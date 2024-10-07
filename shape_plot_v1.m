close all
clear all
clc
% Read TIFF movie frames
numFrames = 10;
frames = cell(1, numFrames);
%20220630_Tcells_IM7_20x_5min_XY01_BW

for i = 1:numFrames
    frames{i} = imread('D:\Aamir data\In house tracking codes\20220630_Tcells_IM7_20x_5min_XY01_BW.tif', i);
end


% Process frames to extract edges
edges = cell(1, numFrames);
for i = 1:numFrames
    edges{i} = edge(frames{i});
end
%
% % Find centroids of objects
% centroids = cell(1, numFrames);
% for i = 1:numFrames
%     % Label the connected components
%     labeledImage = bwlabel(edges{i});
%
%     % Get region properties including centroids
%     stats = regionprops(labeledImage, 'Centroid');
%     centroids{i} = cat(1, stats.Centroid);
%
%     % Shift centroids to (0,0)
%     %centroids{i}(:, 1) = centroids{i}(:, 1) - size(frames{i}, 2)/2;
%     %centroids{i}(:, 2) = centroids{i}(:, 2) - size(frames{i}, 1)/2;
%
%     % Plot edges with shifted centroids and save as TIFF files
%     figure;
%     imshow(imcomplement(edges{i}));
%     hold on;
%     plot(centroids{i}(:, 1), centroids{i}(:, 2), 'r.');
%     hold off;
%     % Add any other visualization or customization if needed
%
%     % Save the figure as a TIFF file
%     %saveas(gcf, ['output_frame', num2str(i), '.tif']);
% end


% Assuming you have the edge image stored in 'edgeImage'

% Assuming you have the edge image stored in 'edges'

% Assuming you have the edge image stored in 'edges'
for j = 1:numFrames
    % Label the connected components
    labeledImage = bwlabel(edges{j});
    
    % Get region properties including centroids and boundaries
    stats = regionprops(labeledImage, 'Centroid', 'BoundingBox');
    
    % Check the number of objects found
    numObjects = numel(stats);
    
    % Plot the original and displaced centroids along with the boundaries for each object
    figure;
    %imshow(edges{1});
    hold on;
    for i = 1:numObjects
        % Get the centroid of the current object
        centroid = stats(i).Centroid;
        
        % Define the displacement values for the current object
        displacement = [1024, 1024]-centroid; % Modify this as per your requirement
        
        % Displace the centroid
        centroid_displaced = centroid + displacement;
        
        % Get the boundary of the current object
        boundary = bwboundaries(labeledImage == i);
        boundary = boundary{1};
        
        % Calculate the displaced boundary
        for k=1:length(boundary)
            displaced_boundary(k,1) = boundary(k,1)+ displacement(2);
            displaced_boundary(k,2) = boundary(k,2)+ displacement(1);
        end
        
        % Plot the original centroid and boundary
        % plot(centroid(1), centroid(2), 'ro', 'MarkerSize', 10);
        % plot(boundary(:, 2), boundary(:, 1), 'r', 'LineWidth', 2);
        
        % Plot the displaced centroid and boundary
        %plot(centroid_displaced(1), centroid_displaced(2), 'go', 'MarkerSize', 10);
        plot(displaced_boundary(:, 2), displaced_boundary(:, 1), 'LineWidth', 0.5,'Color', [0 1 0 0.4]);
    end
    
    hold off;
    xlabel('x(µm)')
    ylabel('x(µm)')
    box on
    axis equal
    
end

% Save the edge frames as TIFF files

% Create an empty TIFF file
% outputFile = 'output_movie.tif';
% imwrite(edgeFrames{1}, outputFile, 'tif');
%
%
% % Append each frame to the TIFF file
% for i = 2:numFrames
%     imwrite(edgeFrames{i}, outputFile, 'tiff', 'WriteMode', 'append');
% end
