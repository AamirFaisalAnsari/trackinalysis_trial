function slope=getFrameInterval(dataFile)
% clear all;
% clc;
% close all;

% Load the list of impo-rtant "Var1" from your CSV file
% importantKeyFile = 'LSM selected metadata v2.csv';  % Replace with the actual file path
% 
% importantKey = readtable(importantKeyFile, 'ReadVariableNames', false);

% % Open a file dialog to select multiple CSV files
% [files, folder] = uigetfile('*.csv', 'Select CSV Files', 'MultiSelect', 'on');
% 


% % Check if 'files' is a cell array
% if ~iscell(files)
%     % Convert 'files' to a cell array if only one file is selected
%     files = {files};
% end
% 
% if isequal(files, 0)
%     disp('No files selected. Exiting.');
%     return;
% end

%dataFile='H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_25Jun23_Tcells_in_brain\\Zen_25Jun23_Tcells_in_brain_2023_06_25__19_01_09__p02_MD.csv';
% Loop through each selected CSV file
for i = 1%:length(files)
    % Construct the full file path
    %dataFile = fullfile(folder, files{i});
    fid = fopen(dataFile,'r');
    str = textscan(fid,'%s','Delimiter','\r');
    str = str{1};
    fclose(fid);
    str(15)=[];%remove that one row that has multiple columns or entries making it hard to
    %concatenate
    data = array2table((split(str,',')));
    
    %KeyToExtract = importantKey.Var1;
    values = data.Var2(contains(data.Var1, 'TimeStamp'));
    %numericValues = cellfun(@str2double, values, 'UniformOutput', false);
    numericValues=(str2double(values));
    
    numericValues(numericValues==0)=[];%remove zeros ...movie stopped before it ended
    
    % Store 'values' in the cell array
    valuesCellArray(i,:) = numericValues;
    % Calculate the slope using linear regression
    x = 1:numel(valuesCellArray(i,:));
    y = valuesCellArray(i,:);
    p = polyfit(x, y, 1);
    slope(i) = p(1);


end

end