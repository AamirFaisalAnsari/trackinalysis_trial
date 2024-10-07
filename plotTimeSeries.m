function plotTimeSeries(x_data, y_data,alpha_quality)
% x_data: Cell array of X-coordinate time series data
% y_data: Cell array of Y-coordinate time series data

% Create a new figure
%figure;
hold on;
n=50;
min_alpha_cbar=0;
max_alpha_cbar=3;
cmap_parula = parula(n);
color_indices = round(linspace(1, n, length(alpha_quality)));
custom_colormap = cmap_parula(color_indices, :);
%alpha_quality=sort(alpha_quality);
colormap_start=1;
colormap_end=2;
% Iterate over each XY time series
num_series = size(x_data,2);%%%%check this
net_disp_x=0;
net_disp_y=0;

offset=1;




%% Angle of tracks with x axis and the direction of the convection
for i = 1:num_series
    old_x = x_data(:,i);  % Extract X-coordinate data
    old_y = y_data(:,i);

    first_nonnan_xy_id=find(~isnan(old_x), 1, 'first');
    last_nonnan_xy_id=find(~isnan(old_x), 1, 'last');

    track_angle(i,1)=atand((old_y(last_nonnan_xy_id,i)-old_y(first_nonnan_xy_id,i))/(old_x(last_nonnan_xy_id,i)-old_x(first_nonnan_xy_id,i)));
end


mean_track_angle=nanmean(track_angle);
for i = 1:num_series
    track_angle_relative_to_mean(i,1)=track_angle(i,1)-unique(mean_track_angle);
end

%% Actual windrose and shifted windrose plots

for i = 1:num_series
    old_x = x_data(:,i);  % Extract X-coordinate data
    old_y = y_data(:,i);  % Extract Y-coordinate data

    x=fill_tracks_afa(old_x);
    y=fill_tracks_afa(old_y);

    %     x=(old_x);
    % y=(old_y);

    % if alpha_quality(i)<1
    %     color=cmap_parula(colormap_start,:);
    % elseif alpha_quality(i)>=1
    %     color=cmap_parula(colormap_end,:);
    % else
    %     color='k';
    % end
    if ~isnan(alpha_quality(i))
        graded_alpha=round(1+((n-1)/(max_alpha_cbar-min_alpha_cbar))*(alpha_quality(i)-min_alpha_cbar));
        if graded_alpha>size(cmap_parula,1)
            color=cmap_parula(end,:);
        elseif graded_alpha<1
            color=cmap_parula(1,:);
        else
            color=cmap_parula(graded_alpha,:);
        end
    else
        color='k';
    end

    first_nonnan_xy_id=find(~isnan(x), 1, 'first');
    last_nonnan_xy_id=find(~isnan(x), 1, 'last');

    %x-offset*x(first_nonnan_xy_id)

    x_centre = x(first_nonnan_xy_id);
    y_centre = y(first_nonnan_xy_id);
    x_shifted = x-x_centre;
    y_shifted = y-y_centre;
    v = [x_shifted y_shifted];

    theta = track_angle_relative_to_mean(i,1)*pi/180; %45 degrees
    R = [cos(theta) -sin(theta); sin(theta) cos(theta)];  %%%%%%%%%%%%%%%
    vo = v*R;
    x_rotated = vo(:,1)+x_centre;
    y_rotated = vo(:,2)+y_centre;

    % Plot the XY time series starting at the origin
    plot3(x_rotated-offset*x_centre, y_rotated-offset*y_centre,x*0+rand*1000,'-','color',color, 'LineWidth', 0.9);
    %plot3(x-offset*x(first_nonnan_xy_id), y-offset*y(first_nonnan_xy_id),x*0+rand*1000,'-','color',color, 'LineWidth', 1.5);


    %scatter(x-offset*x(1), y-offset*y(1),x*0+rand*1000,'-','color',color, 'LineWidth', 1.5);

    % Calculate displacement
    displacement_x = x(end) - offset*x(first_nonnan_xy_id);
    displacement_y = y(end) - offset*y(first_nonnan_xy_id);

    if isnan(displacement_x)==0 && isnan(displacement_y)==0

        displacement_x_unit=displacement_x;%/sqrt(displacement_x^2+displacement_y^2);
        displacement_y_unit=displacement_y;%/sqrt(displacement_x^2+displacement_y^2);


        net_disp_x=net_disp_x+displacement_x_unit;
        net_disp_y=net_disp_y+displacement_y_unit;
    end
    % Plot individual displacement vectors
    %plot([0,displacement_x], [0,displacement_y], 'k-');

    p1 = [0 0];
    p2 = [displacement_x displacement_y];
    dp = p2-p1;
    %figure
    %quiver(p1(1),p1(2),dp(1),dp(2),0,'Color', 'k')

end



p1 = [0 0];
p2 = [net_disp_x net_disp_y];
%p2 = [displacement_x displacement_y];

dp = 50*((p2-p1)/sqrt((net_disp_x^2+net_disp_y^2)));
%figure
%quiver(p1(1),p1(2),dp(1),dp(2),0,'Color', 'r', 'LineWidth', 1.4)


% Set plot properties

xlabel('X (um)');
ylabel('Y (um)');
title('Cell Trajectories');

% Define the radii of the circles
radius1 = 50;
radius2 = 150;

% Define the angle range for the circles
theta = linspace(0, 2*pi, 100);

% Calculate the coordinates for each circle
x1 = radius1 * cos(theta);
y1 = radius1 * sin(theta);

x2 = radius2 * cos(theta);
y2 = radius2 * sin(theta);

% Create a new figure


% Plot the circles
plot(x1, y1, 'r--', 'LineWidth', 0.8);
plot(x2, y2, 'r--', 'LineWidth', 0.8);

xlim(200*[-1,1]);
ylim(200*[-1,1]);
%axis equal;

colormap(gca,cmap_parula);


cb=colorbar;%(cmap_parula);
cb.Ticks = linspace(0, 1, 7) ; %Create 8 ticks from zero to 1
cb.TickLabels = num2cell(linspace(0,3,7)) ;
cb.Title.String={'\alpha'};

hold off


% Adjust plot properties as desired

% Show the legend (optional)
% legend('Series 1', 'Series 2', 'Series 3', ...);

% Show the plot
% Uncomment the line below if you want to display the plot automatically
% display(gcf);
end
