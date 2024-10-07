%calculate and plot mean squared displacement over time using overlapped
%time intervals

clear all;
close all;

[folder, name, ext] = fileparts( mfilename('fullpath'));
cd(folder);

%pix=1*1320*1000/2048;%nm%10X = 1320um/2048pix = 645nm, 20X = 330
pix=330;%nm%10X = 1320um/2048pix = 645nm, 20X = 330

dt = 5; %min
file_cell=uipickfiles;
[Filepath,Filename,Fileext] = fileparts(file_cell{1});
file_cell2={};
k=1;

for i=1:numel(file_cell)
    files=dir(char(file_cell(i)));
    for j=1:numel(files)
        [path tempname tempext]=fileparts([char(file_cell(i)) '\' char(files(j).name)]);
        if strcmpi(ext,'.txt')==1
            file_cell2(k)=cellstr([path])% '\' name ext]);
            k=k+1;
        end
    end
end
msd_v=zeros(100,numel(file_cell));
sem_v=zeros(100,numel(file_cell));

maxa=0;
for i=1:numel(file_cell)
    data=load(char(file_cell(i)));
    [frameno b]=size(data);
    if frameno>maxa; maxa=frameno; end
    msd=zeros(1,frameno-1);
    sem=zeros(1,frameno-1);
    for j=1:frameno-1
        xdif=[];
        ydif=[];
        for k=1:frameno-j %step through every interval of the determined size
            xdif(k)=(data(k+j,3)-data(k,3))*pix;
            ydif(k)=(data(k+j,4)-data(k,4))*pix;
        end
        sqdisp=[xdif.^2+ydif.^2];
        sqdisp(isnan(sqdisp))=[];
        msd(j)=mean(sqdisp);
        sem(j)=std(sqdisp)/(numel(sqdisp)^0.5);
    end
    
    t=dt*[1:frameno-1];
    
    msd(sem==0)=[];
    t(sem==0)=[];
    sem(sem==0)=[];
    
    msd(isnan(sem))=[];
    t(isnan(sem))=[];
    sem(isnan(sem))=[];
    
    msd=msd*10^-6; %convert nm^2 to um^2
    sem=sem*10^-6;
    
    msd = msd(1:ceil(end/2));
    sem = sem(1:ceil(end/2));
    t = t(1:ceil(end/2));
    
    [D,R]=fminunc(@(D) randwalk(D,t,msd,sem),[1]);
    [P,S]=fminunc(@(P) prandwalk(P,t,msd,sem),[1 1]);
    
    rmc(i)=D;
    pers(i)=P(2);
    speed(i)=P(1);
%     figure; 
%     subplot(2,1,1); hist((data(:,2))*((pix)/1000)^2);
%     subplot(2,1,2); hist((data(:,6)./data(:,5)));
    cellarea(i)=nanmean(data(:,2))*((pix)/1000)^2;
    cellar(i)=nanmean(data(:,6)./data(:,5));
    figure(1000)
    subplot(1,2,1)
    plot(t,msd,'o')
    hold on
    xlabel('time (min)')
    ylabel('msd (um2)')
    
    xpos=(data(:,3)-data(1,3))*pix*10^-3;
    ypos=(data(:,4)-data(1,4))*pix*10^-3;
    xpos(isnan(xpos))=[];
    ypos(isnan(ypos))=[];
    
    subplot(1,2,2)
    plot(xpos(end),ypos(end),'*b')
    hold on
    xlabel('position (um)')
    ylabel('position (um)')
    
    msd_v(1:length(msd),i)=msd';
    sem_v(1:length(msd),i)=sem';
end
msd_v(msd_v==0)=nan;
sem_v(sem_v==0)=nan;
rmsd=(4*mean(rmc)*dt*maxa)^0.5;
theta=linspace(0,2*pi);
xcirc=rmsd*cos(theta);
ycirc=rmsd*sin(theta);
subplot(1,2,2)
plot(xcirc,ycirc,'-r')

cellarea=cellarea';
cellar=cellar';
rmc=rmc';


mean(rmc)
std(rmc)/(numel(rmc)^0.5)
mean_msd=nanmean(msd_v,2);
mean_msd=mean_msd(~isnan(mean_msd));
sem_msd_gs=(nanmean(sem_v.^2,2)).^0.5;
sem_msd_gs=sem_msd_gs(~isnan(sem_msd_gs));
sem_msd_bb=((nansum(sem_v.^2,2)).^0.5)./sum(~isnan(sem_v),2);
sem_msd_bb= sem_msd_bb(~isnan(sem_msd_bb));
sem_msd=nanstd(msd_v')'./(sum(~isnan(msd_v),2)).^0.5;
sem_msd=sem_msd(~isnan(sem_msd));

subplot(1,2,1); 
plot([15:15:15*length(mean_msd)], mean_msd, 'r'); 
figure; plot([dt:dt:dt*length(mean_msd)], mean_msd, 'b'); 
hold on; plot([dt:dt:dt*length(mean_msd)], 4*[dt:dt:dt*length(mean_msd)]*mean(rmc), 'r');

%%save

tempcell{1,1} = 'rmc(um^2/min)';
tempcell{1,2} = 'area(um^2)';
tempcell{1,3} = 'aspect ratio';
tempcell{1,4} = 'speed(um/min)';

for i = 1:length(rmc)
   temprmc = rmc(i);
   temparea = cellarea(i);
   tempaspect = cellar(i);
   
   tempcell{i+1,1} = temprmc;
   tempcell{i+1,2} = temparea;
   tempcell{i+1,3} = tempaspect;
   tempcell{i+1,4} = speed(i); 
end


%name_save = [Filepath '\' name '.xlsx'];
name_save = [Filepath '\' Filename '_properties.xlsx'];

T = cell2table(tempcell);
writetable(T,name_save)



