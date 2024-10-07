%function LoG_TM_properties_multiple_v17(FilePath,FileName_old,n_movie_in_each_file)
use_as_function=0;
if ~use_as_function
    clc;
    clear all;
    close all
    % FilePath='E:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_10Oct23_Tcells_in_brain_Taxol_100nM_Rep3\';
    % FileName_old=[{'Zen_10Oct23_Tcells_in_brain_Taxol_100nM_Rep3_2023_10_10__23_44_47__p17_Model.xml'},{'Zen_10Oct23_Tcells_in_brain_Taxol_100nM_Rep3_2023_10_10__23_44_47__p17_Model.xml'}];

    FilePath='E:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2\';
    % FileName_old=[{'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37__p10_Model.xml'},...
    %     {'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37__p12_Model.xml'},
    %     {'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37__p14_Model.xml'},
    %     {'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37__p15_Model.xml'}];

    [folder, name, ext] = fileparts( mfilename('fullpath'));
    cd(folder);

    [FileName_old,FilePath]=uigetfile({'.xml'},...
        'Select TrackMate XML File', 'MultiSelect', 'on');
    n_movie_in_each_file=20;%less than 10 for smaller movies
    %FileName_old=['Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37__p01_Model.xml'	'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37__p02_Model.xml'	'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37__p03_Model.xml'	'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37__p04_Model.xml'	'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37__p05_Model.xml'	'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37__p06_Model.xml'	'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37__p07_Model.xml'	'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37__p08_Model.xml'	'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37__p09_Model.xml'	'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37__p10_Model.xml'	'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37__p11_Model.xml'	'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37__p12_Model.xml'	'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37__p13_Model.xml'	'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37__p14_Model.xml'	'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37__p15_Model.xml'	'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37__p16_Model.xml'	'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37__p17_Model.xml'	'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37__p18_Model.xml'	'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37__p19_Model.xml'];
end





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

%%add time stamp
%date_time_stamp=datestr(datetime("now"));
date_time_stamp=datestr(date);
date_time_stamp=strrep(date_time_stamp,':','_');

filename_save_file=strrep(filename_save_file, '.xml', strcat('_',date_time_stamp,'_all.xlsx'));



%common_folder='H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Combined files for final plotting\';
common_folder='F:\Aamir experiment data\Comm_plot\';

