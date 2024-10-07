function windrosePlot(x_data, y_data)
    % x_data: Cell array of X-coordinate data for each time series
    % y_data: Cell array of Y-coordinate data for each time series

    % Combine the X and Y data into a single array
    all_x = cat(2, x_data{:});
    all_y = cat(2, y_data{:});

    % Convert Cartesian coordinates to polar coordinates
    [theta, rho] = cart2pol(all_x, all_y);

    % Create windrose plot using histogram
    num_bins = 16;  % Number of bins (directions) in the windrose plot
    bin_edges = linspace(0, 2*pi, num_bins+1);  % Bin edges
    bin_counts = histcounts(theta, bin_edges);  % Count occurrences in each bin

    % Create polar plot
    polarplot(bin_edges, [bin_counts, bin_counts(1)], '-o', 'LineWidth', 2);

    % Customize the plot
    thetaticks(rad2deg(bin_edges));  % Set the angle labels in degrees
    thetaticklabels({'N', 'NE', 'E', 'SE', 'S', 'SW', 'W', 'NW'});  % Set the angle labels
    rlim([0, max(bin_counts)]);  % Set the radial limit

    title('Windrose Plot');

    % Adjust plot properties as desired

    % Show the plot
    % Uncomment the line below if you want to display the plot automatically
    % pause(0.1); % Add a small delay to ensure the figure is rendered before displaying
    % display(gcf);
end
