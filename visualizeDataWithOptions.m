function visualizeDataWithOptions(data,master_column_data,weight_column_data,master_column_title)
% Input:
% - data: a cell array with datasets


% Get the number of datasets
numDatasets = length(data);

% Check if data is valid and not empty
if 0%numDatasets < 2
    %error('At least two datasets are required for analysis.');
else

    % Create a figure with a beautiful color scheme
    %figure;
    set(gcf, 'Color', [0.95, 0.95, 0.95]);  % Set background color

    % Define custom colors
    colorPalette = parula(3);
    %violin(data,'facecolor',repmat([1,1,1],1,1),'edgecolor',repmat([0,0,0],1,1));%,'bw',10);
    count_i=0;
    % Scatter plot with density-based point size and custom aesthetics
    for i = 1:numDatasets
        if ~isempty(data{i})
            count_i=count_i+1;

            %weight_column_data{i}=weight_column_data{i};
            %weight_column_data_norm{i}=weight_column_data{i}/sum(weight_column_data{i});

            %ext_vect=extended_vector_afa(data{i}, weight_column_data{i}*0+1);

            %weighted_median=nanmedian(ext_vect);
            weighted_median=nanmedian(data{i});

            hold on;
            %             jitteredX = i + (rand(size(data{i})) - 0.5) * 0.2; % Add random jitter to x-axis
            %             scatter(jitteredX, data{i}, 100, colorPalette(i, :), 'filled', 'MarkerEdgeColor', 'k', 'LineWidth', 1.2);
            %simple_violin_scatter( i+0*data{i}, data{i}, 10, 0.6, {8,data{i},'MarkerEdgeColor',colorPalette(2,:)});
            simple_violin_scatter( count_i+0*data{i}, data{i}, 10, 0.6, {8,master_column_data{i}});
            pad=0.3;
            plot(linspace(count_i-pad,count_i+pad,100), linspace(count_i-pad,count_i+pad,100)*0+weighted_median,'k-','LineWidth',2);

            cb=colorbar;
            cb.Title.String=master_column_title;
        end
    end

    % Add a box around the plot
    box on;

    % Remove the grid
    grid off;

    % Remove x-axis label
    xlabel('');

    % Display p-values as horizontal lines above data points with text
    %
    % for i = 1:numDatasets
    %     for j = i+1:numDatasets
    %         if ~isempty(data{i}) && ~isempty(data{j})
    %             allData = [data{i}; data{j}];
    %             groups = [ones(size(data{i})); 2 * ones(size(data{j}))];
    %
    %             lineY = max(allData);
    %             p = kruskalwallis(allData,groups, 'off');
    %             x1 = i;
    %             x2 = j;
    %             xMid = (x1 + x2) / 2;
    %             yMid = lineY +0.1*(lineY-median(allData));
    %             textMid=yMid+0.1*(lineY-median(allData));
    %             % Blunted line ends
    %             line([x1, x2], [yMid, yMid], 'Color', 'k', 'LineWidth', 0.8);
    %             %line([xMid + 0.15, x2], [yMid, yMid], 'Color', colorPalette(i, :), 'LineWidth', 2);
    %             text(xMid, textMid, sprintf('p = %.4f', p), 'HorizontalAlignment', 'center', 'FontSize', 6);
    %         end
    %     end
    % end

    % Customize the axes
    ax = gca;
    ax.FontSize = 12;
    %ax.YLabel.String = 'Values';


    %ax.YLabel.FontSize = 14;

    % Save the plot as an image (optional)
    % saveas(gcf, 'scatter_plot.png');
end
end
