clear all;
close all;
clc

%In 20X, one pixel is 0.33 microns
conversion=0.33;
timestep=5;
 
%load('D:/Aamir data/20220630/XY21_temp.mat')
%load('D:/Aamir data/20220630-IM7/IM7_XY01_temp.mat')
[folder, name, ext] = fileparts( mfilename('fullpath'));
cd(folder);

[filename_pre,FilePath]=uigetfile({'.xml'},...
    'Select XML File', 'MultiSelect', 'on');

filename = [FilePath '\' filename_pre];
data = parseXML(filename);

Total_no_track=(size(data.Children(2).Children(6).Children,2)-1)/2;
Total_no_filt_track=(size(data.Children(2).Children(8).Children,2)-1)/2;

for i=1:Total_no_filt_track
    filt_track_ID{i,:}=data.Children(2).Children(8).Children(2*i).Attributes.Value;
end

count=1;
for i=1:Total_no_track
    temp_id=data.Children(2).Children(6).Children(2*i).Attributes(15).Value;
    if sum(ismember(filt_track_ID,temp_id))==1
        track_mean_speed(count,:)=(conversion/timestep)*str2double(data.Children(2).Children(6).Children(2*i).Attributes(19).Value);
        count=count+1;
    end
end



Total_no_frames=(size(data.Children(2).Children(4).Children,2)-1)/2;

for i=1:Total_no_frames
    
    total_no_spots_in_frame(i)=(size(data.Children(2).Children(4).Children(2*i).Children,2)-1)/2;
    
    for j=1:total_no_spots_in_frame(i)
        Frame_wise_spot_ID(i,j)=str2double(data.Children(2).Children(4).Children(2*i).Children(2*j).Attributes(11).Value);
    end
end


count=1;
for i=1:Total_no_track
    temp_id=data.Children(2).Children(6).Children(2*i).Attributes(15).Value;
    if sum(ismember(filt_track_ID,temp_id))==1
        
        total_no_spots_in_filt_track(count)=(size(data.Children(2).Children(6).Children(2*i).Children,2)-1)/2+1;
        
        for j=1:total_no_spots_in_filt_track(count)-1
            spot_ID_start(count,j)=str2double(data.Children(2).Children(6).Children(2*i).Children(2*j).Attributes(9).Value);
            spot_ID_edgetime(count,j)=str2double(data.Children(2).Children(6).Children(2*i).Children(2*j).Attributes(3).Value)+1/2;
            
            spot_ID_end(count,j)=str2double(data.Children(2).Children(6).Children(2*i).Children(2*j).Attributes(10).Value);

            
            [search_i,search_j]=find((Frame_wise_spot_ID==spot_ID_start(count,j)));
            
            spot_area(count,j)=conversion^2*str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(1).Value);
            spot_X(count,j)=conversion*str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(18).Value);
            spot_Y(count,j)=conversion*str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(19).Value);

            spot_aspectratio(count,j)=str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(4).Value);
            spot_stdIntCh1(count,j)=str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(27).Value);
            
        end
        
        
        %taking care of the last spot in each track
        The_last_spot_ID(count)=setdiff(spot_ID_end(count,:),spot_ID_start(count,:));
        spot_ID_edgetime(count,j+1)=max(spot_ID_edgetime(count,:))+1;
        
        [search_i,search_j]=find((Frame_wise_spot_ID==The_last_spot_ID(count)));
            
        spot_area(count,j+1)=conversion^2*str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(1).Value);
        spot_X(count,j+1)=conversion*str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(18).Value);
        spot_Y(count,j+1)=conversion*str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(19).Value);
        
        spot_aspectratio(count,j+1)=str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(4).Value);
        spot_stdIntCh1(count,j+1)=str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(27).Value);
            
        
        %mean calculations
        mean_spot_area(count)=sum(spot_area(count,:))/total_no_spots_in_filt_track(count);
        mean_spot_aspectratio(count)=sum(spot_aspectratio(count,:))/total_no_spots_in_filt_track(count);
        
        count=count+1;
    end
end


%rearranging in the order of increasing time
ordered_spot_area=nan(Total_no_filt_track,Total_no_frames);
ordered_spot_X=nan(Total_no_filt_track,Total_no_frames);
ordered_spot_Y=nan(Total_no_filt_track,Total_no_frames);


ordered_spot_aspectratio=nan(Total_no_filt_track,Total_no_frames);
ordered_spot_stdIntCh1=nan(Total_no_filt_track,Total_no_frames);

for i=1:Total_no_filt_track
    for j=1:Total_no_frames
        search_loc=find(spot_ID_edgetime(i,:)==(j*1));
        
        if size(search_loc,2)~=0
            ordered_spot_area(i,j)=spot_area(i,search_loc);
            ordered_spot_X(i,j)=spot_X(i,search_loc);
            ordered_spot_Y(i,j)=spot_Y(i,search_loc);

            
            ordered_spot_aspectratio(i,j)=spot_aspectratio(i,search_loc);
            ordered_spot_stdIntCh1(i,j)=spot_stdIntCh1(i,search_loc);
        end
    end
end


%plotting
hold on;
for i=1:Total_no_filt_track
    plot(linspace(1,Total_no_frames,Total_no_frames),ordered_spot_aspectratio(i,:));
end


%[x,y,data] = xmltotracks(filename, maxt);
x=transpose(ordered_spot_X);
y=transpose(ordered_spot_Y);

%saving tracks 
for i=1:Total_no_filt_track
   track_store=[timestep*(1:Total_no_frames);ordered_spot_X(i,:);ordered_spot_Y(i,:)]';
   track_formatted{i}=track_store;
end


[RMC, pers, rand_speed,exit_flags,MSD] = calculate_rmc(x,y,timestep,1);

%plotting MSD plots
figure;
hold on;

for i=1:Total_no_filt_track

    plot((linspace(1,Total_no_frames,Total_no_frames)),(MSD(:,i,2)));
end

%% storing the properties conveniently

for i=1:Total_no_filt_track
    
    if exit_flags(i,1)~=1
        RMC(i)=nan;
    end
    
    if exit_flags(i,2)~=1
        rand_speed(i)=nan;
        pers(i)=nan;
    end
end


[alpha,gamma,r2fit] = fitLogLogMSD_afa(MSD(:,:,2),timestep);

alpha_quality=alpha;
alpha_quality(r2fit < 0.8)=nan;
percentage_adherence=100*sum(alpha_quality<1)/(length(alpha_quality)-sum(isnan(alpha_quality)));

%track properties
Track_properties=[RMC',track_mean_speed,rand_speed',pers',alpha_quality,mean_spot_area',mean_spot_aspectratio',total_no_spots_in_filt_track'];

%Just Msd
just_msd=transpose(MSD(:,:,2));

combining_all=[Track_properties,zeros(Total_no_filt_track,1),just_msd];

filename_save=strcat(filename(1:end-4),'.csv');
writematrix(combining_all,filename_save);