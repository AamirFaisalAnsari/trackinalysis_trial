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
common_folder='E:\Aamir experiment data\Comm_plot\';
%common_folder='C:\UCMS Dec 7 2023 AFA';


filename_save_full_1=[FilePath '\' filename_save_file];
filename_save_full_2=[common_folder '\' filename_save_file];

%filename_save=strcat(FilePath,'22Jun2023_mTcells_in_the_brain_v1.xlsx');

%%

%filename_save=strcat(FilePath,'trial_sept11.xlsx');

%20220630_Tcells_IM7_20x_5min_XY02_morph_Tracks

delete(filename_save_full_1);
delete(filename_save_full_2);

Mega_combine_1=[];
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
    
    [slope]=getFrameInterval(strrep(strrep(filename_call, 'Model', 'MD'),'xml','csv'));
    
    interval=mean(slope);%2.5 for June 21 2023
    XY=1;
    
    rep=1;video_id=1000*rep+fileno;
    
    
    [combining_all,median_no_spots_in_frame,trackmate_settings,combining_all_xy,combining_all_MSD]=DoG_TM_properties_func_update_v5(filename_call,video_id,interval,clip_factor);
    median_no_spots_in_frame_saved(fileno)=median_no_spots_in_frame;
    
    Mega_combine_1=[Mega_combine_1;combining_all];
    combining_all_xy_joined=[combining_all_xy_joined;combining_all_xy];
    combining_all_MSD_joined=[combining_all_MSD_joined;num2cell(combining_all_MSD)];
    
    
    
    
    [slope,name_keys,values_all_keys]=getMetadata(strrep(strrep(filename_call, 'Model', 'MD'),'xml','csv'));
    total_track=size(combining_all,1);
    meta_data_formatted=[meta_data_formatted;repmat(transpose(values_all_keys),total_track,1)];
    trackmate_setting_formatted=[trackmate_setting_formatted;repmat(transpose(trackmate_settings(:,2)),total_track,1)];
    Actual_delta_T=[Actual_delta_T;repmat(slope,total_track,1)];
    
    [~,address_b]=ismember(name_keys,metadata_for_XY_plots);
    [~,g_b]=sort(address_b,'ascend');
    metadata_XY_values=str2double(values_all_keys(g_b(end-length(metadata_for_XY_plots)+1:end)));
    combining_all_z_joined=[combining_all_z_joined;repmat(metadata_XY_values',size(combining_all_xy,1),1)];
end




%% making the main sheet
%writematrix(Mega_combine,filename_save);
mega_combine_cell_1=num2cell(Mega_combine_1);
%mega_combine_cell_header=[];
%Track_properties=[video_id+0*total_no_spots_in_filt_track',total_no',m_area',aspectratio',t_speed,m_linearity_forward,alpha_quality,par];
%header_name={'movie_id','track_id','track_density','cell_density','no_of_spot','area','aspect Ratio','speed','confinement','alpha','sat_MSD','tau_c','conf_D','RMC','directed_v','directed_D'};

header_name={'movie_id','track_id','track_density',...
    'cell_density','no_of_spot','area','aspect Ratio',...
    'med_speed','mean_speed','max_speed','min_speed','std_speed','straight_speed',...
    'track_mean_qual','track_disp','track_tot_dist','max_dist','linearity','confinement','mean_dirn_change',...
    'alpha','sat_MSD','tau_c','conf_D','RMC','directed_v','directed_D',...
    'track_angle','mean_track_angle','relative_track_angle'};



mega_combine_cell_1=[header_name;mega_combine_cell_1];

Actual_delta_T_wHeader=[{'Actual frame Interval (s)'};num2cell(Actual_delta_T)];
meta_data_formatted_wheader=[transpose(name_keys);meta_data_formatted];

trackmate_setting_formatted_wheader=[transpose(trackmate_settings(:,1));trackmate_setting_formatted];

mega_mega_all_properties=[mega_combine_cell_1,Actual_delta_T_wHeader,meta_data_formatted_wheader,trackmate_setting_formatted_wheader];

%% XY data sheet

All_XY=[combining_all_xy_joined,combining_all_z_joined];
All_XY_wheader=[{'Movie ID'},{'Track ID'},{' No of spots'},{'x'},{'y'},{'Speed'},{'RMC'},{'Linearity'},{'Alpha'},transpose(metadata_for_XY_plots);num2cell(All_XY)];

%% MSD plot
time_axis_for_msd_header=[nan,linspace(0,slope*(size(combining_all_MSD_joined,2)-2),size(combining_all_MSD_joined,2)-1)];
combining_all_MSD_joined=[num2cell(time_axis_for_msd_header);combining_all_MSD_joined];



%% saving

% writecell(mega_mega_all_properties,filename_save_full_1,'Sheet','Main');
% writecell(All_XY_wheader,filename_save_full_1,'Sheet','XY_data');
% writecell((combining_all_MSD_joined),filename_save_full_1,'Sheet','MSD');


writecell(mega_mega_all_properties,filename_save_full_2,'Sheet','Main');
writecell(All_XY_wheader,filename_save_full_2,'Sheet','XY_data');
writecell((combining_all_MSD_joined),filename_save_full_2,'Sheet','MSD');

