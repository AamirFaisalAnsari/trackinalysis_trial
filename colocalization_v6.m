clc
clear all;
close all;

[folder, name, ext] = fileparts( mfilename('fullpath'));
cd(folder);


[FileName_old,FilePath]=uigetfile({'*.tif'},...
    'Select All Red TIF', 'MultiSelect', 'on');

if iscell(FileName_old)
    movie_num = size(FileName_old,2);
else
    movie_num = 1;
end

strel_disk=3;
minimum_pixel_size = 200;

gcf = figure('Position',[200,100,600,600]);
hold on


%% read metadata and make file-x,y,z association
% filename_MData='H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_01Oct23_Tcells_in_brain_CD44_block_120ul_brain_slices_20ul_in_T\Zen_01Oct23_Tcells_in_brain_CD44_block_120ul_brain_slices_20ul_in_T_2023_10_01__05_53_53__p02_MD.csv';
%
% %filename_MData='H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_01Oct23_Tcells_in_brain_CD44_block_120ul_brain_slices_20ul_in_T\Zen_01Oct23_10_01__05_53_53__p01_MD - Copy.csv';
%
% all_filenames_MD=filename_MData;
%
% % for k=1:1%length(all_filenames)
% %     %XYTable_k{k,1} = readtable(string(all_filenames{k,1}),'Sheet','XY_data');  % Load the data into a table
% %     MDTable_k{k,1} = readtable(string(all_filenames_MD));  % Load the data into a table
% %
% %     MDTable=MDTable_k{1,1};
% % end





%%
filename_Data='H:\Aamir experiment data\Comm_plot\Zen_01Oct23_Tcells_in_brain_CD44_block_120ul_brain_slices_20ul_in_T_2023_10_01__05_53_53__p01_Model_all.xlsx';
all_filenames=filename_Data;

for k=1:1%length(all_filenames)
    %XYTable_k{k,1} = readtable(string(all_filenames{k,1}),'Sheet','XY_data');  % Load the data into a table
    XYTable_k{k,1} = readtable(string(all_filenames),'Sheet','XY_data');  % Load the data into a table
    
    XYTable=XYTable_k{1,1};
end

XYTable_copy=XYTable;
red_inten_saved=nan(height(XYTable),1);

for k=1:1%length(all_filenames)
    
    iid=XYTable.('IID');
    
    xPosition=XYTable.('XPositionForPosition_1');
    x_series = XYTable.('x')+0*xPosition;
    
    yPosition = XYTable.('YPositionForPosition_1');
    y_series = XYTable.('y')+0*yPosition;
    
    z_series = XYTable.('ZPositionForPosition_1');
    zPosition=XYTable.('ZPositionForPosition_1');
    voxel_size_x=XYTable.('VoxelSizeX');
    voxel_size_y=XYTable.('VoxelSizeY');
    
    x_series_pix=floor(x_series./voxel_size_x)+1;
    y_series_pix=floor(y_series./voxel_size_y)+1;
end


%%
%close all
for movie_i = 1:movie_num
    %
    if iscell(FileName_old)
        %MultiTiff=tiffread([FilePath FileName_old{fileno}]);
        MultiTiff=loadtiff([FilePath FileName_old{movie_i}]);
    else
        %MultiTiff=tiffread([FilePath FileName_old]);
        MultiTiff=loadtiff([FilePath FileName_old]);
    end
    
    if iscell(FileName_old)
        temp=FileName_old{1,movie_i};
        FileName{movie_i}=temp(1:end-8);%remove '_red.tif'
        
        filename_save = strcat(FilePath,FileName{movie_i},'_red_annotated.svg');
        filename_MD = strcat(FilePath,FileName{movie_i},'_MD.csv');
        %filename_Data = strcat(FilePath,FileName{movie_i},'_model_all.xlsx');
        %filename_red_image = strcat(FilePath,FileName{movie_i},'_BW.tif');
        
    else
        FileName=FileName_old(1:end-8);
        filename_save = strcat(FilePath,FileName,'_red_annotated.svg');
        filename_MD = strcat(FilePath,FileName,'_MD.csv');
        %filename_Data = strcat(FilePath,FileName,'_BW.tif');
    end
    
    fid = fopen(filename_MD,'r');
    str = textscan(fid,'%s','Delimiter','\r');
    str = str{1};
    fclose(fid);
    str(15)=[];%remove that one row that has multiple columns or entries making it hard to
    %concatenate
    data_MD = array2table((split(str,',')));
    
    %KeyToExtract = importantKey.Var1;
    X_pos_for_movie(movie_i) = data_MD.Var2(contains(data_MD.Var1, 'X position for position #1'));
    %nnz((XYTable.XPositionForPosition_1==str2double(X_pos_for_movie{1,1})))
    x_series_pix_sel=x_series_pix((XYTable.XPositionForPosition_1==str2double(X_pos_for_movie{1,movie_i})));
    y_series_pix_sel=y_series_pix((XYTable.XPositionForPosition_1==str2double(X_pos_for_movie{1,movie_i})));
    id_sel=iid((XYTable.XPositionForPosition_1==str2double(X_pos_for_movie{1,movie_i})));

    
    %delete(filename_save);
    
    for frameno=1:1:1%size(MultiTiff,3)
        frameno;
        %figure(1)
        temp_tiff = MultiTiff(:,:,frameno);
        image_double=im2double(temp_tiff);
        
