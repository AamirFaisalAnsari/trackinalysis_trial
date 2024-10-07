
function edge_value=edges_for_equal_count_histogram_afa(hist_value,N_obs,method_type)
% close all
% clear hist_Y
% clear edge_y

% method_type=1;
% N_obs=100;
% N_bin=11-1;
% X = 1*rand(1,5*N);
% hist_y = sort(1*normrnd(0,2,[1,(N_obs*N_bin)+50]));

% hist_y = sort(1*normrnd(0,2,[1,1012]));
%hist_value=ds_series1;
hist_value_mod=hist_value;
hist_value_mod(isnan(hist_value_mod))=[];
hist_value_mod=sort(hist_value_mod);
N_bin=floor(length(hist_value_mod)/N_obs);

%edge_y = mean([hist_y(N_obs:N_obs:end-1);hist_y(1+N_obs:N_obs:end)],1); % bin edges
%edge_y = mean([hist_y(1:N_obs-1:end);hist_y(2:N_obs-1:end)],1); % bin edges
if method_type==1
    %%%%%method 1: create a new bin for the leftover
    edge_value= nan(1,N_bin+2);
    edge_value(1)=hist_value_mod(1);
    edge_value(2:end-1) = hist_value_mod(N_obs+1:N_obs:(1+N_obs*floor(length(hist_value_mod)/N_obs)));%hist_y(2:N_obs-1:end)],1); % bin edges
    edge_value(end)=hist_value_mod(end);

else
    %%%%%method 2: you do not create a new bin for the leftover
    edge_value= nan(1,N_bin+1);
    edge_value(1)=hist_value_mod(1);
    edge_value(2:end-1) = hist_value_mod(N_obs+1:N_obs:(N_obs*floor(length(hist_value_mod)/N_obs)));%hist_y(2:N_obs-1:end)],1); % bin edges
    edge_value(end)=hist_value_mod(end);
end

%spl = reshape(Y,N_obs,[]);

% hold on
% subplot(1,2,1)
% histogram(hist_value_mod,N_bin,'Normalization','pdf')
% subplot(1,2,2)
% histogram(hist_value_mod,'Normalization','pdf','BinEdges',edge_value)

