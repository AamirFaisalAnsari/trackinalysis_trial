close all

% % Make random data of "density" so I assume it's a histogram.
% myHistogram = randi(20, 1, 1234);
% % Randomly make some of them nan's
% % Not sure how this would happen with a histogram, but whatever....
% nanLocations = randi(length(myHistogram), 1, 33);
% myHistogram(nanLocations) = NaN;
% % Now we can start
% % First make NaNs zero.
% myHistogram(isnan(myHistogram)) = 0;
% % Now compute CDF
% myCDF = cumsum(myHistogram);
% myCDF = myCDF / myCDF(end);
% % plot(myCDF);
% % grid on;
% % Find out how many bins to sum together
% % so that we get 10 new bins.
% binsToUse = round(length(myHistogram)/10);
% % Rebin into 10 bins
% edges(1) = 1; % Location of first bin.
% for b = 1 : 9
%   % Find out bin that will give CDFs of 10%, 20%, 30%,...100%
%   endingBin = find(myCDF < b*0.1, 1, 'last');
%   edges(b+1) = endingBin;
%   % Sum those bins to form new histogram
%   newHist(b) = sum(myHistogram(edges(b):edges(b+1)));
% end
% % Finish up with last bin.
% newHist(10) = sum(myHistogram(edges(9) + 1:end));
% % Print to command line
% % edges
% % newHist
% 
% hold on
% histogram(myHistogram)
% histogram(myHistogram,'BinEdges',edges(1:10))
% 
% 
% 

% x=normrnd(0,2,100);
% nbin = 10;
% y = quantile(x,nbin-1);
% %[counts, Id] = histc(x,[-inf; y(:); inf]);
% 
% histogram(x)
% %histogram(myHistogram,'BinEdges',edges(1:10))




% YourData=normrnd(0,2,100);
% sortvals = sort(YourData(~isnan(YourData)));
% binwidth = floor(length(sortvals)/10);
% leftover = length(sortvals) - binwidth*10;
% bincontents = cell2mat(sortvals(:), [binwidth*ones(1,9), leftover], 1);
% 

clear hist_Y 
clear edge_y

N_obs=100;
%N_bin=11-1;
%X = 1*rand(1,5*N);
%hist_y = sort(1*normrnd(0,2,[1,(N_obs*N_bin)+50]));

hist_y = sort(1*normrnd(0,2,[1,1012]));
N_bin=floor(length(hist_y)/N_obs);

%edge_y = mean([hist_y(N_obs:N_obs:end-1);hist_y(1+N_obs:N_obs:end)],1); % bin edges
%edge_y = mean([hist_y(1:N_obs-1:end);hist_y(2:N_obs-1:end)],1); % bin edges

%%%%%method 1: create a new bin for the leftover
edge_y= nan(1,N_bin+2);
edge_y(1)=hist_y(1);
edge_y(2:end-1) = hist_y(N_obs+1:N_obs:(1+N_obs*floor(length(hist_y)/N_obs)));%hist_y(2:N_obs-1:end)],1); % bin edges
edge_y(end)=hist_y(end);



%%%%%method 2: you do not create a new bin for the leftover
% edge_y= nan(1,N_bin+1);
% edge_y(1)=hist_y(1);
% edge_y(2:end-1) = hist_y(N_obs+1:N_obs:(N_obs*floor(length(hist_y)/N_obs)));%hist_y(2:N_obs-1:end)],1); % bin edges
% edge_y(end)=hist_y(end);


%spl = reshape(Y,N_obs,[]);

hold on
subplot(1,2,1)
histogram(hist_y,N_bin,'Normalization','count')
subplot(1,2,2)
histogram(hist_y,'Normalization','count','BinEdges',edge_y)

