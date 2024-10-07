function [combining_all,median_no_spots_in_frame,trackmate_settings,combining_all_XY,combining_all_MSD]=DoG_TM_properties_func_update_v7(filename,movie_id,timestep_actual,clip_factor)
use_as_function=1;
if ~use_as_function
    clc;
    clear all;
    close all

    % %
    %filename= 'H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_21Jun23_Tcells_in_brain\MAX_Zen_21Jun23_Tcells_in_brain_2023_06_21__19_02_26__p1_Slow_Model.xml';
    %
    %filename= 'H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_21Jun23_Tcells_in_brain\Zen_21Jun23_Tcells_in_brain_2023_06_21__19_02_26__p1_Model.xml';

    %filename= 'H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_21Jun23_Tcells_in_brain\MAX_Zen_21Jun23_Tcells_in_brain_2023_06_21__19_02_26__p1_Slow_Model.xml';

    %go to xml file
    %filename= 'E:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_30Jun23_Tcells_in_brain_100ug_ml_IM7\Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49__p01_Model.xml';
    %filename= 'Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49__p01_Model.xml';

    %%46 mb xml file
    %filename='H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_25Aug23_MTcells_in_brain_slices_embd_collagen\Zen_25Aug23_MTcells_in_brain_slices_embd_collagen_2023_08_26__01_28_30__p10_100_Model.xml';
    %p10

    %filename='Zen_25Aug23_MTcells_in_brain_slices_embd_collagen_2023_08_26__01_28_30__p10_100_Model.xml';
    %filename='Zen_25Aug23_MTcells_in_brain_slices_embd_collagen_2023_08_26__01_28_30__p12_100_Model.xml';


    % filename= 'H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_25Aug23_MTcells_in_brain_slices_embd_collagen\Zen_25Aug23_MTcells_in_brain_slices_embd_collagen_2023_08_25__20_34_46__p01_Model.xml';

    %%\Zen_25Aug23_MTcells_in_brain_slices_embd_collagen\Zen_25Aug23_MTcells_in_brain_slices_embd_collagen_2023_08_25__20_34_46__p01_Model


    %%%%checking foir an error in a specific file
    %filename='E:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_14Jul23_Tcells_in_brain_100nM_Taxol\Zen_14Jul23_Tcells_in_brain_100nM_Taxol_2023_07_14__01_08_06__p01_Model.xml';

    %filename='E:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_25Jun23_Tcells_in_brain\Zen_25Jun23_Tcells_in_brain_2023_06_25__21_01_08__p01_Model.xml';
    %filename='E:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_25Jun23_Tcells_in_brain\Zen_25Jun23_Tcells_in_brain_2023_06_25__19_01_09__p01_Model.xml';

    %filename='E:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_11Jul23_Tcells_in_brain_1000nM_Taxol\Zen_11Jul23_Tcells_in_brain_1000nM_Taxol_2023_07_12__02_31_38__p01_Model.xml';
    %filename='E:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_11Jul23_Tcells_in_brain_1000nM_Taxol\Zen_11Jul23_Tcells_in_brain_1000nM_Taxol_2023_07_12__02_31_38_Z23_p20_Model_v2.xml';

    %filename= 'E:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_22Jun23_Tcells_in_brain\Zen_22Jun23_Tcells_in_brain_2023_06_22__18_08_10_Z23_p1_Model_v2.xml';
    %filename= 'E:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_21Jun23_Tcells_in_brain\Zen_21Jun23_Tcells_in_brain_2023_06_21__19_02_26_Z23_p1_Model_v2.xml';
    
    %filename= 'E:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_25Jun23_Tcells_in_brain\Zen_25Jun23_Tcells_in_brain_2023_06_25__19_01_09_Z23_p02_Model_v2.xml';
    filename= 'E:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2\Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37_Z23_p01_Model_v2.xml';
 
    
    %Zen_22Jun23_Tcells_in_brain_rep3_2023_06_22__23_31_59_Z23_p1_Model_v2
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

