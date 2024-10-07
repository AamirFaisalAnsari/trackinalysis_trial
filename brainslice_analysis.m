
P = '/Volumes/';
filename = 'SarahANew/AnalysisSummary_Tcells2.xlsx';
%filename = 'BrainSliceAssays/Tcells/AnalysisSummaryTcells.xlsx';
trackinfo = table2cell(readtable(strcat(P,filename)));
folders = trackinfo(:,1);
trackfiles = trackinfo(:,2);


lsm_filenames = trackinfo(:,2);
track_filenames = lsm_filenames;


track_timeval = trackinfo(:,6);
track_maxt = nan(1,size(track_timeval,1));
%track_filenames = cell(1,size(track_timeval,1))';

registration = trackinfo(:,8);

for i = 1:size(track_timeval,1)
   
    if size(track_timeval{i},1) > 0
        celltimevals = strsplit(track_timeval{i}, '-');
        track_maxt(i) = str2double(celltimevals{2})-str2double(celltimevals{1}) + 1;
 
    end

        split = strsplit(string(lsm_filenames(i)), '.');
        track_filenames{i} = strcat(split(1),'_green_Tracks.xml');
%          if strcmp(registration{i},'yes')
%              track_filenames{i} = strcat(split(1),'_green_reg_Tracks.xml');
%          else
%              track_filenames{i} = strcat(split(1),'_green_Tracks.xml');
%          end
    
end


for n=1:size(trackfiles,1)

    n
if ~isnan(track_maxt(n))
    
    path = strcat(P, string(folders{n}),'/');
    [x, y] = xmltotracks(strcat(path, string(track_filenames(n))), track_maxt(n));
    zs = find(x==0 & y==0);
    x(zs) = NaN;
    y(zs) = NaN;
    %[rmc_vals ,msd] = rmc(x,y);
    [rmc_vals ,msd] = rmc2(x,y, 5);
    tvals = maxt(x);


    
    %checking
    % for i=1:size(rmc_vals,2)
    %     figure
    %     errorbar(msd(:,1,i), msd(:,2,i), msd(:,3,i))
    %     hold on
    %     plot(msd(:,1,i), 4*rmc_vals(i).*msd(:,1,i))
    % end

    split = strsplit(string(track_filenames(n)), '.xml');
    newname = strcat(split(1),'_a');
    save(strcat(path,newname), 'rmc_vals','tvals','msd','x','y')

end
end
