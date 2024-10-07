close all;
clc;
clear all;

common_folder='H:\Aamir experiment data\Comm_plot\';
%common_folder2='H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Combined files for final plotting\';

% filename_ctrl_1= [common_folder,'Zen_21Jun23_Tcells_in_brain_2023_06_21__19_02_26__p4_Model_all.xlsx'];
% filename_ctrl_2= [common_folder,'Zen_22Jun23_Tcells_in_brain_2023_06_22__18_08_10__p1_Model_all.xlsx'];
% filename_ctrl_3= [common_folder,'Zen_25Jun23_Tcells_in_brain_2023_06_25__21_01_08__p01_Model_all.xlsx'];
% filename_ctrl_4= [common_folder,'Zen_27Jun23_Tcells_in_brain_2023_06_27__20_43_29__p13_Model_all.xlsx'];
% filename_ctrl_5= [common_folder,'Zen_22Aug23_MTcells_in_the_brain_high_res_2023_08_22__19_06_19__p17_Model_all.xlsx'];
% filename_ctrl_6= [common_folder,'Zen_23Aug23_MTcells_in_the_brain_high_res_3hr_2023_08_23__22_40_50__p02_Model_all.xlsx'];
% 
% 
% 
% filename7= [common_folder,'Zen_11Jul23_Tcells_in_brain_1000nM_Taxol_2023_07_12__02_31_38__p20_Model_all.xlsx'];
% filename6= [common_folder,'Zen_14Jul23_Tcells_in_brain_100nM_Taxol_2023_07_14__01_08_06__p02_Model_all.xlsx'];
% filename5= [common_folder,'Zen_15Jul23_Tcells_in_brain_1000uM_Nocadazole_2023_07_14__23_27_53__p22_Model_all.xlsx'];
% filename4= [common_folder,'Zen_12Jul23_Tcells_in_brain_10uM_Nocadazole_2023_07_13__00_56_57__p01_Model_all.xlsx'];
% 
% filename8=[common_folder2,'Zen_12Jul23_Tcells_in_brain_10uM_Nocadazole_2023_07_13__00_56_57__p01_Model_all.xlsx'];
% filename3= [common_folder,'Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49__p20_Model_all.xlsx'];
% filename2= [common_folder,'Zen_28Jun23_Tcells_in_brain_20ugml_IM7apriori_2023_06_28__04_04_23__p20_Model_all.xlsx'];


filename2= [common_folder,'tie_20dec23_mtcells_PAG_700Pa01_Slow_Model_all.xlsx'];
filename3= [common_folder,'tie_20dec23_mtcells_2x_im7_50Pa01_Slow_Model_all.xlsx'];
filename4= [common_folder,'tie_20dec23_mtcells_2x_im7_700Pa01_Slow_Model_all.xlsx'];
filename5= [common_folder,'tie_20dec23_mtcells_glass_2x_IM7_50Pa01_Slow_Model_all.xlsx'];


%filename1=[common_folder,'Zen_21Jun23_Tcells_in_brain_2023_06_21__19_02_26__p4_Model_all.xlsx'];


% all_filenames={{filename_ctrl_1};{filename_ctrl_2};{filename_ctrl_3};
%     {filename_ctrl_4};{filename_ctrl_5};{filename_ctrl_6};
%     {filename2};{filename3};{filename8}};

all_filenames={{filename2};{filename3};{filename4};{filename5}};

% all_filenames={{filename_ctrl_1};{filename_ctrl_2};{filename_ctrl_3};
%     {filename_ctrl_4};{filename_ctrl_5};{filename_ctrl_6};
%     {filename2};{filename3};{filename4};{filename5};{filename6};{filename7}};

%file_x_axis_label={'Control','Treatment 1','Treament 2'};
%file_x_axis_label={'Rep 1','Rep 2','Rep 3','Rep 4','Rep 5','Rep 6','Rep 7','Combined'};
%file_x_axis_label={'Control','IM7 20 µg/ml','IM7 100 µg/ml','Nocodazole 10 µM','Nocodazole 1000 µM','Taxol 100 nM','Taxol 1000 nM'};
file_x_axis_label={'PAG','IM7 2X 50 Pa','IM7 2X 700 Pa','IM7 2X Glass'};


% Load your Excel file (replace 'your_file.xlsx' with your actual file path)
filteredData_combined=[];
for k=1:length(all_filenames)
    dataTable_k{k,1} = readtable(string(all_filenames{k,1}),'Sheet','Main');  % Load the data into a table
    dataTable_in=dataTable_k{k,1};
    dataTable=dataTable_in(:,1:13);
    
    header_name={'video_id','no_of_spot','area','aspect_ratio','speed','confinement','alpha','sat_MSD','tau_c','conf_D','RMC','directed_v','directed_D'};
    dataTable.Properties.VariableNames = header_name;

    %dataTable=[header_name;dataTable];


