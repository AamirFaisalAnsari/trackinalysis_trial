
clc
clear all;
close all;

% close the excel file first

[folder, name, ext] = fileparts( mfilename('fullpath'));
cd(folder);

[FileName_old,FilePath]=uigetfile({'.xlsx'},...
    'Select Excel File', 'MultiSelect', 'on');

if iscell(FileName_old)
    filenum = size(FileName_old,2);
else
    filenum = 1;
end

Mega_combine_1=[];
Mega_combine_2=[];
Mega_combine_3=[];
Mega_combine_4=[];

filename_call_1 = [FilePath '\' FileName_old];


filename_slow=filename_call_1;

close all
% sheet_name={'9.3 kPa'};
% sheet_name_print={'','9.3 kPa',''};

% sheet_name={'First day','Next day'};
% sheet_name_print={'','t=0 day','t=1 day',''};

sheet_name={'PAG','2X IM7 50 Pa','2X IM7 700 Pa','2X IM7 Glass'};
sheet_name_print={'','PAG','2X IM7 50 Pa','2X IM7 700 Pa','2X IM7 Glass',''};


timestep=1;
Lpad=0.5;
saved_data_combined=nan(10000,14,4);
saved_data_slow=nan(10000,14,4);
saved_data_fast=nan(10000,14,4);
adherence=nan(30,4);

for sheet_no=1:4
    [data_slow]=table2array(readtable(filename_slow,'Sheet',sheet_name{sheet_no}));
    data_combined=[data_slow(:,1:12)];
    %data_combined(:,14)=[0*data_slow(:,1)];
    saved_data_slow(1:size(data_slow,1),1:1:size(data_slow,2),sheet_no)=data_slow;
    
    saved_data_combined(1:size(data_combined,1),1:1:size(data_combined,2),sheet_no)=data_combined;
    filename_save_extless=strcat(filename_call_1(1:end-5));
    %     writecell(num2cell(data_combined),strcat(filename_save_extless,'_combined.xlsx'),'Sheet',sheet_name{sheet_no});
    %
    %% Hist of crowdiness
%         load(strcat(filename_save_extless,'.mat'));
%     
%     
%     %     histogram(median_no_spots_in_frame_saved,40,'Normalization','probability');
%     %     xlabel('Median number of spots');
%     %     ylabel('Frequency');
%     %     saveas(gcf,strcat(filename_save_extless,sheet_name{sheet_no},'_hist_crowdiness.svg'));
%     %close all
%     %% Hist of adherence
%     
    video_id_slow=data_slow(:,1);
    
    whole_video_id=[video_id_slow];
    unique_video_id=unique(whole_video_id);
    
    no_spots_frame_slow=zeros(length(unique_video_id),1);
    %adherence=nan(length(unique_video_id),4);
    
    for i=1:length(unique_video_id)
        temp_video_id=unique_video_id(i);
        
        search_slow=find(video_id_slow==temp_video_id);
        if ~isempty(search_slow)
            no_spots_frame_slow(i)=length(search_slow);
        end
    end

    
    subplot(3,1,3);
    %figure;
    box on;
    hold on;
    % histogram(Mega_combine_1_signal(:,2))
    % histogram(Mega_combine_1_noise(:,2))
    scatter(sheet_no+0*data_slow(:,2),timestep*data_slow(:,2),'mo','jitter','on','jitterAmount',0.15);
    
    plot(linspace(sheet_no-Lpad,sheet_no+Lpad,100),linspace(sheet_no-Lpad,sheet_no+Lpad,100)*0+nanmedian(data_slow(:,2)),'m-');
    
    
    ylabel('Track length (frames)');
    xlim([0,5]);
    xticks([0:5]);
    xticklabels(sheet_name_print);
    %legend({'Signal','noise'});
    
    pre_pad=1;
    
    %% plotting trackmate usual properties
    % close all
    f=figure(2);
    f.Position = [100 100 540 900];
    ylabel_list={'Area (\mum^2)','Aspect Ratio','Speed (\mum/min)','Linearity Forw Prog'};
    for i=1:4
        subplot(4,1,i);
        %figure;
        box on;
        hold on;
        % histogram(Mega_combine_1_signal(:,2))
        % histogram(Mega_combine_1_noise(:,2))
        scatter(sheet_no+0*data_slow(:,i+pre_pad),data_slow(:,i+pre_pad),'mo','jitter','on','jitterAmount',0.15);
        
        plot(linspace(sheet_no-Lpad,sheet_no+Lpad,100),linspace(sheet_no-Lpad,sheet_no+Lpad,100)*0+nanmedian(data_slow(:,i+pre_pad)),'m-');
        
        
        ylabel(ylabel_list(i));
        xlim([0,5]);
        xticks([0:5]);
        xticklabels(sheet_name_print);
        
        if i==3
            set(gca, 'YScale', 'log');
        end
        %legend({'Signal','noise'});
    end
    
    %% msd plots
    % close all
%     figure(3)
%     %     if sheet_no==1
%     %     axes('XScale', 'log', 'YScale', 'log')
%     %     end
%     hold on
%     for i=1:length(video_id_slow)
%         temp_msd=data_slow(i,14:end);
%         hi=plot(timestep*(1:length(temp_msd)),temp_msd','m.-');
%     end
%     
% 
%     set(gca, 'XScale', 'log', 'YScale', 'log');
%     
%     
%     ylabel('MSD (\mum^2)');
%     xlabel('\DeltaT (frames)');
%     box on
    %hold off
    %% plotting fitting results
    % figure
    % histogram(median_no_spots_in_frame_saved,40,'Normalization','probability');
    % xlabel('Exponent (\alpha)');
    % ylabel('Frequency');
    % %saveas(gcf,strcat(filename_save_extless,'_hist_exponents.svg'));
    %close all
    
    %fit_plot_labels
    f=figure(4);
    f.Position = [100 100 540 1000];
    ylabel_fit_list={'Alpha','Confin size(\mum)','Pre factor','Confi D (\mum^2/min)','RMC(\mum^2/min)','Direct v (\mum/min)','Direct D (\mum^2/min)'};
    for i=1:6
        subplot(7,1,i);
        box on;
        hold on;
        
        % histogram(Mega_combine_1_signal(:,2))
        % histogram(Mega_combine_1_noise(:,2))
        scatter(sheet_no+0*data_slow(:,i+4+pre_pad),data_slow(:,i+4+pre_pad),'mo','jitter','on','jitterAmount',0.15);
        
        plot(linspace(sheet_no-Lpad,sheet_no+Lpad,100),linspace(sheet_no-Lpad,sheet_no+Lpad,100)*0+nanmedian(data_slow(:,i+4+pre_pad)),'m-');
        
        
        if i==1
            ylim([0,10]);
        end
        
        if i==1|| i==3 || i==4 || i==5 || i==6
            set(gca, 'YScale', 'log');
        end
        
        ylabel(ylabel_fit_list(i));
        xlim([0,5]);
        xticks([0:5]);
        xticklabels(sheet_name_print);
        %legend({'Signal','noise'});
    end
end


%close all
%% secondary plotss
for sheet_no=1%1:4
    
    [data_slow]=table2array(readtable(filename_slow,'Sheet',sheet_name{sheet_no}));
    
    f=figure(5);
    f.Position = [100 100 1200 1200];
    
    %% plotting trackmate usual properties
    % close all
    ylabel_list_corr={'No of spots','Area (\mum^2)','Aspect Ratio','Speed (\mum/min)','Linearity Forw Prog','Alpha','Confin size(\mum)','Pre factor','Confi D (\mum^2/min)','RMC(\mum^2/min)','Direct v (\mum/min)','Direct D (\mum^2/min)'};
    for i=1:11
        subplot(3,4,i);
        %figure;
        box on;
        hold on;
        % histogram(Mega_combine_1_signal(:,2))
        % histogram(Mega_combine_1_noise(:,2))
        scatter(data_slow(:,4),data_slow(:,i),'mo');
        
        ylabel(ylabel_list_corr(i));
        %xlim([0,5]);
        %xticks([0:5]);
        %xticklabels(sheet_name_print);
        xlabel('Speed (\mum/min)');
        if 1
            set(gca, 'XScale', 'log','YScale', 'log');
        end
        %legend({'Signal','noise'});
    end
    
    
end

% 
% 
% %% Saving stuffs
% saveas(figure(1),strcat(filename_save_extless,sheet_name{sheet_no},'_track_mate_misc.svg'));
% saveas(figure(2),strcat(filename_save_extless,sheet_name{sheet_no},'_track_mate_usual.svg'));
% saveas(figure(3),strcat(filename_save_extless,sheet_name{sheet_no},'_msd.svg'));
% saveas(figure(4),strcat(filename_save_extless,sheet_name{sheet_no},'fitting_par.svg'));
% saveas(figure(5),strcat(filename_save_extless,sheet_name{sheet_no},'correln_w_speed.svg'));
% 
% %
% %transposing the data for graphpad prism
% transposed_data_combined=permute(saved_data_combined,[1,3,2]);
% transposed_data_slow=permute(saved_data_slow,[1,3,2]);
% 
% sheet_name_combined={'Video id','No spots','Area','Aspect Ratio','Speed ','Confinement Ratio','Alpha','Confinment size','Pre expo factor','Confined D','Random D ','Directed v','Directed D','Slow Fast settings'};
% 
% for i=1:size(transposed_data_combined,3)
%     writecell(num2cell(transposed_data_combined(:,:,i)),strcat(filename_save_extless,'_combined.xlsx'),'Sheet',sheet_name_combined{i});
%     writecell(num2cell(transposed_data_slow(:,:,i)),strcat(filename_save_extless,'_slow.xlsx'),'Sheet',sheet_name_combined{i});
%     
% end
% 
% 
% %% histogram of speed to determine
% % close all
% % load('H:\Aamir data\All_IM7\im7_collagen_speed_hist.mat');
% %
% % map = colormap(autumn(2));
% % figure
% % histogram(xx,100,'facecolor',map(1,:),'facealpha',.5,'edgecolor','none');
% % hold on
% %
% % histogram(yy,50,'facecolor',map(2,:),'facealpha',0.5,'edgecolor','none');
% % %histogram(yy,50,'facecolor',map(3,:),'facealpha',1,'edgecolor','none');
% %
% % box on
% % axis tight
% % set(gca,'xscale','log','yscale','log');
% % xlabel('Speed (\mum/min)');
% % ylabel('Frequency');
% % xlim([10^-1, 10^2]);
% % %ylim([0,1000]);
% % legend('IM7','Collagen');
% % legend boxoff
