function msd = obtain_msd(x,y,timestep, ptoum)

%x=x_series;
%y=y_series;
% timestep=1.1;
% ptoum=1;

%ptoum = pixels/micron
x = x./ptoum;
y = y./ptoum;

nData=size(x,1);
%numberOfTau= floor(nData/4);
numberOfLag= nData;
ntracks = size(x,2);

msd = NaN(numberOfLag,ntracks,4);

if isempty(x)
    msd = nan;

else
    for track = 1:ntracks
        lengg(track)=sum(~isnan(x(:,track)),1)-1;
        for lag_index = 1:numberOfLag%sum(~isnan(x(:,track)),1)-1
            lag=lag_index-1;
            dx = x(1+lag:end,track)-x(1:end-lag,track); %find diff for each tau
            dy = y(1+lag:end,track)-y(1:end-lag,track);

            squaredDisplacement=dx.^2 + dy.^2; %tx^2+ty^2
            msd(lag_index,track,2) = nanmean(squaredDisplacement);
            %if all values are nans, the mean is nan!
            
            %msd(lag_index,track,3) = nanstd(squaredDisplacement)/length(squaredDisplacement);
            msd(lag_index,track,3) = nanstd(squaredDisplacement)/sum(~isnan(squaredDisplacement));

            msd(lag_index,track,1)= lag*timestep;%wrong
            msd(lag_index,track,4)= sum(~isnan(dx));
        end
    end

end

%figure
%errorbar(msd(:,1),msd(:,2),msd(:,3))
%plot(tau,msd(:,2));
%loglog(msd(:,1),msd(:,2))
%xlabel('tau (sec)')
%ylabel('MSD')

%end