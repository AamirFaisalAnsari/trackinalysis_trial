% calculate acf

function acf_store=calc_acf_afa_v2(XY_data_modified,data_col_1,data_col_2,data_col_3)
% close all
% clear all
% clc

%load('XYTable_modified_acf_test_v1.mat');
acf_data=XY_data_modified;

data1=acf_data.(data_col_1);
data2=acf_data.(data_col_2);
data3=acf_data.(data_col_3);

%acf_data = acf_data(~isnan(acf_data.dx_step), :);
%acf_data = acf_data(~isnan(acf_data.x), :);

%close all


% acf_data=readtable('E:\Nikos and Sarah hmm codes\acf_sample_data_afa.xlsx','Sheet','Main');  % Load the data into a table

%acf_sample_data_afa.xlsx
rep_unique=unique(XY_data_modified.rep);
movie_ID_unique=unique(XY_data_modified.MovieID);
track_ID_unique=unique(XY_data_modified.Track_ID);
% dx_acf =x_disp_series;
% dy_acf =y_disp_series;
% dz_acf=x_disp_series*0+1;
count=0;
acf_pub=[];
for rep=1:length(rep_unique)
    for movie_ID_index=1:length(movie_ID_unique)
        movie_ID=movie_ID_unique(movie_ID_index);
        for track_ID_index=1:length(track_ID_unique)
            track_ID=track_ID_unique(track_ID_index);
            %initialize dataframe for acf
            % columns_acf <- c("ID","acf","time")
            % acf_df <- data.frame(matrix(nrow = 0, ncol = length(columns_acf)))
            % colnames(acf_df) = columns_acf
            % t_acf <- linspace(from = 0, to = (max(acf_data$time)-1), by = 1)
            t_acf = linspace(1,max(acf_data.time), (max(acf_data.time)));

            % acf= zeros(length(t_acf),1);
            % temp =  zeros((length(t_acf)),1);

            dx_acf =data1(acf_data.ID==(1E7*movie_ID+track_ID) & acf_data.rep==rep_unique(rep));
            dy_acf =data2(acf_data.ID==(1E7*movie_ID+track_ID) & acf_data.rep==rep_unique(rep));
            dz_acf =data3(acf_data.ID==(1E7*movie_ID+track_ID) & acf_data.rep==rep_unique(rep));


            % dx_acf =acf_data.dx_step(find((acf_data.ID)==(1E7*movie_ID+track_ID)));
            % dy_acf =acf_data.dy_step(find((acf_data.ID)==(1E7*movie_ID+track_ID)));
            % dz_acf=acf_data.dz_step(find((acf_data.ID)==(1E7*movie_ID+track_ID)));

            dx_acf=dx_acf(1:end-1);
            dy_acf=dy_acf(1:end-1);
            dz_acf=dz_acf(1:end-1);

            acf= nan(1,max(acf_data.time));
            %temp =  zeros((length(dx_acf)),1);

            % dx_acf =acf_data.x(find((acf_data.ID)==(1E7*movie_ID+track_ID)));
            % dy_acf =acf_data.y(find((acf_data.ID)==(1E7*movie_ID+track_ID)));
            % dz_acf=acf_data.z(find((acf_data.ID)==(1E7*movie_ID+track_ID)));

            total_points=0;

            K= nansum(dx_acf.^2 + dy_acf.^2+dz_acf.^2);

            if (K == 0)
                K = nan;
            end
            temp=[];
            temp(1) = K;

            n_lags = max(acf_data.time);

            if n_lags>1
                total_points =n_lags;
                for j = 0:(n_lags-1)
                    % vx = dx_acf((j+2):length(dx_acf)) .* dx_acf(1:(length(dx_acf)-j-1));
                    % vy = dy_acf((j+2):length(dy_acf)) .* dy_acf(1:(length(dy_acf)-j-1));
                    % vz = dz_acf((j+2):length(dz_acf)) .* dz_acf(1:(length(dz_acf)-j-1));

                    vx = dx_acf((j+1):length(dx_acf)) .* dx_acf(1:(length(dx_acf)-j));
                    vy = dy_acf((j+1):length(dy_acf)) .* dy_acf(1:(length(dy_acf)-j));
                    vz = dz_acf((j+1):length(dz_acf)) .* dz_acf(1:(length(dz_acf)-j));

                    %s = sum(vx) + sum(vy) + sum(vz);
                    if sum(~isnan(vx))~=0
                        s = nansum(vx) + nansum(vy) + nansum(vz);
                    else
                        s=nan;
                    end
                    temp(j+1) = s;
                end
            end

            if (n_lags>1)
                %temp = (temp/K);
                % acf = length(dx_acf)*temp/K;
                acf = temp/K;
                %acf = acf + 1*temp;
            end
            count=count+1;

            if total_points>0
                acf_store(count,:)=acf;%/total_points;
            else
                acf_store(count,:)=acf;%/total_points;
            end

            %%%% method 2

            %plot(acf,'-b','LineWidth',0.5)
            %hold on
            % param_dim=2;
            % tlag=1;
            % xy=[acf_data.x(find((acf_data.ID)==(1E7*movie_ID+track_ID))),acf_data.y(find((acf_data.ID)==(1E7*movie_ID+track_ID)))];
            % %xy=xys{k};
            % M= max(acf_data.time)-1;
            % cef=nan(1,M); tll=nan(1,M);
            % xy=xy(1:tlag:end,:);
            % if sum(size(xy,1))~=0
            %     %dxy=xy(2:end,1:param_dim)-xy(1:end-1,1:param_dim) ;
            %     dxy=[acf_data.dx_step(find((acf_data.ID)==(1E7*movie_ID+track_ID))),acf_data.dy_step(find((acf_data.ID)==(1E7*movie_ID+track_ID)));];
            %     dxy=dxy(1:end-1,:);
            %
            %     for k=0:M-1
            %         if sum(sum((~isnan(dxy(1:(M-k),:).*dxy((1+k):M,:)))))~=0
            %         cef(1,k+1)=sum(nansum(dxy(1:(M-k),:).*dxy((1+k):M,:),1));%/(M-k);  % using inner dot (taking vector)
            %         tll(1,k+1)=k; % unit of time lag
            %         end
            %     end
            %
            % end
            % %acf_pub=[acf_pub, cef(:)] ;
            % acf_pub_store(count,:)=cef;
        end
    end
