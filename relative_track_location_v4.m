%%%%% calcualte the track location near the edge or in the middle

function [max_relative_track_location,track_in,movie_mode]=relative_track_location_v4(x_series,y_series,x_max,y_max,t_width)
% close all
% clc

figure_on=0;

%figure

nrow=5;
ncol=5;

% x_max=1400;
% y_max=1400;
% t_width=100;

near_boundary=0.05;
split_fraction_lower(1)=0;
split_fraction_lower(2)=near_boundary;
split_fraction_lower(3:nrow)=(1-2*near_boundary)/(nrow-2);

split_fraction_upper(1)=near_boundary;
split_fraction_upper(nrow)=near_boundary;
split_fraction_upper(2:nrow-1)=(1-2*near_boundary)/(nrow-2);

cum_temp=0;
for i=1:nrow
    cum_temp=cum_temp+split_fraction_lower(i);
    split_fraction_lower_cum(i)=cum_temp;
end

cum_temp=0;
for i=1:nrow
    cum_temp=cum_temp+split_fraction_upper(i);
    split_fraction_upper_cum(i)=cum_temp;
end



for track=1:length(x_series)/t_width

    x_track=650*0+1*x_series(1+t_width*(track-1):t_width*track,1);
    y_track=650*0+1*y_series(1+t_width*(track-1):t_width*track,1);
    relative_track_location=nan(t_width,1);

    for frame=1:t_width
        track_count_grid=zeros(nrow,ncol);
        for i=1:nrow
            for j=1:ncol

                x_lower(i)=x_max*split_fraction_lower_cum(i);%split_fraction
                x_upper(i)=x_max*split_fraction_upper_cum(i);

                y_lower(j)=y_max*split_fraction_lower_cum(j);
                y_upper(j)=y_max*split_fraction_upper_cum(j);

                if (x_track(frame)<=x_upper(i)) && (x_track(frame)>=x_lower(i)) && (y_track(frame)<=y_upper(j)) && (y_lower(j)<=y_track(frame))
                    %track_count_grid(i,j)=track_count_grid(i,j)+1;
                    relative_track_location(frame,1)=10*i+j;
                end

            end
        end
        % [max_value,max_id]=max(max(track_count_grid));
        % %max(track_count_grid,[],'all');
        %
        % if ~isempty(find(track_count_grid==1, 1))
        %     [I_row, I_col] = find(track_count_grid==1);
        %
        %     relative_track_location(frame)=10*I_row(1)+I_col(1);
        % else
        %     relative_track_location(frame)=nan;
        % end
    end
    non_nan_relative_track_location=relative_track_location;
    non_nan_relative_track_location(isnan(non_nan_relative_track_location))=[];
    max_relative_track_location(track)=mode(non_nan_relative_track_location);

    str_temp=num2str(max_relative_track_location(track));
    digit1=str2num(str_temp(1)) ;
    digit2=str2num(str_temp(2)) ;

    if digit1==1 || digit2==1 || digit1==nrow || digit2==nrow
        track_in(track)=0;
    else
        track_in(track)=1;
    end


    x_track_nan_removed=x_track;
    y_track_nan_removed=y_track;

    x_track_nan_removed(isnan(x_track_nan_removed))=[];
    y_track_nan_removed(isnan(y_track_nan_removed))=[];

    if figure_on
        hold on
        plot(x_track_nan_removed,y_track_nan_removed,'.-')
        set(gca,'ydir','reverse')
    end
end



% for i=1:nrow
%     for j=1:ncol
%         x_lower(i)=x_max*split_fraction_lower_cum(i);%split_fraction
%         x_upper(i)=x_max*split_fraction_upper_cum(i);
%         y_lower(j)=y_max*split_fraction_lower_cum(j);
%         y_upper(j)=y_max*split_fraction_upper_cum(j);
%
%         xline(x_lower(i));
%         yline(y_lower(j));
%
%         xline(x_upper(i));
%         yline(y_upper(j));
%         xlim([0,x_max]);
%         ylim([0,y_max]);
%     end
% end

if figure_on
    set(gca,'Yticklabel',[])
    set(gca,'Xticklabel',[])
    xlim([0,x_max]);
    ylim([0,y_max]);
    %axis equal
    box on;
end
movie_mode=max_relative_track_location*0+mode(max_relative_track_location);
