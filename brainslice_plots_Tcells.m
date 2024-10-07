clear
close all
P = '/Volumes/SarahA/';
filename = 'BrainSliceAssays/Tcells/AnalysisSummaryTcells.xlsx';

trackinfo = table2cell(readtable(strcat(P,filename)));
folders = trackinfo(:,1);
folders = unique(string(folders));
files = trackinfo(:,2);
track_timeval = trackinfo(:,6);

for i=1: size(files,1)
  
    newstring = split(string(files(i)), ".lsm");
    N(i) = strcat(newstring(1), '_green_Tracks_a.mat');
    
end

F = trackinfo(:,1);

% S = dir(fullfile(strcat(P, folders(1),'/'),'*_a.mat'));
% %S = S(2:end); %remove later!!!
% 
% for i=2:size(folders,1)
%    
%     newS = dir(fullfile(strcat(P, folders(i),'/'),'*_a.mat'));
%     S = [S; newS];
%     
% end
%S(109) = []; %delete later

% N = {S.name};
% F = {S.folder};

cellline = trackinfo(:,3);
condition = trackinfo(:,4);

% for i = 1:size(N,1)
%    
%    split2 = strsplit(string(N(i)), '_green');
%    matchname = split2(1);
%    n = find(files== matchname);
%    S(i).drug = condition(i);
%    S(i).cell = cellline(i);
%     
% end


%make big structure 
for i=1:size(N,2)
    
    load(strcat(P, string(F(i)),'/', string(N(i))));
    
    data(i).rmc = rmc_vals(~isnan(rmc_vals));
    data(i).msd = msd;
    data(i).maxt = tvals;
    data(i).x = x;
    data(i).y = y;
    data(i).drug = condition(i);
    data(i).cell = cellline(i);
    
    %calculate date
    ab = strsplit(string(F(i)),'/'); 
    data(i).date = ab{end};
    
    %calculate position
    ab = strsplit(string(N(i)),'_p');
    ab2 = strsplit(ab{2},'_');
    data(i).pos = ab2{1};
    
end 

rmc_overnight = [];
slice_overnight = [];
rmc_4hrs = [];
slice_4hrs = [];
rmc_control1 = [];
rmc_50Bleb = [];
rmc_control2 = [];
rmc_100Bleb = [];
rmc_control3 = [];
rmc_250Bleb = [];

rmc_cntrl = [];
rmc_cntrl2 = [];
rmc_10B = [];
rmc_50B = [];

rmc_cntrl3 = [];
rmc_5C = [];
rmc_1C = [];

rmc_cntrl4 = [];
rmc_IM7 = [];

rmc_cntrl5 = [];
rmc_cd11a = [];


