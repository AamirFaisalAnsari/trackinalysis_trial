function mean_red_inten_track_all_movie=colocalization_as_neighbor_radius_v3(filename_pre_red,XYTable_modified_read,size_x,size_y,voxel_size_x,voxel_size_y,cell_diameter)

use_as_function=1;
if ~use_as_function
    clc;
    clear all;
    close all

    use_as_function=0;
    voxel_size_x=2.62;
    voxel_size_y=2.62;
    size_x=512;
    size_y=512;
end


home_address='F:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\';
common_folder='F:\Aamir experiment data\Comm_plot\';

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


n_folder=size(folder_sample,1);
common_folder='E:\Aamir experiment data\Comm_plot\';

if ~use_as_function
    cell_diameter=ceil(10/voxel_size_x);%floor(30/voxel_size_x);%has to be an integer,=>1
    figure_on=1;
    sel_folder_id=1;
    XYTable_modified_read= readtable([common_folder,file_sample{sel_folder_id,1},'1_Model_v2_29-Apr-2024_all.xlsx'],'Sheet','Time series data');  % Load the data into a table
else
    cell_diameter=ceil(cell_diameter/voxel_size_x);
    sel_folder_id=find(ismember(file_sample,filename_pre_red));
end

full_filename_pre_red=[home_address,folder_sample{sel_folder_id,1},file_sample{sel_folder_id,1}];



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


marker_size=12;


if mod(cell_diameter,2)==0
    eff_cell_diameter=cell_diameter+1;
else
    eff_cell_diameter=cell_diameter;
end

x_series_pix=floor(x_series./voxel_size_x)+1;
y_series_pix=floor(y_series./voxel_size_y)+1;



% figure('Renderer', 'painters', 'Position', [0 10 1400 600],'WindowState', 'maximized')
%figure('Renderer', 'painters','WindowState','maximized')


subplot_row=1;%ceil(sqrt(length(plot_these_data)));
subplot_column=2;%ceil((length(plot_these_data))/subplot_row);
figure_on=0;

% Create subplots
if figure_on
    fig_1=figure(10);
    fig_1.Position=[50,50,1600,700];

    t=tiledlayout(subplot_row,subplot_column);
    t.TileSpacing = 'tight';
end

unique_movie_id=unique(movie_id(:,1))