end
%acf = acf/total_points;
%
% figure;hold on;
%
% plot(nanmean(acf_store),'r','LineWidth',2);
% %errorbar(mean(acf_store),std(acf_store),'LineWidth',2);
% %shadedErrorBar(linspace(1,size(acf_store,2),size(acf_store,2)),acf_store,{@mean,@std}, 'lineprops', '-r','transparent',false,'patchSaturation',0.075);
% %shadedErrorBar(x, y, {@mean,@std}, 'lineprops', '-r','transparent',false,'patchSaturation',0.075)
%
% H(1) = shadedErrorBar(linspace(1,size(acf_store,2),size(acf_store,2)),acf_store, {@nanmean, @(x) 2*nanstd(x)  }, 'lineprops', '-r');
% H(2) = shadedErrorBar(linspace(1,size(acf_store,2),size(acf_store,2)),acf_store, {@nanmean, @(x) 1*nanstd(x)  }, 'lineprops', '-g');%, 0);
% H(3) = shadedErrorBar(linspace(1,size(acf_store,2),size(acf_store,2)),acf_store, {@nanmean, @(x) 0.5*nanstd(x)},  'lineprops','-b');%, 'LineWidth', 2}, 0);
%
% legend([H(3).mainLine, H.patch], ...
%     '\mu', '2\sigma', '\sigma', '0.5\sigma', ...
%     'Location', 'Northwest');
%
% yline(.20,'r--');
% yline(-.20,'r--');
%
% xlabel('Lag (min)');
% ylabel('ACF(Lag)');
% box on;
