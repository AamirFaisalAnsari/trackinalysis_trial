clear all;close all;clc

[folder, name, ext] = fileparts( mfilename('fullpath'));
cd(folder);

%% read xlsx file

[fileread,FilePath]=uigetfile({'*.*','All Files (*.*)'},...
    'Select Image File', 'MultiSelect', 'on');

[filefolder, FileName, fileext] = fileparts(fileread);


% fileread = 'aCellTrack.xlsx';
    CF = readtable([FilePath fileread]);

count1 = 1;
for i = 2:size(CF,2)
    temp = CF{1,i};
    if ~isnan(temp)
        for j = 1:5
            temp = CF{j*3-2:j*3,i};
            if ~isnan(temp)
                record{count1}(j,:) = temp;% cell number, first frame, last frame
            end
        end
        count1 = count1+1;
    end
end


%% read mat file
% cd 'S:\JayHou\exp1024\migration\19kpa_control';

% [FileName,FilePath]=uigetfile({'*.*','All Files (*.*)'},...
%     'Select Image File', 'MultiSelect', 'on');
% load([FilePath FileName]);

load([FilePath FileName '.tif.mat']);

%% make txt file

for m = 1:length(record)
    recordno = 1;
    for i = 1 : size(record{m},1)
        cellno = record{m}(i,1);
        frame_start = record{m}(i,2);
        frame_end = record{m}(i,3);
        fileID = fopen([FilePath FileName '_record'  '.txt'],'a');
        fprintf(fileID,'cell %d [%d %d %d]\n',m,cellno,frame_start,frame_end);
        fclose(fileID);
        
        for frameno=frame_start: frame_end
            
            for k = 1:size(cellno_all{frameno},2)
                if cellno == cellno_all{frameno}(k)
                    ind = k;
                end
            end
            if recordno == 1
                temp = [recordno stats_all{frameno}(ind).Area stats_all{frameno}(ind).Centroid stats_all{frameno}(ind).MinorAxisLength stats_all{frameno}(ind).MajorAxisLength];
                % frameN, area, centerx, centery, minaxis, maxaxis
                % in pixels
                dlmwrite([FilePath FileName '_' num2str(m) '.txt'],temp);
                recordno = recordno+1;
                centroidp = stats_all{frameno}(ind).Centroid;
            else
                temp = [recordno stats_all{frameno}(ind).Area stats_all{frameno}(ind).Centroid stats_all{frameno}(ind).MinorAxisLength stats_all{frameno}(ind).MajorAxisLength];
                dlmwrite([FilePath FileName '_' num2str(m) '.txt'],temp,'-append');
                recordno = recordno+1;
                centroid = stats_all{frameno}(ind).Centroid;
                if ((centroid(1)-centroidp(1))^2+(centroid(2)-centroidp(2))^2)^0.5 > 1000
                    error('cell %d number may not right', m)
                end
                centroidp = centroid;
            end
        end
        
    end
end


end1=1;







