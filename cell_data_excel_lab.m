%path where files are saved
path = '/Volumes/SarahA/siRNA_Migration/PAG/20220314';

%filename, with number and ext truncated
%output files from aCellTrack.m should be in the form 'filename##_1.tif.mat'
%excel file should be in the form 'filename##_1.xlsx
filename = 'U251_siRNAEZR_collagen_10KPa_10min_10x001_XY';

%XY vals you want it to loop through
XYvals = [1:40];

ptoum = 1.5515; %pixels/um
timestep = 10; %minutes

for XY = XYvals
        
clear celldata

if XY<10
    XYi = strcat('0',string(XY));
else
    XYi = string(XY);
end

loadname = strcat(path, filename, string(XYi),'_1.tif.mat'); 
%loadname = strcat(path, 'U251_collagen_rad_10x_10min_T01_T25_crop1_reg_1.tif.mat'); 
load(loadname); 

%read excel file
excelname = strcat(path, filename, string(XYi),'_1.xlsx'); 
excelinfo = table2cell(readtable(excelname));

ncells = size(excelinfo,2)-1;
nframes = max(cell2mat(excelinfo([4:3:16],2:end)), [],'all');
%celldata = nan(nframes,ncells);
clear celldata
cellind = nan(nframes,ncells);

for cell = 1:ncells

        firstframes = cell2mat(excelinfo([3:3:15],cell+1));
        firstframes = firstframes(~isnan(firstframes));

        lastframes = cell2mat(excelinfo([4:3:16],cell+1));
        lasttframes = lastframes(~isnan(lastframes));

        celllabel = cell2mat(excelinfo([2:3:14], cell+1));
        celllabel = celllabel(~isnan(celllabel));

    for j = 1:size(celllabel,1) 

        
        for i= firstframes(j):lastframes(j) %loop through each frame

            
            %find indices of correct cell label
            if isempty(find(cellno_all{1,i} == celllabel(j)))
                disp(strcat('error in cell ',num2str(cell),' at frame ',num2str(i)));
            end

            cellind(i,cell) = find(cellno_all{1,i} == celllabel(j));
            celldata(i,cell) = stats_all{1,i}(cellind(i,cell));

        end

    end

    
end 

x = nan(size(celldata));
y = nan(size(celldata));
area = nan(size(celldata));
major = nan(size(celldata));
minor = nan(size(celldata));

for i = 1:size(x,1)
    for j = 1:size(x,2)
        
        if ~isempty(celldata(i,j).Centroid)
        
            x(i,j) = celldata(i,j).Centroid(1);
            y(i,j) = celldata(i,j).Centroid(2);
            area(i,j) = celldata(i,j).Area;
            major(i,j) = celldata(i,j).MajorAxisLength;
            minor(i,j) = celldata(i,j).MinorAxisLength;
        
        end
        
        
    end
end



[RMC, MSD] = rmc2(x,y,timestep,ptoum);

cs = find(~isnan(RMC));
RMC = RMC(cs);
MSD = MSD(:,:,cs);

ind = find(sum(~isnan(major),1)>=10);
AspectRatio = nanmean(major./minor, 1);
AspectRatio = AspectRatio(ind); %eliminate ones with <10 data points

Area = nanmean(area,1)./ptoum^2;
Area = Area(ind);


savename = strcat(path, filename, string(XYi),'_1.tif_excel_a.mat');
save(savename, 'RMC', 'MSD', 'AspectRatio', 'Area')

end

