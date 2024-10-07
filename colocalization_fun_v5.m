
function XY_colocalization=colocalization_fun_v5(filename_pre_red_full_trunc,combining_all_xy_joined,n_movie_in_each_file,size_x,size_y,voxel_size_x,voxel_size_y)

use_as_function=1;
if ~use_as_function
    clc;
    clear all;
    close all

    %filename= 'H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_30Jun23_Tcells_in_brain_100ug_ml_IM7\Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49__p01_Model.xml';
    %filename= 'H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_30Jun23_Tcells_in_brain_100ug_ml_IM7\Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49__p01_Model.xml';
    filename= 'E:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_30Jun23_Tcells_in_brain_100ug_ml_IM7\Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49__p01_Model.xml';

    %filename_pre_red='H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_30Jun23_Tcells_in_brain_100ug_ml_IM7\Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49__p';
    %filename_pre_red='E:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_30Jun23_Tcells_in_brain_100ug_ml_IM7\Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49__p';
    filename_pre_red_full_trunc='E:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_11Jul23_Tcells_in_brain_1000nM_Taxol\\Zen_11Jul23_Tcells_in_brain_1000nM_Taxol_2023_07_12__02_31_38_Z23_p';

    %load('sample_combining_all_xy_just_one_movie.mat')
    %load('sample_combining_all_xy_five_movies_Jun_30');
    load('sample_combining_all_xy_two_movies_Jul_11.mat');

    %combining_all_xy_joined=combining_all_XY;
    %combining_all_xy_joined(:,1)=1;
end


figure_on=0;

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

% voxel_size_x=2.62;
% voxel_size_y=2.62;
% size_x=512;
% size_y=512;

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

unique_movie_id=unique(movie_id(:,1));

for movie_i = 1:nnz(unique_movie_id)
    %disp(unique_movie_id(movie_i));

    if unique_movie_id(movie_i)<10
        str_movie_i= strcat('0',num2str(unique_movie_id(movie_i)));
    else
        str_movie_i= strcat('',num2str(unique_movie_id(movie_i)));
    end

    if n_movie_in_each_file<10
        str_movie_i= strcat('p',num2str(unique_movie_id(movie_i)));
    end

    movie_i_file_name=strcat(filename_pre_red_full_trunc,str_movie_i);
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

    red_inten_movie_method_1=nan+zeros(t_width*total_track,1);
    red_inten_movie_method_2=nan+zeros(t_width*total_track,1);
    %subplot(1,3,1)
    % tiledlayout(1,3,"TileSpacing","compact")
    % nexttile(1);
    %
    % imshow(image_double_mod)
    % hold on
    %
    if figure_on
        fig_1=figure();
        fig_1.Position=[500,50,800,800];
        hold on

        xlim([1,size_x]);
        ylim([1,size_y]);
        box on;
    end

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

                if figure_on
                    plot(current_x_ser_pix,current_y_ser_pix,'k-');
                end

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
    if figure_on
        fig_2=figure();
        fig_2.Position=[50,50,800,800];

        nexttile(1);
        hold on
        imshow(temp_tiff_at_t,[])%%the latest time
    end
    % hold on
    for track=1:total_track
        current_track_block=(track-1)*t_width+1:track*t_width;

        current_x_ser_pix=x_series_pix_movie(current_track_block);
        current_y_ser_pix=y_series_pix_movie(current_track_block);

        current_x_ser=x_series_movie(current_track_block);
        current_y_ser=y_series_movie(current_track_block);

        if figure_on
            %subplot(1,3,1)
            nexttile(1);
            hold on
            %imshow(temp_tiff,[])
            plot(current_x_ser_pix,current_y_ser_pix,'g.-');
            %scatter(current_x_ser_pix,current_x_ser_pix,2,track_id_sel(current_track_block), 'filled');


            text_x_for_track=nanmean(x_series_pix_movie(current_track_block));
            text_y_for_track=nanmean(y_series_pix_movie(current_track_block));
            text(text_x_for_track,text_y_for_track,num2str(track),'Color','w');
            xlim([1,size_x]);
            ylim([1,size_y]);

            box on;
            %subplot(1,3,2)
            nexttile(2);
            hold on
        end
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

            if figure_on
                plot(1:t_width,red_inten_sel_track_filled,'k.-');
                scatter(1:t_width, red_inten_sel_track, 12,alpha_series_sel_track, 'filled');
                cbar = colorbar;
                %cbar.Title.String = masterColumn_header;  % Set the colorbar title
                set(gca,'ColorScale','log')
                set( cbar, 'YTick', [0,0.5,1,1.5,2,2.5] );
                ylabel('Mean Red Intensity (8 bits)');
                xlabel('Time frames');
                box on;
            end
        else
            track_length(track)=nan;
        end
    end

    if figure_on
        %subplot(1,3,3)
        nexttile(3);
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
    end
    %mean_RMC_series_sel_track
    %saveas(figure(movie_i),filename_save);
    %close all;

end

XY_colocalization=red_inten_saved_method_1;