%         tot_frame=100;
%         total_track=length(x_series_pix_sel)/tot_frame;
        tot_frame=nnz(id_sel==1);
        total_track=nnz(unique(id_sel));
        red_inten=nan+zeros(tot_frame*total_track,1);
        
        for track=1:total_track
            for time_track=(track-1)*tot_frame+1:track*tot_frame
                if ~isnan(x_series_pix_sel(time_track))
                    
                    red_inten(time_track)=temp_tiff(x_series_pix_sel(time_track),x_series_pix_sel(time_track));
                    %red_inten(time_track)=(x_series_pix(time_track));%,y_series_pix(time_track));
                    
                end
            end
        end
        
        %red_inten_saved(XYTable.XPositionForPosition_1==str2double(X_pos_for_movie{1,movie_i}))=red_inten;
        red_inten_saved(XYTable.XPositionForPosition_1==str2double(X_pos_for_movie{1,movie_i}))=x_series_pix_sel;
      
        
        figure(movie_i)
        imshow(image_double)
        hold on
        for track=1:total_track
            %red_inten_fill=fill_tracks_afa(red_inten_fill)
            %plot(1:tot_frame,red_inten((track-1)*tot_frame+1:track*tot_frame),'.-');
            %imshow(temp_tiff,[])
            
            plot(x_series_pix_sel((track-1)*tot_frame+1:track*tot_frame),y_series_pix_sel((track-1)*tot_frame+1:track*tot_frame),'.-');
            
        end
        %
        %         options.append = true;
        %         saveastiff(grayScaleImage,filename_save,options)
        %         clear temp_tiff image_double im ColorImage grayScaleImage
    end
    
    saveas(figure(movie_i),filename_save);
    close all;
end
%filename_save
%saveas(figure(movie_i),strcat(common_folder,'_trajectories_3D_demo.svg'));

XYTable_copy.('RedIntensity')=red_inten_saved;

