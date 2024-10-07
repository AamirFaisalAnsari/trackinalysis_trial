clc
clear all;
close all;

[folder, name, ext] = fileparts( mfilename('fullpath'));
cd(folder);

[FileName_old,FilePath]=uigetfile({'.xml'},...
    'Select XML File', 'MultiSelect', 'on');

if iscell(FileName_old)
    filenum = size(FileName_old,2);
else
    filenum = 1;
end


if iscell(FileName_old)
    filename_save_file=FileName_old{1};
else
    filename_save_file = FileName_old;
end

filename_save_file=strrep(filename_save_file, '.xml', '_all.xlsx');

%common_folder='H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Combined files for final plotting\';
common_folder='H:\Aamir experiment data\Comm_plot\';

filename_save_full_1=[FilePath '\' filename_save_file];
filename_save_full_2=[common_folder '\' filename_save_file];

%filename_save=strcat(FilePath,'22Jun2023_mTcells_in_the_brain_v1.xlsx');

%%

%filename_save=strcat(FilePath,'trial_sept11.xlsx');

%20220630_Tcells_IM7_20x_5min_XY02_morph_Tracks

delete(filename_save_full_1);
delete(filename_save_full_2);

Mega_combine=[];
Mega_combine_2=[];
Mega_combine_3=[];
Mega_combine_4=[];
clip_factor=0.4;
clear metadata_for_XY_plots

metadata_for_XY_plots={'X position for position #1';
    'Y position for position #1';
    'Z position for position #1';
    'SizeX';'SizeY';'SizeZ';
    'VoxelSizeX';'VoxelSizeY';'VoxelSizeZ'};

%figure
%hold on
meta_data_formatted=[];
trackmate_setting_formatted=[];
Actual_delta_T=[];
combining_all_xy_joined=[];
combining_all_z_joined=[];
combining_all_MSD_joined=[];

for fileno = 1:filenum
    
    disp(['You are at ',num2str(fileno),'/',num2str(filenum),'...']);
    
    if iscell(FileName_old)
        filename_call = [FilePath '\' FileName_old{fileno}];
    else
        filename_call = [FilePath '\' FileName_old];
    end
    
    slope=1;
    %[slope]=getFrameInterval(strrep(strrep(filename_call, 'Model', 'MD'),'xml','csv'));
    %slope_ind{fileno,1}=slope;
    
    interval=mean(slope);%2.5 for June 21 2023
    XY=1;rep=1;video_id=1000*rep+fileno;
    
    [combining_all,median_no_spots_in_frame,trackmate_settings,combining_all_xy,combining_all_MSD]=DoG_TM_properties_func(filename_call,video_id,interval,clip_factor);
    median_no_spots_in_frame_saved(fileno)=median_no_spots_in_frame;
    
    trackmate_settings_ind{fileno,1}=trackmate_settings;
    
    Mega_combine_ind{fileno,1}=combining_all;
    combining_all_xy_joined_ind{fileno,1}=combining_all_xy;
    combining_all_MSD_joined_ind{fileno,1}=combining_all_MSD;
 end


for fileno=1:filenum
    
    Mega_combine=[Mega_combine;Mega_combine_ind{fileno,1}];
    combining_all_xy_joined=[combining_all_xy_joined;combining_all_xy_joined_ind{fileno,1}];
    bb=num2cell(combining_all_MSD_joined_ind{fileno,1});
    
    if 0%fileno==6
    combining_all_MSD_joined=[combining_all_MSD_joined;bb(:,1:(end-2))];
    else
    combining_all_MSD_joined=[combining_all_MSD_joined;bb];

    end
    
    meta_data_formatted=[meta_data_formatted;meta_data_formatted_ind{fileno,1}];
    trackmate_setting_formatted=[trackmate_setting_formatted;trackmate_setting_formatted_ind{fileno,1}];
    
    Actual_delta_T=[Actual_delta_T;Actual_delta_T_ind{fileno,1}];
    combining_all_z_joined=[combining_all_z_joined;combining_all_z_joined_ind{fileno,1}];
    
end

%% making the main sheet
%writematrix(Mega_combine,filename_save);
mega_combine_cell_1=num2cell(Mega_combine);
%mega_combine_cell_header=[];
%Track_properties=[video_id+0*total_no_spots_in_filt_track',total_no',m_area',aspectratio',t_speed,m_linearity_forward,alpha_quality,par];
header_name={'video_id','cell_density','no_of_spot','area','aspect Ratio','speed','confinement','alpha','sat_MSD','tau_c','conf_D','RMC','directed_v','directed_D'};

mega_combine_cell_1=[header_name;mega_combine_cell_1];

Actual_delta_T_wHeader=[{'Actual frame Interval (s)'};num2cell(Actual_delta_T)];
meta_data_formatted_wheader=[transpose(name_keys_ind{1,1});meta_data_formatted];

trackmate_settings_ind_use=trackmate_settings_ind{1,1};
trackmate_setting_formatted_wheader=[transpose(trackmate_settings_ind_use(:,1));trackmate_setting_formatted];

mega_mega_all_properties=[mega_combine_cell_1,Actual_delta_T_wHeader,meta_data_formatted_wheader,trackmate_setting_formatted_wheader];

%% XY data sheet

All_XY=[combining_all_xy_joined,combining_all_z_joined];
All_XY_wheader=[{'IID'},{'x'},{'y'},{'Alpha'},transpose(metadata_for_XY_plots);num2cell(All_XY)];

%% saving

% writecell(mega_mega_all_properties,filename_save_full_1,'Sheet','Main');
% writecell(All_XY_wheader,filename_save_full_1,'Sheet','XY_data');
% writecell((combining_all_MSD_joined),filename_save_full_1,'Sheet','MSD');


writecell(mega_mega_all_properties,filename_save_full_2,'Sheet','Main');
writecell(All_XY_wheader,filename_save_full_2,'Sheet','XY_data');
writecell((combining_all_MSD_joined),filename_save_full_2,'Sheet','MSD');