all_track_in_movie=0;
for movie_i = 1:nnz(unique_movie_id)
    %disp(unique_movie_id(movie_i));

    if unique_movie_id(movie_i)<10
        str_movie_i= strcat('0',num2str(unique_movie_id(movie_i)));
    else
        str_movie_i= strcat('',num2str(unique_movie_id(movie_i)));
    end

    if max(unique_movie_id)<10
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

    %subplot(1,2,1)
    %  tiledlayout(1,1,"TileSpacing","compact")
    %  nexttile(1);
    %  %
    %  % imshow(image_double_mod)
    % hold on
    %
    % fig_4=figure(4);
    % fig_4.Position=[500,50,800,800];
    % hold on
    %
    % xlim([1,size_x]);
    % ylim([1,size_y]);
    % box on;

    red_inten_movie_method_1=[];
    red_inten_movie_method_2=[];

    for track=1:total_track
        current_track_block=(track-1)*t_width+1:track*t_width;
        %current_track_block=(1-1)*t_width+1:1*t_width;

        current_x_ser_pix=x_series_pix_movie(current_track_block);
        current_y_ser_pix=y_series_pix_movie(current_track_block);

        % current_x_ser_pix=x_series_pix_movie(1:30);
        % current_y_ser_pix=y_series_pix_movie(1:30);

        current_x_ser=x_series_movie(current_track_block);
        current_y_ser=y_series_movie(current_track_block);

        red_inten_at_time_t_method_1=nan+0*current_x_ser;
        red_inten_at_time_t_method_2=nan+0*current_x_ser;

        for time=1:t_width
            %temp_tiff_at_t = single_red_tif(:,:,time*0+1);
            temp_tiff_at_t = transpose(single_red_tif(:,:,time));%%%x,y need to be transposed

            %temp_tiff_at_t_copy=imadjust(temp_tiff_at_t);
            temp_tiff_at_t_copy=transpose(temp_tiff_at_t);
            RedMonochrome=cat(3,temp_tiff_at_t_copy,zeros(size(temp_tiff_at_t_copy)),zeros(size(temp_tiff_at_t_copy)));

            if track==1 && time==1
                %imshow((RedMonochrome))
            end

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

                cell_coverage_x_square(cell_coverage_x_square<1 | cell_coverage_x_square>size_x)=nan;
                cell_coverage_y_square(cell_coverage_y_square<1 | cell_coverage_y_square>size_y)=nan;
                %hold on;

                for index_i=1:(eff_cell_diameter)
                    for index_j=1:(eff_cell_diameter)
                        if isnan(cell_coverage_x_square(index_i,index_j)) || isnan(cell_coverage_y_square(index_i,index_j))
                            intensity_cell_coverage_square(index_i,index_j)=nan;
                        else
                            intensity_cell_coverage_square(index_i,index_j)=temp_tiff_at_t(cell_coverage_x_square(index_i,index_j),cell_coverage_y_square(index_i,index_j));
                            %plot(cell_coverage_x_square(index_i,index_j),cell_coverage_y_square(index_i,index_j),'ks');
                        end
                    end
                end
                %plot(current_x_ser_pix,current_y_ser_pix,'k-');

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
                %red_inten_at_time_t_method_1(time)=max(max(intensity_cell_coverage_square.*weight_cell_coverage_square));

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
    %temp_tiff_at_t_copy=imadjust(temp_tiff_at_t);
    %RedMonochrome=cat(3,temp_tiff_at_t_copy,zeros(size(temp_tiff_at_t_copy)),zeros(size(temp_tiff_at_t_copy)));

    if figure_on
        nexttile(1);
        hold on
        %imshow(RedMonochrome,[])%%the latest time
        imshow(temp_tiff_at_t_copy,[])%%the latest time
    end

    % hold on
    for track=1:total_track
        current_track_block=(track-1)*t_width+1:track*t_width;

        current_x_ser_pix=x_series_pix_movie(current_track_block);
        current_y_ser_pix=y_series_pix_movie(current_track_block);

        current_x_ser=x_series_movie(current_track_block);
        current_y_ser=y_series_movie(current_track_block);



        red_inten_sel_track=red_inten_movie_method_1(current_track_block);
        alpha_series_sel_track=alpha_series_sel(current_track_block);
        RMC_series_sel_track=RMC_series_sel(current_track_block);

        mean_red_inten_track(track)=nanmean(red_inten_sel_track);
        all_track_in_movie=all_track_in_movie+1;
        mean_red_inten_track_all_movie(all_track_in_movie)=mean_red_inten_track(track);
        %mean_red_inten_sel_track(track)=max(red_inten_sel_track);

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



        %subplot(1,3,1)
        if figure_on

            %nexttile(1);
            %hold on
            %imshow(temp_tiff,[])
            if mean_red_inten_track(track)>55
                plot(current_x_ser_pix,current_y_ser_pix,'g.-','MarkerSize',1);
                scatter(current_x_ser_pix,current_y_ser_pix,2,'g')
            else
                plot(current_x_ser_pix,current_y_ser_pix,'w.-','MarkerSize',3);
                scatter(current_x_ser_pix,current_y_ser_pix,2,'w')
            end
            %scatter(current_x_ser_pix,current_y_ser_pix,2);%,track_id_sel(current_track_block), 'filled');


            text_x_for_track=nanmean(x_series_pix_movie(current_track_block));
            text_y_for_track=nanmean(y_series_pix_movie(current_track_block));
            % text(text_x_for_track,text_y_for_track,num2str(track),'Color','w');
            %xlim([1,size_x]);
            %ylim([1,size_y]);

            box on;
            %subplot(1,3,2)
            % nexttile(2);
            % hold on
        end
    end

    %subplot(1,3,3)
    if figure_on

        nexttile(2);
        hold on
        for track=1:total_track
            if 1%track_length(track)>=8
                plot(mean_alpha_series_sel_track(track),mean_red_inten_track(track),'ko');
            end
        end
        %xlabel('RMC (\mum^2/min)');
        xlabel('\alpha');
        ylabel('Mean Red Intensity (8 bits)');
        box on;
    end
    %mean_RMC_series_sel_track
    %saveas(figure(movie_i),filename_save);
    %close all;

end

%XY_colocalization=red_inten_saved_method_1;
%XYTable_modified_read=combining_all_xy_joined;

