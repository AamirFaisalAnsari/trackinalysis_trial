
clear all
close all
clc

% Sample X and Y time series data
x_data = -[55, 1, 2, 3, 4;+55, -1, 82, 3, 4]'; % Replace with your X-coordinate time series data
y_data = -[15, 2, 4, 6, 8;15, 2, 4, 6, 8]'; % Replace with your Y-coordinate time series data

hold on
% Call the function to plot the XY time series
plotTimeSeries(x_data, y_data);



