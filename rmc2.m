function [RMC, msd] = rmc2(x,y,timestep, ptoum)

%ptoum = pixels/micron
x = x./ptoum;
y = y./ptoum;

nData=size(x,1);
%numberOfTau= floor(nData/4);
numberOfTau= nData;
ntracks = size(x,2);

msd = NaN(numberOfTau,3,ntracks);

if length(x) == 0
    msd = NaN;
    RMC = NaN;
else
    
    for track = 1:ntracks
        track
        if sum(~isnan(x(:,track)),1) >= 0 %must have 5 or more points
            lengg=sum(~isnan(x(:,track)),1)-2;
            for tau = 1:sum(~isnan(x(:,track)),1)-2
                
                dx = x(1+tau:end,track)-x(1:end-tau,track); %find diff for each tau
                dy = y(1+tau:end,track)-y(1:end-tau,track);
                
                squaredDisplacement=dx.^2 + dy.^2; %tx^2+ty^2
                msd(tau,2,track) = nanmean(squaredDisplacement);
                msd(tau,3,track) = nanstd(squaredDisplacement)/length(squaredDisplacement);
                msd(tau,1,track)= tau*timestep;
            end
            track_msd =  msd(:,:,track);
            track_msd = track_msd(~isnan(track_msd(:,1)), :);
            RMC(track) = RMC_calc(track_msd);
            
            %       DDval(track,:) = DiffDrift(track_msd);
            
            %checking
            %         figure
            %         errorbar(track_msd(:,1), track_msd(:,2), track_msd(:,3))
            %         hold on
            %         plot(track_msd(:,1), 4.*track_msd(:,1).*RMC(track))
            %
        else
            
            RMC(track) = NaN;
            %        DDval(track,:) = [NaN NaN];
        end
        %plot(linspace(1,lengg),msd(:,2,track));
    end
    
end

%figure
%errorbar(msd(:,1),msd(:,2),msd(:,3))
%plot(tau,msd(:,2));
%loglog(msd(:,1),msd(:,2))
%xlabel('tau (sec)')
%ylabel('MSD')

end