
%function XY_colocalization=colocalization_fun_v1(filename_pre_red,combining_all_xy_joined)

use_as_function=0;
if ~use_as_function
    clc;
    clear all;
    close all

    %filename= 'H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_30Jun23_Tcells_in_brain_100ug_ml_IM7\Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49__p01_Model.xml';
    %filename= 'H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_30Jun23_Tcells_in_brain_100ug_ml_IM7\Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49__p01_Model.xml';
    filename= 'E:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_30Jun23_Tcells_in_brain_100ug_ml_IM7\Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49__p01_Model.xml';

    %filename_pre_red='H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_30Jun23_Tcells_in_brain_100ug_ml_IM7\Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49__p';
    filename_pre_red='E:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_30Jun23_Tcells_in_brain_100ug_ml_IM7\Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49__p';

    %load('sample_combining_all_xy_just_one_movie.mat')
    load('sample_combining_all_xy_five_movies_Jun_30');

    %combining_all_xy_joined=combining_all_XY;
    %combining_all_xy_joined(:,1)=1;
end



combining_all_xy_joined_copy=combining_all_xy_joined;
red_inten_saved=nan(size(combining_all_xy_joined,1),1);

%Movie ID	Track_ID	x	y	Speed	Linearity	Alpha	RMC
movie_id=combining_all_xy_joined(:,1);
track_id=combining_all_xy_joined(:,2);
x_series = combining_all_xy_joined(:,3);
y_series = combining_all_xy_joined(:,4);
speed_series=combining_all_xy_joined(:,5);
linearity_series=combining_all_xy_joined(:,6);
alpha_series=combining_all_xy_joined(:,7);
RMC_series=combining_all_xy_joined(:,8);

voxel_size_x=2.62;
voxel_size_y=2.62;

neighbour=5;

x_series_pix=floor(x_series./voxel_size_x)+1;
y_series_pix=floor(y_series./voxel_size_y)+1;



% figure('Renderer', 'painters', 'Position', [0 10 1400 600],'WindowState', 'maximized')
%figure('Renderer', 'painters','WindowState','maximized')