if ~isfile(filename)

    disp('Warning by AFA: File not found');
    combining_all=[];%zeros(2,(Total_no_frames+13));
    combining_all_XY=[];
    combining_all_MSD=[];
    trackmate_settings=[];
    median_no_spots_in_frame=nan;


else
    %dat2a = parseXML(filename);%not recognized in 2023
    new_data=readstruct(filename);%faster,reconized in 2023 and after

    %data=xml2struct(filename);
    %%%

    % edgetime_a=str2double(data.Children(4).Children(2).Attributes(8).Value);%60
    % edgetime_b=str2double(data.Children(4).Children(2).Attributes(8).Value)/2+0.5;%30.5

    edgetime_a=(new_data.Settings.ImageData.timeintervalAttribute);%60
    edgetime_b=(new_data.Settings.ImageData.timeintervalAttribute)/2;%30.5 or 30 for the latest


    timestep_speed_conversion=timestep_actual/(60*edgetime_a);
    %%both edtime and timestep_actual are in seconds and directly caluculated
    %%from the metadata


    % Total_no_frames=(size(data.Children(2).Children(4).Children,2)-1)/2;
    %
    % Total_no_track=(size(data.Children(2).Children(6).Children,2)-1)/2;
    % Total_no_filt_track=(size(data.Children(2).Children(8).Children,2)-1)/2;
    % for i=1:Total_no_frames
    %     total_no_spots_in_frame(i)=(size(data.Children(2).Children(4).Children(2*i).Children,2)-1)/2;
    % end


    Total_no_frames=size(new_data.Model.AllSpots.SpotsInFrame,2);
    Total_no_track=size(new_data.Model.AllTracks.Track,2);
    Total_no_filt_track=size(new_data.Model.FilteredTracks.TrackID,2);
    for i=1:Total_no_frames
        total_no_spots_in_frame(i)=size(new_data.Model.AllSpots.SpotsInFrame(i).Spot,2);
    end


    median_no_spots_in_frame=median(total_no_spots_in_frame);

    if Total_no_filt_track<=0 %check if it still has to be -0.5%|| median_no_spots_in_frame<40
        combining_all=[];%zeros(2,(Total_no_frames+13));
        combining_all_XY=[];
        combining_all_MSD=[];
        trackmate_settings=[];
        median_no_spots_in_frame=nan;
    else
        for i=1:Total_no_filt_track
            filt_track_ID(i)=new_data.Model.FilteredTracks.TrackID(i).TRACK_IDAttribute;
        end

        count=1;
        for i=1:Total_no_track
            temp_id=new_data.Model.AllTracks.Track(i).TRACK_IDAttribute;
            if sum((filt_track_ID==temp_id))==1

                track_med_speed(count,:)=(xy_conversion/timestep_speed_conversion)*new_data.Model.AllTracks.Track(i).TRACK_MEDIAN_SPEEDAttribute;
                track_mean_speed(count,:)=(xy_conversion/timestep_speed_conversion)*new_data.Model.AllTracks.Track(i).TRACK_MEAN_SPEEDAttribute;
                track_max_speed(count,:)=(xy_conversion/timestep_speed_conversion)*new_data.Model.AllTracks.Track(i).TRACK_MAX_SPEEDAttribute;
                track_min_speed(count,:)=(xy_conversion/timestep_speed_conversion)*new_data.Model.AllTracks.Track(i).TRACK_MIN_SPEEDAttribute;
                track_std_speed(count,:)=(xy_conversion/timestep_speed_conversion)*new_data.Model.AllTracks.Track(i).TRACK_STD_SPEEDAttribute;
                track_straight_line_speed(count,:)=(xy_conversion/timestep_speed_conversion)*new_data.Model.AllTracks.Track(i).MEAN_STRAIGHT_LINE_SPEEDAttribute;

                track_mean_quality(count,:)=(1)*new_data.Model.AllTracks.Track(i).TRACK_MEAN_QUALITYAttribute;
                track_no_gaps(count,:)=(1)*new_data.Model.AllTracks.Track(i).NUMBER_GAPSAttribute;
                track_duration(count,:)=(timestep_actual/(60*60))*new_data.Model.AllTracks.Track(i).TRACK_DURATIONAttribute;

                track_disp(count,:)=(xy_conversion/1)*new_data.Model.AllTracks.Track(i).TRACK_DISPLACEMENTAttribute;
                track_tot_dist(count,:)=(xy_conversion/1)*new_data.Model.AllTracks.Track(i).TOTAL_DISTANCE_TRAVELEDAttribute;
                track_max_dist(count,:)=(xy_conversion/1)*new_data.Model.AllTracks.Track(i).MAX_DISTANCE_TRAVELEDAttribute;

                track_linearity_forward(count,:)=new_data.Model.AllTracks.Track(i).LINEARITY_OF_FORWARD_PROGRESSIONAttribute;
                track_confinement(count,:)=(1/1)*new_data.Model.AllTracks.Track(i).CONFINEMENT_RATIOAttribute;

                track_mean_direction_change(count,:)=(1/1)*(180/pi)*new_data.Model.AllTracks.Track(i).MEAN_DIRECTIONAL_CHANGE_RATEAttribute;


                count=count+1;
            end
        end

        Frame_wise_spot_ID=nan(Total_no_frames,max(total_no_spots_in_frame));
        missing_count=zeros(Total_no_frames,max(total_no_spots_in_frame));
        for i=1:Total_no_frames

            %total_no_spots_in_frame(i)=size(new_data.Model.AllSpots.SpotsInFrame(i).Spot,2);

            for j=1:total_no_spots_in_frame(i)

                if ~ismissing(new_data.Model.AllSpots.SpotsInFrame(i).Spot(j))
                    Frame_wise_spot_ID(i,j)=new_data.Model.AllSpots.SpotsInFrame(i).Spot(j).IDAttribute;
                else
                    missing_count(i,j)=missing_count(i,j)+1;
                end

                %spot ID for two channel=4
                %spot ID for single channel=3

            end
        end

        median_no_spots_in_frame=median(total_no_spots_in_frame);

        %Frame_wise_spot_ID(Frame_wise_spot_ID==0)=nan; %%%%this mau cause error
        %sometimes when y

        count=1;
        for i=1:Total_no_track
            temp_id=new_data.Model.AllTracks.Track(i).TRACK_IDAttribute;
            if sum(ismember(filt_track_ID,temp_id))==1
                total_no_spots_in_filt_track(count,1)=new_data.Model.AllTracks.Track(i).NUMBER_SPOTSAttribute;

                for j=1:(total_no_spots_in_filt_track(count,1)-1)  %%%runs through each edge


                    spot_ID_start(count,j)=new_data.Model.AllTracks.Track(i).Edge(j).SPOT_SOURCE_IDAttribute;
                    spot_ID_end(count,j)=new_data.Model.AllTracks.Track(i).Edge(j).SPOT_TARGET_IDAttribute;
                    spot_ID_edgetime(count,j)=new_data.Model.AllTracks.Track(i).Edge(j).EDGE_TIMEAttribute;


                    [search_i,search_j]=find((Frame_wise_spot_ID==spot_ID_start(count,j)));

                    if no_of_channel_TrackMate==1%%%% single channel


                        %%%%single channel data
                        spot_area(count,j)=xy_conversion^2*(new_data.Model.AllSpots.SpotsInFrame(search_i).Spot(search_j).RADIUSAttribute)^2;
                        spot_X(count,j)=xy_conversion*new_data.Model.AllSpots.SpotsInFrame(search_i).Spot(search_j).POSITION_XAttribute;
                        spot_Y(count,j)=xy_conversion*new_data.Model.AllSpots.SpotsInFrame(search_i).Spot(search_j).POSITION_YAttribute;
                        %spot_Z(count,j)=conversion*str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(11).Value);
                        spot_stdIntCh1(count,j)=new_data.Model.AllSpots.SpotsInFrame(search_i).Spot(search_j).STD_INTENSITY_CH1Attribute;%single channel
                    else
                        %%%%%%two channel data
                        spot_area(count,j)=xy_conversion^2*(new_data.Model.AllSpots.SpotsInFrame(search_i).Spot(search_j).RADIUSAttribute)^2;
                        spot_X(count,j)=xy_conversion*new_data.Model.AllSpots.SpotsInFrame(search_i).Spot(search_j).POSITION_XAttribute;
                        spot_Y(count,j)=xy_conversion*new_data.Model.AllSpots.SpotsInFrame(search_i).Spot(search_j).POSITION_YAttribute;
                        %spot_Z(count,j)=conversion*str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(11).Value);
                        spot_stdIntCh1(count,j)=new_data.Model.AllSpots.SpotsInFrame(search_i).Spot(search_j).STD_INTENSITY_CH1Attribute;%single channel
                    end

                    spot_aspectratio(count,j)=1;



                end


                %taking care of the last spot in each track
                The_last_spot_ID(count)=setdiff(spot_ID_end(count,:),spot_ID_start(count,:));
                spot_ID_edgetime(count,j+1)=max(spot_ID_edgetime(count,:))+edgetime_a;%edgetime_a;%check this wrror prone

                [search_i,search_j]=find((Frame_wise_spot_ID==The_last_spot_ID(count)));

                last_spot_frame_id(count)=search_i;

                if no_of_channel_TrackMate==1%%%% single channel
                    spot_area(count,j+1)=xy_conversion^2*(new_data.Model.AllSpots.SpotsInFrame(search_i).Spot(search_j).RADIUSAttribute)^2;
                    spot_X(count,j+1)=xy_conversion*new_data.Model.AllSpots.SpotsInFrame(search_i).Spot(search_j).POSITION_XAttribute;
                    spot_Y(count,j+1)=xy_conversion*new_data.Model.AllSpots.SpotsInFrame(search_i).Spot(search_j).POSITION_YAttribute;
                    %spot_Z(count,j)=conversion*str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(11).Value);
                    spot_stdIntCh1(count,j+1)=new_data.Model.AllSpots.SpotsInFrame(search_i).Spot(search_j).STD_INTENSITY_CH1Attribute;%single channel
                else
                    %%%%%two channel
                    spot_area(count,j+1)=xy_conversion^2*(new_data.Model.AllSpots.SpotsInFrame(search_i).Spot(search_j).RADIUSAttribute)^2;
                    spot_X(count,j+1)=xy_conversion*new_data.Model.AllSpots.SpotsInFrame(search_i).Spot(search_j).POSITION_XAttribute;
                    spot_Y(count,j+1)=xy_conversion*new_data.Model.AllSpots.SpotsInFrame(search_i).Spot(search_j).POSITION_YAttribute;
                    %spot_Z(count,j)=conversion*str2double(data.Children(2).Children(4).Children(2*search_i).Children(2*search_j).Attributes(11).Value);
                    spot_stdIntCh1(count,j+1)=new_data.Model.AllSpots.SpotsInFrame(search_i).Spot(search_j).STD_INTENSITY_CH1Attribute;%single channel

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

            %%%getting the strating position right
            zero_removed_spot_ID_edgetime=spot_ID_edgetime(i,:);
            zero_removed_spot_ID_edgetime(zero_removed_spot_ID_edgetime==0)=[];

            j=min(zero_removed_spot_ID_edgetime/edgetime_a)+0.5;

            %j=1;
            while j<Total_no_frames
                %for j=1:Total_no_frames

                for b_factor=1:10
                    search_loc=find(spot_ID_edgetime(i,:)==((j-1)*edgetime_a+(edgetime_b*b_factor)));
                    if size(search_loc,2)~=0

                        break
                    end
                end


                %%% this assumes that the edges can only be found at locatiosn
                %%% permitted by having no gaps

                if size(search_loc,2)~=0
                    ordered_spot_area(i,j)=spot_area(i,search_loc);
                    ordered_spot_X(i,j)=spot_X(i,search_loc);
                    ordered_spot_Y(i,j)=spot_Y(i,search_loc);


                    ordered_spot_aspectratio(i,j)=spot_aspectratio(i,search_loc);
                    ordered_spot_stdIntCh1(i,j)=spot_stdIntCh1(i,search_loc);

                    j=j+b_factor;
                else
                    j=j+1;
                end

            end

            last_non_zero_spot_X=spot_area(i,:);
            last_non_zero_spot_X=flip(last_non_zero_spot_X);
            %last_non_zero_spot_X(last_non_zero_spot_X==0)=[];

            if 1%~isempty(find(last_non_zero_spot_X~=0,1))
                last_non_zero_spot_X_ID(i)=size(spot_X,2)-find(last_non_zero_spot_X~=0,1)+1;
            else
                last_non_zero_spot_X_ID(i)=size(spot_X,2);
            end


            ordered_spot_area(i,last_spot_frame_id(i))=spot_area(i,last_non_zero_spot_X_ID(i));
            ordered_spot_X(i,last_spot_frame_id(i))=spot_X(i,last_non_zero_spot_X_ID(i));
            ordered_spot_Y(i,last_spot_frame_id(i))=spot_Y(i,last_non_zero_spot_X_ID(i));


            ordered_spot_aspectratio(i,last_spot_frame_id(i))=spot_aspectratio(i,last_non_zero_spot_X_ID(i));
            ordered_spot_stdIntCh1(i,last_spot_frame_id(i))=spot_stdIntCh1(i,last_non_zero_spot_X_ID(i));

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

        trackmate_settings(1:6,1)=fieldnames(new_data.Settings.DetectorSettings);
        trackmate_settings(1:6,2)=struct2cell(new_data.Settings.DetectorSettings);

        %tracker name
        trackmate_settings(7,1)={"TRACKER_NAMEAttribute"};
        trackmate_settings(7,2)=cellstr(new_data.Settings.TrackerSettings.TRACKER_NAMEAttribute);

        lat_index=size(trackmate_settings,1);

        %linking
        trackmate_settings(lat_index+1:lat_index+2,1)=fieldnames(new_data.Settings.TrackerSettings.Linking);
        trackmate_settings(lat_index+1:lat_index+2,2)=struct2cell(new_data.Settings.TrackerSettings.Linking);

        %gap closing
        lat_index=size(trackmate_settings,1);

        trackmate_settings(lat_index+1:lat_index+4,1)=fieldnames(new_data.Settings.TrackerSettings.GapClosing);
        trackmate_settings(lat_index+1:lat_index+4,2)=struct2cell(new_data.Settings.TrackerSettings.GapClosing);


        lat_index=size(trackmate_settings,1);

        %initial spot filter (just quality mostly)



        trackmate_settings(lat_index+1:lat_index+3,1)=fieldnames(new_data.Settings.InitialSpotFilter);
        trackmate_settings(lat_index+1:lat_index+3,2)=struct2cell(new_data.Settings.InitialSpotFilter);


        lat_index=size(trackmate_settings,1);

        %spot filter collection
        running_index=1;
        if size(new_data.Settings.SpotFilterCollection.Filter,2)~=0

            for mm=1:size(new_data.Settings.SpotFilterCollection.Filter,2)

                trackmate_settings(lat_index+1:lat_index+3,1)=fieldnames(new_data.Settings.SpotFilterCollection.Filter(mm));
                trackmate_settings(lat_index+1:lat_index+3,2)=struct2cell(new_data.Settings.SpotFilterCollection.Filter(mm));
                lat_index=lat_index+3;

            end

        end

        lat_index=size(trackmate_settings,1);

        %tracker filter collection
        running_index=1;
        if strcmp(new_data.Settings.TrackFilterCollection,"")~=1

            for mm=1:size(new_data.Settings.TrackFilterCollection)

                trackmate_settings(lat_index+1:lat_index+3,1)= fieldnames(new_data.Settings.TrackFilterCollection.Filter(mm));
                trackmate_settings(lat_index+1:lat_index+3,2)=struct2cell(new_data.Settings.TrackFilterCollection.Filter(mm));
                lat_index=lat_index+3;

            end

        end


        %% identifying stuck versus rolling
        MSD=obtain_msd(x,y,timestep_actual/60, 1);

        [alpha,~,r2fit] = fitLogLogMSD_afa(MSD(:,:,2),clip_factor,timestep_actual/60);

        alpha_quality=alpha;
        %alpha_quality(r2fit < 0.8)=nan;
        percentage_adherence=100*sum(alpha_quality<1)/(length(alpha_quality)-sum(isnan(alpha_quality)));

        %% fit various random walks
        %hold on
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
        %% Angle of tracks with x axis and the direction of the convection

        for tk=1:size(x,2)

            first_nonnan_xy_id(tk)=find(~isnan(x(:,tk)), 1, 'first');
            last_nonnan_xy_id(tk)=find(~isnan(x(:,tk)), 1, 'last');

            point_start=[x(first_nonnan_xy_id(tk),tk),y(first_nonnan_xy_id(tk),tk)];
            point_end=[x(last_nonnan_xy_id(tk),tk),y(last_nonnan_xy_id(tk),tk)];

            %track_angle(tk,1)=atand((y(last_nonnan_xy_id(tk),tk)-y(first_nonnan_xy_id(tk),tk))/(x(last_nonnan_xy_id(tk),tk)-x(first_nonnan_xy_id(tk),tk)));
            %track_angle(tk,1)=atan2d(point_end(2)-point_start(2),point_end(1)-point_start(1)) + 360*((point_end(2)-point_start(2))<0);
            track_angle(tk,1)=mod(atan2d(point_end(2)-point_start(2),point_end(1)-point_start(1)),360);

        end


        mean_track_angle=nanmean(track_angle);
        for tk=1:size(x,2)
            track_angle_relative_to_mean(tk,1)=track_angle(tk,1)-mean_track_angle;
        end

        %% Adjusting for drifting


        %% Identifying fraction of time stuck vs migrating Nikos code





        %% plot trajectories as a function of time

        n=12;
        cmap_parula = lines(n);
        color_indices = round(linspace(1, n, length(alpha_quality)));
        custom_colormap = cmap_parula(color_indices, :);
        %alpha_quality=sort(alpha_quality);
        colormap_start=1;
        colormap_end=2;


        %subplot(1,2,1);
        %figure(1)
        % hold on;
        % plotTimeSeries(x,y,alpha_quality);
        % box on;
        %axis equal;


        %% plotting MSD plots



        % subplot(1,2,2);
        % figure(5)
        % hold on;
        % for i=1:Total_no_filt_track
        %     if alpha_quality(i)<1
        %         color=cmap_parula(colormap_start,:);
        %     elseif alpha_quality(i)>=1
        %         color=cmap_parula(colormap_end,:);
        %     else
        %         color='k';
        %     end
        %
        %     if isnan(alpha_quality(i))==0
        %         hplot=plot((timestep_actual/60)*linspace(1,Total_no_frames,Total_no_frames),MSD(:,i,2),'color',color);
        %     else
        %         hplot=plot((timestep_actual/60)*linspace(1,Total_no_frames,Total_no_frames),MSD(:,i,2),'color','k');
        %     end
        %
        %     %%%%trying to plot shaded error bar
        % %H(1) = shadedErrorBar(linspace(1,size(acf_store_plot,2),size(acf_store_plot,2)),acf_store_plot, {@mean, @(x) 2*std(x)  }, 'lineprops', '-r');
        %
        % end
        % cmap = [cmap_parula(colormap_start,:) ; cmap_parula(colormap_end,:)] ;
        % colormap(cmap)
        % cbar=colorbar;
        % caxis([0, 2]);
        % cbar.Title.String={'\alpha'};
        % set(gca, 'YScale', 'log', 'XScale', 'log')
        % %     legend('');
        % %     cols =  ["green", "red", "black"];
        % %     col_names = ["Initially Confined", "Initially Rolling", "Poor fit"];
        % %     for j =1:length(col_names)
        % %         plot([NaN NaN], [NaN NaN], 'Color', cols(j), 'DisplayName', col_names(j))
        % %     end
        % % hplot.xscale = 'log';
        % % hplot.yscale = 'log';
        %
        % ylabel('MSD (\mum^2)');
        % xlabel('\DeltaT (min)');
        %
        % box on;

        %hold off;




        %try to include track qualities
        %movie_id,track_med_speed,m_linearity_forward,alpha_quality
        %Just Msd
        just_msd_t=transpose(MSD(:,:,1));
        just_msd=transpose(MSD(:,:,2));
        just_sem=transpose(MSD(:,:,3));
        just_msd_pt=transpose(MSD(:,:,4));

        msd_t_series=(reshape(just_msd_t',[],1));
        msd_series=(reshape(just_msd',[],1));
        sem_series=(reshape(just_sem',[],1));
        msd_pt_series=(reshape(just_msd_pt',[],1));

        just_x=reshape(x,[],1);
        just_y=reshape(y,[],1);

        for nv=1:size(x,1)
            for mv=1:size(x,2)
                track_ID_AFA_xy(nv,mv)=mv;
            end
        end


        %% Relative track location Gridwise
        x_max=new_data.Settings.ImageData.widthAttribute*new_data.Settings.ImageData.pixelwidthAttribute;
        y_max=new_data.Settings.ImageData.heightAttribute*new_data.Settings.ImageData.pixelheightAttribute;
        t_width=Total_no_frames;
        %figure;
        [max_relative_track_location,track_in,movie_mode]=relative_track_location_v4(just_x,just_y,x_max,y_max,t_width);



        %% save track and other properties

        just_track_ID_AFA_xy=reshape(track_ID_AFA_xy,[],1);

        Track_properties=[movie_id+0*total_no_spots_in_filt_track,track_ID_AFA_xy(1,:)',size(track_ID_AFA_xy,2)+0*total_no_spots_in_filt_track,median_no_spots_in_frame+0*total_no_spots_in_filt_track,...
            total_no_spots_in_filt_track,track_no_gaps,track_duration,med_spot_area',med_spot_aspectratio',...
            track_med_speed,track_mean_speed,track_max_speed,track_min_speed,track_std_speed,track_straight_line_speed,...
            track_mean_quality,track_disp,track_tot_dist,track_max_dist,track_linearity_forward,track_confinement,track_mean_direction_change,...
            alpha_quality,r2fit,par,...
            track_angle,track_angle*0+mean_track_angle,track_angle_relative_to_mean,...
            max_relative_track_location',track_in',movie_mode'];

        % header_name={'movie_id','track_id','track_density',...
        %     'cell_density','no_of_spot','area','aspect Ratio',...
        %     'med_speed','mean_speed','max_speed','min_speed','std_speed','straight_speed',...
        %     'track_mean_qual','track_disp','track_tot_dist','max_dist','linearity','confinement','mean_dirn_change',...
        %     'alpha','sat_MSD','tau_c','conf_D','RMC','directed_v','directed_D',...
        %     'track_angle','mean_track_angle','relative_track_angle'};


        %movie_id,track_med_speed,m_linearity_forward,alpha_quality,par
        combining_all=[Track_properties];%,nan(Total_no_filt_track,1)];%,just_msd];
        %par(...,4) is RMC

        combining_all_XY=[movie_id+0*track_med_speed(just_track_ID_AFA_xy),just_track_ID_AFA_xy,(total_no_spots_in_filt_track(just_track_ID_AFA_xy)),...
            just_x,just_y,...
            track_med_speed(just_track_ID_AFA_xy),track_linearity_forward(just_track_ID_AFA_xy),...
            alpha_quality(just_track_ID_AFA_xy),r2fit(just_track_ID_AFA_xy),par(just_track_ID_AFA_xy,5),...
            track_angle(just_track_ID_AFA_xy),track_angle(just_track_ID_AFA_xy)*0+mean_track_angle,track_angle_relative_to_mean(just_track_ID_AFA_xy),...
            msd_t_series,msd_series,sem_series,msd_pt_series
            ];

        combining_all_MSD=[movie_id+0*track_med_speed,track_ID_AFA_xy(1,:)',(total_no_spots_in_filt_track),...
            track_med_speed,track_linearity_forward,...
            alpha_quality,par(:,5),track_med_speed*nan,...
            just_msd];

        %filename_save=strcat(filename(1:end-4),'.csv');
        %writematrix(combining_all,filename_save);


    end
end
%end

