function [x,y,data] = xmltotracks(filename, maxt);

data = parseXML(filename);
%data = parseXML('C1-20200315_orthotopicU251GFPAct_NRG_2020_03_16__18_04_26__p2_20x_overnight_Tracks_red.xml');

numtracks = (size(data.Children,2)-1)/2;
x = nan(maxt,numtracks);
y = nan(maxt,numtracks);

for tracks = 1:numtracks
    
    time = (size(data.Children(tracks*2).Children,2)-1)/2; %number of time points
    
    for t=1:time
        
        x(t, tracks) = str2num(data.Children(tracks*2).Children(t*2).Attributes(2).Value);
        y(t, tracks) = str2num(data.Children(tracks*2).Children(t*2).Attributes(3).Value);

    end

end

end