%     if k~=4 && k ~=5
%         dataTable= removevars(dataTable,{'TimeStamp_001'});
%     end
    % Define filtering criteria functions and corresponding column names
    criteriaAndColumns = {
        'RMC', @(x) (x >= 0 && x < inf),
        'speed', @(x) (x >= 0 && x < inf),
        'confinement', @(x) (x >= 0 && x < 0.85),
        'alpha', @(x) (x >= 0 && x <= 3),
        'no_of_spot', @(x) (x >= 20 && x <= inf),
        % Add more combined criteria and column name pairs for other columns as needed
        };
    
    % Initialize a logical filter with all 'true' values
    finalFilter = true(size(dataTable, 1), 1);
    
    % Apply combined criteria to the specified columns
    for i = 1:1:length(criteriaAndColumns)
        columnName = criteriaAndColumns{i,1};
        criteriaFunction = criteriaAndColumns{i,2};
        
        columnCriteria = arrayfun(criteriaFunction, dataTable.(columnName));
        finalFilter = finalFilter & columnCriteria;
    end
    
    % Extract the filtered rows
    ind_filteredData_k{k} = dataTable(finalFilter, :);
    
end

%combining the two
%un_filteredData_k=[ind_filteredData_k{1}];%;ind_filteredData_k{2}];
%un_filteredData_k=[ind_filteredData_k{1},ind_filteredData_k{2}];

%filteredData_k={un_filteredData_k,un_filteredData_k};%,un_filteredData_k};
% filteredData_k{1,1}=[ind_filteredData_k{1,1};ind_filteredData_k{1,2};ind_filteredData_k{1,3};
%     ind_filteredData_k{1,4}];%;ind_filteredData_k{1,5};ind_filteredData_k{1,6}];%,un_filteredData_k};

for i=1:4
    filteredData_k{1,i}=ind_filteredData_k{i};%
end

% un_filteredData_k=[ind_filteredData_k{1};ind_filteredData_k{2}];
% filteredData_k={un_filteredData_k,un_filteredData_k};


%% plot usual properties
% Define the master column (e.g., 'master_column')
masterColumn = 'alpha';  % Replace with your actual master column name

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
% header_name={'video_id','no_of_spot','area','aspectRatio','speed','confinement','alpha','sat_MSD','tau_c','conf_D','RMC','directed_v','directed_D'};
% plot_these_data=header_name;

%%%plot 1
header_name={'speed','confinement','alpha','RMC'};
plot_these_data=header_name;
plot_these_data_lables={'Speed (µm/min)','Linearity','\alpha','RMC (µm²/min)'};


subplot_row=ceil(sqrt(length(plot_these_data)));
subplot_column=ceil((length(plot_these_data))/subplot_row);

% Create subplots
figure;
for i = 1:length(plot_these_data)
    columnName = plot_these_data{i};
    subplot(subplot_row, subplot_column, i);
    
    yData_combined=[];
    for k=1:length(filteredData_k)
        filteredData=filteredData_k{1,k};
        % Get data for the current subplot
        xData = 1+0*filteredData.(columnName);%filteredData.(columnName);
        yData = filteredData.(columnName);
        yData_combined{1,k}=1*yData;
        master_column_data{1,k}=filteredData.(masterColumn);%master column or alpha values
    end
    
    %yData_combined={yData_combined};
    % Color code points based on master column values
    %scatter(xData, yData, 30, 'filled');
    %colormap(colors);
    
    %visualizeDataWithOptions({yData,2*yData,3*yData});
    visualizeDataWithOptions(yData_combined,master_column_data);
    ax = gca;
    ax.YLabel.String = plot_these_data_lables{i};
    ax.XTick=linspace(1,length(filteredData_k),length(filteredData_k));
    ax.XTickLabels= file_x_axis_label;
    ax.XTickLabelRotation = 70;
    ax.XLabel.FontSize = 5;
    if strcmp(columnName,'RMC')==1
        ax.YScale = 'log';
        ax.YTick=[0.0001,0.1,1,10,100,1000];
    end
    
end


%% plot metadata vs speed RMC

hold off
%figure

% Define the master column (e.g., 'master_column')
masterColumn = 'RMC';  % Replace with your actual master column name
masterColumn_header='RMC (µm²/min)';

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
% header_name={'video_id','no_of_spot','area','aspectRatio','speed','confinement','alpha','sat_MSD','tau_c','conf_D','RMC','directed_v','directed_D'};
% plot_these_data=header_name;

%%%plot 1
% header_name={'speed','confinement','alpha','RMC'};
% plot_these_data=header_name;
% plot_these_data_lables={'Speed (µm/min)','Linearity','\alpha','RMC (µm²/min)'};


