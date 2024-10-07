trackinfo = table2cell(readtable('/Volumes/SarahA/siRNA_Migration/PAG/master.xlsx'));
row = 7;

folder = string(trackinfo(row,1));
path = strcat('/Volumes/SarahA/siRNA_Migration/PAG/', folder, '/');
filename = string(trackinfo(row,2));
%XYvals = eval(string(trackinfo(row,7)));
%XYvals = [1:3,21:23,31:33];
XYvals = [2 3 21 22 31 32];
%XYvals = 2;


ptoum = double(string(trackinfo(row,6)));
timestep = double(string(trackinfo(row,5)));

%path = '/Volumes/SarahA3/20220408/';
%filename = 'U251_siRNARDX_collagen_10kpa_10x_10min_XY';

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

