function [combining_all,median_no_spots_in_frame]=TM_properties_func(filename,video_id,timestep,clip_factor)
%
% clc;
% clear all;
% close all

%filename='H:\Aamir experiment data\PA Gels\Mice-Spleen derived T cells on 2D gels\mT cells on 2x IM7 coated gels\\tie_20dec23_mtcells_2x_im7_50Pa01_Slow_Model.xml';
%filename='D:\Aamir data\20220630_IM7_Final\\20220630_Tcells_IM7_20x_5min_XY01_morph_Model.xml';
%filename='D:\Aamir data\20220630_IM7_Final\\20220630_Tcells_IM7_20x_5min_XY01_morph_Model.xml';

%filename='H:\Aamir data\all_collagen\20220714_Tcells_Collagen_2.5mins_20x001_XY05_Fast_Model.xml';

%"H:\Aamir data\all_collagen\20220714_Tcells_Collagen_2.5mins_20x001_XY01_Slow_Model"
%filename= 'H:\Aamir experiment data\PA Gels\Human T cells on 2D gels\All HT on IM7\\03242023_NoCART_10kP_20x_089_XY11_Slow_Model.xml';
%filename= 'H:\Aamir experiment data\PA Gels\Human T cells on 2D gels\All HT on fibronectin\\03242023_NoCART_10kP_20x_089_1_Tracks.xml';

%In 20X, one pixel is 0.33 microns
conversion=0.33;
% timestep=1.5;
% clip_factor=0.4;
% video_id=172917291729;

%load('D:/Aamir data/20220630/XY21_temp.mat')
%load('D:/Aamir data/20220630-IM7/IM7_XY01_temp.mat')
% [folder, name, ext] = fileparts( mfilename('fullpath'));
% cd(folder);
%
% [filename_pre,FilePath]=uigetfile({'.xml'},...
%     'Select XML File', 'MultiSelect', 'on');
%
% filename = [FilePath '\' filename_pre];
data = parseXML(filename);

Total_no_frames=(size(data.Children(2).Children(4).Children,2)-1)/2;

Total_no_track=(size(data.Children(2).Children(6).Children,2)-1)/2;
Total_no_filt_track=(size(data.Children(2).Children(8).Children,2)-1)/2;
for i=1:Total_no_frames
    total_no_spots_in_frame(i)=(size(data.Children(2).Children(4).Children(2*i).Children,2)-1)/2;
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
            track_med_speed(count,:)=(conversion/timestep)*str2double(data.Children(2).Children(6).Children(2*i).Attributes(20).Value);
            m_linearity_forward(count,:)=str2double(data.Children(2).Children(6).Children(2*i).Attributes(2).Value);
            count=count+1;
        end
    end
    
    
    for i=1:Total_no_frames
        
        total_no_spots_in_frame(i)=(size(data.Children(2).Children(4).Children(2*i).Children,2)-1)/2;
        
        for j=1:total_no_spots_in_frame(i)
            Frame_wise_spot_ID(i,j)=str2double(data.Children(2).Children(4).Children(2*i).Children(2*j).Attributes(11).Value);
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
    % figure;
    % hold on;
    % for i=1:Total_no_filt_track
    %     plot(linspace(1,Total_no_frames,Total_no_frames),ordered_spot_aspectratio(i,:));
    % end
    % hold off;
    
    
    
    %[x,y,data] = xmltotracks(filename, maxt);
    x=transpose(ordered_spot_X);
    y=transpose(ordered_spot_Y);
    
    
    MSD=obtain_msd(x,y,timestep, 1);
    
    %% identifying stuck versus rolling
    [alpha,~,r2fit] = fitLogLogMSD_afa(MSD(:,:,2),clip_factor,timestep);
    
    alpha_quality=alpha;
    alpha_quality(r2fit < 0.8)=nan;
    percentage_adherence=100*sum(alpha_quality<1)/(length(alpha_quality)-sum(isnan(alpha_quality)));
    
    
    %figure;
    %plotTimeSeries(x, y,alpha_quality)
    
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
    
    
    %% plotting MSD plots
    %     figure;
    %         hold on;
    %         for i=1:Total_no_filt_track
    %             if alpha_quality(i)<1
    %                 color='g';
    %             elseif alpha_quality(i)>=1
    %                 color='r';
    %             else
    %                 color='k';
    %             end
    %
    %             plot(timestep*linspace(1,Total_no_frames,Total_no_frames),MSD(:,i,2),'Color',color);
    %
    %         end
    %         legend('');
    %         cols =  ["green", "red", "black"];
    %         col_names = ["Initially Confined", "Initially Rolling", "Poor fit"];
    %         for j =1:length(col_names)
    %             plot([NaN NaN], [NaN NaN], 'Color', cols(j), 'DisplayName', col_names(j))
    %         end
    %         ylabel('MSD (\mum^2)');
    %         xlabel('\DeltaT (min)');
    %
    %         box on;
    
    %hold off;
    %% track properties
    Track_properties=[video_id+0*total_no_spots_in_filt_track',total_no_spots_in_filt_track',med_spot_area',med_spot_aspectratio',track_med_speed,m_linearity_forward,alpha_quality,par];
    
    %Just Msd
    just_msd=transpose(MSD(:,:,2));
    
    combining_all=[Track_properties,nan(Total_no_filt_track,1),just_msd];
    
    %filename_save=strcat(filename(1:end-4),'.csv');
    %writematrix(combining_all,filename_save);
    
    
end

%end

