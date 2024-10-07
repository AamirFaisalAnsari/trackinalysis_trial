function plotCellTrajectories(x_data, y_data)
    % x_data: Cell array of X-coordinate data for each trajectory
    % y_data: Cell array of Y-coordinate data for each trajectory
    
    % Plotting parameters
    colors = lines(length(x_data)); % Generate colors for each trajectory
    
    % Create a figure
    figure;
    hold on;
    
    % Plot each trajectory
    for i = 1:length(x_data)
        x = x_data{i};
        y = y_data{i};
        
        plot(x, y, 'Color', colors(i, :));
    end
    
    hold off;
    
    % Customize the plot
    xlabel('X-coordinate');
    ylabel('Y-coordinate');
    title('Cell Trajectories');
    legend('Trajectory 1', 'Trajectory 2', 'Trajectory 3'); % Customize the legend labels
    
    % Adjust plot properties as desired
    
    % Show the plot
    % Uncomment the line below if you want to display the plot automatically
    % pause(0.1); % Add a small delay to ensure the figure is rendered before displaying
    % display(gcf);
end
