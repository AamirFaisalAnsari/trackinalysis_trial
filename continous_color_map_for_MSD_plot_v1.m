close all
clear all
clc

% Sample data for alpha_quality
alpha_quality = 1*(linspace(1,500,500));  % Example data from 0 to 2
alpha_quality=sort(alpha_quality);
n=4096;
cmap_parula = parula(n);
color_indices = round(linspace(1, n, length(alpha_quality)));
custom_colormap = cmap_parula(color_indices, :);

% Create a scatter plot with custom colors
hold on;
for i=1:length(alpha_quality)
    x = linspace(1,10);%1:numel(alpha_quality);
    y=alpha_quality(i)+0*x;
    
    plot(x, y, '-o', 'color',custom_colormap(i,:));
end
% axis([0, numel(alpha_quality) + 1, -1, 1]);
% title('Smooth Transition Colormap from Green to Red');
cbar=colorbar;
caxis([-2, 20]);