close all;
clc;
clear all;


% Sample data (replace with your own data)
data1 = randn(1000, 1);  % Data Set 1
data2 = data1;%randn(30, 1);  % Data Set 2
data3 = 0+3*randn(500, 1);  % Data Set 3
% 
% data1 = rand(10,1);
% data2 = rand(30,1);
% % Concatenation with a ; in between because these are **column** vectors
% allData = [data1; data2;data3]; 
% groups = [ones(size(data1)); 2 * ones(size(data2));3 * ones(size(data3))];
% %[P,ANOVATAB,STATS] = kruskalwallis(allData, groups);

% Create a cell array with the data sets
data = {data1, data2, data3};

% Choose the visualization option (1 for Violin, 2 for Swarm, 3 for Strip, 4 for Bean)
visualizationOption = 1;
%pass_data=[allData,groups];
% Call the function to visualize the data with p-values
%visualizeDataWithOptions(data, visualizationOption);
visualizeDataWithOptions(data);
