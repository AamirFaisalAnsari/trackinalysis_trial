% function [par] = track_fit(msd,alpha,clip_factor)
%
% ntracks = size(msd,2);
% par=nan(ntracks,6);
% if ~isempty(ntracks)
%
%     for track = 1:ntracks
%         track_msd =  msd(:,track,:);
%         %track_msd = track_msd(~isnan(track_msd(:,1)), :);
%         %[RMC1(track),pers(track),rand_speed(track),exit_flags(track,:)] = RMC_calc(track_msd,alpha);
%         [par(track,:)] = track_fit_function(track_msd,alpha(track),clip_factor);
%     end
%
% end
%
% %figure
% %errorbar(msd(:,1),msd(:,2),msd(:,3))
% %plot(tau,msd(:,2));
% %loglog(msd(:,1),msd(:,2))
% %xlabel('tau (sec)')
% %ylabel('MSD')
%
% end
close all
clip_factor=0.4;
alpha=1.5;
msd_series=[0	39.11475603	71.48180352	81.98408149	105.9159149	117.214793	117.5543183	120.4359793	117.4686227	112.4873407	120.1634312	129.8868689	126.6427746	121.4304742	114.616801	97.11547188	93.48163476	107.2584795	109.6688048	117.0790297	133.4066231	138.9079017	139.4698332	140.7719365	136.4551406	136.9366963	142.0015388	136.1873876	132.8391901	152.2578479	172.5497711	163.5666424	162.0747904	172.4496371	159.6594172	145.4168827	131.4267909	100.9721884	85.09782593	79.86313531	85.43687569	93.95560367	78.46505124	78.74902431	67.22340243	36.33504014	27.55337211];
sem=msd;
t=5*linspace(1,length(msd),length(msd));

msd_to_be_passed=[t;msd;sem]';

plot(t,msd,'ro');
set(gca, 'YScale', 'log', 'XScale', 'log')


ylabel('MSD (\mum^2)');
xlabel('\DeltaT (min)');

[par] = track_fit_function(msd_to_be_passed,alpha,clip_factor);

function [par] = track_fit_function(msd,alpha,clip_factor)
% clear all
% close all
% clc
% %collagen
% alpha=1.5;
% %msd=[0	3608.253463	8067.346527	16414.85297	26282.39814	40485.209	53236.02886	74251.55513	95310.69108];
%
% %im7
% msd=[0	39.11475603	71.48180352	81.98408149	105.9159149	117.214793	117.5543183	120.4359793	117.4686227	112.4873407	120.1634312	129.8868689	126.6427746	121.4304742	114.616801	97.11547188	93.48163476	107.2584795	109.6688048	117.0790297	133.4066231	138.9079017	139.4698332	140.7719365	136.4551406	136.9366963	142.0015388	136.1873876	132.8391901	152.2578479	172.5497711	163.5666424	162.0747904	172.4496371	159.6594172	145.4168827	131.4267909	100.9721884	85.09782593	79.86313531	85.43687569	93.95560367	78.46505124	78.74902431	67.22340243	36.33504014	27.55337211];
%
% sem=msd;
% t=5*linspace(1,length(msd),length(msd));
%
% sem_cell=msd*0+1;
% msd_cell=msd;
% tau_cell=t;

sem_cell = msd(1:ceil(end*clip_factor),3);
msd_cell = msd(1:ceil(end*clip_factor),2);
tau_cell = msd(1:ceil(end*clip_factor),1);

sem_cell=sem_cell(~isnan(msd_cell));
msd_cell=msd_cell(~isnan(msd_cell));
tau_cell=tau_cell(~isnan(msd_cell));

par=nan(1,8);

options = optimoptions('fminunc','Display','final');%,'PlotFcn','optimplotx');

if sum(msd_cell) == 0 || isnan(sum(msd_cell))==1 %|| isnan(alpha)
    par=nan(1,8);
else
    if alpha<0.95

        [P,~,exitflag]=fminunc(@(P) confined_walk(P,tau_cell,msd_cell,sem_cell),[150 1 1],options);
        par1=sqrt(P(1));
        par2=P(2);
        par3=P(3);
        %[P,S,exitflag2]=fminunc(@(P) prandwalk(P,tau_cell,msd_cell,sem_cell),[10 800],options);
        %speed=P(1);
        %pers=P(2);
        if exitflag~=1 || par1<=0 || par2<0 || par3<0
            par1=nan;
            par2=nan;
            par3=nan;
        end
        par(1:3)=[par1,par2,par3];

    elseif alpha>1.05
        [input_convec,~,exitflag]=fminunc(@(input_convec) convective_randwalk(input_convec,tau_cell,msd_cell,sem_cell),[200 1],options);
        par1=input_convec(1);
        par2=input_convec(2);
        par3=nan;
        if exitflag~=1 || par1<0 || par2<0
            par1=nan;
            par2=nan;
            par3=nan;
        end
        par(5:6)=[par1,par2];
    end
msd_cell
    [D,~,exitflag]=fminunc(@(D) randwalk(D,tau_cell,msd_cell,sem_cell),[280],options);
    par1=D;
    par2=nan;
    par3=nan;
    if exitflag~=1 || par1<0
        par1=nan;
        par2=nan;
        par3=nan;
    end
    par(4)=par1;

    [P,~,exitflag]=fminunc(@(P) prandwalk(P,tau_cell,msd_cell,sem_cell),[2 5],options);
    prandwalk_plot(P,tau_cell,msd_cell,sem_cell);
    par1=P(1);
    par2=P(2);
    par3=nan;
    if exitflag~=1 || par1<0
        par1=nan;
        par2=nan;
        par3=nan;
    end
    par(7)=par1;
    par(8)=par2;
    
    %end
end

end


function F=confined_walk(P,t,msd,sem)
%%%eq=msd_sat*(1-par1*exp(-4*confined_D*t/msd_sat))
fit=P(1).*(1-P(2).*(exp(-4*P(3).*t./P(1))));
F=sum((1./(sem+.000001).^0.5).*(msd-fit).^2);

% close all
% hold on
% plot(t,msd,'ro');
% plot(t,fit,'b-');
% hold off
end

function F=prandwalk(P,t,msd,sem)
fit=2*P(1)^2*P(2).*(t-P(2).*(1-exp(-t./P(2))));
F=sum((1./(sem+.000001).^0.5).*(msd-fit).^2);

% close all
% hold on
% plot(t,msd,'ro');
% plot(t,fit,'b-');
% hold off
end

function prandwalk_plot(P,t,msd,sem)
fit=2*P(1)^2*P(2).*(t-P(2).*(1-exp(-t./P(2))));
% close all

figure
hold on
plot(t,msd,'ro');
plot(t,fit,'b-');
% hold off
end

function F=randwalk(D,t,msd,sem)
fit=4*D*t;
F=sum((1./(sem+.000001).^0.5).*(msd-fit).^2);
% close all
% hold on
% plot(t,msd,'ro');
% plot(t,fit,'b-');
% hold off
end

function F=convective_randwalk(input_convec,t,msd,sem)
convective_v=input_convec(1);
D=input_convec(2);

fit=convective_v^2*t.^2+4*D*t;
F=sum((1./(sem+.000001).^0.5).*(msd-fit).^2);

% close all
% hold on
% plot(t,msd,'ro');
% plot(t,fit,'b-');
% hold off
end