%% Trajectories windrose plots
% figure
% subplot(1,2,1);
% for k=1:1%length(all_filenames)
%     %XYTable_k{k,1} = readtable(string(all_filenames{k,1}),'Sheet','XY_data');  % Load the data into a table
%     XYTable_k{k,1} = readtable(string(all_filenames),'Sheet','XY_data');  % Load the data into a table
%
%     XYTable=XYTable_k{1,1};
% end
%
% hold on;
%
% yData_combined=[];
% for k=1:1%length(all_filenames)
%
%
%     xPosition=XYTable.('XPositionForPosition_1');
%     x_series = XYTable.('x')+0*xPosition;
%
%     yPosition = XYTable.('YPositionForPosition_1');
%     y_series = XYTable.('y')+0*yPosition;
%
%     z_series = XYTable.('ZPositionForPosition_1');
%     zPosition=XYTable.('ZPositionForPosition_1');
%
%
% %     x_width=XYTable.('SizeX').*XYTable.('VoxelSizeX');
% %     y_width=XYTable.('SizeY').*XYTable.('VoxelSizeY');
% %     z_width=(XYTable.('SizeZ')-1).*XYTable.('VoxelSizeZ');
% %     t_width=54;
% %     alpha_quality=(XYTable.('Alpha'));
% %
% %     filteredData=filteredData_k{1, 1};
% %     filtered_alpha_list=filteredData.('alpha');
% %
% %     %%%%testing
% %     filtered_alpha_list=[filtered_alpha_list;2];
% %
% %
% %     alpha_quality_re=unique(alpha_quality,'stable');
% %     alpha_quality_re(isnan(alpha_quality_re))=[];
% %
% %     % filtered_alpha_list_rearranged=filtered_alpha_list,alpha_quality_re
% %
% %     [a_sorted, a_order] = sort(filtered_alpha_list,'descend');
% %
% %
% %     n=1000;
% %     cmap_parula = parula(n);
% %     cmap_lines = lines(5);
% %
% %     color_indices = round(linspace(1, n, length(filtered_alpha_list)));%length(alpha_quality_re)));
% %     custom_colormap = cmap_parula(color_indices, :);
% %     custom_colormap_rearranged = custom_colormap(a_order,:);
% %     colormap_start=1;
% %     colormap_end=2;
% %
% %     %scatter3(xPosition, yPosition, zPosition, 'r', 'filled');
% %
% %     %     for ppp=1:length(xPosition)
% %     %         boxWidth = x_width(ppp);  % Specify the width of the transparent box
% %     %         boxHeight = z_width(ppp); % Specify the height of the transparent box
% %     %         P = [xPosition(ppp), yPosition(ppp), zPosition(ppp)] ;   % you center point
% %     %         L = [boxWidth,boxWidth,boxHeight] ;  % your cube dimensions
% %     %         O = P-L/2 ;       % Get the origin of cube so that P is at center
% %     %         plotcube(L,O,.2,'m');
% %     %         %axis equal;
% %     %     end
% %
% %
% %
% %     track_current_alpha=[];
% %     counter=1;
% %     for ppp=1:length(x_series)/t_width
% %         current_alpha(ppp)=alpha_quality((ppp-1)*t_width+1);
% %         if sum(track_current_alpha==current_alpha(ppp))==0
% %             if isnan(current_alpha(ppp))==0
% %                 if sum((current_alpha(ppp)==filtered_alpha_list))~=0
% %                     if current_alpha(ppp)<1
% %                         color=cmap_lines(colormap_start,:);
% %                     elseif current_alpha(ppp)>=1
% %                         color=cmap_lines(colormap_end,:);
% %                     else
% %                         color='k';
% %                     end
% %
% %                     color_plotted(counter,:)=custom_colormap_rearranged(counter,:);
% %                     color=color_plotted(counter,:);
% %                     current_alpha_plotted(counter)=current_alpha(ppp);
% %                     track_current_alpha=[track_current_alpha;current_alpha(ppp)];
% %
% %                     %plot3(x_series((ppp-1)*t_width+1:ppp*t_width,1),y_series((ppp-1)*t_width+1:ppp*t_width,1),z_series((ppp-1)*t_width+1:ppp*t_width,1), 'LineWidth', 1.5,'color',[1 1 1]);
% %                     scatter3(x_series((ppp-1)*t_width+1:ppp*t_width,1),y_series((ppp-1)*t_width+1:ppp*t_width,1),z_series((ppp-1)*t_width+1:ppp*t_width,1),8,alpha_quality((ppp-1)*t_width+1:ppp*t_width,1),'filled' );%'LineWidth', 1.5,'color',color);
% %
% %                     counter=counter+1;
% %                 end
% %             else
% %                 %plot3(x_series((ppp-1)*t_width+1:ppp*t_width,1),y_series((ppp-1)*t_width+1:ppp*t_width,1),z_series((ppp-1)*t_width+1:ppp*t_width,1), 'LineWidth', 1.5,'color','k');
% %
% %
% %             end
% %         end
% %     end
% %     view(45,25);
% %     box on;
%
% end
% % cmap = [cmap_lines(colormap_start,:) ; cmap_lines(colormap_end,:)] ;
% % colormap(cmap);
% % cbar=colorbar;
% % %caxis([0, 2]);
% % cbar.Title.String={'\alpha'};
% %
% % xlabel('X (µm)');
% % ylabel('Y (µm)');
% % zlabel('Z (µm)');
% % title('Trajectories');
%
% %saveas(figure(1),strcat(common_folder,'_trajectories_3D_demo.svg'));
% %saveas(figure(1),strcat('','_trajectories_3D_MSD_demo.svg'));
%
%
%
%
% % n=12;
% % cmap_parula = lines(n);
% % color_indices = round(linspace(1, n, length(alpha_quality)));
% % custom_colormap = cmap_parula(color_indices, :);
% % %alpha_quality=sort(alpha_quality);
% % colormap_start=1;
% % colormap_end=2;
%
%
% % subplot(1,1,1);
% % %figure(1)
% % hold on;
% % plotTimeSeries(x, y,alpha_quality)
% % box on;
% % %axis equal;
%
%
%
%