%%%plot meta data
header_name={'speed','no_of_spot','RMC','confinement'};
plot_these_data=header_name;
plot_these_data_lables={'Speed (µm/min)','Track Length (in frames)','RMC (µm²/min)','Linearity'};

correlation_plot_col_name_list={'speed'};
correlation_plot_col_name_list_label={'Speed (µm/min)'};

subplot_row=ceil(sqrt(length(plot_these_data)));
subplot_column=ceil((length(plot_these_data))/subplot_row);

% Create subplots
figure;
for i = 1:length(plot_these_data)
    columnName = plot_these_data{i};
    correlation_plot_col_name=correlation_plot_col_name_list{1};
    subplot(subplot_row, subplot_column, i);
    
    yData_combined=[];
    for k=1:length(filteredData_k)
        filteredData=filteredData_k{1,k};
        % Get data for the current subplot
        xData = filteredData.(correlation_plot_col_name);%filteredData.(columnName);
        yData = filteredData.(columnName);
        yData_combined{1,k}=1*yData;
        master_column_data{1,k}=filteredData.(masterColumn);%master column or alpha values
    end
    
    %yData_combined={yData_combined};
    % Color code points based on master column values
    scatter(xData, yData, 12,(filteredData.(masterColumn)), 'filled');
    % Show the colorbar with a title
    cbar = colorbar;
    cbar.Title.String = masterColumn_header;  % Set the colorbar title
    set(gca,'ColorScale','log')
    set( cbar, 'YTick', [0.0001,0.1,1,10,100,1000] )
    
    %colormap(colors);
    
    %visualizeDataWithOptions({yData,2*yData,3*yData});
    %visualizeDataWithOptions(yData_combined,master_column_data);
    ax = gca;
    ax.YLabel.String = plot_these_data_lables{i};
    ax.XLabel.String = correlation_plot_col_name_list_label{1};
    if strcmp(columnName,'RMC')==1
        ax.YScale = 'log';
        ax.YTick=[0.0001,0.1,1,10,100,1000];
    end
    %     ax.XTick=[1,2,3];
    %     ax.XTickLabels= file_x_axis_label;
    %     ax.XTickLabelRotation = 0;
    %    ax.XLabel.FontSize = 8;
    
    
end