for movie_i = 1:nnz(unique(combining_all_xy_joined(:,1)))

    if movie_i<10
        str_movie_i= strcat('0',num2str(movie_i));
    else
        str_movie_i= strcat('',num2str(movie_i));
    end

    movie_i_file_name=strcat(filename_pre_red,str_movie_i);
    movie_i_file_name=strcat(movie_i_file_name,'_red.tif');

    single_red_tif=loadtiff(movie_i_file_name);
    temp_tiff = single_red_tif(:,:,1);
    image_double=im2double(temp_tiff);
    image_double_mod=imadjust(image_double);
    %temp_tiff=imadjust(temp_tiff);

    track_id_sel=track_id(movie_id==movie_i);
    x_series_pix_sel=x_series_pix(movie_id==movie_i);
    y_series_pix_sel=y_series_pix(movie_id==movie_i);
    speed_series_sel=speed_series(movie_id==movie_i);
    linearity_series_sel=linearity_series(movie_id==movie_i);
    alpha_series_sel=alpha_series(movie_id==movie_i);
    RMC_series_sel=RMC_series(movie_id==movie_i);


    tot_frame=nnz(track_id_sel==1);
    total_track=nnz(unique(track_id_sel));
    red_inten_sel=nan+zeros(tot_frame*total_track,1);

    %subplot(1,3,1)
    % tiledlayout(1,3,"TileSpacing","compact")
    % nexttile(1);
    %
    % imshow(image_double_mod)
    % hold on
    %
    for track=1:total_track
        for time_track=(track-1)*tot_frame+1:track*tot_frame
            if ~isnan(x_series_pix_sel(time_track))

                pix_neighbour=floor(neighbour/2);
                count_pix=1;
                cell_coverage_square=nan(neighbour,neighbour);

                for i=-pix_neighbour:pix_neighbour

                    cell_coverage_x(count_pix)=x_series_pix_sel(time_track)+i;
                    cell_coverage_y(count_pix)=y_series_pix_sel(time_track)+i;


                    if cell_coverage_x(count_pix)>512 || cell_coverage_x(count_pix)<1
                        cell_coverage_x(count_pix)=nan;
                    end

                    if cell_coverage_y(count_pix)>512 || cell_coverage_y(count_pix)<1
                        cell_coverage_y(count_pix)=nan;
                    end
                    count_pix=count_pix+1;
                end

                for index_i=1:(neighbour)
                    if isnan(cell_coverage_x(index_i))
                        cell_coverage_square(ceil(neighbour/2),index_i)=nan;
                    else
                        cell_coverage_square(ceil(neighbour/2),index_i)=temp_tiff(cell_coverage_x(index_i),cell_coverage_y(ceil(neighbour/2)));
                    end

                    if isnan(cell_coverage_y(index_i))
                        cell_coverage_square(index_i,ceil(neighbour/2))=nan;
                    else
                        cell_coverage_square(index_i,ceil(neighbour/2))=temp_tiff(cell_coverage_x(ceil(neighbour/2)),cell_coverage_y(index_i));
                    end
                end

                % plot(cell_coverage_x,cell_coverage_x*0+cell_coverage_y(ceil(neighbour/2)),'rs');
                % plot(cell_coverage_y*0+cell_coverage_x(ceil(neighbour/2)),cell_coverage_y,'rs');
                %for whole neighbourhood
                red_inten_sel(time_track)=nanmean(nanmean(cell_coverage_square));

                %for just centroid
                %red_inten_sel(time_track)=temp_tiff(x_series_pix_sel(time_track),y_series_pix_sel(time_track));
                %red_inten(time_track)=(x_series_pix(time_track));%,y_series_pix(time_track));

            end
        end
    end

    red_inten_saved(movie_id==movie_i)=red_inten_sel;
    %red_inten_saved(movie_id==movie_i)=x_series_pix_sel;



    nexttile(1);
    hold on
    imshow(temp_tiff,[])

    % hold on
    for track=1:total_track
        %red_inten_fill=fill_tracks_afa(red_inten_fill)


        %subplot(1,3,1)
        nexttile(1);
        hold on
        %imshow(temp_tiff,[])
        plot(x_series_pix_sel((track-1)*tot_frame+1:track*tot_frame),y_series_pix_sel((track-1)*tot_frame+1:track*tot_frame),'g.-');
        %scatter(x_series_pix_sel((track-1)*tot_frame+1:track*tot_frame),y_series_pix_sel((track-1)*tot_frame+1:track*tot_frame),2,track_id_sel((track-1)*tot_frame+1:track*tot_frame), 'filled');


        text_x_for_track=nanmean(x_series_pix_sel((track-1)*tot_frame+1:(track)*tot_frame));
        text_y_for_track=nanmean(y_series_pix_sel((track-1)*tot_frame+1:(track)*tot_frame));
        text(text_x_for_track,text_y_for_track,num2str(track),'Color','w');
        xlim([1,512]);
        ylim([1,512]);

        box on;
        %subplot(1,3,2)
        nexttile(2);
        hold on

        red_inten_sel_track=red_inten_sel((track-1)*tot_frame+1:track*tot_frame);
        alpha_series_sel_track=alpha_series_sel((track-1)*tot_frame+1:track*tot_frame);
        RMC_series_sel_track=RMC_series_sel((track-1)*tot_frame+1:track*tot_frame);

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

            plot(1:tot_frame,red_inten_sel_track_filled,'k.-');
            scatter(1:tot_frame, red_inten_sel_track, 12,alpha_series_sel_track, 'filled');
            cbar = colorbar;
            %cbar.Title.String = masterColumn_header;  % Set the colorbar title
            set(gca,'ColorScale','log')
            set( cbar, 'YTick', [0,0.5,1,1.5,2,2.5] );
            ylabel('Mean Red Intensity');
            xlabel('Time frames');
            box on;
        else
            track_length(track)=nan;
        end
    end

    %subplot(1,3,3)
    nexttile(3);
    hold on
    for track=1:total_track
        if track_length(track)>=8
            plot(mean_RMC_series_sel_track(track),mean_red_inten_sel_track(track),'ko');
        end
    end
    xlabel('RMC (um2/min)');
    ylabel('Mean Red Intensity');
    box on;
    %mean_RMC_series_sel_track
    %saveas(figure(movie_i),filename_save);
    %close all;



end



XY_colocalization=red_inten_saved;

