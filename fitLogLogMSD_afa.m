function [alpha,gamma,r2fit] = fitLogLogMSD_afa(MSD_matrix,clip_factor,timestep)
%MSD_matrix=MSD(:,:,2);
%rows are time and columns are tracks
%clip_factor=0.25;
n_tracks = size(MSD_matrix,2);
n_frames=size(MSD_matrix,1);

alpha = NaN(n_tracks, 1);
gamma = NaN(n_tracks, 1);
r2fit = NaN(n_tracks, 1);
alpha_upperci = NaN(n_tracks, 1);
alpha_lowerci = NaN(n_tracks, 1);
ft = fittype('poly1');

for i_track = 1 : n_tracks
    
    t = timestep*(1:n_frames)';
    y = MSD_matrix(:,i_track);
    
    % Clip data
    if clip_factor < 1
        t_limit = 2 : round(numel(t) * clip_factor);
    else
        t_limit = 2 : min(1+round(clip_factor), numel(t));
    end
    t = t(t_limit);
    y = y(t_limit);
    
    % Thrash bad data
    nonnan = ~isnan(y);
    
    t = t(nonnan);
    y = y(nonnan);
    
    if numel(y) < 2
        continue
    end
    
    xl = log(t);
    yl = log(y);
    
    bad_log =  isinf(xl) | isinf(yl);
    xl(bad_log) = [];
    yl(bad_log) = [];
    
    if numel(xl) < 2
        continue
    end
    
    [fo, gof] = fit(xl, yl, ft);
    if fo.p1<0
        alpha(i_track) = nan;
        gamma(i_track) = nan;
        r2fit(i_track) = nan;
    else
        alpha(i_track) = fo.p1;
        gamma(i_track) = exp(fo.p2);
        r2fit(i_track) = gof.adjrsquare;
    end
    
    %ci = confint( fo );
    %alpha_lowerci(i_track) = ci(1, 1);
    %alpha_upperci(i_track) = ci(2, 1);
end
end