%function [combining_all,median_no_spots_in_frame,trackmate_settings,combining_all_XY,combining_all_MSD]=DoG_TM_properties_func(filename,movie_id,timestep_actual,clip_factor)
use_as_function=0;
if ~use_as_function
    clc;
    clear all;
    close all
    
    % %
    %filename= 'H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_21Jun23_Tcells_in_brain\MAX_Zen_21Jun23_Tcells_in_brain_2023_06_21__19_02_26__p1_Slow_Model.xml';
    %
    %filename= 'H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_21Jun23_Tcells_in_brain\Zen_21Jun23_Tcells_in_brain_2023_06_21__19_02_26__p1_Model.xml';
    
    %filename= 'H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_21Jun23_Tcells_in_brain\MAX_Zen_21Jun23_Tcells_in_brain_2023_06_21__19_02_26__p1_Slow_Model.xml';
    
    %my go-to xml file
    filename= 'H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_30Jun23_Tcells_in_brain_100ug_ml_IM7\Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49__p01_Model.xml';
    
    %%46 mb xml file
    %filename='H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_25Aug23_MTcells_in_brain_slices_embd_collagen\Zen_25Aug23_MTcells_in_brain_slices_embd_collagen_2023_08_26__01_28_30__p10_100_Model.xml';
    %filename= 'H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_25Aug23_MTcells_in_brain_slices_embd_collagen\Zen_25Aug23_MTcells_in_brain_slices_embd_collagen_2023_08_25__20_34_46__p01_Model.xml';

    %%\Zen_25Aug23_MTcells_in_brain_slices_embd_collagen\Zen_25Aug23_MTcells_in_brain_slices_embd_collagen_2023_08_25__20_34_46__p01_Model
    
   %filename= 'H:\Aamir experiment data\PA Gels\To be sorted\TiE_29Jun23\C1-TiE_29Jun23_Tcells_on_IM7_50Pa003_crop1_cell_1.xml';
    clip_factor=0.4;
    movie_id=172917291729;
    timestep_actual=66;
end

no_of_channel_TrackMate=1;

