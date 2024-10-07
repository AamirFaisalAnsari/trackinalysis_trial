%%%%get moment of inertia and lambda 1 and lambda 2
%function calc_lambda_moment()
% close all
for track=1:height(Time_series_data)/t_width
    current_track_block=(track-1)*t_width+1:track*t_width;

    x_disp_track=rand+linspace(1,100,100);%x_disp_series(current_track_block,:);
    y_disp_track=rand+linspace(1,100,100);%y_disp_series(current_track_block,:);

    I_xx=nansum(x_disp_track.*x_disp_track);
    I_xy=-1*nansum(x_disp_track.*y_disp_track);
    I_yx=-1*nansum(y_disp_track.*x_disp_track);
    I_yy=nansum(y_disp_track.*y_disp_track);

    Moment_I=[I_xx,I_xy;I_yx,I_yy];

    [lambda(track,:)]=(eig(Moment_I))';
    lambda_max(track)=max(lambda(track,:));
    lambda_min(track)=min(lambda(track,:));
    
    ratio_lambda(track)=lambda_max(track)/lambda_min(track);
    asphericity_num(track)=(0.5*(lambda(track,1)+lambda(track,2))^2-2*lambda(track,1)*lambda(track,2));
    asphericity_den(track)=(0.5*(lambda(track,1)+lambda(track,2))^2);

end
mean_aspericity=mean(asphericity_num)/mean(asphericity_den)%0.57 for RW, 1 for directed,0 for circular

ratio_avg_lambda=mean(lambda_max)/mean(lambda_min)
avg_ratio_lambda=mean(ratio_lambda)

n_bin=15;
c_hist=histogram(log10(ratio_lambda),n_bin,'Normalization','count','FaceAlpha',1,'EdgeAlpha',0,'FaceColor','k');
% ax=gca;
% ax.XScale='log';
% ax.YScale='log';

