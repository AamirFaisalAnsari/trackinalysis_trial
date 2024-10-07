%%%% see original data (selected T cells overlaid on the red)

%function plot_original_tracks_v3(XY_data,sel_folder_filename,sel_movie_id,sel_track_id)
%,sel_movie_id,sel_track_id
% sel_folder_id_previous=look_at_single;
% sel_folder_filename=all_filenames{sel_folder_id_previous,1};
% sel_folder_filename=sel_folder_filename(36:end-32);%prone to error 31 and 32
% XY_data=XY_data_modified_k{1,k_list(sel_folder_id_previous)};

sel_movie_id=[];
sel_track_id=[];

use_as_function=0;
close all
if ~use_as_function

    close all
    % clc
    % clear all

    home_address='F:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\';
    %home_address='F:\Aamir experiment data\Mice brain slices\Human T cells in brain slices\';

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

    %%% Human CAR T cells from COH
    {'Zen_17May24_CART_COH_in_the_brain_rep1\'};...%%40
    {'Zen_18May24_CART_COH_in_the_brain_rep3_IM7_rep1\'};...%%41
    {'Zen_20May24_CART_COH_in_the_brain_IM7_rep2_rep3\'};...%%42
    {'Zen_28Jun24_CART_COH_in_the_brain_rep4_im7_rep4\'};...%%43

    {'Zen_05Jun24_CART_COH_blebb_10uM_cRGD_1uM_rep1\'};...%%44
    {'Zen_06Jun24_CART_COH_blebb_10uM_cRGD_1uM_rep2\'};...%%45

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



    %%%%Human CAR T cells from COH
    {'Zen_17May24_CART_COH_in_the_brain_rep1_2024_05_18__03_31_48_Z23_p'};...%%//40//frame=200//maxp_number=24
    {'Zen_18May24_CART_COH_in_the_brain_rep3_IM7_rep1_13_onward_2024_05_18__11_04_50_Z23_p'};...%%//41//frame=200//maxp_number=24
    {'Zen_20May24_CART_COH_in_the_brain_IM7_rep2_rep3_2024_05_20__21_13_17_Z23_p'};...%%//42//frame=200//maxp_number=28
    {'Zen_28Jun24_CART_COH_in_the_brain_rep4_im7_rep4_2024_06_28__18_13_29_Z23_p'};...%%//43//frame=200//maxp_number=24

    {'Zen_05Jun24_CART_COH_blebb_10uM_cRGD_1uM_rep1_2024_06_05__22_00_12_Z23_p'};...%%//44//frame=400//maxp_number=24
    {'Zen_06Jun24_CART_COH_blebb_10uM_cRGD_1uM_rep2_2024_06_06__21_31_00'};...%%//45//frame=169maxp_number=16//need to split into positions

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

        %%%CART from 40 onwaedrs
        ,24
        ,24
        ,28
        ,24

        ,24
        ,0
        ];

    n_folder=size(folder_sample,1);





    %% thumbnails to see everythng at once

    % sel_folder_id=7;
    % sel_movie_id=12;
    % sel_track_id=1;
    common_folder='F:\Aamir experiment data\Comm_plot\';


    for look_at_single=1:27
        red_thumbnails=[];
        sel_folder_id_previous=look_at_single;
        sel_folder_filename=all_filenames{sel_folder_id_previous,1};

        if look_at_single<=2
            sel_folder_filename=sel_folder_filename(36:end-31);%prone to error 31 and 32
        else
            sel_folder_filename=sel_folder_filename(36:end-32);%prone to error 31 and 32
        end

        XY_data=XY_data_modified_k{1,k_list(sel_folder_id_previous)};


        sel_folder_id=find(ismember(file_sample,sel_folder_filename));
        for k=sel_folder_id%33:n_folder

            if n_movie_in_each_file(k)<10
                subplot_column=2;%ceil(sqrt(n_movie_in_each_file(k)));
            else
                subplot_column=7;
            end

            subplot_row=ceil((n_movie_in_each_file(k))/subplot_column);

            fig_11=figure(11);%,'Renderer', 'painters', 'Position', [300 50 800 600])
            fig_11.Position=[20 20 1800 1000];
            t=tiledlayout(subplot_row,subplot_column,'Padding','tight');
            t.TileSpacing = 'none';
            t.Units='inches';
            %t.OuterPosition = [0.1 0.1 10 10];


            FilePath=[home_address,folder_sample{k,1}];
            temp_address=[];
            count_movie=0;
            if n_movie_in_each_file(k)<10
                excel_file_name=([file_sample{k,1},'1','_Model_v2_29-Apr-2024_all.xlsx']);
            else
                excel_file_name=([file_sample{k,1},'01','_Model_v2_29-Apr-2024_all.xlsx']);
            end


            if n_movie_in_each_file(k)<10
                image_save_address=([file_sample{k,1},'1','_Model_v2_29-Apr-2024_all.pdf']);
            else
                image_save_address=([file_sample{k,1},'01','_Model_v2_29-Apr-2024_all.pdf']);
            end

            if isfile([common_folder,(image_save_address)])
                delete([common_folder,(image_save_address)]);
            end


            if  isfile([common_folder,excel_file_name])
                %XY_data = readtable([common_folder,(excel_file_name)],'Sheet','Time series data');  % Load the data into a table
            end

            for i=1:n_movie_in_each_file(k)
                if i<10
                    fileno_i=strcat('0',num2str(i));
                else
                    fileno_i=num2str(i);
                end

                if n_movie_in_each_file(k)<10
                    fileno_i=num2str(i);
                end

                temp_file_name=([file_sample{k,1},fileno_i,'_red.tif'])
                %temp_file_name=([sel_folder_filename,fileno_i,'_red.tif'])

                if isfile([FilePath,temp_file_name]) %isfile(temp_file_name)%
                    nexttile(i)
                    count_movie=count_movie+1;
                    temp_address=[temp_address,cellstr(temp_file_name)];


                    single_red_tif=loadtiff([FilePath,(temp_file_name)]);
                    %single_red_tif=loadtiff([(temp_file_name)]);

                    for time=1
                        temp_tiff_at_t = single_red_tif(:,:,time);
                    end

                    %histogram(temp_tiff_at_t)

                    min_intensity=0;%min(min(temp_tiff_at_t));
                    mode_intensity=18;%mode(mode(temp_tiff_at_t))+1;
                    max_slope_intensity=mode_intensity+5;

                    %mask1=temp_tiff_at_t>0 & temp_tiff_at_t<mode_intensity;
                    %mask1_overlaid = imoverlay(temp_tiff_at_t,mask1,[0.8,0,0]);

                    mask2=temp_tiff_at_t>0 & temp_tiff_at_t<max_slope_intensity;

                    RedMonochrome=cat(3,imadjust(temp_tiff_at_t),zeros(size(temp_tiff_at_t)),zeros(size(temp_tiff_at_t)));

                    mask2_overlaid = imoverlay(RedMonochrome,mask2,[1,1,1]*0.0);

                    %imshow(RedMonochrome,[]);
                    %imshow(temp_tiff_at_t,[]);
                    imshow(mask2_overlaid,[]);
                    %h = drawpolyline('Position',[500 500;400 600;400 700;500 800;600 800;700 700; 700 600]*0.1);
                    %h.LineWidth = 15;

                    %g=h.createMask();
                    %g_dilated=imdilate(g,true(10));
                    %mask_with_tracks=imoverlay(mask2_overlaid,g_dilated,[156,81,182]/255);
                    %imshow(mask_with_tracks,[]); %%%%this will prolly work but
                    %will be very slow, I am guessing

                    red_thumbnails(:,:,count_movie)=temp_tiff_at_t;



                    %XY_data=XY_data_modified_k{1,k_list(k)};
                    %XY_data = readtable(string(all_filenames{k_list(i_k),1}),'Sheet','Time series data');  % Load the data into a table
                    XY_data_modified=XY_data(XY_data.('MovieID')==i,:);
                    %XY_data_modified(XY_data_modified.('MovieID')~=movie_id,:)=[];

                    xPosition=XY_data_modified.('XPositionForPosition_1');
                    x_series = (XY_data_modified.('x')+0*xPosition)/(unique(XY_data_modified.('VoxelSizeX')));

                    yPosition = XY_data_modified.('YPositionForPosition_1');
                    y_series = (XY_data_modified.('y')+0*yPosition)/(unique(XY_data_modified.('VoxelSizeY')));


                    zPosition= XY_data_modified.('ZPositionForPosition_1');
                    z_series = -1+2*(zPosition-min(zPosition))/(max(zPosition)-min(zPosition));



                    x_width=XY_data_modified.('SizeX').*XY_data_modified.('VoxelSizeX');
                    y_width=XY_data_modified.('SizeY').*XY_data_modified.('VoxelSizeY');
                    z_width=(XY_data_modified.('SizeZ')-1).*XY_data_modified.('VoxelSizeZ');

                    track_set=unique(XY_data_modified.('Track_ID'));

                    if isempty(track_set)
                        t_width=0;
                    else
                        t_width=nnz(XY_data_modified.('Track_ID')==track_set(1) & XY_data_modified.('MovieID')==i);%%%%prone to error
                    end
                    alpha_series=(XY_data_modified.('Alpha'));



                    xy_filtered=XY_data_modified.('Filter1');

                    hold on

                    if t_width~=0
                        for track=1:length(x_series)/t_width
                            current_track_block=(track-1)*t_width+1:track*t_width;
                            %xy_filtered(current_track_block(1),1)
                            if  xy_filtered(current_track_block(1),1) %i==sel_movie_id && ismember(track,sel_track_id)
                                %purple=[156,81,182]/255
                                plot(x_series(current_track_block,1), y_series(current_track_block,1),'-','MarkerSize',1,'Color',[0,1,0]);
                                scatter(x_series(current_track_block,1), y_series(current_track_block,1),1,[0,1,0],'.','MarkerEdgeAlpha',0.2)
                            else
                                plot(x_series(current_track_block,1), y_series(current_track_block,1),'-','MarkerSize',1,'Color',[1,1,1]);
                                scatter(x_series(current_track_block,1), y_series(current_track_block,1),1,alpha_series(current_track_block,1),'w.','MarkerEdgeAlpha',0.2)
                            end

                            %options.append = true;%[common_folder,(tiff_save)]
                            %options.color = true;
                            %current_image=frame2im(getframe(gca));
                            %saveastiff(current_image(:,:,:),[common_folder,(tiff_save)],options);

                            %figure('PaperPositionMode', 'auto');
                            %plot(rand(10));

                        end
                    end
                end

                % options.append = true;
                % options.color     = true;
                % saveastiff(temp_tiff_at_t,tiff_save,options)
                %saveastiff('all_movies_for_a_folder.tif',red_thumbnails);
                %set(gcf,'PaperPositionMode','auto')
                %print(gcf, '-dpdf', 'test.pdf','-fillpage');
                %print('my_file','-depsc','-append')

                %exportgraphics(gca,[common_folder,(image_save_address)],'Append',true);
                %%%%%this is working fine but can make matlab crash
            end
            exportgraphics(gcf,[common_folder,(image_save_address)],'ContentType','image');
        end
    end
end