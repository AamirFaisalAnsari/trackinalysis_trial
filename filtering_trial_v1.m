close all;
clc;
clear all;

common_folder='H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Combined files for final plotting\';
% filename1= [common_folder,'25Jun2023_mTcells_in_the_brain_2hr_v1 - Sample Copy1.xlsx'];
% filename2= [common_folder,'25Jun2023_mTcells_in_the_brain_2hr_v1 - Sample Copy2.xlsx'];
% filename3= [common_folder,'25Jun2023_mTcells_in_the_brain_2hr_v1 - Sample Copy3.xlsx'];

filename1= [common_folder,'25Jun2023_mTcells_in_the_brain_2hr_v1_copy1.xlsx'];
filename2= [common_folder,'25Jun2023_mTcells_in_the_brain_2hr_v1_2hr.xlsx'];

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
        'RMC', @(x) (x > 0 && x < 100),
        'speed', @(x) (x > 0 && x < 10000),
        'confinement', @(x) (x > 0 && x < 0.5),
        'alpha', @(x) (x > 0 && x <= 2),
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
    filteredData_k{k} = dataTable(finalFilter, :);
    
end

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

header_name={'speed','confinement','alpha','RMC'};
plot_these_data=header_name;

%plot_these_data={'Speed','RMC','alpha','videoID', 'Area'};
%plot_these_data_lables={'Speed (µm/min)','RMC (µm²/min)','Alpha','VideoID', 'Area'};

%plot_these_data_lables=header_name;
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
   
    
end