for i=1:size(data,2)
%for i=[121:126]   
%i 
%fprintf(string(data(i).drug))
    if string(data(i).drug) == 'overnight'
        
        rmc_overnight = [rmc_overnight; data(i).rmc'];
        %slice_control = [slice_control; repelem(string(strcat(data(i).date, '_p', data(i).pos)), size(data(i).rmc,2))'];
        
    elseif string(data(i).drug) == '4 hrs'
        
        rmc_4hrs = [rmc_4hrs; data(i).rmc'];
        %slice_50bleb = [slice_50bleb; repelem(string(strcat(data(i).date, '_p', data(i).pos)), size(data(i).rmc,2))'];
        
    elseif string(data(i).drug) == 'control1'
        
        rmc_control1 = [rmc_control1; data(i).rmc'];
        %slice_50bleb = [slice_50bleb; repelem(string(strcat(data(i).date, '_p', data(i).pos)), size(data(i).rmc,2))'];
        
    elseif string(data(i).drug) == '50 uM Bleb'
        
        rmc_50Bleb = [rmc_50Bleb; data(i).rmc'];
        %slice_50bleb = [slice_50bleb; repelem(string(strcat(data(i).date, '_p', data(i).pos)), size(data(i).rmc,2))'];
    
    elseif string(data(i).drug) == 'control2'
        
        rmc_control2 = [rmc_control2; data(i).rmc'];
        %slice_50bleb = [slice_50bleb; repelem(string(strcat(data(i).date, '_p', data(i).pos)), size(data(i).rmc,2))'];
        
    elseif string(data(i).drug) == '100 uM Bleb'
        
        rmc_100Bleb = [rmc_100Bleb; data(i).rmc'];
        %slice_50bleb = [slice_50bleb; repelem(string(strcat(data(i).date, '_p', data(i).pos)), size(data(i).rmc,2))'];
    
    elseif string(data(i).drug) == 'control3'
        
        rmc_control3 = [rmc_control3; data(i).rmc'];
        %slice_50bleb = [slice_50bleb; repelem(string(strcat(data(i).date, '_p', data(i).pos)), size(data(i).rmc,2))'];
        
    elseif string(data(i).drug) == '250 uM Bleb'
        
        rmc_250Bleb = [rmc_250Bleb; data(i).rmc'];
        %slice_50bleb = [slice_50bleb; repelem(string(strcat(data(i).date, '_p', data(i).pos)), size(data(i).rmc,2))'];
    
    elseif string(data(i).drug) == 'cntrl'
        
        rmc_cntrl = [rmc_cntrl; data(i).rmc'];
        %slice_50bleb = [slice_50bleb; repelem(string(strcat(data(i).date, '_p', data(i).pos)), size(data(i).rmc,2))'];    
        
    elseif string(data(i).drug) == 'cntrl2'
        
        rmc_cntrl2 = [rmc_cntrl2; data(i).rmc'];
        %slice_50bleb = [slice_50bleb; repelem(string(strcat(data(i).date, '_p', data(i).pos)), size(data(i).rmc,2))'];   
        
    elseif string(data(i).drug) == '10B'
        
        rmc_10B = [rmc_10B; data(i).rmc'];
        %slice_50bleb = [slice_50bleb; repelem(string(strcat(data(i).date, '_p', data(i).pos)), size(data(i).rmc,2))'];   
        
    elseif string(data(i).drug) == '50B'
        
        rmc_50B = [rmc_50B; data(i).rmc'];
        %slice_50bleb = [slice_50bleb; repelem(string(strcat(data(i).date, '_p', data(i).pos)), size(data(i).rmc,2))'];   


    elseif string(data(i).drug) == 'cntrl3'
        
        rmc_cntrl3 = [rmc_cntrl3; data(i).rmc'];
        %slice_50bleb = [slice_50bleb; repelem(string(strcat(data(i).date, '_p', data(i).pos)), size(data(i).rmc,2))'];   

    elseif string(data(i).drug) == '5C'
        
        rmc_5C = [rmc_5C; data(i).rmc'];
        %slice_50bleb = [slice_50bleb; repelem(string(strcat(data(i).date, '_p', data(i).pos)), size(data(i).rmc,2))'];   

    elseif string(data(i).drug) == '1C'
        
        rmc_1C = [rmc_1C; data(i).rmc'];
        %slice_50bleb = [slice_50bleb; repelem(string(strcat(data(i).date, '_p', data(i).pos)), size(data(i).rmc,2))'];   
    
    elseif string(data(i).drug) == 'cntrl4'
        
        rmc_cntrl4 = [rmc_cntrl4; data(i).rmc'];
        %slice_50bleb = [slice_50bleb; repelem(string(strcat(data(i).date, '_p', data(i).pos)), size(data(i).rmc,2))'];   

    elseif string(data(i).drug) == 'IM7'
        
        rmc_IM7 = [rmc_IM7; data(i).rmc'];
        %slice_50bleb = [slice_50bleb; repelem(string(strcat(data(i).date, '_p', data(i).pos)), size(data(i).rmc,2))'];   

    elseif string(data(i).drug) == 'cntrl5'
        
        rmc_cntrl5 = [rmc_cntrl5; data(i).rmc'];
        %slice_50bleb = [slice_50bleb; repelem(string(strcat(data(i).date, '_p', data(i).pos)), size(data(i).rmc,2))'];   

    elseif string(data(i).drug) == 'cd11a'
        
        rmc_cd11a = [rmc_cd11a; data(i).rmc'];
        %slice_50bleb = [slice_50bleb; repelem(string(strcat(data(i).date, '_p', data(i).pos)), size(data(i).rmc,2))'];   


    else
        i
        print('No Condition Specified ')
    end
end

%drugs
rmc_tot = nan(max([size(rmc_overnight,1), size(rmc_4hrs,1), size(rmc_control1,1), size(rmc_50Bleb,1), size(rmc_control2,1), size(rmc_100Bleb,1), size(rmc_control3,1), size(rmc_250Bleb,1), size(rmc_cntrl,1),size(rmc_cntrl2,1),size(rmc_10B,1),size(rmc_50B,1),size(rmc_cntrl3,1),size(rmc_1C,1),size(rmc_5C,1),size(rmc_cntrl4,1),size(rmc_IM7,1),size(rmc_cntrl5,1),size(rmc_cd11a,1)  ]),19);
rmc_tot(1:size(rmc_overnight,1),1) = rmc_overnight;
rmc_tot(1:size(rmc_4hrs,1),2) = rmc_4hrs;
rmc_tot(1:size(rmc_control1,1),3) = rmc_control1;
rmc_tot(1:size(rmc_50Bleb,1),4) = rmc_50Bleb;
rmc_tot(1:size(rmc_control2,1),5) = rmc_control2;
rmc_tot(1:size(rmc_100Bleb,1),6) = rmc_100Bleb;
rmc_tot(1:size(rmc_control3,1),7) = rmc_control3;
rmc_tot(1:size(rmc_250Bleb,1),8) = rmc_250Bleb;
rmc_tot(1:size(rmc_cntrl,1),9) = rmc_cntrl;
rmc_tot(1:size(rmc_cntrl2,1),10) = rmc_cntrl2;
rmc_tot(1:size(rmc_10B,1),11) = rmc_10B;
rmc_tot(1:size(rmc_50B,1),12) = rmc_50B;
rmc_tot(1:size(rmc_cntrl3,1),13) = rmc_cntrl3;
rmc_tot(1:size(rmc_1C,1),14) = rmc_1C;
rmc_tot(1:size(rmc_5C,1),15) = rmc_5C;
rmc_tot(1:size(rmc_cntrl4,1),16) = rmc_cntrl4;
rmc_tot(1:size(rmc_IM7,1),17) = rmc_IM7;
rmc_tot(1:size(rmc_cntrl5,1),18) = rmc_cntrl5;
rmc_tot(1:size(rmc_cd11a,1),19) = rmc_cd11a;

%slice tracker
% slice_tot = strings(max([size(slice_control,1), size(slice_50bleb,1), size(slice_5bleb,1), size(slice_10bleb,1), size(slice_5crgd,1), size(slice_500crgd,1) ]),8);
% slice_tot(1:size(slice_control,1),1) = slice_control;
% slice_tot(1:size(slice_5bleb,1),2) = slice_5bleb;
% slice_tot(1:size(slice_50bleb,1),4) = slice_50bleb;
% slice_tot(1:size(slice_10bleb,1),3) = slice_10bleb;
% slice_tot(1:size(slice_5crgd,1),6) = slice_5crgd;
% slice_tot(1:size(slice_500crgd,1),5) = slice_500crgd;



% 
% 
% %drugs
% figure
% Conditions = ["Control"; "5uM Bleb"; "10uM Bleb"; "50uM Bleb"; "500nM cRGD";"5uM cRGD"];
% boxplot(rmc_tot, Conditions)
% ylabel('RMC (\mum^2/min)')
% title('Accumulated Random Motility Coefficient')
% set(gca, 'YScale', 'log')
% 
% 
% 
% %Kruskal-Wallis for RMC drugs
% Alpha = 0.05;
% [Pk,ANOVATAB,STATS] = kruskalwallis(rmc_tot(:,:));
% figure
% multcompare(STATS, 'Alpha',Alpha,'CType','dunn-sidak');
% 
