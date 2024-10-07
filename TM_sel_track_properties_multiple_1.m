clc
clear all;
close all;

% close the excel file first
%...XY17..._model.xml

%series=['Collagen 19.5kPa';'Collagen 19.5kPa';'Collagen 19.5kPa','Collagen 100kPa';'Collagen 100kPa';'Collagen 100kPa';'Collagen 9.3kPa';'Collagen 9.3kPa';'Collagen 9.3kPa';'Collagen 0.7kPa';'Collagen 0.7kPa';'Collagen 0.7kPa'];
%series={'XY01';'XY02';'XY03';'XY11';'XY12';'XY13';'XY21';'XY22';'XY23';'XY31';'XY32';'XY33'};

%important=make sure the selection order and this series' order isthe same
%series=[1,2,3,11,12,13,21,22,23,31,32,33];
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

%filename_save=strcat(FilePath,'manual_ht_fibronectin_03242023_CART_89.xlm');
filename_save=strcat(FilePath,'manual_ht_fibronectin_03242023_CART_89.xlsx');

%HT on fibronectin 03242023_noCART_89_
sel_matrix={[22,32];
    [14,15];
    [0];
    [3];
    [];
    [];
    [5];
    [0];
    [0];
    [2];
    [];
    [7]};

%20220630_Tcells_IM7_20x_5min_XY02_morph_Tracks

delete(filename_save);

Mega_combine_1=[];
Mega_combine_2=[];
Mega_combine_3=[];
Mega_combine_4=[];
clip_factor=0.4;

%figure
hold on
for fileno = 1:filenum
    
    if iscell(FileName_old)
        filename_call = [FilePath '\' FileName_old{fileno}]
    else
        filename_call = [FilePath '\' FileName_old];
    end
    
    interval_identifier=filename_call(strfind(filename_call,'min')-2);
    expt_date=filename_call(strfind(filename_call,'Tcell')-5:strfind(filename_call,'Tcell')-2);
    
    %     if strcmp(interval_identifier,'.')==1
    %         interval=2.5;
    %     else
    %         interval=5;
    %     end
    
    
    %interval=2.5;
    
    %icam1 and XY_XY_
    if strcmp(expt_date,'0811')==1 || strcmp(expt_date,'0812')==1
        %  XY=str2num(filename_call(strfind(filename_call,'XY')+2+3:strfind(filename_call,'XY')+3+3));
        % else
        XY=str2num(filename_call(strfind(filename_call,'XY')+2:strfind(filename_call,'XY')+3));
    end
    XY=str2num(filename_call(strfind(filename_call,'XY')+2:strfind(filename_call,'XY')+3));
    
    %anti cd11a
    %     if strcmp(expt_date,'0803')==1
    %         interval=2.5;
    %     elseif strcmp(expt_date,'0714')==1
    %         interval=5;%exception-ask menal
    %     elseif strcmp(expt_date,'0729')==1
    %         interval=1;
    %     else
    %         interval=5;
    %     end
    
    interval=1.75;
    
    rep=str2num(filename_call(strfind(filename_call,'2022'):strfind(filename_call,'2022')+7));
    video_id=1000*rep+XY;
    
    combining_all=[];
    median_no_spots_in_frame=[];
    if ~isempty(sel_matrix{fileno,:})
        [combining_all,median_no_spots_in_frame]=TM_sel_track_properties_func(filename_call,video_id,interval,clip_factor,sel_matrix{fileno,:});
        median_no_spots_in_frame_saved(fileno)=median_no_spots_in_frame;
        
        if 1%XY<=10
            Mega_combine_1=[Mega_combine_1;combining_all];
        elseif 0%XY<=20
            Mega_combine_2=[Mega_combine_2;combining_all];
        elseif 0%XY<=30
            Mega_combine_3=[Mega_combine_3;combining_all];
        elseif 0%XY<=40
            Mega_combine_4=[Mega_combine_4;combining_all];
        end
        
        
    end
    %collagen
    %     if strcmp(expt_date,'0701')==1
    %         XY=XY+10;
    %     end
    
    
    
    
    %     if strcmp(expt_date,'0803')==1
    %         Mega_combine_1=[Mega_combine_1;combining_all];
    %     else
    %         Mega_combine_2=[Mega_combine_2;combining_all];
    %     end
    
end

%hold off

%writematrix(Mega_combine,filename_save);
mega_combine_cell_1=num2cell(Mega_combine_1);
%mega_combine_cell_1(1,1:11)={'No of Spots','Area','Aspect Ratio','Dir Change','Inst Speed','Alpha','Directed v','Directed D','Random D','Sat MSD','Tau c'};
%mega_combine_cell_1(1,1:10)={'video_id','No of Spots','Area','Aspect Ratio','Inst Speed','Dir Change','Alpha','Directed v/Random D/Confinement size','Directed D/.../Pre expo','.../.../Confined D'};

mega_combine_cell_2=num2cell(Mega_combine_2);
% mega_combine_cell_2(1,1:8)={'RMC','Speed','Random Speed','Persistence','Exponent','Area','Aspect Ratio','Number of spots'};
%
mega_combine_cell_3=num2cell(Mega_combine_3);
% mega_combine_cell_3(1,1:8)={'RMC','Speed','Random Speed','Persistence','Exponent','Area','Aspect Ratio','Number of spots'};
%
mega_combine_cell_4=num2cell(Mega_combine_4);
% mega_combine_cell_4(1,1:8)={'RMC','Speed','Random Speed','Persistence','Exponent','Area','Aspect Ratio','Number of spots'};

%
%  writecell(mega_combine_cell_1,filename_save,'Sheet','0.7 kPa');
% writecell(mega_combine_cell_2,filename_save,'Sheet','9.3 kPa');
% writecell(mega_combine_cell_3,filename_save,'Sheet','19.5 kPa');
% writecell(mega_combine_cell_4,filename_save,'Sheet','100 kPa');

% writecell(mega_combine_cell_1,filename_save,'Sheet','First day');
% writecell(mega_combine_cell_2,filename_save,'Sheet','Next day');
% %
%
% % writecell(mega_combine_cell_1,filename_save,'Sheet','19.5 kPa');
% % writecell(mega_combine_cell_2,filename_save,'Sheet','100 kPa');
% % writecell(mega_combine_cell_3,filename_save,'Sheet','9.3 kPa');
% % writecell(mega_combine_cell_4,filename_save,'Sheet','0.7 kPa');
%
%
% filename_save_mat=strcat(filename_save(1:end-5),'.mat');
% save(filename_save_mat,'median_no_spots_in_frame_saved');
