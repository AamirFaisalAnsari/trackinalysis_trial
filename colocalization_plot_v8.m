%function colocalization_plot_v8(filename_pre_red,XYTable_modified_read,t_width)

use_as_function=0;
if ~use_as_function
    clc;
    %clear all;
    close all

    %filename= 'H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_30Jun23_Tcells_in_brain_100ug_ml_IM7\Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49__p01_Model.xml';
    %filename= 'H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_30Jun23_Tcells_in_brain_100ug_ml_IM7\Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49__p01_Model.xml';
    %filename= 'E:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_30Jun23_Tcells_in_brain_100ug_ml_IM7\Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49__p01_Model.xml';

    %filename_pre_red='H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_30Jun23_Tcells_in_brain_100ug_ml_IM7\Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49__p';
    %filename_pre_red='E:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_30Jun23_Tcells_in_brain_100ug_ml_IM7\Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49__p';
    %='E:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_11Jul23_Tcells_in_brain_1000nM_Taxol\\Zen_11Jul23_Tcells_in_brain_1000nM_Taxol_2023_07_12__02_31_38_Z23_p';

    %load('sample_combining_all_xy_just_one_movie.mat')
    %load('sample_combining_all_xy_five_movies_Jun_30');
    %load('sample_combining_all_xy_two_movies_Jul_11.mat');

    %combining_all_xy_joined=combining_all_XY;
    %combining_all_xy_joined(:,1)=1;


    %%%% for colocalization plots
    common_folder='E:\Aamir experiment data\Comm_plot\';
    %filename='Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49__p13_Model_09-Mar-2024_all.xlsx';
    filename='Zen_11Jul23_Tcells_in_brain_1000nM_Taxol_2023_07_12__02_31_38_Z23_p20_Model_v2_22-Apr-2024_all.xlsx';
    XYTable_modified_read= readtable([common_folder,filename],'Sheet','Time series data');  % Load the data into a table
    filename_pre_red='E:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_11Jul23_Tcells_in_brain_1000nM_Taxol\Zen_11Jul23_Tcells_in_brain_1000nM_Taxol_2023_07_12__02_31_38_Z23_p';

end

%%
home_address='E:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\';