filename_save_full_1=[FilePath '\' filename_save_file];
filename_save_full_2=[common_folder '\' filename_save_file];

%filename_save=strcat(FilePath,'22Jun2023_mTcells_in_the_brain_v1.xlsx');

%%

%filename_save=strcat(FilePath,'trial_sept11.xlsx');

%20220630_Tcells_IM7_20x_5min_XY02_morph_Tracks

% delete(filename_save_full_1);
% delete(filename_save_full_2);

clip_factor=0.4;
clear metadata_for_XY_plots

metadata_for_XY_plots={'X position for position #1';
    'Y position for position #1';
    'Z position for position #1';
    'SizeX';'SizeY';'SizeZ';
    'VoxelSizeX';'VoxelSizeY';'VoxelSizeZ'};
%%I need movie number (file no); also x,y,z pos

%figure
%hold on
meta_data_formatted=[];
trackmate_setting_formatted=[];
Actual_delta_T=[];


for fileno = 1:filenum

    disp(['You are at ',num2str(fileno),'/',num2str(filenum),'...']);
    disp(['Folder=',FilePath]);
    disp(['File=',FileName_old{fileno}]);

    if iscell(FileName_old)
        filename_call = [FilePath '\' FileName_old{fileno}];
    else
        filename_call = [FilePath '\' FileName_old];
    end

    [slope]=getFrameInterval(strrep(strrep(filename_call, 'Model_v2', 'MD'),'xml','csv'));
    slope_ind{fileno,1}=slope;

    interval=mean(slope);%2.5 for June 21 2023
    %movie_id=fileno;%%%%better would be to get the "pXY"value
    if n_movie_in_each_file>=10
        movie_id=str2num(filename_call(strfind(filename_call,'_Z23_p')+3+3:strfind(filename_call,'_Z23_p')+4+3));
    else
        movie_id=str2num(filename_call(strfind(filename_call,'_Z23_p')+3+3:strfind(filename_call,'_Z23_p')+3+3));
    end


    %try
        [combining_all,median_no_spots_in_frame,trackmate_settings,combining_all_xy,combining_all_MSD]=DoG_TM_properties_func_update_v7(filename_call,movie_id,interval,clip_factor);
    %catch
        %disp('Warning by AFA: Some error, skipping the movie!!!');
        % combining_all=[];
        % median_no_spots_in_frame=nan;
        % trackmate_settings=[];
        % combining_all_xy=[];
        % combining_all_MSD=[];
        % continue
    %end

    median_no_spots_in_frame_saved(fileno)=median_no_spots_in_frame;

    trackmate_settings_ind{fileno,1}=trackmate_settings;

    Mega_combine_ind{fileno,1}=combining_all;
    combining_all_xy_joined_ind{fileno,1}=combining_all_xy;
    combining_all_MSD_joined_ind{fileno,1}=combining_all_MSD;

    [slope,name_keys,values_all_keys]=getMetadata(strrep(strrep(filename_call, 'Model_v2', 'MD'),'xml','csv'));
    name_keys_ind{fileno,1}=name_keys;
    total_track=size(combining_all,1);

    meta_data_formatted_ind{fileno,1}=repmat(transpose(values_all_keys),total_track,1);

    trackmate_setting_formatted_ind{fileno,1}=repmat(transpose(trackmate_settings(:,2)),total_track,1);

    Actual_delta_T_ind{fileno,1}=repmat(slope,total_track,1);

    [~,address_b]=ismember(name_keys,metadata_for_XY_plots);
    [~,g_b]=sort(address_b,'ascend');
    metadata_XY_values=str2double(values_all_keys(g_b(end-length(metadata_for_XY_plots)+1:end)));
    combining_all_z_joined_ind{fileno,1}=repmat(metadata_XY_values',size(combining_all_xy,1),1);
end


meta_data_formatted=[];
trackmate_setting_formatted=[];
Actual_delta_T=[];
Mega_combine=[];
combining_all_xy_joined=[];
combining_all_z_joined=[];
combining_all_MSD_joined=[];
for fileno=1:filenum

    Mega_combine=[Mega_combine;Mega_combine_ind{fileno,1}];
    combining_all_xy_joined=[combining_all_xy_joined;combining_all_xy_joined_ind{fileno,1}];
    bb=num2cell(combining_all_MSD_joined_ind{fileno,1});

    if 0%fileno==6 %%%fileno=13 for 16Nov CalA rep2 and fileno6 for the other one
        combining_all_MSD_joined=[combining_all_MSD_joined;bb(:,1:(end-2))];
    else
        %combining_all_MSD_joined=[combining_all_MSD_joined;bb];
         combining_all_MSD_joined=[combining_all_MSD_joined];

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
%Track_properties=[movie_id+0*total_no_spots_in_filt_track',total_no',m_area',aspectratio',t_speed,m_linearity_forward,alpha_quality,par];
%header_name={'movie_id','cell_density','no_of_spot','area','aspect Ratio','speed','confinement','alpha','sat_MSD','tau_c','conf_D','RMC','directed_v','directed_D'};
%header_name={'movie_id','track_id','tot_no_track','cell_density','track_t_length','area','aspect Ratio','speed','confinement','alpha','sat_MSD','tau_c','conf_D','RMC','directed_v','directed_D','track Angle','Mean Track Angle','Relative to mean track angle'};


header_name={'movie_id','track_id','track_density','cell_density',...
    'no_of_spot','no_gaps','track_duration','area','aspect Ratio',...
    'med_speed','mean_speed','max_speed','min_speed','std_speed','straight_speed',...
    'track_mean_qual','track_disp','track_tot_dist','max_dist','linearity','confinement','mean_dirn_change',...
    'alpha','R2_alpha',  'sat_MSD','tau_c','conf_D','R2_confined',  'RMC','R2_pure',  'directed_v','directed_D','R2_convect',  'PRWM_speed','PRWM_persistence','R2_PRWM',...
    'track_angle','mean_track_angle','relative_track_angle',...
    'Track_grid','In_or_out','Movie_Grid'};




mega_combine_cell_1=[header_name;mega_combine_cell_1];

Actual_delta_T_wHeader=[{'Actual frame Interval (s)'};num2cell(Actual_delta_T)];
meta_data_formatted_wheader=[transpose(name_keys_ind{1,1});meta_data_formatted];

trackmate_settings_ind_use=trackmate_settings_ind{1,1};
trackmate_setting_formatted_wheader=[transpose(trackmate_settings_ind_use(:,1));trackmate_setting_formatted];

mega_mega_all_properties=[mega_combine_cell_1,Actual_delta_T_wHeader,meta_data_formatted_wheader,trackmate_setting_formatted_wheader];

%% Localization calculation

if iscell(FileName_old)
    filename_pre_red=FileName_old{1};
else
    filename_pre_red = FileName_old;
end

filename_pre_red_full = [FilePath '\' filename_pre_red];

%filename_pre_red=strrep(filename_pre_red, '_Model.xml', '_red.tif');
filename_pre_red_full_trunc=filename_pre_red_full(1:end-15);%from '..._p23_Model.xml' to '..._p'

%%%%same for all movies in a folder
size_x=str2double(mega_mega_all_properties(2,strcmp(mega_mega_all_properties(1,:),'SizeX')));
size_y=str2double(mega_mega_all_properties(2,strcmp(mega_mega_all_properties(1,:),'SizeY')));
voxel_size_x=str2double(mega_mega_all_properties(2,strcmp(mega_mega_all_properties(1,:),'VoxelSizeX')));
voxel_size_y=str2double(mega_mega_all_properties(2,strcmp(mega_mega_all_properties(1,:),'VoxelSizeY')));

XY_colocalization=nan(size(combining_all_xy_joined,1),1);
XY_colocalization=colocalization_fun_v5(filename_pre_red_full_trunc,combining_all_xy_joined,n_movie_in_each_file,size_x,size_y,voxel_size_x,voxel_size_y);
%%%can take time
%% XY data sheet

All_XY=[combining_all_xy_joined,combining_all_z_joined, XY_colocalization];
All_XY_wheader=[{'Movie ID'},{'Track_ID'},{'No of spots'},{'x'},{'y'},{'med_speed'},{'Linearity'},{'Alpha'},{'R2_alpha'},{'RMC'},{'Track Angle'},{'Mean Track Angle'},{'Relative Mean Track Angle'},{'MSD_t'},{'MSD'},{'MSD_SEM'},{'MSD_No'},transpose(metadata_for_XY_plots),{'Red_Intensity'};num2cell(All_XY)];

%% MSD plot
% msd_header=[{'Movie ID'},{'Track_ID'},{'No of spots'},{'med_speed'},{'Linearity'},{'Alpha'},{'RMC'},{''},repmat({'MSD'},1,size(combining_all_MSD_joined,2)-8)];
% time_axis_for_msd_header=[nan,nan,nan,nan,nan,nan,nan,nan,linspace(0,slope_ind{1,1}*(size(combining_all_MSD_joined,2)-9),size(combining_all_MSD_joined,2)-8)];
% combining_all_MSD_joined_wheader=[msd_header;num2cell(time_axis_for_msd_header);combining_all_MSD_joined];

%% saving

% writecell(mega_mega_all_properties,filename_save_full_1,'Sheet','Main');
% writecell(All_XY_wheader,filename_save_full_1,'Sheet','XY_data');
% writecell((combining_all_MSD_joined),filename_save_full_1,'Sheet','MSD');

%%%can take time
writecell(mega_mega_all_properties,filename_save_full_2,'Sheet','Track properties');
writecell(All_XY_wheader,filename_save_full_2,'Sheet','Time series data');
%writecell((combining_all_MSD_joined_wheader),filename_save_full_2,'Sheet','MSD');

