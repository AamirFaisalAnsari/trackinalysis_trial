% Read data
fid = fopen(dataFile,'r');
str = textscan(fid,'%s','Delimiter','\r');
str = str{1};
fclose(fid);
str(15)=[];
data = array2table((split(str,',')));

% Your cell array with mixed data
values2 = {1, 'Hello', '2.5', 'World', 3};
%values2=transpose(values);

% Your cell array containing character representations of numbers
%values = {'3.141592', '2.718281', '42', 'Hello'};

% Convert character representations to numeric values
numericValues = cellfun(@str2double, values, 'UniformOutput', false);

% Filter out non-numeric values (NaN) if needed
numericValues = cell2mat(numericValues(~isnan(cell2mat(numericValues))));

% Display the resulting numeric array
disp(numericValues);