% %%
% 
% group_filteredData_k{1,1}=[];
% group_filteredData_k{1,2}=[];
% group_filteredData_k{1,3}=[];
% 
% 
% group_matrix_1=[];
% group_matrix_2=[];
% group_matrix_3=[];
% 
% intensity_threshold=35;
% large_change_threshold=7;%%%+- 10
% for i=1:length(XY_colocalization)/100
%     track_block=(i-1)*100+1:i*100;
%     red_inten_track_orig=XY_colocalization(track_block);
% 
%     red_inten_track=red_inten_track_orig;
%     red_inten_track(red_inten_track<=intensity_threshold)=nan;
% 
%     mean_intensity(i)=nanmedian(red_inten_track_orig);
%     std_intensity(i)=nanstd(red_inten_track_orig);
%     max_intensity(i)=max(red_inten_track_orig);
%     min_intensity(i)=min(red_inten_track_orig);
% 
%     no_abv_noise(i)=sum(~isnan(red_inten_track));
%     track_length(i)=100;
%     fraction_abv_noise(i)=no_abv_noise(i)/track_length(i);
% 
%     %%%%fraction of sudden large change in the intensity
%     fraction_sudden_change(i)=sum(abs(diff(red_inten_track)>=large_change_threshold));
% 
%     if sum(isnan(unique(combining_all_xy_joined_copy(track_block,7))))==0
%         track_alpha(i)=unique(combining_all_xy_joined_copy(track_block,7));%%retrieve corresponding properties from the MAin table
%         track_RMC(i)=unique(combining_all_xy_joined_copy(track_block,8));%%retrieve corresponding properties from the MAin table
% 
%     else
%         track_alpha(i)=nan;
%         track_RMC(i)=nan;
%     end
% 
%     if isnan(track_alpha(i))
%         group_matrix_3=[group_matrix_3;[mean_intensity(i),std_intensity(i),max_intensity(i),no_abv_noise(i),fraction_abv_noise(i),fraction_sudden_change(i),track_alpha(i),track_RMC(i)]];
%     elseif track_alpha(i)<1
%         group_matrix_1=[group_matrix_1;[mean_intensity(i),std_intensity(i),max_intensity(i),no_abv_noise(i),fraction_abv_noise(i),fraction_sudden_change(i),track_alpha(i),track_RMC(i)]];
%     else
%         group_matrix_2=[group_matrix_2;[mean_intensity(i),std_intensity(i),max_intensity(i),no_abv_noise(i),fraction_abv_noise(i),fraction_sudden_change(i),track_alpha(i),track_RMC(i)]];
%     end
% 
% end
% 
% header = {'mean_red','std_red','max_red','no_abv_noise','fract_abv_noise','fract_sudden_change','alpha','RMC'};
% 
% 
% group_table_1 = array2table(group_matrix_1, 'VariableNames',header);
% group_table_2 = array2table(group_matrix_2, 'VariableNames',header);
% group_table_3 = array2table(group_matrix_3, 'VariableNames',header);
% 
% 
% group_filteredData_k{1,1}=group_table_1;
% group_filteredData_k{1,2}=group_table_2;
% group_filteredData_k{1,3}=group_table_3;
% 
% file_x_axis_label={'\alpha<1','\alpha>1','Rest'};
% %%plot usual properties
% close all
% figure
% % Define the master column (e.g., 'master_column')
% %masterColumn = 'speed';  % Replace with your actual master column name
% masterColumn = 'std_red';  % Replace with your actual master column name
% 
% weightColumn = 'alpha';  % Replace with your actual master column name
% 
% % Define custom colors for the legend
% colors = [
%     0.2 0.8 0.2;  % Green
%     0 0 0;        % Black
%     1 0 0;        % Red
%     1 0 1;        % Magenta (for NaN values)
%     ];
% 
% % Define legend labels
% legendLabels = {
%     '< 0.95',
%     '0.95 - 1.05',
%     '> 1.05',
%     'NaN'
%     };
% % header_name={'video_id','track_t_length','area','aspectRatio','speed','confinement','alpha','sat_MSD','tau_c','conf_D','RMC','directed_v','directed_D'};
% % plot_these_data=header_name;
% 
% %%plot 1
% header_name=header;
% 
% plot_these_data=header_name;
% plot_these_data_lables={'Mean Red Intensity','Std Red Intensity','Max Red Intensity','Occurence above noise','Fraction of above noise','Occurence of large Change','\alpha','RMC (um2/min)'};
% 
% 
% subplot_row=ceil(sqrt(length(plot_these_data)));
% subplot_column=ceil((length(plot_these_data))/subplot_row);
% 
% % Create subplots
% figure;
% for i = 1:length(plot_these_data)
%     columnName = plot_these_data{i};
%     subplot(subplot_row, subplot_column, i);
% 
%     yData_combined=[];
%     count_k=0;
%     for k=1:length(group_filteredData_k) %%%should be from 1
% 
%         if 1%ismember(k,[1,7,8])==1
%             count_k=count_k+1;
%             filteredData=group_filteredData_k{1,k};
%             % Get data for the current subplot
%             xData = 1+0*filteredData.(columnName);%filteredData.(columnName);
%             yData = filteredData.(columnName);
%             yData_combined{1,count_k}=1*yData;
%             master_column_data{1,count_k}=filteredData.(masterColumn);%master column or alpha values
%             weight_column_data{1,count_k}=filteredData.(weightColumn);%weight column usually no of spots in a a trcak
%             file_x_axis_label_k{1,count_k}=file_x_axis_label{1,k};
%         end
%     end
% 
% 
%     %yData_combined={yData_combined};
%     % Color code points based on master column values
%     %scatter(xData, yData, 30, 'filled');
%     %colormap(colors);
% 
%     %visualizeDataWithOptions({yData,2*yData,3*yData});
%     visualizeDataWithOptions(yData_combined,master_column_data,weight_column_data);
%     ax = gca;
%     ax.YLabel.String = plot_these_data_lables{i};
%     ax.XTick=linspace(1,length(yData_combined),length(yData_combined));
%     ax.XTickLabels= file_x_axis_label_k;
%     ax.XTickLabelRotation = 70;
%     ax.XLabel.FontSize = 5;
%     if strcmp(columnName,'RMC')==1
%         ax.YScale = 'log';
%         ax.YTick=[0.0001,0.1,1,10,100,1000];
%         %ax.YLim=[0,1];
%     end
% 
%     %header = {'mean_red','std_red','max_red','no_abv_noise','alpha','RMC'};
% 
%     if strcmp(columnName,'mean_red')==1 | strcmp(columnName,'max_red')
%         %ax.YScale = 'log';
%         %ax.YTick=[0.0001,0.1,1,10,100,1000];
%         %ax.YLim=[0,1];
%         hline1=yline(intensity_threshold,'r-');
%         %hline1
%     end
% 
% end
% 


