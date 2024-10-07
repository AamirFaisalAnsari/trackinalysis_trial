close all;
clc;
clear all;


% Load the list of important "Var1" from your CSV file
importantKeyFile = 'LSM selected metadata v2.csv';  % Replace with the actual file path

importantKey = readtable(importantKeyFile, 'ReadVariableNames', false);

% Open a file dialog to select multiple CSV files
[files, folder] = uigetfile('*.csv', 'Select CSV Files', 'MultiSelect', 'on');



% Check if 'files' is a cell array
if ~iscell(files)
    % Convert 'files' to a cell array if only one file is selected
    files = {files};
end

if isequal(files, 0)
    disp('No files selected. Exiting.');
    return;
end

% Initialize arrays to store data for scatter plots
xPosition1 = [];
yPosition1 = [];
zPosition1 = [];
redData = [];
greenData = [];

% Loop through each selected CSV file
for i = 1:length(files)
    % Construct the full file path
    dataFile = fullfile(folder, files{i});
    fid = fopen(dataFile,'r');
    str = textscan(fid,'%s','Delimiter','\r');
    str = str{1};
    fclose(fid);
    str(15)=[];
    data = array2table((split(str,',')));
    
    KeyToExtract = importantKey.Var1;
    values = data.Var2(ismember(data.Var1, KeyToExtract));
    numericValues = cellfun(@str2double, values, 'UniformOutput', false);
    
    
    % Store 'values' in the cell array
    valuesCellArray(i,:) = transpose(values);



    
    % Filter out non-numeric values (NaN) if needed
    %numericValues = cell2mat(numericValues(~isnan(cell2mat(numericValues))));
    
    % Calculate median and standard deviation
    %     medianValue = median(values);
    %     stdValue = std(values);
    
    %     % Create a bar plot with jitter
    %     figure;
    %     subplot(1, 2, 1);
    %     bar(1, medianValue);
    %     hold on;
    %     scatter(1 + 0.2 * randn(size(values)), values, 'r', 'filled', 'jitter');
    %     title(files{i}, 'Interpreter', 'none');
    %     xticklabels({''});
    %     ylabel('Values');
    %     ylim([min(values) - 1, max(values) + 1]);
    %     legend({'Median', 'Actual Values'});
    
    % Store data for 3D scatter plots
    xPosition1 = [xPosition1; str2double(data.Var2(strcmp(data.Var1, 'X position for position #1')))];
    yPosition1 = [yPosition1; str2double(data.Var2(strcmp(data.Var1, 'Y position for position #1')))];
    zPosition1 = [zPosition1; str2double(data.Var2(strcmp(data.Var1, 'Z position for position #1')))];
    
    % Store data for red and green Var1
    redData = [redData; str2double(data.Var2(strcmp(data.Var1, 'IlluminationChannel Power #1')))];
    greenData = [greenData; str2double(data.Var2(strcmp(data.Var1, 'IlluminationChannel Power #2')))];
end

% Create a table with 'values' from all files
valuesTable = cell2table(valuesCellArray);

% Use renamevars to assign new column names
% Replace spaces and '#' with underscores in each cell
for i = 1:numel(KeyToExtract)
    % Replace spaces with underscores
    mod_KeyToExtract{i} = regexprep(KeyToExtract{i}, '[#\s]+', '_');
end
valuesTable.Properties.VariableNames=sort(mod_KeyToExtract);

% Specify the Excel file where you want to store the data
outputExcelFile = 'output_values.xlsx';  % Replace with the desired file name

% Write the table to an Excel file
writetable(valuesTable, outputExcelFile, 'Sheet', 'Values', 'WriteVariableNames', true);


% Create 3D scatter plot for "X position for position #1," "Y position for position #1," and "Z position for position #1"
subplot(1, 1, 1);
scatter3(xPosition1, yPosition1, zPosition1, 'r', 'filled');
xlabel('X Position');
ylabel('Y Position');
zlabel('Z Position');
title('3D Scatter Plot');

% Add transparent boxes for each position
hold on;

boxWidth = 2000/3;  % Specify the width of the transparent box
boxHeight = 20; % Specify the height of the transparent box


for i=1:length(files)
P = [xPosition1(i), yPosition1(i), zPosition1(i)] ;   % you center point 
L = [boxWidth,boxWidth,boxHeight] ;  % your cube dimensions 
O = P-L/2 ;       % Get the origin of cube so that P is at center 
plotcube(L,O,.2,'m');
%axis equal;
end

% Create 3D scatter plot for "IlluminationChannel Power #1" (red) and "IlluminationChannel Power #2" (green)
% figure;
% scatter3(redData, greenData, zPosition1, 'r', 'filled');
% xlabel('IlluminationChannel Power #1');
% ylabel('IlluminationChannel Power #2');
% zlabel('Z Position');
% title('3D Scatter Plot (Red vs. Green)');
% 
% % Adjust subplot positions
% pos = get(gca, 'Position');
% pos(1) = pos(1) - 0.1;
% set(gca, 'Position', pos);
