close all;
clc;
clear all;

common_folder='H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Combined files for final plotting\';
% filename1= [common_folder,'25Jun2023_mTcells_in_the_brain_2hr_v1 - Sample Copy1.xlsx'];
% filename2= [common_folder,'25Jun2023_mTcells_in_the_brain_2hr_v1 - Sample Copy2.xlsx'];
% filename3= [common_folder,'25Jun2023_mTcells_in_the_brain_2hr_v1 - Sample Copy3.xlsx'];

% filename1= [common_folder,'25Jun2023_mTcells_in_the_brain_2hr_v1_copy1.xlsx'];
% filename2= [common_folder,'25Jun2023_mTcells_in_the_brain_2hr_v1_2hr.xlsx'];
%

filename1= [common_folder,'Zen_25Jun23_Tcells_in_brain_2023_06_25__19_01_09__p03_Model_all.xlsx'];
filename2= [common_folder,'Zen_25Jun23_Tcells_in_brain_2023_06_25__19_01_09__p03_Model_all.xlsx'];

%filename3= [common_folder,'25Jun2023_mTcells_in_the_brain_2hr_v1_copy1.xlsx'];


all_filenames={filename1,filename2};%,filename3};
file_x_axis_label={'Control','Treatment 1','Treament 2'};

% Load your Excel file (replace 'your_file.xlsx' with your actual file path)
filteredData_combined=[];
for k=1:length(all_filenames)
    dataTable_k{k,1} = readtable(all_filenames{k},'Sheet','Main');  % Load the data into a table
    dataTable=dataTable_k{k,1};
    % Define filtering criteria functions and corresponding column names
    criteriaAndColumns = {
        'RMC', @(x) (x >= 0 && x < inf),
        'speed', @(x) (x >= 0 && x < inf),
        'confinement', @(x) (x >= 0 && x < 0.95),
        'alpha', @(x) (x > 0 && x <= 2),
        'cell_density',@(x) (x > 0 && x <= 20) ,
        'no_of_spot', @(x) (x > 10 && x <= 1000),
        'ZPositionForPosition_1',@(x) (x<=inf)
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

un_filteredData_k=[ind_filteredData_k{1};ind_filteredData_k{2}];
filteredData_k={un_filteredData_k,un_filteredData_k};

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
    for k=1:length(all_filenames)
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
    ax.XTick=[1,2,3];
    ax.XTickLabels= file_x_axis_label;
    ax.XTickLabelRotation = 0;
    ax.XLabel.FontSize = 8;
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
header_name={'speed','ZPositionForPosition_1','cell_density','no_of_spot','RMC','confinement'};
plot_these_data=header_name;
plot_these_data_lables={'Speed (µm/min)','Z (µm)','Frame Cell Density','Track Length (in frames)','RMC (µm²/min)','Linearity'};

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
    for k=1:length(all_filenames)
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


%% Trajectories windrose plots


 
    n=12;
    cmap_parula = lines(n);
    color_indices = round(linspace(1, n, length(alpha_quality)));
    custom_colormap = cmap_parula(color_indices, :);
    %alpha_quality=sort(alpha_quality);
    colormap_start=1;
    colormap_end=2;
    
    
    subplot(1,2,1);
    %figure(1)
    hold on;
    plotTimeSeries(x, y,alpha_quality)
    box on;
    %axis equal;
    
    
    %% plotting MSD plots
    
    
    
    subplot(1,2,2);
    %figure(2)
    hold on;
    for i=1:Total_no_filt_track
        if alpha_quality(i)<1
            color=cmap_parula(colormap_start,:);
        elseif alpha_quality(i)>=1
            color=cmap_parula(colormap_end,:);
        else
            color='k';
        end
        
        if isnan(alpha_quality(i))==0
            plot((timestep_actual/60)*linspace(1,Total_no_frames,Total_no_frames),MSD(:,i,2),'color',color);
        else
            plot((timestep_actual/60)*linspace(1,Total_no_frames,Total_no_frames),MSD(:,i,2),'color','k');
        end
        
    end
    cmap = [cmap_parula(colormap_start,:) ; cmap_parula(colormap_end,:)] ;
    colormap(cmap)
    cbar=colorbar;
    caxis([0, 2]);
    cbar.Title.String={'\alpha'};
    %     legend('');
    %     cols =  ["green", "red", "black"];
    %     col_names = ["Initially Confined", "Initially Rolling", "Poor fit"];
    %     for j =1:length(col_names)
    %         plot([NaN NaN], [NaN NaN], 'Color', cols(j), 'DisplayName', col_names(j))
    %     end
    ylabel('MSD (\mum^2)');
    xlabel('\DeltaT (min)');
    
    box on;
  
