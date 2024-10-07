close all
clear all
clc
% Read TIFF movie frames
numFrames = 30;
frames = cell(1, numFrames);
%20220630_Tcells_IM7_20x_5min_XY01_BW

%H:\Aamir data\All_IM7\20220630_Tcells_IM7_20x_5min_XY01_BW.tif
%D:\Aamir data\20220630_IM7_Final\20220630_Tcells_IM7_20x_5min_XY01_morph.tif

% for i = 1:numFrames
%     frames{i} = imread('D:\Aamir data\20220630_IM7_Final\20220630_Tcells_IM7_20x_5min_XY01_morph_1_m.tif');
%     imshow(frames{i})
%
% end
%'H:\Aamir data\all_collagen\20220714_Tcells_Collagen_2.5mins_20x001_XY02_Fast_Model.xml'
%MultiTiff=loadtiff(['D:\Aamir data\20220630_IM7_Final\20220630_Tcells_IM7_20x_5min_XY01_morph_1_m.tif']);

MultiTiff=loadtiff(['H:\Aamir data\all_collagen\20220714_Tcells_Collagen_2.5mins_20x001_XY05_BW.tif']);

%
% % Process frames to extract edges
% edges = cell(1, numFrames);
% for i = 1:numFrames
%     edges{i} = edge(frames{i});
% end
% %
% % % Find centroids of objects
% % centroids = cell(1, numFrames);
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

% Save the plots as a multipage TIFF file
filename = 'plots_multipage3.tiff';  % Specify the filename and extension

for j = 1:numFrames
    cc = bwconncomp(MultiTiff(:,:,j));
    
    %cc = bwconncomp(frames{j});
    stats2 = regionprops(cc,"Area","Eccentricity","Orientation");
    idx = find([stats2.Area] < 4000 & [stats2.Eccentricity] < 0.9 & [stats2.Eccentricity] > 0.5);% & [stats2.Orientation] < 95 & [stats2.Orientation] > 85);
    BW2 = ismember(labelmatrix(cc),idx);
    im_cen_x=floor(size(BW2,1)/2);
    im_cen_y=floor(size(BW2,2)/2);
    
    edges{j} = edge(BW2);
%             figure
%         imshow(edges{j})
    % Label the connected components
    labeledImage = bwlabel(edges{j});
    
    % Get region properties including centroids and boundaries
    stats = regionprops(labeledImage, 'Centroid', 'BoundingBox',"Area","Eccentricity");
    
    
    % Check the number of objects found
    numObjects = numel(stats);
    
    
    % Plot the original and displaced centroids along with the boundaries for each object
    %figure;
    %     imshow(edges{j});
    hold on;
    for i = 1:numObjects
        % Get the centroid of the current object
        centroid = stats(i).Centroid;
        
        % Define the displacement values for the current object
        displacement = [im_cen_x, im_cen_y]-centroid; % Modify this as per your requirement
        
        % Displace the centroid
        centroid_displaced = centroid + displacement;
        
        % Get the boundary of the current object
        [boundary] = bwboundaries(labeledImage == i);
        boundary = boundary{1};
        
        %         [B,L] = bwboundaries(BW,'noholes');
        %         imshow(label2rgb(L, @jet, [.5 .5 .5]))
        %         hold on
        %         B=boundary
        %         for k = 1:length(B)
        %             boundary = B{k};
        %             plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
        %         end
        
        
        
        displaced_boundary=[];
        % Calculate the displaced boundary
        for k=1:length(boundary)
            displaced_boundary(k,1) = boundary(k,1)+ displacement(2);
            displaced_boundary(k,2) = boundary(k,2)+ displacement(1);
        end
        
        % Plot the original centroid and boundary
        %plot(centroid(1), centroid(2), 'ro', 'MarkerSize', 10);
        %plot(boundary(:, 2), boundary(:, 1), 'r', 'LineWidth', 2);
        
        
        if ~isequal(boundary(1,:), boundary(end,:))
            color_aa=[1 0 0 1];
        else
            color_aa=[0 0 0 0.2];
        end
        
        % Plot the displaced centroid and boundary
        % plot(centroid_displaced(1), centroid_displaced(2), 'go', 'MarkerSize', 10);
        plot(displaced_boundary(:, 2), displaced_boundary(:, 1), 'LineWidth', 0.5,'Color', color_aa);
        
        
    end
    pause(1);
    
    set(gcf, 'Units', 'pixels');
    position = get(gcf, 'Position');
    set(gcf, 'PaperPositionMode', 'auto', 'PaperUnits', 'points', 'PaperSize', [position(3), position(4)]);
    
    %     xlabel('x(µm)')
    %     ylabel('x(µm)')

    
    lims=100;
    xlim([im_cen_x-lims,im_cen_x+lims]);
    ylim([im_cen_y-lims,im_cen_y+lims]);
    box on
    axis off
    
    % Define the radii of the circles
    radius1 = 10/0.65;
    radius2 = 50/0.65;
    
    % Define the angle range for the circles
    theta = linspace(0, 2*pi, 100);
    
    % Calculate the coordinates for each circle
    x1 = im_cen_x+radius1 * cos(theta);
    y1 = im_cen_y+radius1 * sin(theta);
    
    x2 = im_cen_x+radius2 * cos(theta);
    y2 = im_cen_y+radius2 * sin(theta);
    
    % Create a new figure
    
    
    % Plot the circles
    plot(x1, y1, 'r--', 'LineWidth', 2);
    plot(x2, y2, 'r--', 'LineWidth', 2);
    
    
    %     if j == 1
    %         imwrite(frame2im(getframe(gcf)), filename, 'writemode', 'overwrite');
    %     else
    %         imwrite(frame2im(getframe(gcf)), filename, 'writemode', 'append');
    %     end
    
    %   hold off
    %   close all
end

%
%
% for i = 1:numel(h)
%     % Switch to the figure containing the plot
%     figure(h{i});
%
%     % Save the current figure as a TIFF file
%     if i == 1
%         imwrite(frame2im(getframe(gcf)), filename, 'writemode', 'overwrite');
%     else
%         imwrite(frame2im(getframe(gcf)), filename, 'writemode', 'append');
%     end
% end


% Save the edge frames as TIFF files

% % Create an empty TIFF file
% outputFile = 'output_movie.tiff';
% imwrite(h{1}, outputFile, 'tiff');
%
%
% % Append each frame to the TIFF file
% for i = 2:numFrames
%     imwrite(h{i}, outputFile, 'tiff', 'WriteMode', 'append');
% end
