function [par1,par2,par3,msd] = calculate_rmc2(x,y,alpha,timestep, ptoum)

%ptoum = pixels/micron
x = x./ptoum;
y = y./ptoum;

nData=size(x,1);
%numberOfTau= floor(nData/4);
numberOfTau= nData;
ntracks = size(x,2);

msd = NaN(numberOfTau,ntracks,3);

if isempty(x)
    msd = nan;
    par1 = nan;
    par2=nan;
    par3=nan;
else
    for track = 1:ntracks
            lengg=sum(~isnan(x(:,track)),1)-2;
            for tau = 1:sum(~isnan(x(:,track)),1)-2
                
                dx = x(1+tau:end,track)-x(1:end-tau,track); %find diff for each tau
                dy = y(1+tau:end,track)-y(1:end-tau,track);
                
                squaredDisplacement=dx.^2 + dy.^2; %tx^2+ty^2
                msd(tau,track,2) = nanmean(squaredDisplacement);
                msd(tau,track,3) = nanstd(squaredDisplacement)/length(squaredDisplacement);
                msd(tau,track,1)= tau*timestep;
            end
            
            track_msd =  msd(:,track,:);
            track_msd = track_msd(~isnan(track_msd(:,1)), :);
            %[RMC1(track),pers(track),rand_speed(track),exit_flags(track,:)] = RMC_calc(track_msd,alpha);
            [par1(track),par2(track),par3(track)] = RMC_calc_3(track_msd,alpha);
    end
    
end

%figure
%errorbar(msd(:,1),msd(:,2),msd(:,3))
%plot(tau,msd(:,2));
%loglog(msd(:,1),msd(:,2))
%xlabel('tau (sec)')
%ylabel('MSD')

end