%In 20X, one pixel is 0.33 microns
%conversion=1.312;%for 10x at 0.5 zoom...zeiss...4*0.33
xy_conversion=1*1;%because all lsm files is coming with all x and y already converted%;2.625;%for 10x at 0.5 zoom...zeiss...4*0.33
%
% [folder, name, ext] = fileparts( mfilename('fullpath'));
% cd(folder);
%
% [filename_pre,FilePath]=uigetfile({'.xml'},...
%     'Select XML File', 'MultiSelect', 'on');
%
% filename = [FilePath '\' filename_pre];

%data = parseXML(filename);

data = parseXML(filename);
%new_data=xml2struct(filename);


edgetime_a=str2double(data.Children(4).Children(2).Attributes(8).Value);%60
edgetime_b=str2double(data.Children(4).Children(2).Attributes(8).Value)/2+0.5;%30.5


edgetime_a_new=str2double(new_data.Settings.Interval);%60
edgetime_b_new=str2double(new_data.Settings.Interval)/2+0.5;%30.5



timestep_speed_conversion=timestep_actual/(60*edgetime_a);
%%both edtime and timestep_actual are in seconds and directly caluculated
%%from the metadata


Total_no_frames=(size(data.Children(2).Children(4).Children,2)-1)/2;
Total_no_track=(size(data.Children(2).Children(6).Children,2)-1)/2;
Total_no_filt_track=(size(data.Children(2).Children(8).Children,2)-1)/2;
for i=1:Total_no_frames
    total_no_spots_in_frame(i)=(size(data.Children(2).Children(4).Children(2*i).Children,2)-1)/2;
end


Total_no_frames_new=size(new_data.Model.AllSpots.SpotsInFrame);
Total_no_track_new=size(new_data.Model.AllTracks);
Total_no_filt_track_new=size(new_data.Model.FilteredTracks);
for i=1:Total_no_frames_new
    total_no_spots_in_frame_new(i)=size(new_data.Model.AllSpots.SpotsInFrame.Spot(i));
end

median_no_spots_in_frame=median(total_no_spots_in_frame);

if Total_no_filt_track==-0.5 %|| median_no_spots_in_frame<40
    combining_all=[];%zeros(2,(Total_no_frames+13));
    %median_no_spots_in_frame=nan;
else
    
    for i=1:Total_no_filt_track
        filt_track_ID{i,:}=data.Children(2).Children(8).Children(2*i).Attributes.Value;
    end
    
    count=1;
    for i=1:Total_no_track
        temp_id=data.Children(2).Children(6).Children(2*i).Attributes(15).Value;
        if sum(ismember(filt_track_ID,temp_id))==1
            track_med_speed(count,:)=(xy_conversion/timestep_speed_conversion)*str2double(data.Children(2).Children(6).Children(2*i).Attributes(20).Value);
            m_linearity_forward(count,:)=str2double(data.Children(2).Children(6).Children(2*i).Attributes(2).Value);
            count=count+1;
        end
    end
    
    
    for i=1:Total_no_frames
        
        total_no_spots_in_frame(i)=(size(data.Children(2).Children(4).Children(2*i).Children,2)-1)/2;
        
        for j=1:total_no_spots_in_frame(i)
            
            if no_of_channel_TrackMate==1%%%% single channel
                Frame_wise_spot_ID(i,j)=str2double(data.Children(2).Children(4).Children(2*i).Children(2*j).Attributes(3).Value);
            else
                Frame_wise_spot_ID(i,j)=str2double(data.Children(2).Children(4).Children(2*i).Children(2*j).Attributes(4).Value);
            end
            
            %spot ID for two channel=4
            %spot ID for single channel=3
            
        end
    end
    
    median_no_spots_in_frame=median(total_no_spots_in_frame);
    
    Frame_wise_spot_ID(Frame_wise_spot_ID==0)=nan;
    
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
                
                if no_of_channel_TrackMate==1%%%% single channel
                    
                    %%%%single channel data
                    spot_area(count,j)=xy_conversion^2*(str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(13).Value))^2;
                    spot_X(count,j)=xy_conversion*str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(9).Value);
                    spot_Y(count,j)=xy_conversion*str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(10).Value);
                    %spot_Z(count,j)=conversion*str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(11).Value);
                    spot_stdIntCh1(count,j)=str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(15).Value);%single channel
                else
                    %%%%%%two channel data
                    spot_area(count,j)=xy_conversion^2*(str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(18).Value))^2;
                    spot_X(count,j)=xy_conversion*str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(14).Value);
                    spot_Y(count,j)=xy_conversion*str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(15).Value);
                    %spot_Z(count,j)=conversion*str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(16).Value);
                    
                    spot_stdIntCh1(count,j)=str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(21).Value);%double channel
                end
                
                spot_aspectratio(count,j)=1;
                
                
                
            end
            
            
            %taking care of the last spot in each track
            The_last_spot_ID(count)=setdiff(spot_ID_end(count,:),spot_ID_start(count,:));
            spot_ID_edgetime(count,j+1)=max(spot_ID_edgetime(count,:))+1;
            
            [search_i,search_j]=find((Frame_wise_spot_ID==The_last_spot_ID(count)));
            
            if no_of_channel_TrackMate==1%%%% single channel
                spot_area(count,j+1)=xy_conversion^2*(str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(13).Value))^2;
                spot_X(count,j+1)=xy_conversion*str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(9).Value);
                spot_Y(count,j+1)=xy_conversion*str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(10).Value);
                
                spot_stdIntCh1(count,j+1)=str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(15).Value);
                
            else
                %%%%%two channel
                spot_area(count,j+1)=xy_conversion^2*(str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(18).Value))^2;
                spot_X(count,j+1)=xy_conversion*str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(14).Value);
                spot_Y(count,j+1)=xy_conversion*str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(15).Value);
                
                spot_stdIntCh1(count,j+1)=str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(21).Value);
                %spot_stdIntCh1(count,j+1)=str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(27).Value);
                
            end
            
            spot_aspectratio(count,j+1)=1;
            
            
            %mean calculations
            area_zero_less=spot_area(count,:);
            area_zero_less(area_zero_less==0)=[];
            
            aspect_zero_less=spot_aspectratio(count,:);
            aspect_zero_less(aspect_zero_less==0)=[];
            
            med_spot_area(count)=median(area_zero_less);%/total_no_spots_in_filt_track(count);
            med_spot_aspectratio(count)=median(aspect_zero_less);%/total_no_spots_in_filt_track(count);
            
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
            search_loc=find(spot_ID_edgetime(i,:)==((j-1)*edgetime_a+edgetime_b));
            
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
    % figure;
    % hold on;
    % for i=1:Total_no_filt_track
    %     plot(linspace(1,Total_no_frames,Total_no_frames),ordered_spot_aspectratio(i,:));
    % end
    % hold off;
    
    
    
    %[x,y,data] = xmltotracks(filename, maxt);
    x=transpose(ordered_spot_X);
    y=transpose(ordered_spot_Y);
    
    %% save some detector and tracker settings
    %clear trackmate_settings
    
    %%% detector setting
    for g=1:6
        trackmate_settings{g,1}=data.Children(4).Children(6).Attributes(g).Name;
        trackmate_settings{g,2}=(data.Children(4).Children(6).Attributes(g).Value);
    end
    
    %linking
    trackmate_settings{g+1,1}=data.Children(4).Children(12).Children(2).Attributes.Name;
    trackmate_settings{g+1,2}=data.Children(4).Children(12).Children(2).Attributes.Value;
    
    %gap closing
    lat_index=size(trackmate_settings,1);
    for kk=1:3
        trackmate_settings{lat_index+kk,1}=data.Children(4).Children(12).Children(4).Attributes(kk).Name;
        trackmate_settings{lat_index+kk,2}=(data.Children(4).Children(12).Children(4).Attributes(kk).Value);
    end
    
    lat_index=size(trackmate_settings,1);
    
    %initial spot filter (just quality mostly)
    
    
    for g=1:3
        trackmate_settings{lat_index+g,1}=data.Children(4).Children(8).Attributes(g).Name;
        trackmate_settings{lat_index+g,2}=(data.Children(4).Children(8).Attributes(g).Value);
    end
    
    lat_index=size(trackmate_settings,1);
    
    %spot filter collection
    running_index=1;
    if (size(data.Children(4).Children(10).Children,2))/2~=0
        
        for mm=1:(size(data.Children(4).Children(10).Children,2)-1)/2
            for vvv=1:3
                trackmate_settings{lat_index+running_index,1}=data.Children(4).Children(10).Children(2*mm).Attributes(vvv).Name;
                trackmate_settings{lat_index+running_index,2}=data.Children(4).Children(10).Children(2*mm).Attributes(vvv).Value;
                running_index=running_index+1;
            end
        end
        
    end
    
    lat_index=size(trackmate_settings,1);
    
    %tracker collection
    running_index=1;
    if (size(data.Children(4).Children(14).Children,2))/2~=0
        
        for mm=1:(size(data.Children(4).Children(14).Children,2)-1)/2
            for vvv=1:3
                trackmate_settings{lat_index+running_index,1}=data.Children(4).Children(14).Children(2*mm).Attributes(vvv).Name;
                trackmate_settings{lat_index+running_index,2}=data.Children(4).Children(14).Children(2*mm).Attributes(vvv).Value;
                running_index=running_index+1;
            end
        end
        
    end
    
    
    %% identifying stuck versus rolling
    MSD=obtain_msd(x,y,timestep_actual/60, 1);
    
    [alpha,~,r2fit] = fitLogLogMSD_afa(MSD(:,:,2),clip_factor,timestep_actual/60);
    
    alpha_quality=alpha;
    alpha_quality(r2fit < 0.8)=nan;
    percentage_adherence=100*sum(alpha_quality<1)/(length(alpha_quality)-sum(isnan(alpha_quality)));
    
    %%
    [par]=track_fit(MSD,alpha_quality,clip_factor);
    
    %[par1,par2,par3,MSD] = calculate_rmc2(x,y,alpha,timestep,1);
    
    %     if alpha<0.95
    %         Sat_MSD=par1;
    %         pre_expon=par2;
    %         confined_D=par3;
    %
    %     elseif alpha>1.05
    %         directed_v=par1;
    %         directed_D=par2;
    %
    %     else
    %         Random_D=par1;
    %     end
    
    %% plot trajectories as a function of time
    
    n=12;
    cmap_parula = lines(n);
    color_indices = round(linspace(1, n, length(alpha_quality)));
    custom_colormap = cmap_parula(color_indices, :);
    %alpha_quality=sort(alpha_quality);
    colormap_start=1;
    colormap_end=2;
    
    
    subplot(1,2,1);
    %figure(1)
    hold on;
    plotTimeSeries(x,y,alpha_quality);
    box on;
    %axis equal;
    
    
    %% plotting MSD plots
    
    
    
    subplot(1,2,2);
    %figure(2)
    hold on;
    for i=1:Total_no_filt_track
        if alpha_quality(i)<1
            color=cmap_parula(colormap_start,:);
        elseif alpha_quality(i)>=1
            color=cmap_parula(colormap_end,:);
        else
            color='k';
        end
        
        if isnan(alpha_quality(i))==0
            plot((timestep_actual/60)*linspace(1,Total_no_frames,Total_no_frames),MSD(:,i,2),'color',color);
        else
            plot((timestep_actual/60)*linspace(1,Total_no_frames,Total_no_frames),MSD(:,i,2),'color','k');
        end
        
    end
    cmap = [cmap_parula(colormap_start,:) ; cmap_parula(colormap_end,:)] ;
    colormap(cmap)
    cbar=colorbar;
    caxis([0, 2]);
    cbar.Title.String={'\alpha'};
    %     legend('');
    %     cols =  ["green", "red", "black"];
    %     col_names = ["Initially Confined", "Initially Rolling", "Poor fit"];
    %     for j =1:length(col_names)
    %         plot([NaN NaN], [NaN NaN], 'Color', cols(j), 'DisplayName', col_names(j))
    %     end
    ylabel('MSD (\mum^2)');
    xlabel('\DeltaT (min)');
    
    box on;
    
    %hold off;
    %% track properties

    
    %movie_id,track_med_speed,m_linearity_forward,alpha_quality
    %Just Msd
    just_msd=transpose(MSD(:,:,2));
    just_x=reshape(x,[],1);
    just_y=reshape(y,[],1);
    
    for nv=1:size(x,1)
        for mv=1:size(x,2)
            track_ID_AFA_xy(nv,mv)=mv;
        end
    end
    
    just_track_ID_AFA_xy=reshape(track_ID_AFA_xy,[],1);
    
    Track_properties=[movie_id+0*total_no_spots_in_filt_track',track_ID_AFA_xy(1,:)',size(track_ID_AFA_xy,2)+0*total_no_spots_in_filt_track',median_no_spots_in_frame+0*total_no_spots_in_filt_track',total_no_spots_in_filt_track',med_spot_area',med_spot_aspectratio',track_med_speed,m_linearity_forward,alpha_quality,par];
    
    %movie_id,track_med_speed,m_linearity_forward,alpha_quality,par
    combining_all=[Track_properties];%,nan(Total_no_filt_track,1)];%,just_msd];
    %par(...,4) is RMC
    combining_all_XY=[movie_id+0*track_med_speed(just_track_ID_AFA_xy),just_track_ID_AFA_xy,just_x,just_y,track_med_speed(just_track_ID_AFA_xy),m_linearity_forward(just_track_ID_AFA_xy),alpha_quality(just_track_ID_AFA_xy),par(just_track_ID_AFA_xy,4)];
    combining_all_MSD=[movie_id+0*track_med_speed,track_ID_AFA_xy(1,:)',track_med_speed,m_linearity_forward,alpha_quality,par(:,4),track_med_speed*nan,just_msd];
    
    %filename_save=strcat(filename(1:end-4),'.csv');
    %writematrix(combining_all,filename_save);
    
    
end

%end