folder_sample=[

%%Mouse T cells
{'Zen_21Jun23_Tcells_in_brain\'};...%%1
{'Zen_22Jun23_Tcells_in_brain\'};...%%2
{'Zen_22Jun23_Tcells_in_brain\'};...%%3
{'Zen_25Jun23_Tcells_in_brain\'};...%%4
{'Zen_25Jun23_Tcells_in_brain\'};...%%5

{'Zen_27Jun23_Tcells_in_brain\'};...%%6
{'Zen_27Jun23_Tcells_in_brain\'};...%%7
{'Zen_27Jun23_Tcells_in_brain\'};...%%8
{'Zen_27Jun23_Tcells_in_brain\'};...%%9

{'Zen_22Aug23_MTcells_in_the_brain_high_res\'};...%%10
{'Zen_22Aug23_MTcells_in_the_brain_high_res\'};...%%11

{'Zen_25Aug23_MTcells_in_brain_slices_embd_collagen\'};...%%12
{'Zen_25Aug23_MTcells_in_brain_slices_embd_collagen\'};...%%13

{'Zen_23Aug23_MTcells_in_the_brain_high_res_rep2\'};...%%14


%%IM7
{'Zen_28Jun23_Tcells_in_brain_20ug_ml_IM7\'};... %%15
{'Zen_30Jun23_Tcells_in_brain_100ug_ml_IM7\'};... %%16
{'Zen_21Sep23_Tcells_in_the_bran_IM7_20ugml_rep2\'};...%%17%%T cells prolly died
{'Zen_29Sep23_Tcells_in_brain_slices_full_IM7_block_120ul_in_brain_20x2_in_T\'};...%%18
{'Zen_01Oct23_Tcells_in_brain_CD44_block_120ul_brain_slices_20ul_in_T\'};...%%19


%%CalA
{'Zen_09Nov23_Tcells_in_brain_CalA_1nM_rep1\'};...%%20
{'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2\'};...%%21%%it has two sets of big data
{'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep3\'};...%%22%%this is empty


%%LatA
{'Zen_08Nov23_Tcells_in_brain_LatA_500nM_rep1\'};...%%23
{'Zen_08Nov23_Tcells_in_brain_LatA_500nM_rep2\'};...%%24
{'Zen_15Nov23_Tcells_in_brain_LatA_500nM_rep3\'};...%%25


%%Nocodazole
{'Zen_15Jul23_Tcells_in_brain_1000uM_Nocadazole\'};...%%26
{'Zen_12Jul23_Tcells_in_brain_10uM_Nocadazole\'};...%%27
{'Zen_30Sep23_Tcells_in_brain_10uM_Nocodazole\'};...%%28
{'Zen_11Oct23_Tcells_in_brain_10uM_Nocodazole_rep3\'};...%%29


%%Taxol
{'Zen_14Jul23_Tcells_in_brain_100nM_Taxol\'};...%%30
{'Zen_11Jul23_Tcells_in_brain_1000nM_Taxol\'};...%%31
{'Zen_11Jul23_Tcells_in_brain_1000nM_Taxol\'};...%%32
{'Zen_29Sep23_Tcells_in_brain_Taxol_100nM\'};...%%33
{'Zen_10Oct23_Tcells_in_brain_Taxol_100nM_Rep3\'};...%%34


%% Human T cells
{'Zen_29Jul23_RhoA_HTcells_in_brain\'};...%%35
{'Zen_29Jul23_RhoA_HTcells_in_brain\'};...%%36

{'Zen_24Jul23_HTcells_in_brain_no_incubation\'};...%%37
{'Zen_21Jul23_HTcells_in_brain_NoCO2\'};...%%38
{'Zen_20Jul23_HTcells_in_brain\'};...%%39
];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Sub folders


file_sample=[

%%Mouse T cells
{'Zen_21Jun23_Tcells_in_brain_2023_06_21__19_02_26_Z23_p'};...%%1%%frame=100maxp_number=4%%100%%4
{'Zen_22Jun23_Tcells_in_brain_2023_06_22__18_08_10_Z23_p'};...%%2%%frame=100maxp_number=4%%100%%4
{'Zen_22Jun23_Tcells_in_brain_rep3_2023_06_22__23_31_59_Z23_p'};...%%3%%frame=100maxp_number=4%%100%%4
{'Zen_25Jun23_Tcells_in_brain_2023_06_25__19_01_09_Z23_p'};...%%4%%frame=55maxp_number=14%%100(55)%%14
{'Zen_25Jun23_Tcells_in_brain_2023_06_25__21_01_08_Z23_p'};...%%5%%frame=100maxp_number=14%%100%%14

{'Zen_27Jun23_Tcells_in_brain_35ul_50uM_Cal_2023_06_28__00_14_13_Z23_p'};...%%6%%1%%frame=80maxp_number=14%%80%%14
{'Zen_27Jun23_Tcells_in_brain_2023_06_27__20_43_29_Z23_p'};...%%7%%frame=50maxp_number=13%%50%%13
{'Zen_27Jun23_Tcells_in_brain_2023_06_27__22_17_36_Z23_p'};...%%8%%frame=30maxp_number=15%%50(30)%%15
{'Zen_27Jun23_Tcells_in_brain_2023_06_27__22_51_21_Z23_p'};...%%9%%frame=50maxp_number=15%%50%%15

{'Zen_22Aug23_MTcells_in_the_brain_high_res_2023_08_22__19_06_19_Z23_p'};...%%10%%frame=60maxp_number=17%%60%%17
{'Zen_22Aug23_MTcells_in_the_brain_high_res_a_day_aftr_2023_08_23__19_02_42_Z23_p'};...%%11%%frame=100maxp_number=16%%100%%16

{'Zen_25Aug23_MTcells_in_brain_slices_embd_collagen_2023_08_25__20_34_46_Z23_p'};...%%12%%frame=100maxp_number=19%%100%%19
{'Zen_25Aug23_MTcells_in_brain_slices_embd_collagen_2023_08_26__01_28_30_Z23_p'};...%%13%%frame=400maxp_number=16%%400%%16

{'Zen_23Aug23_MTcells_in_the_brain_high_res_3hr_2023_08_23__22_40_50_Z23_p'};...%%14%%frame=73maxp_number=18%%73%%18


%%IM7
{'Zen_28Jun23_Tcells_in_brain_20ugml_IM7apriori_2023_06_28__04_04_23_Z23_p'};...%%15%%frame=150
{'Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49_Z23_p'};...%%16%%frame=100
{'Zen_21Sep23_Tcells_in_the_bran_IM7_20ugml_rep2_2023_09_21__21_46_45_Z23_p'};...%%17%%frame=73maxp_number=14%%t cells proll died
{'en_29Sep23_Tcells_in_brain_slices_full_IM7_block_120ug_in_brain_20x2_in_T_3hr_2023_09_29__02_48_37_Z23_p'};...%%18%%frame=2000maxp_number=22
{'Zen_01Oct23_Tcells_in_brain_CD44_block_120ul_brain_slices_20ul_in_T_2023_10_01__05_53_53_Z23_p'};...%%19%%frame=10000maxp_number=10000


%% CalA
{'Zen_09Nov23_Tcells_in_brain_CalA_1nM_rep1_2023_11_09__20_07_06_Z23_p'};...%%20%%
{'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37_Z23_p'};...%%21%%
{'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__15_10_26_Z23_p'};...%%22%%


%% LatA
{'Zen_08Nov23_Tcells_in_brain_LatA_500nM_rep1_2023_11_08__01_56_23_Z23_p'};...%%23%%
{'Zen_08Nov23_Tcells_in_brain_LatA_500nM_rep2_2023_11_08__12_53_43_Z23_p'};...%%24%%
{'Zen_15Nov23_Tcells_in_brain_LatA_500nM_rep3_2023_11_15__01_47_09_Z23_p'};...%%25%%


%% Nocodazole
{'Zen_15Jul23_Tcells_in_brain_1000uM_Nocadazole_2023_07_14__23_27_53_Z23_p'};...%%26%%frame=100
{'Zen_12Jul23_Tcells_in_brain_10uM_Nocadazole_2023_07_13__00_56_57_Z23_p'};...%%27%%frame=100
{'Zen_30Sep23_Tcells_in_brain_10uM_Nocodazole_2023_10_01__02_20_18_Z23_p'};...%%28%%
{'Zen_11Oct23_Tcells_in_brain_10uM_Nocodazole_rep3_2023_10_11__23_10_58_Z23_p'};...%%29%%


%% Taxol
{'Zen_14Jul23_Tcells_in_brain_100nM_Taxol_2023_07_14__01_08_06_Z23_p'};...%%30%%frame=100
{'Zen_11Jul23_Tcells_in_brain_1000nM_Taxol_2023_07_12__02_31_38_Z23_p'};...%%31%%frame=100%%3-100
{'Zen_11Jul23_Tcells_in_brain_control_2023_07_12__01_10_08_Z23_p'};...%%32%%frame=50
{'en_29Sep23_Tcells_in_brain_Taxol_100nM_2023_09_30__06_00_08_Z23_p'};...%%33 %%1%%frames only, nothing after that
{'Zen_10Oct23_Tcells_in_brain_Taxol_100nM_Rep3_2023_10_10__23_44_47_Z23_p'};... %%34 %%1%%frames only, nothing after that


%% human T cells
{'Zen_29Jul23_RhoA_HTcells_in_brain_2023_07_29__01_18_16_Z23_p'};...%%35%%frame=231maxp_number=22%%231%%22
{'Zen_29Jul23_RhoA_HTcells_in_brain_18hr_later_2023_07_29__20_34_26_Z23_p'};...%%36%%frame=9maxp_number=22%%9%%22

{'Zen_24Jul23_HTcells_in_brain_no_incubation_2023_07_25__00_24_15_Z23_p'};...%%37%%frame=169maxp_number=16%%169%%16
{'Zen_21Jul23_HTcells_in_brain_NoCO2_2023_07_21__21_57_50_Z23_p'};...%%38%%frame=150maxp_number=19%%150%%19
{'Zen_20Jul23_HTcells_in_brain_2023_07_20__17_21_30_Z23_p'};...%%39%%frame=200maxp_number=19%%200%%19
];

n_movie_in_each_file=[
    4
    ,4
    ,4
    ,14
    ,14
    ,14
    ,13
    ,15
    ,15
    ,17
    ,16
    ,19
    ,16
    ,18
    ,20
    ,20
    ,14
    ,22
    ,21
    ,22
    ,19
    ,19
    ,20
    ,20
    ,22
    ,22
    ,23
    ,20
    ,22
    ,21
    ,20
    ,20
    ,19
    ,25
    ,22
    ,22
    ,16
    ,19
    ,19
    ];

n_folder=size(folder_sample,1);


%%thumbnails to see everythng at once

% sel_folder_id=7;
% sel_movie_id=12;
% sel_track_id=1;
common_folder='E:\Aamir experiment data\Comm_plot\';
%sel_folder_id=find(ismember(file_sample,filename_pre_red));
sel_folder_id=1;
full_filename_pre_red=[home_address,folder_sample{sel_folder_id,1},file_sample{sel_folder_id,1}];

% close all
% XYTable_modified_read=XY_data_modified;
% XYTable_modified_read.condition=[];

if sum(ismember(XYTable_modified_read.Properties.VariableNames,'condition'))%i_k~=4 && i_k ~=5
    XYTable_modified_read= removevars(XYTable_modified_read,{'condition'});
end

%%%
combining_all_xy_joined=table2array(XYTable_modified_read);
combining_all_xy_joined_copy=combining_all_xy_joined;
red_inten_saved_method_1=nan(size(combining_all_xy_joined,1),1);
red_inten_saved_method_2=nan(size(combining_all_xy_joined,1),1);

%[{'Movie ID'},{'Track_ID'},{'No of spots'},{'x'},{'y'},{'med_speed'},{'Linearity'},{'Alpha'},{'RMC'},{'Track Angle'},{'Mean Track Angle'},{'Relative Mean Track Angle'},transpose(metadata_for_XY_plots),{'Red_Intensity'};num2cell(All_XY)];
movie_id=combining_all_xy_joined(:,1);
track_id=combining_all_xy_joined(:,2);
x_series = combining_all_xy_joined(:,4);
y_series = combining_all_xy_joined(:,5);
speed_series=combining_all_xy_joined(:,6);
linearity_series=combining_all_xy_joined(:,7);
alpha_series=combining_all_xy_joined(:,8);
RMC_series=combining_all_xy_joined(:,9);

voxel_size_x=2.62;
voxel_size_y=2.62;
image_size_x=512;
image_size_y=512;

marker_size=12;


cell_diameter=5;%has to be an integer,=>1

if mod(cell_diameter,2)==0
    eff_cell_diameter=cell_diameter+1;
else
    eff_cell_diameter=cell_diameter;
end

x_series_pix=floor(x_series./voxel_size_x)+1;
y_series_pix=floor(y_series./voxel_size_y)+1;



% figure('Renderer', 'painters', 'Position', [0 10 1400 600],'WindowState', 'maximized')
%figure('Renderer', 'painters','WindowState','maximized')


subplot_row=3;%ceil(sqrt(length(plot_these_data)));
subplot_column=5;%ceil((length(plot_these_data))/subplot_row);

% Create subplots
fig_1=figure(10);
fig_1.Position=[50,50,1600,700];

t=tiledlayout(subplot_row,subplot_column);
t.TileSpacing = 'tight';

unique_movie_id=unique(movie_id(:,1));

%t_width=98;
for movie_i = 1:nnz(unique_movie_id)
    %disp(unique_movie_id(movie_i));

    if unique_movie_id(movie_i)<10
        str_movie_i= strcat('0',num2str(unique_movie_id(movie_i)));
    else
        str_movie_i= strcat('',num2str(unique_movie_id(movie_i)));
    end

    if nnz(unique_movie_id)<10
        str_movie_i= strcat('',num2str(unique_movie_id(movie_i)));
    end

    movie_i_file_name=strcat(full_filename_pre_red,str_movie_i);
    movie_i_file_name=strcat(movie_i_file_name,'_red.tif');
    disp(movie_i_file_name)

    single_red_tif=loadtiff(movie_i_file_name);
    % temp_tiff = single_red_tif(:,:,2);
    % image_double=im2double(temp_tiff);
    % image_double_mod=imadjust(image_double);
    %temp_tiff=imadjust(temp_tiff);

    track_id_sel=track_id(movie_id==unique_movie_id(movie_i));

    x_series_pix_movie=x_series_pix(movie_id==unique_movie_id(movie_i));
    y_series_pix_movie=y_series_pix(movie_id==unique_movie_id(movie_i));

    x_series_movie=x_series(movie_id==unique_movie_id(movie_i));
    y_series_movie=y_series(movie_id==unique_movie_id(movie_i));

    speed_series_sel=speed_series(movie_id==unique_movie_id(movie_i));
    linearity_series_sel=linearity_series(movie_id==unique_movie_id(movie_i));
    alpha_series_sel=alpha_series(movie_id==unique_movie_id(movie_i));
    RMC_series_sel=RMC_series(movie_id==unique_movie_id(movie_i));


    t_width=nnz(track_id_sel==1);
    total_track=nnz(unique(track_id_sel));
    red_inten_movie=nan+zeros(t_width*total_track,1);

    %subplot(1,3,1)
    % tiledlayout(1,3,"TileSpacing","compact")
    % nexttile(1);
    %
    % imshow(image_double_mod)
    % hold on
    %
    % fig_4=figure(4);
    % fig_4.Position=[500,50,800,800];
    % hold on
    %
    % xlim([1,image_size_x]);
    % ylim([1,image_size_y]);
    % box on;

    red_inten_movie_method_1=[];
    red_inten_movie_method_2=[];

    for track=1:total_track
        current_track_block=(track-1)*t_width+1:track*t_width;

        current_x_ser_pix=x_series_pix_movie(current_track_block);
        current_y_ser_pix=y_series_pix_movie(current_track_block);

        current_x_ser=x_series_movie(current_track_block);
        current_y_ser=y_series_movie(current_track_block);

        red_inten_at_time_t_method_1=nan+0*current_x_ser;
        red_inten_at_time_t_method_2=nan+0*current_x_ser;

        for time=1:t_width
            temp_tiff_at_t = single_red_tif(:,:,time);
            temp_tiff_at_t_copy=imadjust(temp_tiff_at_t);
            RedMonochrome=cat(3,temp_tiff_at_t_copy,zeros(size(temp_tiff_at_t_copy)),zeros(size(temp_tiff_at_t_copy)));
            %imshow((RedMonochrome))

            %Red_image=imshow(temp_tiff_at_t,[]);

            x_cent_pix_at_time_t=current_x_ser_pix(time);
            y_cent_pix_at_time_t=current_y_ser_pix(time);

            x_cent_at_time_t=current_x_ser(time);
            y_cent_at_time_t=current_y_ser(time);

            if sum(~isnan(x_cent_pix_at_time_t))~=0

                cell_coverage_x=nan(1,eff_cell_diameter);
                cell_coverage_y=nan(eff_cell_diameter,1);
                cell_coverage_x_square=nan(eff_cell_diameter,eff_cell_diameter);
                cell_coverage_y_square=nan(eff_cell_diameter,eff_cell_diameter);

                intensity_cell_coverage_square=nan(eff_cell_diameter,eff_cell_diameter);
                weight_cell_coverage_square=nan(eff_cell_diameter,eff_cell_diameter);

                pix_neighbour=floor(eff_cell_diameter/2);
                count_pix=1;
                for i=-pix_neighbour:pix_neighbour
                    cell_coverage_x(1,count_pix)=x_cent_pix_at_time_t+i;
                    cell_coverage_y(count_pix,1)=y_cent_pix_at_time_t+i;
                    count_pix=count_pix+1;
                end

                cell_coverage_x_square=repmat(cell_coverage_x,[eff_cell_diameter,1]);
                cell_coverage_y_square=repmat(cell_coverage_y,[1,eff_cell_diameter]);

                cell_coverage_x_square(cell_coverage_x_square<1 | cell_coverage_x_square>image_size_x)=nan;
                cell_coverage_y_square(cell_coverage_y_square<1 | cell_coverage_y_square>image_size_y)=nan;

                for index_i=1:(eff_cell_diameter)
                    for index_j=1:(eff_cell_diameter)
                        if isnan(cell_coverage_x_square(index_i,index_j)) || isnan(cell_coverage_y_square(index_i,index_j))
                            intensity_cell_coverage_square(index_i,index_j)=nan;
                        else
                            intensity_cell_coverage_square(index_i,index_j)=temp_tiff_at_t(cell_coverage_x_square(index_i,index_j),cell_coverage_y_square(index_i,index_j));
                            %plot(cell_coverage_x_square(index_i,index_j),cell_coverage_y_square(index_i,index_j),'rs');
                        end
                    end
                end
                % plot(current_x_ser_pix,current_y_ser_pix,'k-');

                if mod(cell_diameter,2)==0 %even
                    fraction_weight=0.5;
                else
                    fraction_weight=1;
                end

                middle_index=ceil(eff_cell_diameter/2);
                enclosing_index=eff_cell_diameter-middle_index-1;

                weight_cell_coverage_square=fraction_weight*ones(eff_cell_diameter,eff_cell_diameter);
                weight_cell_coverage_square(middle_index-enclosing_index:middle_index+enclosing_index,middle_index-enclosing_index:middle_index+enclosing_index)=1;
                red_inten_at_time_t_method_1(time)=nanmean(nanmean(intensity_cell_coverage_square.*weight_cell_coverage_square));
            end

            if sum(~isnan(x_cent_at_time_t))~=0
                red_inten_at_time_t_method_2(time) = nanmean(nanmean(intensity_cell_coverage_square));
                % img=temp_tiff_at_t;
                % %img = rand(640, 480);
                % x   = x_cent_at_time_t;  % Position of center
                % y   = y_cent_at_time_t;
                % r   = eff_cell_diameter/2;   % Radius
                % h = size(img, 1);
                % w = size(img, 2);
                % mask(:,:,time) = ((1-x:h-x).' .^2 + (1-y:w-y) .^2) <= r^2;
                % red_inten_at_time_t_method_2(time) = sum(img(mask(:,:,time)), 'all');
                %
                % %red_inten_at_time_t_method_2(time) = nanmean(nanmean(intensity_cell_coverage_square));
                % [mask_y,mask_x]= ind2sub(size(mask(:,:,time)),find(mask(:,:,time)==1));
                % plot(mask_x,mask_y,'m*-')
                %B = imoverlay(temp_tiff_at_t,mask,'m');
                %B = imshow(mask);
            end
        end

        red_inten_movie_method_1(current_track_block)=red_inten_at_time_t_method_1;
        red_inten_movie_method_2(current_track_block)=red_inten_at_time_t_method_2;
    end

    red_inten_saved_method_1(movie_id==unique_movie_id(movie_i))=red_inten_movie_method_1;
    red_inten_saved_method_2(movie_id==unique_movie_id(movie_i))=red_inten_movie_method_2;
    %red_inten_saved(movie_id==movie_i)=x_series_pix_sel;


    %%%%%%%%% plotting etc
    % fig_3=figure(3);
    % fig_3.Position=[50,50,800,800];

    nexttile(1);
    hold on
    temp_tiff_at_t_copy=imadjust(temp_tiff_at_t);
    RedMonochrome=cat(3,temp_tiff_at_t_copy,zeros(size(temp_tiff_at_t_copy)),zeros(size(temp_tiff_at_t_copy)));

    imshow(RedMonochrome,[])%%the latest time

    % hold on
    for track=1:total_track
        current_track_block=(track-1)*t_width+1:track*t_width;

        current_x_ser_pix=x_series_pix_movie(current_track_block);
        current_y_ser_pix=y_series_pix_movie(current_track_block);

        current_x_ser=x_series_movie(current_track_block);
        current_y_ser=y_series_movie(current_track_block);


        %subplot(1,3,1)
        nexttile(1);
        hold on
        %imshow(temp_tiff,[])
        plot(current_x_ser_pix,current_y_ser_pix,'g.-','MarkerSize',3);
        %scatter(current_x_ser_pix,current_y_ser_pix,2);%,track_id_sel(current_track_block), 'filled');


        text_x_for_track=nanmean(x_series_pix_movie(current_track_block));
        text_y_for_track=nanmean(y_series_pix_movie(current_track_block));
        % text(text_x_for_track,text_y_for_track,num2str(track),'Color','w');
        xlim([1,image_size_x]);
        ylim([1,image_size_y]);

        box on;
        %subplot(1,3,2)
        % nexttile(2);
        % hold on

        red_inten_sel_track=red_inten_movie_method_1(current_track_block);
        alpha_series_sel_track=alpha_series_sel(current_track_block);
        RMC_series_sel_track=RMC_series_sel(current_track_block);

        mean_red_inten_sel_track(track)=nanmean(red_inten_sel_track);
        if ~isempty(unique(alpha_series_sel_track(~isnan(alpha_series_sel_track))))
            mean_alpha_series_sel_track(track)=unique(alpha_series_sel_track(~isnan(alpha_series_sel_track)));
        else
            mean_alpha_series_sel_track(track)=nan;
        end


        if ~isempty(unique(RMC_series_sel_track(~isnan(RMC_series_sel_track))))
            mean_RMC_series_sel_track(track)=unique(RMC_series_sel_track(~isnan(RMC_series_sel_track)));
        else
            mean_RMC_series_sel_track(track)=nan;
        end

        %track_length(track)=sum(~isnan(RMC_series_sel_track));


        if sum(~isnan(red_inten_sel_track))>1
            red_inten_sel_track_filled=linear_nan_fill(red_inten_sel_track);
            track_length(track)=sum(~isnan(red_inten_sel_track_filled));

            % plot(1:tot_frame,red_inten_sel_track_filled,'k.-');
            % scatter(1:tot_frame, red_inten_sel_track, 12,alpha_series_sel_track, 'filled');
            % cbar = colorbar;
            % %cbar.Title.String = masterColumn_header;  % Set the colorbar title
            % set(gca,'ColorScale','log')
            % set( cbar, 'YTick', [0,0.5,1,1.5,2,2.5] );
            % ylabel('Mean Red Intensity (8 bits)');
            % xlabel('Time frames');
            % box on;
        else
            track_length(track)=nan;
        end
    end

    %subplot(1,3,3)
    nexttile(2);
    hold on
    for track=1:total_track
        if track_length(track)>=8
            plot(mean_alpha_series_sel_track(track),mean_red_inten_sel_track(track),'ko');
        end
    end
    %xlabel('RMC (\mum^2/min)');
    xlabel('\alpha');
    ylabel('Mean Red Intensity (8 bits)');
    box on;
    %mean_RMC_series_sel_track
    %saveas(figure(movie_i),filename_save);
    %close all;

end

%XY_colocalization=red_inten_saved_method_1;
%XYTable_modified_read=combining_all_xy_joined;

%%
%writetable(XYTable_modified,[common_folder,filename],'Sheet','XY_data_modified');
%close all
% clear
% clc

% common_folder='E:\Aamir experiment data\Comm_plot\';
% filename='Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49__p13_Model_09-Mar-2024_all.xlsx';
% XYTable_modified_read= readtable([common_folder,filename],'Sheet','XY_data_modified');  % Load the data into a table



XY_colocalization=XYTable_modified_read.Red_Intensity;

group_filteredData_k{1,1}=[];
group_filteredData_k{1,2}=[];
group_filteredData_k{1,3}=[];


group_matrix_1=[];
group_matrix_2=[];
group_matrix_3=[];

intensity_threshold=35;
large_change_threshold_intensity=5;%%%+- 10
large_change_threshold_step=5;
step_threshold=2.6;

for i=1:length(XY_colocalization)/t_width
    track_block=(i-1)*t_width+1:i*t_width;
    red_inten_track_orig=XY_colocalization(track_block);

    red_inten_track=red_inten_track_orig;
    red_inten_track(red_inten_track<=intensity_threshold)=nan;

    mean_intensity(i)=nanmedian(red_inten_track_orig);
    std_intensity(i)=nanstd(red_inten_track_orig);
    max_intensity(i)=max(red_inten_track_orig);
    min_intensity(i)=min(red_inten_track_orig);

    no_abv_noise(i)=sum(~isnan(red_inten_track));
    track_length(i)=unique(XYTable_modified_read.NoOfSpots(track_block));
    fraction_abv_noise(i)=no_abv_noise(i)/track_length(i);

    fraction_state1(i)=sum(XYTable_modified_read.step(track_block)<step_threshold)/(track_length(i)-1);
    fraction_state2(i)=sum(XYTable_modified_read.step(track_block)>step_threshold)/(track_length(i)-1);

    %%%%fraction of sudden large change in the intensity
    fraction_sudden_change_inten(i)=sum(abs(diff(red_inten_track_orig))>=large_change_threshold_intensity);%/(track_length(i)-1);

    fraction_sudden_change_step(i)=sum(abs(diff(XYTable_modified_read.step(track_block)))>=large_change_threshold_step);%/(track_length(i)-1);
    fraction_sudden_change_both(i)=sum(abs(diff(red_inten_track_orig))>=large_change_threshold_intensity & abs(diff(XYTable_modified_read.step(track_block)))>=large_change_threshold_step);%/(track_length(i)-1);


    if sum(isnan(unique(XYTable_modified_read.Alpha(track_block))))==0
        track_alpha(i)=unique(XYTable_modified_read.Alpha(track_block));%%retrieve corresponding properties from the MAin table
        track_RMC(i)=unique(XYTable_modified_read.RMC(track_block));%%retrieve corresponding properties from the MAin table
    else
        track_alpha(i)=nan;
        track_RMC(i)=nan;
    end

    % if isnan(track_alpha(i))
    %     group_matrix_3=[group_matrix_3;[mean_intensity(i),std_intensity(i),max_intensity(i),no_abv_noise(i),fraction_abv_noise(i),fraction_sudden_change(i),track_alpha(i),track_RMC(i)]];
    % elseif track_alpha(i)<1
    %     group_matrix_1=[group_matrix_1;[mean_intensity(i),std_intensity(i),max_intensity(i),no_abv_noise(i),fraction_abv_noise(i),fraction_sudden_change(i),track_alpha(i),track_RMC(i)]];
    % else
    %     group_matrix_2=[group_matrix_2;[mean_intensity(i),std_intensity(i),max_intensity(i),no_abv_noise(i),fraction_abv_noise(i),fraction_sudden_change(i),track_alpha(i),track_RMC(i)]];
    % end

    if track_alpha(i)>=2%isnan(track_alpha(i))
        group_matrix_3=[group_matrix_3;[mean_intensity(i),std_intensity(i),max_intensity(i),no_abv_noise(i),fraction_abv_noise(i),fraction_sudden_change_inten(i),fraction_sudden_change_step(i),fraction_sudden_change_both(i),track_alpha(i),track_RMC(i)]];
    elseif track_alpha(i)<1
        group_matrix_1=[group_matrix_1;[mean_intensity(i),std_intensity(i),max_intensity(i),no_abv_noise(i),fraction_abv_noise(i),fraction_sudden_change_inten(i),fraction_sudden_change_step(i),fraction_sudden_change_both(i),track_alpha(i),track_RMC(i)]];
    else
        group_matrix_2=[group_matrix_2;[mean_intensity(i),std_intensity(i),max_intensity(i),no_abv_noise(i),fraction_abv_noise(i),fraction_sudden_change_inten(i),fraction_sudden_change_step(i),fraction_sudden_change_both(i),track_alpha(i),track_RMC(i)]];
    end

end

header = {'mean_red','std_red','max_red','no_abv_noise','fract_abv_noise','fract_change_inten','fract_change_step','fract_change_both','alpha','RMC'};
%header = {'mean_red','no_abv_noise','fract_abv_noise','fract_change_inten','fract_change_step','fract_change_both'};


group_table_1 = array2table(group_matrix_1, 'VariableNames',header);
group_table_2 = array2table(group_matrix_2, 'VariableNames',header);
group_table_3 = array2table(group_matrix_2, 'VariableNames',header);


group_filteredData_k{1,1}=group_table_1;
group_filteredData_k{1,2}=group_table_2;
group_filteredData_k{1,3}=group_table_3;


file_x_axis_label={'\alpha<1','\alpha>1','Rest'};
%%plot usual properties
%close all
%figure
% Define the master column (e.g., 'master_column')
%masterColumn = 'speed';  % Replace with your actual master column name
masterColumn = 'alpha';  %'std_red'% Replace with your actual master column name

weightColumn = 'alpha';  % Replace with your actual master column name

% Define custom colors for the legend
colors = [
    0.2 0.8 0.2;  % Green
    0 0 0;        % Black
    1 0 0;        % Red
    1 0 1;        % Magenta (for NaN values)
    ];

% Define legend labels
legendLabels = {
    '< 0.95',
    '0.95 - 1.05',
    '> 1.05',
    'NaN'
    };
% header_name={'video_id','track_t_length','area','aspectRatio','speed','confinement','alpha','sat_MSD','tau_c','conf_D','RMC','directed_v','directed_D'};
% plot_these_data=header_name;

%%plot 1
header_name={'mean_red','no_abv_noise','fract_abv_noise','fract_change_inten','fract_change_step','fract_change_both'};


plot_these_data=header_name;
%plot_these_data_lables={'Mean Red Intensity','Std Red Intensity','Max Red Intensity','Occurence above noise','Fraction of above noise','Change in Intensity','Change in Step','Change in Intensity & Step','\alpha','RMC (um2/min)'};
plot_these_data_lables={'Mean Red Intensity','Occurence above noise','Fraction of above noise','Change in Intensity','Change in Step','Change in Intensity & Step'};


% subplot_row=3;%ceil(sqrt(length(plot_these_data)));
% subplot_column=4;%ceil((length(plot_these_data))/subplot_row);
%
% % Create subplots
% fig_1=figure(1);
% fig_1.Position=[50,50,1200,700];
%
% tiledlayout(subplot_row,subplot_column);

tile_count=2;

tile_count=tile_count+1;
nexttile(tile_count)
histogram(XYTable_modified_read.Red_Intensity,20,'FaceAlpha',1,'EdgeAlpha',0,'FaceColor','k')
xlabel('Red Intensity');
ylabel('Count');
xline(intensity_threshold,'--r')
box on;

tilelocations=[2,3,4,9,10,11]+2;
for i = 1:6%length(plot_these_data)
    columnName = plot_these_data{i};
    nexttile(tilelocations(i))
    yData_combined=[];
    count_k=0;
    for k=1:length(group_filteredData_k) %%%should be from 1

        if 1%ismember(k,[1,7,8])==1
            count_k=count_k+1;
            filteredData=group_filteredData_k{1,k};
            % Get data for the current subplot
            xData = 1+0*filteredData.(columnName);%filteredData.(columnName);
            yData = filteredData.(columnName);
            yData_combined{1,count_k}=1*yData;
            master_column_data{1,count_k}=filteredData.(masterColumn);%master column or alpha values
            weight_column_data{1,count_k}=filteredData.(weightColumn);%weight column usually no of spots in a a trcak
            file_x_axis_label_k{1,count_k}=file_x_axis_label{1,k};
        end
    end


    %yData_combined={yData_combined};
    % Color code points based on master column values
    %scatter(xData, yData, 30, 'filled');
    %colormap(colors);

    %visualizeDataWithOptions({yData,2*yData,3*yData});
    visualizeDataWithOptions(yData_combined,master_column_data,weight_column_data,'\alpha');
    ax = gca;
    ax.YLabel.String = plot_these_data_lables{i};
    ax.XTick=linspace(1,length(yData_combined),length(yData_combined));
    ax.XTickLabels= file_x_axis_label_k;
    ax.XTickLabelRotation = 70;
    ax.XLabel.FontSize = 5;
    if strcmp(columnName,'RMC')==1
        ax.YScale = 'log';
        ax.YTick=[0.0001,0.1,1,10,100,1000];
        %ax.YLim=[0,1];
    end

    %header = {'mean_red','std_red','max_red','no_abv_noise','alpha','RMC'};

    if strcmp(columnName,'mean_red')==1 | strcmp(columnName,'max_red')
        %ax.YScale = 'log';
        %ax.YTick=[0.0001,0.1,1,10,100,1000];
        %ax.YLim=[0,1];
        hline1=yline(intensity_threshold,'r--');
        %hline1
    end

end



% %close all
% fig_2=figure(2);
% fig_2.Position=[50,50,1200,600];
% t=tiledlayout(2,3);
% t.TileSpacing = 'tight';
%
% tile_count=0;
%
% % intensity_threshold=35;
% % large_change_threshold=8;%%%+- 10
% % large_change_threshold_step=8;
% % step_threshold=2.6;


marker_size=12;
tile_count=4+2;

tile_count=tile_count+1;
nexttile(tile_count)
t_width=100;
hold on
for track=1%:height(XYTable_modified_read)/t_width
    current_track_block=((track-1)*t_width+1):(track*t_width);
    yyaxis left
    plot(1:t_width,XYTable_modified_read.Red_Intensity(current_track_block),'.-')
    ylabel('Red Intensity');

    yyaxis right
    plot(1:t_width,XYTable_modified_read.step(current_track_block),'.-')
    ylabel('Step length (\mum)');

end
xlabel('Time');
%ylabel('Red Intensity');
box on;

tile_count=tile_count+1;
nexttile(tile_count)
scatter(XYTable_modified_read.step,XYTable_modified_read.Red_Intensity,marker_size,XYTable_modified_read.Alpha,'o');
xlabel('Step length (\mum)');
ylabel('Red Intensity');
xline(large_change_threshold_step,'r--');
yline(intensity_threshold,'r--');
box on;

ax = gca;
ax.XScale='log';
cb=colorbar;
cb.Title.String='\alpha';

tile_count=tile_count+1;
nexttile(tile_count)
scatter(XYTable_modified_read.angle,XYTable_modified_read.Red_Intensity,marker_size,XYTable_modified_read.Alpha,'o');
xlabel('Turning angle (rad)');
set(gca,'XTick',-pi:pi/2:pi)
set(gca,'XTickLabel',{'-\pi','-\pi/2','0','\pi/2','\pi'});
ylabel('Red Intensity');
box on;
cb=colorbar;
cb.Title.String='\alpha';


tile_count=tile_count+1;
nexttile(tile_count)
hold on
for track=1:height(XYTable_modified_read)/t_width
    current_track_block=((track-1)*t_width+1):(track*t_width);
    scatter(diff(XYTable_modified_read.step(current_track_block)),diff(XYTable_modified_read.Red_Intensity(current_track_block)),marker_size,XYTable_modified_read.Alpha(((track-1)*t_width+1):(track*t_width)-1),'o')
end

xline(large_change_threshold_step,'r--');
xline(-1*large_change_threshold_step,'r--');

yline(large_change_threshold_intensity,'r--');
yline(-1*large_change_threshold_intensity,'r--');

xlim([-50,50]);
ylim([-25,25]);

xline(0,'k-');
yline(0,'k-');

xlabel('\delta(step)');
ylabel('\delta(Red Intensity)');
box on;

cb=colorbar;
cb.Title.String='\alpha';



tile_count=11+2;

tile_count=tile_count+1;
nexttile(tile_count)
hold on
for track=1:height(XYTable_modified_read)/t_width
    %current_track_block=((track-1)*t_width+1):(track*t_width);
    %(XYTable_modified_read.Alpha((track-1)*t_width+1))
    scatter(mean_intensity(track),fraction_state1(track),marker_size,(XYTable_modified_read.Alpha((track-1)*t_width+1)),'o');
end


xlabel('Mean Intensity');
ylabel('Time in the slow state');
box on;


cb=colorbar;
cb.Title.String='\alpha';
% tile_count=tile_count+1;
% nexttile(tile_count)