% %% Trajectories windrose plots
% figure
% subplot(1,2,1);
% for k=1:length(all_filenames)
%     XYTable_k{k,1} = readtable(string(all_filenames{k,1}),'Sheet','XY_data');  % Load the data into a table
%     XYTable=XYTable_k{1,1};
% end
% 
% hold on;
% 
% yData_combined=[];
% for k=1:length(all_filenames)
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
%     x_width=XYTable.('SizeX').*XYTable.('VoxelSizeX');
%     y_width=XYTable.('SizeY').*XYTable.('VoxelSizeY');
%     z_width=(XYTable.('SizeZ')-1).*XYTable.('VoxelSizeZ');
%     t_width=54;
%     alpha_quality=(XYTable.('Alpha'));
%     
%     filteredData=filteredData_k{1, 1};
%     filtered_alpha_list=filteredData.('alpha');
%     
%     %%%%testing
%     filtered_alpha_list=[filtered_alpha_list;2];
%     
%     
%     alpha_quality_re=unique(alpha_quality,'stable');
%     alpha_quality_re(isnan(alpha_quality_re))=[];
%     
%     % filtered_alpha_list_rearranged=filtered_alpha_list,alpha_quality_re
%     
%     [a_sorted, a_order] = sort(filtered_alpha_list,'descend');
%     
%     
%     n=1000;
%     cmap_parula = parula(n);
%     cmap_lines = lines(5);
%     
%     color_indices = round(linspace(1, n, length(filtered_alpha_list)));%length(alpha_quality_re)));
%     custom_colormap = cmap_parula(color_indices, :);
%     custom_colormap_rearranged = custom_colormap(a_order,:);
%     colormap_start=1;
%     colormap_end=2;
%     
%     %scatter3(xPosition, yPosition, zPosition, 'r', 'filled');
%     
%     %     for ppp=1:length(xPosition)
%     %         boxWidth = x_width(ppp);  % Specify the width of the transparent box
%     %         boxHeight = z_width(ppp); % Specify the height of the transparent box
%     %         P = [xPosition(ppp), yPosition(ppp), zPosition(ppp)] ;   % you center point
%     %         L = [boxWidth,boxWidth,boxHeight] ;  % your cube dimensions
%     %         O = P-L/2 ;       % Get the origin of cube so that P is at center
%     %         plotcube(L,O,.2,'m');
%     %         %axis equal;
%     %     end
%     
%     
%     
%     track_current_alpha=[];
%     counter=1;
%     for ppp=1:length(x_series)/t_width
%         current_alpha(ppp)=alpha_quality((ppp-1)*t_width+1);
%         if sum(track_current_alpha==current_alpha(ppp))==0
%             if isnan(current_alpha(ppp))==0
%                 if sum((current_alpha(ppp)==filtered_alpha_list))~=0
%                     if current_alpha(ppp)<1
%                         color=cmap_lines(colormap_start,:);
%                     elseif current_alpha(ppp)>=1
%                         color=cmap_lines(colormap_end,:);
%                     else
%                         color='k';
%                     end
%                     
%                     color_plotted(counter,:)=custom_colormap_rearranged(counter,:);
%                     color=color_plotted(counter,:);
%                     current_alpha_plotted(counter)=current_alpha(ppp);
%                     track_current_alpha=[track_current_alpha;current_alpha(ppp)];
%                     
%                     %plot3(x_series((ppp-1)*t_width+1:ppp*t_width,1),y_series((ppp-1)*t_width+1:ppp*t_width,1),z_series((ppp-1)*t_width+1:ppp*t_width,1), 'LineWidth', 1.5,'color',[1 1 1]);
%                     scatter3(x_series((ppp-1)*t_width+1:ppp*t_width,1),y_series((ppp-1)*t_width+1:ppp*t_width,1),z_series((ppp-1)*t_width+1:ppp*t_width,1),8,alpha_quality((ppp-1)*t_width+1:ppp*t_width,1),'filled' );%'LineWidth', 1.5,'color',color);
%                     
%                     counter=counter+1;
%                 end
%             else
%                 %plot3(x_series((ppp-1)*t_width+1:ppp*t_width,1),y_series((ppp-1)*t_width+1:ppp*t_width,1),z_series((ppp-1)*t_width+1:ppp*t_width,1), 'LineWidth', 1.5,'color','k');
%                 
%                 
%             end
%         end
%     end
%     view(45,25);
%     box on;
%     
% end
% % cmap = [cmap_lines(colormap_start,:) ; cmap_lines(colormap_end,:)] ;
% % colormap(cmap);
% cbar=colorbar;
% %caxis([0, 2]);
% cbar.Title.String={'\alpha'};
% 
% xlabel('X (µm)');
% ylabel('Y (µm)');
% zlabel('Z (µm)');
% title('Trajectories');
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
% %% plotting MSD plots
% 
% cmap_lines = lines(5);
% colormap_start=1;
% colormap_end=2;
% 
% for k=1:length(all_filenames)
%     MSDTable_k{k,1} = readtable(string(all_filenames{k,1}),'Sheet','MSD', 'ReadVariableNames', false);  % Load the data into a table
%     MSD_Matrix=table2array(MSDTable_k{k,1});
% end
% alpha_quality_MSD=MSD_Matrix(:,1);
% t_axis_size=size(MSD_Matrix,2)-1;
% tracker_no=size(MSD_Matrix,1);
% subplot(1,2,2);
% %figure(2)
% 
% hold on;
% for i=1:tracker_no
%     if alpha_quality_MSD(i)<1
%         color=cmap_lines(colormap_start,:);
%     elseif alpha_quality_MSD(i)>=1
%         color=cmap_lines(colormap_end,:);
%     else
%         color='k';
%     end
%     
%     if isnan(alpha_quality_MSD(i))==0 %&&  sum((alpha_quality_MSD(i)==filtered_alpha_list))~=0
%         plot(MSD_Matrix(1,2:end)/60,MSD_Matrix(i,2:end),'color',color,'LineWidth',2);
%     else
%         %plot(linspace(1,Total_no_frames,Total_no_frames),MSD(:,i,2),'color','k');
%     end
%     ax = gca;
%     ax.YScale = 'log';
%     ax.XScale = 'log';
%     
% end
% % cmap = [cmap_lines(colormap_start,:) ; cmap_lines(colormap_end,:)] ;
% % colormap(cmap)
% % cbar=colorbar;
% % caxis([0, 2]);
% % cbar.Title.String={'\alpha'};
% legend('');
% %xlim([0,100]);
% 
% 
% %cols =  ["green", "red", "black"];
% cols =  [cmap_lines(colormap_start,:);cmap_lines(colormap_end,:)];
% %col_names = ["Initially Confined", "Initially Rolling", "Poor fit"];
% 
% col_names = ["\alpha<1", "\alpha>1"];
% for j =1:length(col_names)
%     plot([NaN NaN], [NaN NaN], 'Color', cols(j,:), 'DisplayName', col_names(j))
% end
% ylabel('MSD (\mum^2)');
% xlabel('\DeltaT (min)');
% 
% box on;
% 
