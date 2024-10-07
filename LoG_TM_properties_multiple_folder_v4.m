%%%%to runthrough folders
close all
clc
clear all

home_address='E:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\';

folder_sample=[

%%Mouse T cells
{'Zen_21Jun23_Tcells_in_brain\'};...%%1
{'Zen_22Jun23_Tcells_in_brain\'};...%%2
{'Zen_22Jun23_Tcells_in_brain\'};...%%3
{'Zen_25Jun23_Tcells_in_brain\'};...%%4
{'Zen_25Jun23_Tcells_in_brain\'};...%%5

{'Zen_27Jun23_Tcells_in_brain\'};...%%6
{'Zen_27Jun23_Tcells_in_brain\'};...%%7
{'Zen_27Jun23_Tcells_in_brain\'};...%%8
{'Zen_27Jun23_Tcells_in_brain\'};...%%9

{'Zen_22Aug23_MTcells_in_the_brain_high_res\'};...%%10
{'Zen_22Aug23_MTcells_in_the_brain_high_res\'};...%%11

{'Zen_25Aug23_MTcells_in_brain_slices_embd_collagen\'};...%%12
{'Zen_25Aug23_MTcells_in_brain_slices_embd_collagen\'};...%%13

{'Zen_23Aug23_MTcells_in_the_brain_high_res_rep2\'};...%%14


%%IM7
{'Zen_28Jun23_Tcells_in_brain_20ug_ml_IM7\'};... %%15
{'Zen_30Jun23_Tcells_in_brain_100ug_ml_IM7\'};... %%16
{'Zen_21Sep23_Tcells_in_the_bran_IM7_20ugml_rep2\'};...%%17%%T cells prolly died
{'Zen_29Sep23_Tcells_in_brain_slices_full_IM7_block_120ul_in_brain_20x2_in_T\'};...%%18
{'Zen_01Oct23_Tcells_in_brain_CD44_block_120ul_brain_slices_20ul_in_T\'};...%%19


%%CalA
{'Zen_09Nov23_Tcells_in_brain_CalA_1nM_rep1\'};...%%20
{'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2\'};...%%21%%it has two sets of big data
{'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep3\'};...%%22%%this is empty


%%LatA
{'Zen_08Nov23_Tcells_in_brain_LatA_500nM_rep1\'};...%%23
{'Zen_08Nov23_Tcells_in_brain_LatA_500nM_rep2\'};...%%24
{'Zen_15Nov23_Tcells_in_brain_LatA_500nM_rep3\'};...%%25


%%Nocodazole
{'Zen_15Jul23_Tcells_in_brain_1000uM_Nocadazole\'};...%%26
{'Zen_12Jul23_Tcells_in_brain_10uM_Nocadazole\'};...%%27
{'Zen_30Sep23_Tcells_in_brain_10uM_Nocodazole\'};...%%28
{'Zen_11Oct23_Tcells_in_brain_10uM_Nocodazole_rep3\'};...%%29


%%Taxol
{'Zen_14Jul23_Tcells_in_brain_100nM_Taxol\'};...%%30
{'Zen_11Jul23_Tcells_in_brain_1000nM_Taxol\'};...%%31
{'Zen_11Jul23_Tcells_in_brain_1000nM_Taxol\'};...%%32
{'Zen_29Sep23_Tcells_in_brain_Taxol_100nM\'};...%%33
{'Zen_10Oct23_Tcells_in_brain_Taxol_100nM_Rep3\'};...%%34


%% Human T cells
{'Zen_29Jul23_RhoA_HTcells_in_brain\'};...%%35
{'Zen_29Jul23_RhoA_HTcells_in_brain\'};...%%36

{'Zen_24Jul23_HTcells_in_brain_no_incubation\'};...%%37
{'Zen_21Jul23_HTcells_in_brain_NoCO2\'};...%%38
{'Zen_20Jul23_HTcells_in_brain\'};...%%39
];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Sub folders


file_sample=[

%%Mouse T cells
{'Zen_21Jun23_Tcells_in_brain_2023_06_21__19_02_26_Z23_p'};...%%1%%frame=100maxp_number=4%%100%%4
{'Zen_22Jun23_Tcells_in_brain_2023_06_22__18_08_10_Z23_p'};...%%2%%frame=100maxp_number=4%%100%%4
{'Zen_22Jun23_Tcells_in_brain_rep3_2023_06_22__23_31_59_Z23_p'};...%%3%%frame=100maxp_number=4%%100%%4
{'Zen_25Jun23_Tcells_in_brain_2023_06_25__19_01_09_Z23_p'};...%%4%%frame=55maxp_number=14%%100(55)%%14
{'Zen_25Jun23_Tcells_in_brain_2023_06_25__21_01_08_Z23_p'};...%%5%%frame=100maxp_number=14%%100%%14

{'Zen_27Jun23_Tcells_in_brain_35ul_50uM_Cal_2023_06_28__00_14_13_Z23_p'};...%%6%%1%%frame=80maxp_number=14%%80%%14
{'Zen_27Jun23_Tcells_in_brain_2023_06_27__20_43_29_Z23_p'};...%%7%%frame=50maxp_number=13%%50%%13
{'Zen_27Jun23_Tcells_in_brain_2023_06_27__22_17_36_Z23_p'};...%%8%%frame=30maxp_number=15%%50(30)%%15
{'Zen_27Jun23_Tcells_in_brain_2023_06_27__22_51_21_Z23_p'};...%%9%%frame=50maxp_number=15%%50%%15

{'Zen_22Aug23_MTcells_in_the_brain_high_res_2023_08_22__19_06_19_Z23_p'};...%%10%%frame=60maxp_number=17%%60%%17
{'Zen_22Aug23_MTcells_in_the_brain_high_res_a_day_aftr_2023_08_23__19_02_42_Z23_p'};...%%11%%frame=100maxp_number=16%%100%%16

{'Zen_25Aug23_MTcells_in_brain_slices_embd_collagen_2023_08_25__20_34_46_Z23_p'};...%%12%%frame=100maxp_number=19%%100%%19
{'Zen_25Aug23_MTcells_in_brain_slices_embd_collagen_2023_08_26__01_28_30_Z23_p'};...%%13%%frame=400maxp_number=16%%400%%16

{'Zen_23Aug23_MTcells_in_the_brain_high_res_3hr_2023_08_23__22_40_50_Z23_p'};...%%14%%frame=73maxp_number=18%%73%%18


%%IM7
{'Zen_28Jun23_Tcells_in_brain_20ugml_IM7apriori_2023_06_28__04_04_23_Z23_p'};...%%15%%frame=150
{'Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49_Z23_p'};...%%16%%frame=100
{'Zen_21Sep23_Tcells_in_the_bran_IM7_20ugml_rep2_2023_09_21__21_46_45_Z23_p'};...%%17%%frame=73maxp_number=14%%t cells proll died
{'en_29Sep23_Tcells_in_brain_slices_full_IM7_block_120ug_in_brain_20x2_in_T_3hr_2023_09_29__02_48_37_Z23_p'};...%%18%%frame=2000maxp_number=22
{'Zen_01Oct23_Tcells_in_brain_CD44_block_120ul_brain_slices_20ul_in_T_2023_10_01__05_53_53_Z23_p'};...%%19%%frame=10000maxp_number=10000


%% CalA
{'Zen_09Nov23_Tcells_in_brain_CalA_1nM_rep1_2023_11_09__20_07_06_Z23_p'};...%%20%%
{'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37_Z23_p'};...%%21%%
{'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__15_10_26_Z23_p'};...%%22%%


%% LatA
{'Zen_08Nov23_Tcells_in_brain_LatA_500nM_rep1_2023_11_08__01_56_23_Z23_p'};...%%23%%
{'Zen_08Nov23_Tcells_in_brain_LatA_500nM_rep2_2023_11_08__12_53_43_Z23_p'};...%%24%%
{'Zen_15Nov23_Tcells_in_brain_LatA_500nM_rep3_2023_11_15__01_47_09_Z23_p'};...%%25%%


%% Nocodazole
{'Zen_15Jul23_Tcells_in_brain_1000uM_Nocadazole_2023_07_14__23_27_53_Z23_p'};...%%26%%frame=100
{'Zen_12Jul23_Tcells_in_brain_10uM_Nocadazole_2023_07_13__00_56_57_Z23_p'};...%%27%%frame=100
{'Zen_30Sep23_Tcells_in_brain_10uM_Nocodazole_2023_10_01__02_20_18_Z23_p'};...%%28%%
{'Zen_11Oct23_Tcells_in_brain_10uM_Nocodazole_rep3_2023_10_11__23_10_58_Z23_p'};...%%29%%


%% Taxol
{'Zen_14Jul23_Tcells_in_brain_100nM_Taxol_2023_07_14__01_08_06_Z23_p'};...%%30%%frame=100
{'Zen_11Jul23_Tcells_in_brain_1000nM_Taxol_2023_07_12__02_31_38_Z23_p'};...%%31%%frame=100%%3-100
{'Zen_11Jul23_Tcells_in_brain_control_2023_07_12__01_10_08_Z23_p'};...%%32%%frame=50
{'en_29Sep23_Tcells_in_brain_Taxol_100nM_2023_09_30__06_00_08_Z23_p'};...%%33 %%1%%frames only, nothing after that
{'Zen_10Oct23_Tcells_in_brain_Taxol_100nM_Rep3_2023_10_10__23_44_47_Z23_p'};... %%34 %%1%%frames only, nothing after that


%% human T cells
{'Zen_29Jul23_RhoA_HTcells_in_brain_2023_07_29__01_18_16_Z23_p'};...%%35%%frame=231maxp_number=22%%231%%22
{'Zen_29Jul23_RhoA_HTcells_in_brain_18hr_later_2023_07_29__20_34_26_Z23_p'};...%%36%%frame=9maxp_number=22%%9%%22

{'Zen_24Jul23_HTcells_in_brain_no_incubation_2023_07_25__00_24_15_Z23_p'};...%%37%%frame=169maxp_number=16%%169%%16
{'Zen_21Jul23_HTcells_in_brain_NoCO2_2023_07_21__21_57_50_Z23_p'};...%%38%%frame=150maxp_number=19%%150%%19
{'Zen_20Jul23_HTcells_in_brain_2023_07_20__17_21_30_Z23_p'};...%%39%%frame=200maxp_number=19%%200%%19
];

n_movie_in_each_file=[
    4
    ,4
    ,4
    ,14
    ,14
    ,14
    ,13
    ,15
    ,15
    ,17
    ,16
    ,19
    ,16
    ,18
    ,20
    ,20
    ,14
    ,22
    ,21
    ,22
    ,19
    ,19
    ,20
    ,20
    ,22
    ,22
    ,23
    ,20
    ,22
    ,21
    ,20
    ,20
    ,19
    ,25
    ,22
    ,22
    ,16
    ,19
    ,19
    ];

n_folder=size(folder_sample,1);

%%Find frame interval
frame_interval_store=nan(n_folder,1);
for k=1:n_folder
    if 1%k~=22
        if n_movie_in_each_file(k)<10
            file_address_first_movie=([home_address,folder_sample{k,1},file_sample{k,1},'1_MD.csv']);
        else
            file_address_first_movie=([home_address,folder_sample{k,1},file_sample{k,1},'01_MD.csv']);
        end

        %frame_interval=getFrameInterval(strrep(strrep(filename_call, 'Model_v2', 'MD'),'xml','csv'));
        frame_interval=getFrameInterval(file_address_first_movie);
        frame_interval_store(k,1)=frame_interval;
    end
end
%%

%
%
% %%%%find the number of csv files in a folder that has 'MD' in the filename
% %folderPath1 = 'C:\Users\matav\Documents\MATLAB\example';
% for k=1:n_folder
%     cd([home_address,folder_sample{k,1}]);
%     csvFiles = dir('*.csv') ;
%     no_MD_file=0;
%     for i=1:length(csvFiles)
%         if ~isempty(strfind(csvFiles(i).name,'_MD')) %%&& (csvFiles(i).bytes)>=11000 && (csvFiles(i).bytes)<=13000
%             no_MD_file=no_MD_file+1;
%         end
%     end
%     n_file(k,1)=no_MD_file;
%     if k==10
%         n_file(k,1)=n_file(k,1)/2;
%     end
% end
% n_file(17,1)=4;
% n_file(18,1)=4;
% n_file(19,1)=14;
% n_file(20,1)=13;
% n_file(21,1)=13;
% n_file(22,1)=13;
%
% %%%high res rep 1 and 2 22 ad 23Aug
% n_file(23,1)=17;
% n_file(24,1)=18; %%%%skpi first file....error last spot
%
% n_file(25,1)=17;
% n_file(26,1)=17;

%%%%%%27 memory issue
%% Rest


%%%fileno=13 for folder=10 or 16Nov CalA rep2 ##Check it too many tracks
%%%willgive problem
% %%%and fileno6 for the other one Sept 30 Nocodazole 10uM
%%%%skipping 10,13 fpor the moment...
% Error using vertcat
% Dimensions of arrays being concatenated are not consistent.
%
% Error in LoG_TM_properties_multiple_v11 (line 132)
%         combining_all_MSD_joined=[combining_all_MSD_joined;bb];
%
for k=21%33:n_folder
    temp_address=[];
    FilePath=[home_address,folder_sample{k,1}];

    for i=1:n_movie_in_each_file(k)
        if i<10
            fileno_i=strcat('0',num2str(i));
        else
            fileno_i=num2str(i);
        end

        if n_movie_in_each_file(k)<10
            fileno_i=num2str(i);
        end

        temp_file_name=([file_sample{k,1},fileno_i,'_Model_v2.xml']);
        if isfile([FilePath,temp_file_name])
            temp_address=[temp_address,cellstr(temp_file_name)];
        end
    end

    FileName_list=temp_address;
    LoG_TM_properties_multiple_v16(FilePath,FileName_list,n_movie_in_each_file(k));
    %close all
end

