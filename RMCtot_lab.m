%path where files are saved
path = '/Volumes/SarahA/siRNA_Migration/PAG/20220314';

%filename, with number and ext truncated
%output files from cell_data should be in the form 'filename##_1.tif_a.mat'
filename = 'U251_siRNAEZR_collagen_10KPa_10min_10x001_XY';

%XY vals you want it to loop through
XYvals = [1:40];

RMC_1 = [];
RMC_2 = [];
RMC_3 = [];
RMC_4 = [];

AR_1 = [];
AR_2 = [];
AR_3 = [];
AR_4 = [];

Area_1 = [];
Area_2 = [];
Area_3 = [];
Area_4 = [];

for XY = XYvals

    if XY<10
        XYi = strcat('0',string(XY));
    else
        XYi = string(XY);
        end

%    loadname = strcat(path, filename, string(XYi),'_1.tif_test3_a.mat');
 %   loadname = strcat(path, filename, string(XYi),'_1.tif_excel_a.mat'); 
    loadname = strcat(path, filename, string(XYi),'_1.tif_a.mat'); 
    
    load(loadname);    

    if XY<=10
        RMC_1 = [RMC_1;RMC'];
        AR_1 = [AR_1;AspectRatio'];
        Area_1 = [Area_1;Area'];
    elseif XY<=20
        RMC_2 = [RMC_2;RMC'];
        AR_2 = [AR_2;AspectRatio'];
        Area_2 = [Area_2;Area'];
    elseif XY <=30
         RMC_3 = [RMC_3;RMC'];
         AR_3 = [AR_3;AspectRatio'];
         Area_3 = [Area_3;Area'];
    elseif XY<=40
         RMC_4 = [RMC_4;RMC'];
         AR_4 = [AR_4;AspectRatio'];
         Area_4 = [Area_4;Area'];
    end
end


totsize = max([size(RMC_1,1), size(RMC_2,1), size(RMC_3,1), size(RMC_4,1)]);
RMC_tot = nan(totsize, 4);
RMC_tot(1:size(RMC_1,1),1) = RMC_1;
RMC_tot(1:size(RMC_2,1),2) = RMC_2;
RMC_tot(1:size(RMC_3,1),3) = RMC_3;
RMC_tot(1:size(RMC_4,1),4) = RMC_4;

AR_tot = nan(totsize, 4);
AR_tot(1:size(AR_1,1),1) = AR_1;
AR_tot(1:size(AR_2,1),2) = AR_2;
AR_tot(1:size(AR_3,1),3) = AR_3;
AR_tot(1:size(AR_4,1),4) = AR_4;

Area_tot = nan(totsize, 4);
Area_tot(1:size(Area_1,1),1) = Area_1;
Area_tot(1:size(Area_2,1),2) = Area_2;
Area_tot(1:size(Area_3,1),3) = Area_3;
Area_tot(1:size(Area_4,1),4) = Area_4;

