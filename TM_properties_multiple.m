clc
clear all;
close all;

%close the excel file first
%...XY17..._model.xml

%series=['Collagen 19.5kPa';'Collagen 19.5kPa';'Collagen 19.5kPa','Collagen 100kPa';'Collagen 100kPa';'Collagen 100kPa';'Collagen 9.3kPa';'Collagen 9.3kPa';'Collagen 9.3kPa';'Collagen 0.7kPa';'Collagen 0.7kPa';'Collagen 0.7kPa'];
%series={'XY01';'XY02';'XY03';'XY11';'XY12';'XY13';'XY21';'XY22';'XY23';'XY31';'XY32';'XY33'};

%important=make sure the selection order and this series' order isthe same
series=[1,2,3,11,12,13,21,22,23,31,32,33];
%series=[7,9,11,12,13,21,22,31,32,33];

%series=[1,2,3];

[folder, name, ext] = fileparts( mfilename('fullpath'));
cd(folder);

[FileName_old,FilePath]=uigetfile({'.xml'},...
    'Select XML File', 'MultiSelect', 'on');

if iscell(FileName_old)
    filenum = size(FileName_old,2);
else
    filenum = 1;
end

filename_save=strcat(FilePath,'Collagen_1.csv');

delete(filename_save);

Mega_combine=[];

header={'RMC','Speed','Ran Speed','Persistence','Exponent','Area','Aspect Ratio','Number of spots'};

stiffness_section=[1,11,21,31];

figure
hold on
for fileno = 1:filenum
    
    if iscell(FileName_old)
        filename_call = [FilePath '\' FileName_old{fileno}];
    else
        filename_call = [FilePath '\' FileName_old];
    end
    
    combining_all=TM_properties_func(filename_call);
    
    XY=str2num(filename_call(strfind(filename_call,'XY')+2:strfind(filename_call,'XY')+3))
    
    if sum(stiffness_section==XY)==1
        Mega_combine=[Mega_combine;zeros(1,size(combining_all,2));XY*ones(1,size(combining_all,2));zeros(1,size(combining_all,2));combining_all];
    else
        Mega_combine=[Mega_combine;combining_all];
    end
    
end

hold off

%writematrix(Mega_combine,filename_save);
mega_combine_cell=num2cell(Mega_combine);
mega_combine_cell(1,1:8)={'RMC','Speed','Random Speed','Persistence','Exponent','Area','Aspect Ratio','Number of spots'};

writecell(mega_combine_cell,filename_save);



