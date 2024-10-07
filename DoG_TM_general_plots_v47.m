close all;
clc;
clear all;

set(0,'defaultfigurecolor',[1 1 1])

export_on=0;
% common_folder='H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Combined files for final plotting\';
% common_folder2='H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Combined files for final plotting\';
% common_folder3='H:\Aamir experiment data\Comm_plot\';

%simulation_version_tag=['Jan27' && 'Jan28']

common_folder='F:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Combined files for final plotting\';
common_folder2='F:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Combined files for final plotting\';
common_folder3='F:\Aamir experiment data\Comm_plot\';

%common_folder='H:\Aamir experiment data\Comm_plot\';

% filename1= [common_folder,'25Jun2023_mTcells_in_the_brain_2hr_v1 - Sample Copy1.xlsx'];
% filename2= [common_folder,'25Jun2023_mTcells_in_the_brain_2hr_v1 - Sample Copy2.xlsx'];
% filename3= [common_folder,'25Jun2023_mTcells_in_the_brain_2hr_v1 - Sample Copy3.xlsx'];

% filename1= [common_folder,'25Jun2023_mTcells_in_the_brain_2hr_v1_copy1.xlsx'];
% filename2= [common_folder,'25Jun2023_mTcells_in_the_brain_2hr_v1_2hr.xlsx'];
%

% filename1= [common_folder,'Zen_25Jun23_Tcells_in_brain_2023_06_25__19_01_09__p258_Model_all.xlsx'];
% filename2= [common_folder,'Zen_25Jun23_Tcells_in_brain_2023_06_25__19_01_09__p258_Model_all.xlsx'];

%%%Zen_21Jun23_Tcells_in_brain_2023_06_21__19_02_26__p4_Model_all
%%%Zen_22Jun23_Tcells_in_brain_2023_06_22__18_08_10__p1_Model_all
%%%Zen_25Jun23_Tcells_in_brain_2023_06_25__21_01_08__p01_Model_all

%%%Zen_27Jun23_Tcells_in_brain_2023_06_27__20_43_29__p13_Model_all %%%t=0
%%%Zen_27Jun23_Tcells_in_brain_2023_06_27__22_17_36__p15_Model_all  %%%t=1
%%%hr 34 mins
%%%Zen_27Jun23_Tcells_in_brain_2023_06_27__22_51_21__p15_Model_all %%%%t=2
%%%hr 8 mins

%%%Zen_22Aug23_MTcells_in_the_brain_high_res_2023_08_22__19_06_19__p17_Model_all
%%%Zen_22Aug23_MTcells_in_the_brain_high_res_a_day_aftr_2023_08_23__19_02_42__p16_Model_all
%%%a aday after

%%%Zen_23Aug23_MTcells_in_the_brain_high_res_3hr_2023_08_23__22_40_50__p02_Model_all

%%%Zen_25Aug23_MTcells_in_brain_slices_embd_collagen_2023_08_25__20_34_46__p19_Model_all_fixed
%%%Zen_25Aug23_MTcells_in_brain_slices_embd_collagen_2023_08_26__01_28_30__p16_100_Model_all
%%%%a day after

% filename1= [common_folder,'Zen_21Jun23_Tcells_in_brain_2023_06_21__19_02_26__p4_Model_all.xlsx'];
% filename2= [common_folder,'Zen_22Jun23_Tcells_in_brain_2023_06_22__18_08_10__p1_Model_all.xlsx'];
% filename3= [common_folder,'Zen_25Jun23_Tcells_in_brain_2023_06_25__21_01_08__p01_Model_all.xlsx'];
% filename4= [common_folder,'Zen_27Jun23_Tcells_in_brain_2023_06_27__20_43_29__p13_Model_all.xlsx'];
% filename5= [common_folder,'Zen_22Aug23_MTcells_in_the_brain_high_res_2023_08_22__19_06_19__p17_Model_all.xlsx'];
% filename6= [common_folder,'Zen_23Aug23_MTcells_in_the_brain_high_res_3hr_2023_08_23__22_40_50__p02_Model_all.xlsx'];
% filename7= [common_folder,'Zen_25Aug23_MTcells_in_brain_slices_embd_collagen_2023_08_25__20_34_46__p19_Model_all_fixed.xlsx'];

filename_ctrl_1= [common_folder,'Zen_21Jun23_Tcells_in_brain_2023_06_21__19_02_26__p4_Model_all.xlsx'];
filename_ctrl_2= [common_folder,'Zen_22Jun23_Tcells_in_brain_2023_06_22__18_08_10__p1_Model_all.xlsx'];
filename_ctrl_3= [common_folder,'Zen_25Jun23_Tcells_in_brain_2023_06_25__21_01_08__p01_Model_all.xlsx'];
filename_ctrl_4= [common_folder,'Zen_27Jun23_Tcells_in_brain_2023_06_27__20_43_29__p13_Model_all.xlsx'];
filename_ctrl_5= [common_folder,'Zen_22Aug23_MTcells_in_the_brain_high_res_2023_08_22__19_06_19__p17_Model_all.xlsx'];
filename_ctrl_6= [common_folder,'Zen_23Aug23_MTcells_in_the_brain_high_res_3hr_2023_08_23__22_40_50__p02_Model_all.xlsx'];


filename_taxol_1= [common_folder,'Zen_11Jul23_Tcells_in_brain_1000nM_Taxol_2023_07_12__02_31_38__p20_Model_all.xlsx'];
filename_taxol_2= [common_folder,'Zen_14Jul23_Tcells_in_brain_100nM_Taxol_2023_07_14__01_08_06__p02_Model_all.xlsx'];
filename_taxol_3= [common_folder3,'en_29Sep23_Tcells_in_brain_Taxol_100nM_2023_09_30__06_00_08__p01_Model_all.xlsx'];
filename_taxol_4= [common_folder3,'Zen_10Oct23_Tcells_in_brain_Taxol_100nM_Rep3_2023_10_10__23_44_47__p01_Model_all.xlsx'];


filename_Noca_1= [common_folder,'Zen_12Jul23_Tcells_in_brain_10uM_Nocadazole_2023_07_13__00_56_57__p01_Model_all.xlsx'];
filename_Noca_2= [common_folder,'Zen_15Jul23_Tcells_in_brain_1000uM_Nocadazole_2023_07_14__23_27_53__p22_Model_all.xlsx'];
filename_Noca_3= [common_folder3,'Zen_30Sep23_Tcells_in_brain_10uM_Nocodazole_2023_10_01__02_20_18__p01_Model_all.xlsx'];
filename_Noca_4= [common_folder3,'Zen_11Oct23_Tcells_in_brain_10uM_Nocodazole_rep3_2023_10_11__23_10_58__p01_Model_all.xlsx'];


filename_IM7_1= [common_folder,'Zen_28Jun23_Tcells_in_brain_20ugml_IM7apriori_2023_06_28__04_04_23__p20_Model_all.xlsx'];
filename_IM7_2= [common_folder,'Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49__p20_Model_all.xlsx'];
filename_IM7_3= [common_folder3,'en_29Sep23_Tcells_in_brain_slices_full_IM7_block_120ug_in_brain_20x2_in_T_3hr_2023_09_29__02_48_37__p01_Model_all.xlsx'];
filename_IM7_4= [common_folder3,'Zen_01Oct23_Tcells_in_brain_CD44_block_120ul_brain_slices_20ul_in_T_2023_10_01__05_53_53__p01_Model_all.xlsx'];

filename_LatA_1= [common_folder3,'Zen_08Nov23_Tcells_in_brain_LatA_500nM_rep1_2023_11_08__01_56_23__p01_Model_all.xlsx'];
filename_LatA_2= [common_folder3,'Zen_15Nov23_Tcells_in_brain_LatA_500nM_rep3_2023_11_15__01_47_09__p01_Model_all.xlsx'];

filename_CalA_1= [common_folder3,'Zen_09Nov23_Tcells_in_brain_CalA_1nM_rep1_2023_11_09__20_07_06__p01_Model_all.xlsx'];
filename_CalA_2= [common_folder3,'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37__p01_Model_all.xlsx'];
filename_CalA_3= [common_folder3,'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__15_10_26_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];


new_filename_ctrl_1= [common_folder3,'Zen_21Jun23_Tcells_in_brain_2023_06_21__19_02_26_Z23_p1_Model_v2_29-Apr-2024_all.xlsx'];
new_filename_ctrl_2= [common_folder3,'Zen_22Jun23_Tcells_in_brain_2023_06_22__18_08_10_Z23_p1_Model_v2_29-Apr-2024_all.xlsx'];
new_filename_ctrl_3= [common_folder3,'Zen_25Jun23_Tcells_in_brain_2023_06_25__19_01_09_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];
new_filename_ctrl_4= [common_folder3,'Zen_27Jun23_Tcells_in_brain_2023_06_27__20_43_29_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];
new_filename_ctrl_5= [common_folder3,'Zen_22Aug23_MTcells_in_the_brain_high_res_2023_08_22__19_06_19_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];
new_filename_ctrl_6= [common_folder3,'Zen_23Aug23_MTcells_in_the_brain_high_res_3hr_2023_08_23__22_40_50_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];


new_filename_ctrl_1_human= [common_folder3,'Zen_20Jul23_HTcells_in_brain_2023_07_20__17_21_30_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];
new_filename_ctrl_2_human= [common_folder3,'Zen_21Jul23_HTcells_in_brain_NoCO2_2023_07_21__21_57_50_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];
new_filename_ctrl_collagen_embd= [common_folder3,'Zen_25Aug23_MTcells_in_brain_slices_embd_collagen_2023_08_25__20_34_46_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];
new_filename_ctrl_1_eng_human= [common_folder3,'Zen_29Jul23_RhoA_HTcells_in_brain_2023_07_29__01_18_16_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];




new_filename_taxol_1= [common_folder3,'Zen_11Jul23_Tcells_in_brain_1000nM_Taxol_2023_07_12__02_31_38_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];
new_filename_taxol_2= [common_folder3,'Zen_14Jul23_Tcells_in_brain_100nM_Taxol_2023_07_14__01_08_06_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];
new_filename_taxol_3= [common_folder3,'en_29Sep23_Tcells_in_brain_Taxol_100nM_2023_09_30__06_00_08_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];
new_filename_taxol_4= [common_folder3,'Zen_10Oct23_Tcells_in_brain_Taxol_100nM_Rep3_2023_10_10__23_44_47_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];

%%%%Zen_11Jul23_Tcells_in_brain_1000nM_Taxol_2023_07_12__02_31_38__p01_Model_27-Jan-2024_all
new_filename_Noca_1= [common_folder3,'Zen_12Jul23_Tcells_in_brain_10uM_Nocadazole_2023_07_13__00_56_57_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];
new_filename_Noca_2= [common_folder3,'Zen_15Jul23_Tcells_in_brain_1000uM_Nocadazole_2023_07_14__23_27_53_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];
new_filename_Noca_3= [common_folder3,'Zen_30Sep23_Tcells_in_brain_10uM_Nocodazole_2023_10_01__02_20_18_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];
new_filename_Noca_4= [common_folder3,'Zen_11Oct23_Tcells_in_brain_10uM_Nocodazole_rep3_2023_10_11__23_10_58_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];


new_filename_IM7_1= [common_folder3,'Zen_28Jun23_Tcells_in_brain_20ugml_IM7apriori_2023_06_28__04_04_23_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];
new_filename_IM7_2= [common_folder3,'Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];
new_filename_IM7_3= [common_folder3,'en_29Sep23_Tcells_in_brain_slices_full_IM7_block_120ug_in_brain_20x2_in_T_3hr_2023_09_29__02_48_37_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];
new_filename_IM7_4= [common_folder3,'Zen_01Oct23_Tcells_in_brain_CD44_block_120ul_brain_slices_20ul_in_T_2023_10_01__05_53_53_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];

new_filename_LatA_1= [common_folder3,'Zen_08Nov23_Tcells_in_brain_LatA_500nM_rep1_2023_11_08__01_56_23_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];
new_filename_LatA_2= [common_folder3,'Zen_15Nov23_Tcells_in_brain_LatA_500nM_rep3_2023_11_15__01_47_09_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];

new_filename_CalA_1= [common_folder3,'Zen_09Nov23_Tcells_in_brain_CalA_1nM_rep1_2023_11_09__20_07_06_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];
%new_filename_CalA_2= [common_folder3,'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];
new_filename_CalA_2= [common_folder3,'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];
new_filename_CalA_3= [common_folder3,'Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__15_10_26_Z23_p01_Model_v2_29-Apr-2024_all.xlsx'];


%%%% CART from COH
new_filename_CART_COH_ctrl_1= [common_folder3,'Zen_17May24_CART_COH_in_the_brain_rep1_2024_05_18__03_31_48_Z23_p01_Model_v2_22-Jul-2024_all.xlsx'];





% new_filename_individual=[common_folder3,'Zen_25Jun23_Tcells_in_brain_2023_06_25__19_01_09__p01_Model_28-Jan-2024_all.xlsx'];
% new_filename_individual=[common_folder3,'Zen_25Jun23_Tcells_in_brain_2023_06_25__19_01_09__p01_Model_01-Feb-2024_all.xlsx'];
%
% new_filename_individual=[common_folder3,'Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49__p13_Model_13-Mar-2024_all.xlsx'];
% new_filename_individual_treat=[common_folder3,'Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49__p20_Model_25-Mar-2024_all.xlsx'];

%new_filename_individual=[common_folder3,'Zen_25Jun23_Tcells_in_brain_2023_06_25__19_01_09__p01_Model_01-Apr-2024_all.xlsx'];
new_filename_individual=[common_folder3,'Zen_17May24_CART_COH_in_the_brain_rep1_2024_05_18__03_31_48_Z23_p01_Model_v2_22-Jul-2024_all.xlsx'];
new_filename_individual_treat=[common_folder3,'Zen_17May24_CART_COH_in_the_brain_rep1_2024_05_18__03_31_48_Z23_p01_Model_v2_22-Jul-2024_all.xlsx'];

save_figures_as_a_pdf='myplots1_Apr18_2024.pdf';
%delete(save_figures_as_a_pdf);%delete or else the matlab would crrash




%%
group_ctrl=[{new_filename_ctrl_1};{new_filename_ctrl_2};{new_filename_ctrl_3};
    {new_filename_ctrl_4};{new_filename_ctrl_5};{new_filename_ctrl_6}];

group_ctrl_human=[{new_filename_ctrl_1_human};{new_filename_ctrl_2_human}];
group_ctrl_eng_human=[{new_filename_ctrl_1_eng_human}];
group_ctrl_collagen_embd=[{new_filename_ctrl_collagen_embd}];



group_taxol=[{new_filename_taxol_1};{new_filename_taxol_2};{new_filename_taxol_3};
    {new_filename_taxol_4}];
group_noca=[{new_filename_Noca_1};{new_filename_Noca_2};{new_filename_Noca_3};
    {new_filename_Noca_4}];
group_IM7=[{new_filename_IM7_1};{new_filename_IM7_2};{new_filename_IM7_3};
    {new_filename_IM7_4}];
group_LatA=[{new_filename_LatA_1};{new_filename_LatA_2}];
group_CalA=[{new_filename_CalA_1};{new_filename_CalA_2};{new_filename_CalA_3}];


%%%% CART from COH
group_cart_coh_ctrl=[{new_filename_CART_COH_ctrl_1};{new_filename_CART_COH_ctrl_1}];


individual_file=0;
if individual_file
    group_ctrl=[{new_filename_individual}];
    group_treatment=[{new_filename_individual_treat}];
end

all_filenames=[group_ctrl;group_taxol;group_noca;group_IM7;group_LatA;group_CalA;...
    group_ctrl_human;group_ctrl_eng_human;group_ctrl_collagen_embd;...
    group_cart_coh_ctrl];

if individual_file
    all_filenames=[group_ctrl;group_treatment];
end


% all_filenames={{filename_ctrl_1};{filename_ctrl_2};{filename_ctrl_3};
%     {filename_ctrl_4};{filename_ctrl_5};{filename_ctrl_6};
%     {filename2};{filename3};{filename4};{filename5};{filename6};{filename7}};

%file_x_axis_label={'Control','Treatment 1','Treament 2'};
%file_x_axis_label={'Rep 1','Rep 2','Rep 3','Rep 4','Rep 5','Rep 6','Rep 7','Combined'};
%file_x_axis_label={'Control','IM7 20 g/ml','IM7 100 g/ml','Nocodazole 10 M','Nocodazole 1000 M','Taxol 100 nM','Taxol 1000 nM'};
%file_x_axis_label={'Control','IM7 20 g/ml','IM7 100 g/ml','IM7 Full block g/ml Rep 2'};
condition_colormap=lines(5);

if individual_file
    condition_names_k={'Control','Treatment'};%same as size of numbe of files

    condition_names_g={'Control','Treatment'};%same as size of numbe of files
    file_x_axis_label={'Control','Treatment'};
    nGroup=size(condition_names_g,2);

    rep_vector=[1,1];
else
    % condition_names_k={'Mouse_T_cells_rep1','Mouse_T_cells_rep2','Mouse_T_cells_rep3','Mouse_T_cells_rep4','Mouse_T_cells_rep5','Mouse_T_cells_rep6',...
    %                     'Taxol_rep1','Taxol_rep2','Taxol_rep3','Taxol_rep4',...
    %                     'Nocodazole_rep1','Nocodazole_rep2','Nocodazole_rep3','Nocodazole_rep4',...
    %                     'IM7_rep1','IM7_rep2','IM7_rep3','IM7_rep4',...
    %                     'LatA_rep1','LatA_rep2',...
    %                     'CalA_rep1','CalA_rep2',...
    %                     'Human_T_cells_rep1','Human_T_cells_rep2',...
    %                     'En_Human_T_cells_rep1',...
    %                     'Col_Embd_MT_cells_rep1'};

    condition_names_k={'Mouse_T_cells','Mouse_T_cells','Mouse_T_cells','Mouse_T_cells','Mouse_T_cells','Mouse_T_cells',...
        'Taxol','Taxol','Taxol','Taxol',...
        'Nocodazole','Nocodazole','Nocodazole','Nocodazole',...
        'IM7','IM7','IM7','IM7',...
        'LatA','LatA',...
        'CalA','CalA','CalA',...
        'Human_T_cells','Human_T_cells',...
        'En_Human_T_cells',...
        'Col_Embd_MT_cells',...
        'CART_COH_Ctrl'};

    condition_names_g={'Mouse_T_cells','Taxol','Nocodazole','IM7','LatA','CalA','Human_T_cells', 'En_Human_T_cells','Col_Embd_MT_cells','CART_COH_Ctrl'};

    file_x_axis_label={'Mouse CD8+ T cells','Taxol','Nocodazole','IM7','LatA','CalA','Human CD8+ T cells', 'Engd H CD8+ T cells','Col Embd MT cells','CART COH CTRL'};
    nGroup=size(condition_names_g,2);

    %rep_vector=[1,2,3,4,5,6,1,2,3,4,1,2,3,4,1,2,3,4,1,2,1,2];
    rep_vector=[1,2,3,4,5,6,1,2,3,4,1,2,3,4,1,2,3,4,1,2,1,2,3,...
        1,2,1,1,...
        1];
end

look_at_single=18;

k_list=1:length(all_filenames);
g_list=1:nGroup;

% Load your Excel file (replace 'your_file.xlsx' with your actual file path)
filteredData_combined=[];
load('May17_24_mod_track_XY.mat')

for i_k=1:27%length(all_filenames)
    %Track_prop_k{1,k_list(i_k)} = readtable(string(all_filenames{k_list(i_k),1}),'Sheet','Track properties');  % Load the data into a table
    Track_prop=Track_prop_k{1,k_list(i_k)};


    %%%%some final manipulations and additions
    %%%%normalize z position
    %Track_prop.ZPositionForPosition_1=-1+2*((str2double(Track_prop.ZPositionForPosition_1))-min(str2double(Track_prop.ZPositionForPosition_1)))/(max(str2double(Track_prop.ZPositionForPosition_1))-min(str2double(Track_prop.ZPositionForPosition_1)));
    %Track_prop.ZPositionForPosition_1=1*((str2double(Track_prop.ZPositionForPosition_1))-min(str2double(Track_prop.ZPositionForPosition_1)))/(max(str2double(Track_prop.ZPositionForPosition_1))-min(str2double(Track_prop.ZPositionForPosition_1)));
    
    %%%use this when load
    %dataTable.norTrackDensity=1*(((dataTable.tot_no_track))-min((dataTable.tot_no_track)))/(max((dataTable.tot_no_track))-min((dataTable.tot_no_track)));
    Track_prop.norTrackDensity=1*(((Track_prop.track_density))-min((Track_prop.track_density)))/(max((Track_prop.track_density))-min((Track_prop.track_density)));

    Track_prop.norSpotDensity=1*(((Track_prop.cell_density))-min((Track_prop.cell_density)))/(max((Track_prop.cell_density))-min((Track_prop.cell_density)));
    %%%%add repeatitions
    %dataTable.rep=rep_vector(k);
    Track_prop.condition=repmat(condition_names_k(1,k_list(i_k)),size(Track_prop,1),1);
    Track_prop.rep=zeros(size(Track_prop,1),1)+rep_vector(k_list(i_k));



    Track_prop_k{1,k_list(i_k)}=Track_prop;
end

%%apply filters
for i_k=1:27%length(all_filenames)

    Track_prop=Track_prop_k{1,k_list(i_k)};

    if sum(ismember(Track_prop.Properties.VariableNames,'TimeStamp_001'))%i_k~=4 && i_k ~=5
        Track_prop= removevars(Track_prop,{'TimeStamp_001'});
    end

    if sum(ismember(Track_prop.Properties.VariableNames,'featureAttribute_2')) %~ismember(i_k,[17,18,23,24,25,26]) %%%%k~=17 && k ~=18 %%% %%%%have an extra filter on
        Track_prop= removevars(Track_prop,{'featureAttribute_2'});
        Track_prop= removevars(Track_prop,{'valueAttribute_2'});
        Track_prop= removevars(Track_prop,{'isaboveAttribute_2'});
    end

    % Define filtering criteria functions and corresponding column names
    criteriaAndColumns = {
        %'RMC', @(x) (x >= 0 && x < inf),
        %'med_speed', @(x) (x >= 0 && x < inf),
        %'linearity', @(x) (x >= 0 && x <= inf),

        %'alpha', @(x) (x >= 0 && x <= inf),%1.8
        %'R2_alpha', @(x) (x >= 0),%1.8

        %'cell_density',@(x) (x >= 0 && x <= inf) ,
        %'norSpotDensity',@(x) (x >= 0 && x <= inf) ,%0.8

        %'track_density',@(x) (x >= 0 && x <= inf) ,
        %'norTrackDensity',@(x) (x >= 0.5 && x <= 1) ,%0.8

        'no_of_spot', @(x) (x >= 10 && x <= inf),%20
        %'ZPositionForPosition_1',@(x) (x >= 0.25 && x <= 1),%-0.5

        'In_or_out',@(x) ((x)==1),%-0.5

        'track_mean_qual',@(x) ((x)>=10),%-0.5

        %'condition',@(x) (~(strcmp(x, 'Mouse_T_cells'))),%-0.5

        %'rep',@(x) (~(sum(ismember(x,[4,5,6])))),%-0.5

        'mean_red_intensity_new',@(x) (~(x>=10 && x<=18)),%-0.5 x>=25
        %%%% min to mode=tissue blocking, mode to mode+6=mostly media+some tissue
        %%%% blocking
        %%%% blocking
        };

    % Initialize a logical filter with all 'true' values
    filter_criteria = true(size(Track_prop, 1), 1);

    % Apply combined criteria to the specified columns
    for i = 1:1:length(criteriaAndColumns)
        columnName = criteriaAndColumns{i,1};
        criteriaFunction = criteriaAndColumns{i,2};

        columnCriteria = arrayfun(criteriaFunction, Track_prop.(columnName));
        filter_criteria = filter_criteria & columnCriteria;%%%&&  ||wont work
    end

    % Extract the filtered rows
    Track_prop_filtered_k{1,k_list(i_k)} = Track_prop(filter_criteria, :);
    Track_prop.Filter1=filter_criteria;
    Track_prop_Filter1_k{1,k_list(i_k)}=filter_criteria;
    Track_prop_condition_k{1,k_list(i_k)}=Track_prop.condition;
    Track_prop_rep_k{1,k_list(i_k)}=Track_prop.rep;

    Track_prop_k{1,k_list(i_k)}=Track_prop;

end

%%%%% print the ActualFrameInterval_s_
clear expt_parameters
for i_k=1:27%length(all_filenames)
    Track_prop=Track_prop_k{1,k_list(i_k)};
    expt_parameters(i_k,1)=Track_prop.Location(1);
    expt_parameters(i_k,2)=num2cell(Track_prop.ActualFrameInterval_s_(1));
end



%%combining and making groups
%un_filteredData_k=[ind_filteredData_k{1}];%;ind_filteredData_k{2}];
%un_filteredData_k=[ind_filteredData_k{1},ind_filteredData_k{2}];

%filteredData_k={un_filteredData_k,un_filteredData_k};%,un_filteredData_k};
start=0;

combined_Track_prop_k{1,1}=[];
for i_k=1:27%length(k_list)
    if 1%~sum(ismember(i_k,[5,6]))
        combined_Track_prop_k{1,1}=[combined_Track_prop_k{1,1};Track_prop_k{1,k_list(i_k)}];
    end
end

if individual_file
    group_Track_prop_k{1,1}=Track_prop_k{1,1};
    group_Track_prop_k{1,2}=Track_prop_k{1,2};
else
    group_Track_prop_k{1,1}=[Track_prop_k{1,start+1};Track_prop_k{1,start+2};Track_prop_k{1,start+3};
        Track_prop_k{1,start+4};Track_prop_k{1,start+5};Track_prop_k{1,start+6}];%,un_filteredData_k};



    group_Track_prop_k{1,2}=[];
    group_Track_prop_k{1,3}=[];
    group_Track_prop_k{1,4}=[];
    group_Track_prop_k{1,5}=[];
    group_Track_prop_k{1,6}=[];

    group_Track_prop_k{1,7}=[];
    group_Track_prop_k{1,8}=[];
    group_Track_prop_k{1,9}=[];
    group_Track_prop_k{1,10}=[];


    running_spacer=6;

    for i=1:4 %taxol
        group_Track_prop_k{1,2}=[group_Track_prop_k{1,2};Track_prop_k{i+running_spacer}];%
    end
    running_spacer=running_spacer+4;

    for i=1:4 %noca
        if i~=2
            group_Track_prop_k{1,3}=[group_Track_prop_k{1,3};Track_prop_k{i+running_spacer}];%
        end
    end

    running_spacer=running_spacer+4;

    for i=1:4 %im7  %%%%should be 1:4 but no of clolumn is different
        group_Track_prop_k{1,4}=[group_Track_prop_k{1,4};Track_prop_k{i+running_spacer}];%
    end
    running_spacer=running_spacer+4;

    for i=1:2 %LatA
        group_Track_prop_k{1,5}=[group_Track_prop_k{1,5};Track_prop_k{i+running_spacer}];%
    end
    running_spacer=running_spacer+2;

    for i=1:3 %CalA
        group_Track_prop_k{1,6}=[group_Track_prop_k{1,6};Track_prop_k{i+running_spacer}];%
    end

    running_spacer=running_spacer+3;


    for i=1:2 %Human T cells
        group_Track_prop_k{1,7}=[group_Track_prop_k{1,7};Track_prop_k{i+running_spacer}];%
    end
    running_spacer=running_spacer+2;


    for i=1:1 %Engineered Human T cells
        group_Track_prop_k{1,8}=[group_Track_prop_k{1,8};Track_prop_k{i+running_spacer}];%
    end
    running_spacer=running_spacer+1;


    for i=1:1 %Collagen embedded mouse T cells
        group_Track_prop_k{1,9}=[group_Track_prop_k{1,9};Track_prop_k{i+running_spacer}];%
    end
    running_spacer=running_spacer+1;


    % for i=1:1 %CART COH
    %     group_Track_prop_k{1,10}=[group_Track_prop_k{1,10};Track_prop_k{i+running_spacer}];%
    % end
    % running_spacer=running_spacer+1;


end



% un_filteredData_k=[ind_filteredData_k{1};ind_filteredData_k{2}];
% filteredData_k={un_filteredData_k,un_filteredData_k};


%%plot usual properties
% Define the master column (e.g., 'master_column')
%masterColumn = 'speed';  % Replace with your actual master column name
masterColumn = 'Filter1';  % Replace with your actual master column name

%weightColumn = 'track_t_length';  % Replace with your actual master column name
weightColumn = 'no_of_spot';  % Replace with your actual master column name

% Define custom colors for the legend
colors = [
    0.2 0.8 0.2;  % Green
    0 0 0;        % Black
    1 0 0;        % Red
    1 0 1;        % Magenta (for NaN values)
    ];

% Define legend labels
legendLabels = {
    '< 0.95',
    '0.95 - 1.05',
    '> 1.05',
    'NaN'
    };
% header_name={'video_id','track_t_length','area','aspectRatio','speed','confinement','alpha','sat_MSD','tau_c','conf_D','RMC','directed_v','directed_D'};
% plot_these_data=header_name;

%%% plot 1
close all
header_name={'mean_speed','linearity','alpha','RMC','track_disp','mean_dirn_change','mean_red_intensity_new'};
plot_these_data=header_name;
plot_these_data_lables={'Mean Speed (um/min)','Linearity','\alpha','RMC (um2/min)','Track Disp (um)','Dir Change (rad/min)','<Red Intensity>'};


subplot_row=ceil(sqrt(length( ...
    plot_these_data)));
subplot_column=ceil((length(plot_these_data))/subplot_row);

fig_1=figure(1);%,'Renderer', 'painters', 'Position', [300 50 800 600])
fig_1.Position=[50 50 1600 900];
% t=tiledlayout(2,8);
% t.TileSpacing = 'tight';
for i = 1:length(plot_these_data)
    columnName = plot_these_data{i};
    subplot(subplot_row, subplot_column, i);

    yData_combined=[];
    count_k=0;
    for i_g=1:length(g_list) %%%should be from 1

        if 1%ismember(k,[1,7,8])==1
            count_k=count_k+1;
            %group_Track_prop=group_Track_prop_k{1,k};
            combined_Track_prop=combined_Track_prop_k{1,1};
            combined_Track_prop_condition=combined_Track_prop.condition;
            group_Track_prop=combined_Track_prop(strcmp(combined_Track_prop_condition,(condition_names_g{1,g_list(i_g)})),:);
            %group_Track_prop(group_Track_prop.Filter1==0,:)=[];

            xData = 1+0*group_Track_prop.(columnName);%filteredData.(columnName);
            yData = group_Track_prop.(columnName);
            yData_combined{1,count_k}=1*yData;
            master_column_data{1,count_k}=double(group_Track_prop.(masterColumn));%master column or alpha values
            weight_column_data{1,count_k}=group_Track_prop.(weightColumn);%weight column usually no of spots in a a trcak
            file_x_axis_label_k{1,count_k}=file_x_axis_label{1,g_list(i_g)};
        end
    end


    %yData_combined={yData_combined};
    % Color code points based on master column values
    %scatter(xData, yData, 30, 'filled');
    %colormap(colors);

    %visualizeDataWithOptions({yData,2*yData,3*yData});
    visualizeDataWithOptions(yData_combined,master_column_data,weight_column_data,'\alpha');
    ax = gca;
    ax.YLabel.String = plot_these_data_lables{i};
    ax.XTick=linspace(1,length(yData_combined),length(yData_combined));
    ax.XTickLabels= file_x_axis_label_k;
    ax.XTickLabelRotation = 45;
    ax.XLabel.FontSize = 4;
    if strcmp(columnName,'RMC')==1
        ax.YScale = 'log';
        ax.YTick=[0.0001,0.1,1,10,100,1000];
        %ax.YLim=[0,1];
    end

end

%exportgraphics(fig_1,['All_comparison','_30Jul24.pdf'],'ContentType','image');


if export_on
    exportgraphics(fig_1,save_figures_as_a_pdf,'ContentType','image');
end
%%plot metadata vs speed RMC

% hold off
%close all
%figure

% Define the master column (e.g., 'master_column')
%masterColumn = 'RMC';  % Replace with your actual master column name
masterColumn = 'Filter1';  % Replace with your actual master column name
%masterColumn_header='RMC (um2/min)';
masterColumn_header=' Filtered In (1)';
%^masterColumn_header='Speed (um/min)';

% Define custom colors for the legend
colors = [
    0.2 0.8 0.2;  % Green
    0 0 0;        % Black
    1 0 0;        % Red
    1 0 1;        % Magenta (for NaN values)
    ];

% Define legend labels
legendLabels = {
    '< 0.95',
    '0.95 - 1.05',
    '> 1.05',
    'NaN'
    };
% header_name={'video_id','track_t_length','area','aspectRatio','speed','confinement','alpha','sat_MSD','tau_c','conf_D','RMC','directed_v','directed_D'};
% plot_these_data=header_name;

%%%plot 1
% header_name={'speed','confinement','alpha','RMC'};
% plot_these_data=header_name;
% plot_these_data_lables={'Speed (m/min)','Linearity','\alpha','RMC (m/min)'};


%%plot meta data
header_name={'med_speed','mean_speed','ActualFrameInterval_s_','ZPositionForPosition_1','cell_density','norSpotDensity','track_density','norTrackDensity','no_of_spot','RMC','linearity','track_mean_qual','mean_dirn_change','track_disp','In_or_out','mean_red_intensity_new','rep','movie_id'};
plot_these_data=header_name;
plot_these_data_lables={'Median Speed (um/min)','Mean Speed (um/min)','Frame Interval (s)','Relative Z','Cell Density','Norm Cell Density','Track Density','Norm Track Density','Track Length (in frames)','RMC (um2/min)','Linearity','Track Mean Quality','Dir Change (rad/min)','Track Disp(um)','Border Closeness','<Red Intensity>','Repeatitions','Position'};

correlation_plot_col_name_list={'alpha'};
correlation_plot_col_name_list_label={'\alpha'};

subplot_row=4;%ceil(sqrt(length(plot_these_data)));
subplot_column=ceil((length(plot_these_data))/subplot_row);

% Create subplots

for i_g=1:length(g_list)
    fig_2=figure(2);%,'Renderer', 'painters', 'Position', [300 50 800 600])
    fig_2.Position=[50 50 1800 900];

    yData_combined=[];

    % group_Track_prop=group_Track_prop_k{1,k};
    combined_Track_prop=combined_Track_prop_k{1,1};
    combined_Track_prop_condition=combined_Track_prop.condition;
    group_Track_prop=combined_Track_prop(strcmp(combined_Track_prop_condition,(condition_names_g{1,g_list(i_g)})),:);

    %group_Track_prop(group_Track_prop.Filter1==0,:)=[];


    for i =1:length(plot_these_data)

        columnName = plot_these_data{i};
        correlation_plot_col_name=correlation_plot_col_name_list{1};
        subplot(subplot_row, subplot_column, i);

        % Get data for the current subplot
        xData = group_Track_prop.(correlation_plot_col_name);%filteredData.(columnName);
        yData = group_Track_prop.(columnName);
        yData_combined{1,g_list(i_g)}=yData;%str2double
        master_column_data{1,g_list(i_g)}=group_Track_prop.(masterColumn);%master column or alpha values
        correl_common_title=file_x_axis_label{1,g_list(i_g)};



        %yData_combined={yData_combined};
        % Color code points based on master column values
        if 0%i==2 %%%zposition
            scatter(xData, str2double(yData), 12,(group_Track_prop.(masterColumn)), 'filled');
        else
            scatter(xData, yData, 12,(group_Track_prop.(masterColumn)), 'filled');
        end
        % Show the colorbar with a title
        cbar = colorbar;
        cbar.Title.String = masterColumn_header;  % Set the colorbar title
        %set(gca,'ColorScale','log')
        %set( cbar, 'YTick', [0.0001,0.1,1,10,100,1000] )

        %colormap(colors);

        %visualizeDataWithOptions({yData,2*yData,3*yData});
        %visualizeDataWithOptions(yData_combined,master_column_data);
        ax = gca;
        ax.YLabel.String = plot_these_data_lables{i};
        ax.XLabel.String = correlation_plot_col_name_list_label{1};
        %ax.XScale = 'log';
        %ax.Title.String='Hello';
        if strcmp(columnName,'RMC')==1
            ax.YScale = 'log';
            ax.YTick=[0.0001,0.1,1,10,100,1000];
        end
        %     ax.XTick=[1,2,3];
        %     ax.XTickLabels= file_x_axis_label;
        %     ax.XTickLabelRotation = 0;
        %    ax.XLabel.FontSize = 8;

        box on;
    end
    sgtitle(correl_common_title);
    %print(fig_2, '-png', [condition_names_g{1,g_list(i_g)},'_30Jul24.png']);
    %print(fig_2,[condition_names_g{1,g_list(i_g)},'_30Jul24.png'],'-dpng','-r300'); 
    %exportgraphics(fig_2,[condition_names_g{1,g_list(i_g)},'_30Jul24.pdf'],'ContentType','image');
    %%%%%saving it later is slow
end



if export_on
    exportgraphics(fig_2,save_figures_as_a_pdf,'Append',true,'ContentType','image');
end

%%Adding step, displacement, etc in XY data

% for k=1:length(all_filenames)
%
% end

%close all
fig_3=figure(3);%,'Renderer', 'painters', 'Position', [300 50 800 600])
fig_3.Position=[100,100,1800,800];

yData_combined=[];
count_k=0;
current_alpha=[];
subplot_row=5;%ceil(sqrt(length(plot_these_data)));
subplot_column=ceil((length(k_list))/subplot_row);

tiledlayout(subplot_row,subplot_column);
%XY_data_modified_k=[];

for i_k=1:27%length(k_list)%:length(all_filenames)
    count_k=count_k+1;

    XY_data = readtable(string(all_filenames{k_list(i_k),1}),'Sheet','Time series data');  % Load the data into a table
    %XY_data=XY_data_modified_k{1,k_list(i_k)};
    XY_data_modified=XY_data;


    xPosition=XY_data.('XPositionForPosition_1');
    x_series = XY_data.('x')+0*xPosition;

    yPosition = XY_data.('YPositionForPosition_1');
    y_series = XY_data.('y')+0*yPosition;

    zPosition= XY_data.('ZPositionForPosition_1');
    z_series = -1+2*(zPosition-min(zPosition))/(max(zPosition)-min(zPosition));

    time_series=nan+0*x_series;

    ds_series=nan+0*x_series;
    dtheta_series=nan+0*x_series;
    disp_series=nan+0*x_series;
    x_disp_series=nan+0*x_series;
    y_disp_series=nan+0*x_series;
    dx_step_series=nan+0*x_series;
    dy_step_series=nan+0*x_series;


    mean_angle_series=0;%XYTable.('MeanTrackAngle');

    %filtered_yes_or_no_series=XYTable.('Filtered_binary');

    x_width=XY_data.('SizeX').*XY_data.('VoxelSizeX');
    y_width=XY_data.('SizeY').*XY_data.('VoxelSizeY');
    z_width=(XY_data.('SizeZ')-1).*XY_data.('VoxelSizeZ');
    t_width=nnz(XY_data.('Track_ID')==1 & XY_data.('MovieID')==1);%%%%prone to error
    
    alpha_series=(XY_data.('Alpha'));
    
    red_intensity_series=(XY_data.('Red_Intensity'));

    % n=1000;
    % cmap_parula = parula(n);
    % cmap_lines = lines(5);
    %
    % color_indices = round(linspace(1, n, length(filtered_alpha_list)));%length(alpha_quality_re)));
    % custom_colormap = cmap_parula(color_indices, :);
    % custom_colormap_rearranged = custom_colormap(a_order,:);
    % colormap_start=1;
    % colormap_end=2;

    %scatter3(xPosition, yPosition, zPosition, 'r', 'filled');

    %     for ppp=1:length(xPosition)
    %         boxWidth = x_width(ppp);  % Specify the width of the transparent box
    %         boxHeight = z_width(ppp); % Specify the height of the transparent box
    %         P = [xPosition(ppp), yPosition(ppp), zPosition(ppp)] ;   % you center point
    %         L = [boxWidth,boxWidth,boxHeight] ;  % your cube dimensions
    %         O = P-L/2 ;       % Get the origin of cube so that P is at center
    %         plotcube(L,O,.2,'m');
    %         %axis equal;
    %     end


    current_alpha=[];
    avg_red_intensity=[];
    counter=1;
    for track=1:length(x_series)/t_width

        current_track_block=(track-1)*t_width+1:track*t_width;

        %current_alpha(all_track_exp)=unique(alpha_quality(curren_track_block));
        current_alpha(track)=(alpha_series(current_track_block(1)));
        avg_red_intensity(track)=nanmean(red_intensity_series(current_track_block));

        if 1%isnan(current_alpha(all_track_exp))==0
            %%%%unique(filtered_yes_or_no_series(curren_track_block))

            % if current_alpha(all_track_in_an_exp)<1
            %     color=cmap_lines(colormap_start,:);
            % elseif current_alpha(all_track_in_an_exp)>=1
            %     color=cmap_lines(colormap_end,:);
            % else
            %     color='k';
            % end
            %
            % color_plotted(counter,:)=custom_colormap_rearranged(counter,:);
            % color=color_plotted(counter,:);
            % current_alpha_plotted(counter)=current_alpha(all_track_in_an_exp);
            % track_current_alpha=[track_current_alpha;current_alpha(all_track_in_an_exp)];
            % subplot(1,3,1);
            % hold on;
            % %plot3(x_series((ppp-1)*t_width+1:ppp*t_width,1),y_series((ppp-1)*t_width+1:ppp*t_width,1),z_series((ppp-1)*t_width+1:ppp*t_width,1), 'LineWidth', 1.5,'color',[1 1 1]);
            % scatter3(x_series((ppp-1)*t_width+1:ppp*t_width,1),y_series((ppp-1)*t_width+1:ppp*t_width,1),z_series((ppp-1)*t_width+1:ppp*t_width,1),8,alpha_quality((ppp-1)*t_width+1:ppp*t_width,1),'filled' );%'LineWidth', 1.5,'color',color);
            % view(45,25);

            %figure(52)
            % subplot(1,length(k_list),count_k);
            nexttile(count_k)
            hold on;
            %plotTimeSeries(x_series((ppp-1)*t_width+1:ppp*t_width,1), y_series((ppp-1)*t_width+1:ppp*t_width,1),alpha_quality((ppp-1)*t_width+1:ppp*t_width,1),mean_angle_series((ppp-1)*t_width+1:ppp*t_width,1))
            %plotTimeSeries(x_series(current_track_block,1), y_series(current_track_block,1),alpha_series(current_track_block,1))
            %title(file_x_axis_label{1,k_list(i_k)});
            title(condition_names_k{1,k_list(i_k)});

            %figure(62)
            [ds_series_out,dtheta_series_out,disp_series_out,x_disp_series_out,y_disp_series_out,dx_step_series_out,dy_step_series_out]=hmm_model_afa_v1(x_series(current_track_block,1),y_series(current_track_block,1));

            ds_series(current_track_block,1)=ds_series_out;
            dtheta_series(current_track_block,1)=dtheta_series_out;
            disp_series(current_track_block,1)=disp_series_out;
            x_disp_series(current_track_block,1)=x_disp_series_out;
            y_disp_series(current_track_block,1)=y_disp_series_out;
            dx_step_series(current_track_block,1)=dx_step_series_out;
            dy_step_series(current_track_block,1)=dy_step_series_out;
            time_series(current_track_block,1)=(1:t_width)';
        end


    end

    box on;
    xlabel('X (\mum)');
    ylabel('Y (\mum)');
    zlabel('Z (\mum)');

    XY_data_modified.time=time_series;
    XY_data_modified.step=ds_series;
    XY_data_modified.angle=dtheta_series;
    XY_data_modified.tot_disp=disp_series;
    XY_data_modified.x_disp=x_disp_series;
    XY_data_modified.y_disp=y_disp_series;
    XY_data_modified.dx_step=dx_step_series;
    XY_data_modified.dy_step=dy_step_series;


    XY_data_modified.ID=XY_data_modified.MovieID*1E7+XY_data_modified.Track_ID;

    XY_data_modified.z=XY_data_modified.x*0;
    XY_data_modified.dz_step=XY_data_modified.dx_step*0;

    Track_prop_Filter1=Track_prop_Filter1_k{1,k_list(i_k)};
    Track_prop_condition=Track_prop_condition_k{1,k_list(i_k)};
    Track_prop_rep=Track_prop_rep_k{1,k_list(i_k)};

    XY_data_Filter1=nan(height(XY_data_modified),1);
    XY_data_condition={};
    XY_data_rep=[];

    for track=1:length(Track_prop_Filter1)
        XY_data_Filter1((track-1)*t_width+1:(track*t_width),1)=repmat(Track_prop_Filter1(track),t_width,1);
        XY_data_condition((track-1)*t_width+1:(track*t_width),1)=repmat(Track_prop_condition(track),t_width,1);
        XY_data_rep((track-1)*t_width+1:(track*t_width),1)=repmat(Track_prop_rep(track),t_width,1);
    end

    XY_data_modified.Filter1=XY_data_Filter1;
    XY_data_modified.condition=XY_data_condition;
    XY_data_modified.rep=XY_data_rep;

    XY_data_modified_k{1,k_list(i_k)}=XY_data_modified;

    %%%%% Track properties based on xy data
    Track_prop=Track_prop_k{1,k_list(i_k)};
    Track_prop.mean_red_intensity=avg_red_intensity';
    Track_prop_k{1,k_list(i_k)}=Track_prop;

    %%%%
    size_x=unique(XY_data.('SizeX'));
    size_y=unique(XY_data.('SizeY'));
    voxel_size_x=unique(XY_data.('VoxelSizeX'));
    voxel_size_y=unique(XY_data.('VoxelSizeY'));
    cell_diameter=15;%in um, pixel would be less

    current_filename=all_filenames{k_list(i_k)};
    if k_list(i_k)<=2
        filename_pre_red=current_filename(36:(end-31));
    else
        filename_pre_red=current_filename(36:(end-32));
    end
    mean_red_inten=[];
    %mean_red_inten=colocalization_as_neighbor_radius_v3(filename_pre_red,XY_data_modified,size_x,size_y,voxel_size_x,voxel_size_y,cell_diameter);
    
    %Track_prop=Track_prop_k{1,k_list(i_k)};
    %Track_prop.mean_red_intensity_new=mean_red_inten';
    %Track_prop_k{1,k_list(i_k)}=Track_prop;


end
%filename_save_full_2
%writecell(All_XY_wheader,filename_save_full_2,'Sheet','Time series data modified');


% cmap = [cmap_lines(colormap_start,:) ; cmap_lines(colormap_end,:)] ;
% colormap(cmap);
% cbar=colorbar;
% %caxis([0, 2]);
% cbar.Title.String={'\alpha'};
% cbar.Layout.Tile = 'east';


sgtitle('Trajectories');
%saveas(figure(1),strcat(common_folder,'_trajectories_3D_demo.svg'));
%saveas(figure(1),strcat('','_trajectories_3D_MSD_demo.svg'));

if export_on
    exportgraphics(fig_3,save_figures_as_a_pdf,'Append',true,'ContentType','image');
end

% n=12;
% cmap_parula = lines(n);
% color_indices = round(linspace(1, n, length(alpha_quality)));
% custom_colormap = cmap_parula(color_indices, :);
% %alpha_quality=sort(alpha_quality);
% colormap_start=1;
% colormap_end=2;


% subplot(1,1,1);
% %figure(1)
% hold on;
% plotTimeSeries(x, y,alpha_quality)
% box on;
% %axis equal;
%close all
%% 

for i_k=1:length(k_list)%:length(all_filenames)

    XY_data_modified=XY_data_modified_k{1,k_list(i_k)};
    t_width=nnz(XY_data_modified.('Track_ID')==1 & XY_data_modified.('MovieID')==1);%%%%prone to error

    Track_prop_Filter1=Track_prop_Filter1_k{1,k_list(i_k)};
    XY_data_Filter1=nan(height(XY_data_modified),1);

    for track=1:length(Track_prop_Filter1)
        XY_data_Filter1((track-1)*t_width+1:(track*t_width),1)=repmat(Track_prop_Filter1(track),t_width,1);
    end

    XY_data_modified.Filter1=[];
    XY_data_modified.Filter1=XY_data_Filter1;
    XY_data_modified_k{1,k_list(i_k)}=XY_data_modified;

end


sel_folder_id=11;
sel_folder_filename=all_filenames{sel_folder_id,1};
sel_folder_filename=sel_folder_filename(36:end-32);%prone to error 31 and 32

XY_data_sel=XY_data_modified_k{1,k_list(sel_folder_id)};
%plot_original_tracks_v3(XY_data_sel,sel_folder_filename,[],[])

%% Group XY Data
combined_XY_data_k{1,1}=[];
for i_g=1:length(g_list)%length(all_filenames)
    combined_XY_data_k{1,1}=[combined_XY_data_k{1,1};XY_data_modified_k{1,g_list(i_g)}];
end

if individual_file
    group_XYData_k{1,1}=XY_data_modified_k{1,1};
    group_XYData_k{1,2}=XY_data_modified_k{1,2};
else

end

%% Step length and turning angle distribution
%%%%% diso and other related info also

close all
%figure
yData_combined=[];
count_k=0;
combined_Track_prop=combined_Track_prop_k{1,1};
combined_Track_prop_condition=combined_Track_prop.condition;

combined_XY_data=combined_XY_data_k{1,1};
combined_XY_data_condition=combined_XY_data.condition;

for i_g=1%:length(g_list)%:length(all_filenames)
    group_Track_prop=combined_Track_prop(strcmp(combined_Track_prop_condition,(condition_names_g{1,g_list(i_g)})),:);
    group_XY_data=combined_XY_data(strcmp(combined_XY_data_condition,(condition_names_g{1,g_list(i_g)})),:);

    Track_prop=group_Track_prop;%Track_prop_k{1,k_list(i_k)};
    XY_data_modified=group_XY_data;%XY_data_modified_k{1,k_list(i_k)};

    Track_prop(Track_prop.('Filter1')==0,:)=[];
    XY_data_modified(XY_data_modified.('Filter1')==0,:)=[];

    xPosition=XY_data_modified.('XPositionForPosition_1');
    x_series = XY_data_modified.('x')+0*xPosition;

    yPosition = XY_data_modified.('YPositionForPosition_1');
    y_series = XY_data_modified.('y')+0*yPosition;


    alpha_series=(XY_data_modified.('Alpha'));
    t_width=nnz(XY_data_modified.('Track_ID')==1 & XY_data_modified.('MovieID')==1 & XY_data_modified.('rep')==1);%%%%prone to error
    track_id_series=(XY_data_modified.('Track_ID'));
    movie_id_series=(XY_data_modified.('MovieID'));
    rep_index=XY_data_modified.rep;

    ds_series=XY_data_modified.step/(Track_prop.ActualFrameInterval_s_(1)/60);
    dtheta_series=XY_data_modified.angle;

    dtheta_final_series=XY_data_modified.TrackAngle;

    disp_series=XY_data_modified.tot_disp;
    x_disp_series=XY_data_modified.x_disp;
    y_disp_series=XY_data_modified.y_disp;

    dx_step_series=XY_data_modified.dx_step;
    dy_step_series=XY_data_modified.dy_step;


    filter_variable_hist=(XY_data_modified.('RMC'));

    %ds_series(~(XYTable.('Speed')>0))=nan;
    %dtheta_series(~(XYTable.('Speed')>0))=nan;

    ds_series1=ds_series;
    ds_series2=ds_series;
    ds_series3=ds_series;
    ds_series4=ds_series;
    ds_series5=ds_series;

    dtheta_series1=dtheta_series;
    dtheta_series2=dtheta_series;
    dtheta_series3=dtheta_series;
    dtheta_series4=dtheta_series;
    dtheta_series5=dtheta_series;



    filter_hist_list_1=~(filter_variable_hist>0 & filter_variable_hist<1);
    filter_hist_list_2=~(filter_variable_hist>10 & filter_variable_hist<100);
    filter_hist_list_3=~(filter_variable_hist>100 & filter_variable_hist<inf);
    filter_hist_list_4=~(filter_variable_hist>0 & filter_variable_hist<0.1);
    filter_hist_list_5=~(filter_variable_hist>1 & filter_variable_hist<inf);

    ds_series1(filter_hist_list_1)=nan;
    ds_series2(filter_hist_list_2)=nan;
    ds_series3(filter_hist_list_3)=nan;
    ds_series4(filter_hist_list_4)=nan;
    ds_series5(filter_hist_list_5)=nan;

    dtheta_series1(filter_hist_list_1)=nan;
    dtheta_series2(filter_hist_list_2)=nan;
    dtheta_series3(filter_hist_list_3)=nan;
    dtheta_series4(filter_hist_list_4)=nan;
    dtheta_series5(filter_hist_list_5)=nan;



    %(alpha_quality_series>5)
    % ds_series(ds_series<=str2double((filt_data_ind.VoxelSizeX{1})))=nan;
    % dtheta_series(ds_series<=str2double((filt_data_ind.VoxelSizeX{1})))=nan;

    fig_4=figure(4);
    hold on;
    %plot(x,y,'r-o')

    subplot(2,2,1)
    hold on;


    n_bin=75;
    histogram((ds_series),n_bin,'Normalization','pdf','FaceAlpha',1,'EdgeAlpha',0,'FaceColor','k');
    % histogram((ds_series2),n_bin,'Normalization','count','FaceAlpha',0.5,'EdgeAlpha',0);
    % histogram((ds_series3),n_bin,'Normalization','count','FaceAlpha',0.5,'EdgeAlpha',0);

    % histogram((ds_series3),50);
    % histogram((ds_series4),50);
    % histogram((ds_series5),50);

    %normrnd vs lognrnd

    % r = gamrnd(a,b)

    %histogram(lognrnd(log(nanmean(ds_series)),log(nanstd(ds_series)),[1,nnz(~isnan(ds_series))]),30,'FaceAlpha',0.1,'EdgeAlpha',0);
    %histogram(normrnd((nanmean(ds_series)),(nanstd(ds_series)),[1,nnz(~isnan(ds_series))]),30,'FaceAlpha',0.1,'EdgeAlpha',0);
    mean_gamma_1=1.312;%nanmean(ds_series);
    sd_gamma_1=8.433357e-8;%nanstd(ds_series);
    gamma_a=(mean_gamma_1)/(sd_gamma_1);
    gamma_b=(mean_gamma_1)/(sd_gamma_1)^2;
    %histogram(gamrnd(gamma_a,gamma_b,[1,nnz(~isnan(ds_series))]),30,'FaceAlpha',0.1,'EdgeAlpha',0);
    plot(linspace(0.00001,5,100),gampdf(linspace(0.00001,5,100),gamma_a,gamma_b),'g-');


    mean_gamma_2=4.94;%nanmean(ds_series);
    sd_gamma_2=3.89069;%nanstd(ds_series);
    gamma_a=(mean_gamma_2)/(sd_gamma_2);
    gamma_b=(mean_gamma_2)/(sd_gamma_2)^2;
    %histogram(gamrnd(gamma_a,gamma_b,[1,floor(0.01*nnz(~isnan(ds_series)))]),30,'FaceAlpha',0.1,'EdgeAlpha',0);
    plot(linspace(0.00001,5,100),gampdf(linspace(0.00001,5,100),gamma_a,gamma_b),'r-');


    legend('Data','State 1','State 2');

    ylabel('PDF');
    xlabel('Step length (um)');
    box on
    %ylim([0,5000]);
    %set(gca,'XScale','log')
    %set(gca,'YScale','log')
    %xlim([0,5]);

    subplot(2,2,3)
    hold on;


    nbin_theta=20;
    dtheta_series1_mod=dtheta_series;
    %dtheta_series1_mod(dtheta_series1<=0 | isnan(dtheta_series1))=[];
    histogram((dtheta_series1_mod),nbin_theta,'Normalization','count','FaceAlpha',1,'EdgeAlpha',0,'FaceColor','k');
    % histogram(abs(dtheta_series2),nbin_theta,'Normalization','count','FaceAlpha',0.5,'EdgeAlpha',0);
    % histogram(abs(dtheta_series3),nbin_theta,'Normalization','count','FaceAlpha',0.5,'EdgeAlpha',0);

    kappa_vm=0.5;%concentration of mean
    no_valid_dtheta_points=floor(1*nnz(~isnan(dtheta_series1_mod) & dtheta_series1_mod>0));
    no_valid_dtheta_points=length(dtheta_series1_mod);
    histogram(vmrand(3.136,1.698086,[1,no_valid_dtheta_points]),30,'FaceAlpha',0.5,'EdgeAlpha',0,'FaceColor','g');
    histogram(vmrand(-3.1049,0.2409242,[1,floor(0.1*no_valid_dtheta_points)]),30,'FaceAlpha',0.5,'EdgeAlpha',0,'FaceColor','r');

    legend('Data','State 1','State 2');

    ylabel('Count');
    xlabel('Turning Angle (Rad)');
    box on
    %set(gca,'YScale','log')



    subplot(2,2,2)
    [ycdf,xcdf] = cdfcalc(ds_series);
    xccdf = xcdf;
    yccdf = 1-ycdf(1:end-1);
    %plot(xcdf,yccdf,'-k','LineWidth',2);

    yccdf(xcdf<=0)=[];
    xcdf(xcdf<=0)=[];

    % Get coefficients of a line fit through the data.
    coefficients = polyfit(log(xcdf),log(yccdf), 1);
    % Create a new x axis with exactly 1000 points (or whatever you want).
    xFit = log(xccdf);%linspace(min(xcdf), max(xcdf), 1000);
    % Get the estimated yFit value for each of those 1000 new x locations.
    yFit = polyval(coefficients , xFit);
    % Plot everything.
    plot(xcdf, yccdf, 'b.', 'LineWidth', 2); % Plot training data.
    hold on; % Set hold on so the next plot does not blow away the one we just drew.
    plot(exp(xFit), exp(yFit), 'r-', 'LineWidth', 1); % Plot fitted line.

    txt_slope=sprintf('Slope=%.2f',(-1*coefficients(1)));
    legend(txt_slope);

    ax = gca;
    ax.YScale = 'log';
    ax.XScale = 'log';
    xlabel('s (\mum)');
    ylabel('P(step length\geqs)');
    box on;

    subplot(2,2,4)
    box on;
    nbin_theta=20;

    %dtheta_final_series(dtheta_final_series<=0 | isnan(dtheta_final_series))=[];
    polarhistogram((pi/180)*(dtheta_final_series),nbin_theta,'Normalization','count','FaceAlpha',1,'EdgeAlpha',0,'FaceColor','k');

    % ylabel('Count');
    % xlabel('Final Angle (Rad)');
    title('Final Track Angle (Rad)');
    box on


    %plot displacement
    %%close all
    fig_5=figure(5);
    fig_5.Position=[50 150 1200 550];

    subplot(2,6,[1,2])

    rep_set=unique(XY_data_modified.('rep'));
    hold on
    t_width_rep=zeros(length(rep_set),1);
    t_width_rep=zeros(length(rep_set),1);
    
    for rep_k=1:length(rep_set)
        x_series_rep=x_series(rep_index==rep_k);
        y_series_rep=y_series(rep_index==rep_k);
        alpha_series_rep=alpha_series(rep_index==rep_k);
        track_ID_rep=track_id_series(rep_index==rep_k);
        movie_ID_rep=movie_id_series(rep_index==rep_k);

        track_set=unique(track_ID_rep);
        movie_set=unique(movie_ID_rep);

        t_width_rep(rep_k,1)=nnz(XY_data_modified.('Track_ID')==track_set(1) & XY_data_modified.('MovieID')==movie_set(1) & XY_data_modified.('rep')==rep_k);
        if t_width_rep(rep_k,1) ~=0
            for track=1:length(x_series_rep)/t_width_rep(rep_k,1)
                current_track_block=(track-1)*t_width_rep(rep_k,1)+1:track*t_width_rep(rep_k,1);
                plotTimeSeries(x_series_rep(current_track_block,1), y_series_rep(current_track_block,1),alpha_series_rep(current_track_block,1))
            end
        end
    end


    box on;
    axis equal;
    subplot(2,6,[7,8])
    hold on
    for rep_k=1:length(rep_set)
        acf_store=[];
        XY_data_modified_rep=XY_data_modified;
        XY_data_modified_rep(XY_data_modified_rep.rep~=rep_k,:)=[];
        acf_store=calc_acf_afa_v2(XY_data_modified_rep,'dx_step','dy_step','dz_step');
        acf_store_plot=acf_store;
        %autocorr(disp_series(curren_track_block),'NumLags',(sum(~isnan(disp_series(curren_track_block))))-1);

        %plot(mean(acf_store),'r','LineWidth',2);
        %errorbar(mean(acf_store),std(acf_store),'LineWidth',2);
        %shadedErrorBar(linspace(1,size(acf_store,2),size(acf_store,2)),acf_store,{@mean,@std}, 'lineprops', '-r','transparent',false,'patchSaturation',0.075);
        %shadedErrorBar(x, y, {@mean,@std}, 'lineprops', '-r','transparent',false,'patchSaturation',0.075)

        %H(1) = shadedErrorBar(linspace(1,size(acf_store_plot,2),size(acf_store_plot,2)),acf_store_plot, {@mean, @(x) 2*std(x)  }, 'lineprops', '-r');
        H(1) = shadedErrorBar(linspace(1,size(acf_store_plot,2),size(acf_store_plot,2)),acf_store_plot, {@nanmean, @(x) 1*nanstd(x)  }, 'lineprops', '-r');%, 0);
        %H(3) = shadedErrorBar(linspace(1,size(acf_store_plot,2),size(acf_store_plot,2)),acf_store_plot, {@mean, @(x) 0.5*std(x)},  'lineprops','-b');%, 'LineWidth', 2}, 0);
    end


    yline(.20,'r--');
    yline(-.20,'r--');

    % legend([H(3).mainLine, H.patch], ...
    %     '\mu', '2\sigma', '\sigma', '0.5\sigma', '0.2','-0.2',...
    %     'Location', 'Northwest');

    xlabel('Lag (min)');
    ylabel('ACF (dx, dy)');
    box on;




    subplot(2,6,[3,9])
    hold on;
    c_hist=histogram((1)*disp_series(:),'Normalization','pdf','FaceColor','k','FaceAlpha',0,'EdgeAlpha',0);%, 'DisplayStyle', 'stairs'
    plot(conv(c_hist.BinEdges, [0.5 0.5], 'valid'), c_hist.Values,'.-');
    xlabel('Displacement');
    ylabel('PDF');
    box on;
    %legend(file_x_axis_label);

    ax = gca;
    ax.YScale = 'log';
    ax.XScale = 'log';

    subplot(2,6,4)
    %figure
    hold on
    nbin=50;
    edges_bin=linspace(-40,40,nbin);
    x_disp_series(isnan(x_disp_series))=[];
    c_hist=histogram(x_disp_series(1:(end)),edges_bin,'Normalization','pdf','FaceColor','b','FaceAlpha',0.5,'EdgeAlpha',0);
    % plot(conv(c_hist.BinEdges, [0.5 0.5], 'valid'), c_hist.Values,'r-');

    gm = fitgmdist(x_disp_series(1:(end)),2);
    % histogram(normrnd(gm.mu(1),gm.Sigma(1,1),[floor(gm.ComponentProportion(1)*(sum(~isnan(x_disp_series(1:(end)))))),1]),edges_bin,'FaceColor','r','FaceAlpha',0.5,'EdgeAlpha',0);
    % histogram(normrnd(gm.mu(2),gm.Sigma(1,2),[floor(gm.ComponentProportion(2)*(sum(~isnan(x_disp_series(1:(end)))))),1]),edges_bin,'FaceColor','g','FaceAlpha',0.5,'EdgeAlpha',0);
    %
    plot(linspace(-40,40,100),normpdf(linspace(-40,40,100),gm.mu(1),gm.Sigma(1,1)),'r-');
    plot(linspace(-40,40,100),normpdf(linspace(-40,40,100),gm.mu(2),gm.Sigma(1,2)),'g-');


    lgd=legend('Data','Gaussian 1','Gaussian 2','Location','northoutside');
    fontsize(lgd,6,'points')
    %lgd.NumColumns = 2;

    xlabel('X Displacement');
    ylabel('PDF');
    box on;

    % gmm_AIC=[];
    % options = statset('MaxIter',3000);
    % for gmm_realization=1:4
    %     gm = fitgmdist(x_disp_series(1:(end)),gmm_realization,'CovType','full','Options',options);
    %     gmm_AIC(gmm_realization)=gm.AIC;
    %
    % end
    % p = get(gca, 'Position');
    % h = axes('Parent', gcf, 'Position', [p(1)+0.75*p(3) p(2)+0.5*p(4) p(3)/5 p(4)/5]);
    % hold(h);
    %
    % plot(1:gmm_realization,gmm_AIC,'k-s','LineWidth',1);
    % xlabel('Components');
    % ylabel('AIC (dx)');
    % xticks(1:gmm_realization);
    % box on;
    % % ax = gca;
    % h.FontSize = 5;

    subplot(2,6,5)
    hqqp=qqplot(x_disp_series(1:(end)));
    title('');
    hqqp(1).MarkerFaceColor = 'k'; %data
    hqqp(1).MarkerEdgeColor = 'k'; %data


    box on;

    subplot(2,6,10)
    hold on
    edges_bin=linspace(-40,40,nbin);
    y_disp_series(isnan(y_disp_series))=[];



    histogram(y_disp_series(1:(end)),edges_bin,'Normalization','pdf','FaceColor','b','FaceAlpha',0.5,'EdgeAlpha',0);
    gm = fitgmdist(y_disp_series(1:end),2);

    plot(linspace(-40,40,100),normpdf(linspace(-40,40,100),gm.mu(1),gm.Sigma(1,1)),'r-');
    plot(linspace(-40,40,100),normpdf(linspace(-40,40,100),gm.mu(2),gm.Sigma(1,2)),'g-');


    %histogram(normrnd(gm.mu(1),gm.Sigma(1,1),[floor(gm.ComponentProportion(1)*(sum(~isnan(y_disp_series(1:end))))),1]),edges_bin,'FaceColor','r','FaceAlpha',0.5,'EdgeAlpha',0);
    %histogram(normrnd(gm.mu(2),gm.Sigma(1,2),[floor(gm.ComponentProportion(2)*(sum(~isnan(y_disp_series(1:end))))),1]),edges_bin,'FaceColor','g','FaceAlpha',0.5,'EdgeAlpha',0);

    lgd=legend('Data','Gaussian 1','Gaussian 2','Location','northoutside');
    fontsize(lgd,6,'points');

    xlabel('Y Displacement');
    ylabel('PDF');
    box on;



    gmm_AIC=[];
    % options = statset('MaxIter',1000);
    % for gmm_realization=1:4
    %     gm = fitgmdist(y_disp_series(1:(end)),gmm_realization,'CovType','full','Options',options);
    %     gmm_AIC(gmm_realization)=gm.AIC;
    % end

    % p = get(gca, 'Position');
    % h = axes('Parent', gcf, 'Position', [p(1)+0.75*p(3) p(2)+0.5*p(4) p(3)/5 p(4)/5]);
    % hold(h);
    %
    % plot(1:gmm_realization,gmm_AIC,'k-s','LineWidth',1);
    % xlabel('Components');
    % ylabel('AIC (dy)');
    % xticks(1:gmm_realization);
    % box on;
    % h.FontSize = 5;




    subplot(2,6,11)
    hold on
    %y = pdf(gm,[-40:40]');
    %pd = y;%makedist('Weibull');
    hqqp=qqplot(y_disp_series(1:(end)));
    %hqqp_fitted=qqplot(y_disp_series(1:(end)),pd);
    title('');
    hqqp(1).MarkerFaceColor = 'k'; %data
    hqqp(1).MarkerEdgeColor = 'k'; %data
    box on;




    subplot(2,6,6)
    [ycdf, edges] = histcounts(disp_series(1:(track*t_width)), 'Normalization', 'probability');
    xcdf = (edges(1:end-1)+edges(2:end))/2;
    % figure
    % plot(centers, values, 'k-')

    %[ycdf,xcdf] = cdfcalc(disp_series(1:(track*t_width)));
    xccdf = xcdf;
    yccdf =ycdf;% 1-ycdf(1:end-1);
    %plot(xcdf,yccdf,'-k','LineWidth',2);

    yccdf(xcdf<=0)=[];
    xcdf(xcdf<=0)=[];

    % Get coefficients of a line fit through the data.
    coefficients = polyfit(log(xcdf),log(yccdf), 1);
    % Create a new x axis with exactly 1000 points (or whatever you want).
    xFit = log(xccdf);%linspace(min(xcdf), max(xcdf), 1000);
    % Get the estimated yFit value for each of those 1000 new x locations.
    yFit = polyval(coefficients , xFit);
    % Plot everything.
    plot(xcdf, yccdf, 'b.', 'LineWidth', 2); % Plot training data.
    %hold on; % Set hold on so the next plot does not blow away the one we just drew.
    %plot(exp(xFit), exp(yFit), 'r-', 'LineWidth', 1); % Plot fitted line.

    ax = gca;
    ax.YScale = 'log';
    ax.XScale = 'log';
    xlabel('r(\tau) (\mum^2)');
    ylabel('P(r(\tau))');
    % ylabel('P(Displacement\geqs)');
    legend('\tau=1 frame');
    box on;

    subplot(2,6,12)
    box on;
end

if export_on
    exportgraphics(fig_4,save_figures_as_a_pdf,'Append',true,'ContentType','image');
    exportgraphics(fig_5,save_figures_as_a_pdf,'Append',true,'ContentType','image');
end

%% windrose  plots

%% Clusteriung tracks

% rng('default')  % For reproducibility
% load('kmeansdata.mat')
% size(X)


% % close all
% %figure
% yData_combined=[];
% count_k=0;
% %k_list=[1];
% for i_k=1%:length(k_list)%:length(all_filenames)
%     filt_data_ind=Track_prop_k{1,k_list(i_k)};
%
%     %XYTable=readtable(string(all_filenames{k_list(i_k),1}),'Sheet','Time series data');  % Load the data into a table
%
%     Track_prop = readtable(string(all_filenames{k_list(i_k),1}),'Sheet','Track properties');  % Load the data into a table
%
%     Track_prop_reduced=table2array(Track_prop(:,5:12));
% end


% [idx3,C,sumdist3] = kmeans(Track_prop_reduced,3,'Distance','cityblock', ...
%     'Display','final');
%
% [silh3,h] = silhouette(Track_prop_reduced,idx3,'cityblock');
% xlabel('Silhouette Value')
% ylabel('Cluster')

%%%%%%%%

% figure
% eva = evalclusters(Track_prop_reduced,'kmeans','CalinskiHarabasz','KList',1:10);
% plot(eva)
%
% figure
% Xred = nnmf(X,2);
% scatter(Xred(:,1),Xred(:,2))
% xlabel('Column 1')
% ylabel('Column 2')
% grid on


%%%%%%%%%%%% PCA Analysis

% figure
% plotmatrix(Track_prop_reduced);%,[],Cylinders,['c' 'b' 'm' 'g' 'r'],[],[],false);
%

% [coeff,score,latent,tsquared,explained] = pca(Track_prop_reduced);
%
% scatter3(score(:,1),score(:,2),score(:,3))
% axis equal
% xlabel('1st Principal Component')
% ylabel('2nd Principal Component')
% zlabel('3rd Principal Component')



%% plotting MSD plots
% % close all
% %subplot(1,3,3);
%
% cmap_lines = lines(5);
% colormap_start=1;
% colormap_end=2;
%
% for k=1%:length(all_filenames)
%     MSDTable_k{k,1} = readtable(string(all_filenames{k,1}),'Sheet','MSD', 'ReadVariableNames', false);  % Load the data into a table
%     MSD_Matrix=table2array(MSDTable_k{k,1});
% end
% alpha_quality_MSD=MSD_Matrix(2:end,6);
% t_axis_size=size(MSD_Matrix,2)-8;
% tracker_no=size(MSD_Matrix,1)-1;
%
% %figure(2)
%
% hold on;
% for i=1:tracker_no
%     if alpha_quality_MSD(i)<1
%         color=cmap_lines(colormap_start,:);
%     elseif alpha_quality_MSD(i)>=1
%         color=cmap_lines(colormap_end,:);
%     else
%         color='k';
%     end
%
%     if isnan(alpha_quality_MSD(i))==0 %&&  sum((alpha_quality_MSD(i)==filtered_alpha_list))~=0
%         plot(MSD_Matrix(1,9:end)/60,MSD_Matrix(i+1,9:end),'color',color,'LineWidth',2);
%     else
%         %plot(linspace(1,Total_no_frames,Total_no_frames),MSD(:,i,2),'color','k');
%     end
%     ax = gca;
%     ax.YScale = 'log';
%     ax.XScale = 'log';
%
% end
% % cmap = [cmap_lines(colormap_start,:) ; cmap_lines(colormap_end,:)] ;
% % colormap(cmap)
% % cbar=colorbar;
% % caxis([0, 2]);
% % cbar.Title.String={'\alpha'};
% legend('');
% %xlim([0,100]);
%
%
% %cols =  ["green", "red", "black"];
% cols =  [cmap_lines(colormap_start,:);cmap_lines(colormap_end,:)];
% %col_names = ["Initially Confined", "Initially Rolling", "Poor fit"];
%
% col_names = ["\alpha<1", "\alpha>1"];
% for j =1:length(col_names)
%     plot([NaN NaN], [NaN NaN], 'Color', cols(j,:), 'DisplayName', col_names(j))
% end
% ylabel('MSD (\mum^2)');
% xlabel('\DeltaT (min)');
%
% box on;

%% plotting MSD and other plots
% close all
%subplot(1,3,3);

close all
cmap_lines = lines(5);
colormap_start=1;
colormap_end=2;
count_plot=0;
fig_6=figure(6);%,'Renderer', 'painters', 'Position', [300 50 800 600])
fig_6.Position=[50 50 1200 450];
t=tiledlayout(1+0*length(g_list),4);
t.TileSpacing = 'tight';

for i_g=1%:length(g_list)%:length(all_filenames)
    group_Track_prop=combined_Track_prop(strcmp(combined_Track_prop_condition,(condition_names_g{1,g_list(i_g)})),:);
    group_XY_data=combined_XY_data(strcmp(combined_XY_data_condition,(condition_names_g{1,g_list(i_g)})),:);

    Track_prop=group_Track_prop;%Track_prop_k{1,k_list(i_k)};
    XY_data_modified=group_XY_data;%XY_data_modified_k{1,k_list(i_k)};

    Track_prop(Track_prop.('Filter1')==0,:)=[];
    XY_data_modified(XY_data_modified.('Filter1')==0,:)=[];

    xPosition=XY_data_modified.('XPositionForPosition_1');
    x_series = XY_data_modified.('x')+0*xPosition;

    yPosition = XY_data_modified.('YPositionForPosition_1');
    y_series = XY_data_modified.('y')+0*yPosition;

    alpha_series=(XY_data_modified.('Alpha'));
    t_width=nnz(XY_data_modified.('Track_ID')==1 & XY_data_modified.('MovieID')==1 & XY_data_modified.('rep')==1);%%%%prone to error
    track_id_series=(XY_data_modified.('Track_ID'));
    movie_id_series=(XY_data_modified.('MovieID'));
    rep_index=XY_data_modified.rep;

    ds_series=XY_data_modified.step/(Track_prop.ActualFrameInterval_s_(1)/60);
    dtheta_series=XY_data_modified.angle;

    dtheta_final_series=XY_data_modified.TrackAngle;

    disp_series=XY_data_modified.tot_disp;
    x_disp_series=XY_data_modified.x_disp;
    y_disp_series=XY_data_modified.y_disp;

    dx_step_series=XY_data_modified.dx_step;
    dy_step_series=XY_data_modified.dy_step;
    %%% each walk pattern histogram
    % % close all
    % %figure([])
    % figure('Renderer', 'painters', 'Position', [300 50 600 600])
    % tiledlayout(4,3);
    %
    % RWM_pars=[{'sat_MSD'},{'tau_c'},{'conf_D'},{'R2_confined'},...
    %     {'RMC'},{'R2_pure'},...
    %     {'directed_v'},{'directed_D'},{'R2_convect'},...
    %     {'PRWM_speed'},{'PRWM_persistence'},{'R2_PRWM'}];
    %
    % RWM_pars_title=[{'<r^2_{confined}>'},{'\tau_{confined}'},{'D_{confined}'},{'R^2_{confined}'},...
    %     {'D_{random}'},{'R^2_{random}'},...
    %     {'v_{directed}'},{'D_{directed}'},{'R^2_{directed}'},...
    %     {'v_{persistence}'},{'Persistence'},{'R^2_{persistence}'}];
    %
    % RWM_pars_units=[{'\mum^2'},{''},{'\mum^2/min'},{''},...
    %     {'\mum^2/min'},{''},...
    %     {'\mum/min'},{'\mum^2/min'},{''},...
    %     {'\mum/min'},{'min'},{''}];
    %
    %
    % for RWM_pars_index=1:length(RWM_pars)
    %     nexttile();
    %     hold on;
    %     n_bin=10;
    %     RWM_pars_k=RWM_pars{RWM_pars_index};
    %     histogram(Track_prop.(RWM_pars_k),n_bin,'Normalization','count','FaceAlpha',1,'EdgeAlpha',0,'FaceColor','k');
    %     xline(nanmedian(Track_prop.(RWM_pars_k)),'r--');
    %     title(strcat(RWM_pars_title(RWM_pars_index),sprintf(' (M=%.2f)', nanmedian(Track_prop.(RWM_pars_k)))));
    %     %TextLocation(sprintf('%.2f', nanmedian(Track_prop.(RWM_pars_k))),'Location','northeast','FontSize',1);
    %     xlabel(RWM_pars_units(RWM_pars_index));
    %     box on;
    %     ax = gca;
    %     %ax.YScale = 'log';
    %     if contains(RWM_pars_title(RWM_pars_index),'D_{')
    %         ax.XScale = 'log';
    %     end
    % end

    %%%
    % % close all
    % figure(1,'Renderer', 'painters', 'Position', [300 50 800 600])
    % t=tiledlayout(2,3);
    % t.TileSpacing = 'tight';

    %figure(1);

    % nexttile(9);
    % histogram(Track_prop.('R2_alpha'),n_bin,'Normalization','count','FaceAlpha',1,'EdgeAlpha',0,'FaceColor','k');
    % xlabel('');
    % title('R^2_\alpha');
    % xline(0.8,'r--');
    % box on;
    count_plot=count_plot+1;
    nexttile(count_plot)
    rep_set=unique(XY_data_modified.('rep'));
    hold on
    t_width_rep=zeros(length(rep_set),1);
    no_track_rep=zeros(length(rep_set),1);
    for rep_k=1:length(rep_set)
        x_series_rep=x_series(rep_index==rep_k);
        y_series_rep=y_series(rep_index==rep_k);
        alpha_series_rep=alpha_series(rep_index==rep_k);
        track_ID_rep=track_id_series(rep_index==rep_k);
        movie_ID_rep=movie_id_series(rep_index==rep_k);

        track_set=unique(track_ID_rep);
        movie_set=unique(movie_ID_rep);

        t_width_rep(rep_k,1)=nnz(XY_data_modified.('Track_ID')==track_set(1) & XY_data_modified.('MovieID')==movie_set(1) & XY_data_modified.('rep')==rep_k);
        if t_width_rep(rep_k,1) ~=0
            no_track_rep(rep_k,1)=height(XY_data_modified_rep)/t_width_rep(rep_k,1);       
            for track=1:length(x_series_rep)/t_width_rep(rep_k,1)
                current_track_block=(track-1)*t_width_rep(rep_k,1)+1:track*t_width_rep(rep_k,1);
                plotTimeSeries(x_series_rep(current_track_block,1), y_series_rep(current_track_block,1),alpha_series_rep(current_track_block,1))
            end
        end
    end
    box on;
    title(file_x_axis_label{1,g_list(i_g)});

    count_plot=count_plot+1;
    nexttile(count_plot);

    %%close all
    %hold on;
    for rep_k=1:length(rep_set)
        x_series_rep=x_series(rep_index==rep_k);
        y_series_rep=y_series(rep_index==rep_k);
        alpha_series_rep=alpha_series(rep_index==rep_k);
        track_ID_rep=track_id_series(rep_index==rep_k);
        movie_ID_rep=movie_id_series(rep_index==rep_k);

        track_set=unique(track_ID_rep);
        movie_set=unique(movie_ID_rep);

        XY_data_modified_rep=XY_data_modified;
        XY_data_modified_rep(XY_data_modified_rep.rep~=rep_k,:)=[];



        t_width_rep(rep_k,1)=nnz(XY_data_modified.('Track_ID')==track_set(1) & XY_data_modified.('MovieID')==movie_set(1) & XY_data_modified.('rep')==rep_k);

        if t_width_rep(rep_k,1) ~=0
            no_track_rep(rep_k,1)=height(XY_data_modified_rep)/t_width_rep(rep_k,1);
            for track=1:length(x_series_rep)/t_width_rep(rep_k,1)
                current_track_block=(track-1)*t_width_rep(rep_k,1)+1:track*t_width_rep(rep_k,1);


                current_msd_t=XY_data_modified_rep.MSD_t(current_track_block);
                current_msd=XY_data_modified_rep.MSD(current_track_block);
                current_msd_sem=XY_data_modified_rep.MSD_SEM(current_track_block);
                current_msd_pt=XY_data_modified_rep.MSD_No(current_track_block);
                current_alpha=XY_data_modified_rep.Alpha(current_track_block);



                if unique(current_alpha)<1
                    color=cmap_lines(colormap_start,:);
                elseif unique(current_alpha)>=1
                    color=cmap_lines(colormap_end,:);
                else
                    color='k';
                end

                if ~isnan(unique(current_alpha)) %&&  sum((alpha_quality_MSD(i)==filtered_alpha_list))~=0
                    plot(current_msd_t,current_msd,'color',0.8*[1 1 1],'LineWidth',0.5);
                else
                    %plot(linspace(1,Total_no_frames,Total_no_frames),MSD(:,i,2),'color','k');
                end

                hold on
                %H(1) = shadedErrorBar(linspace(1,size(acf_store_plot,2),size(acf_store_plot,2)),acf_store_plot, {@mean, @(x) 2*std(x)  }, 'lineprops', '-r');
                %H(1) = shadedErrorBar(current_msd_t,current_msd,current_msd_sem);%, {@mean, @(x) 2*std(x)  }, 'lineprops', '-r');

                %H(2) = shadedErrorBar(linspace(1,size(acf_store_plot,2),size(acf_store_plot,2)),acf_store_plot, {@mean, @(x) 1*std(x)  }, 'lineprops', '-g');%, 0);
                %H(3) = shadedErrorBar(linspace(1,size(acf_store_plot,2),size(acf_store_plot,2)),acf_store_plot, {@mean, @(x) 0.5*std(x)},  'lineprops','-b');%, 'LineWidth', 2}, 0);
                xlim([0,150]);

                ax = gca;
                ax.YScale = 'log';
                %ax.XScale = 'log';
            end
        end
    end
    % cmap = [cmap_lines(colormap_start,:) ; cmap_lines(colormap_end,:)] ;
    % colormap(cmap)
    % cbar=colorbar;
    % caxis([0, 2]);
    % cbar.Title.String={'\alpha'};
    % legend('');
    %xlim([0,100]);

    %cols =  ["green", "red", "black"];
    cols =  [cmap_lines(colormap_start,:);cmap_lines(colormap_end,:)];
    %col_names = ["Initially Confined", "Initially Rolling", "Poor fit"];

    % col_names = ["\alpha<1", "\alpha>1"];
    % for j =1:length(col_names)
    %     plot([NaN NaN], [NaN NaN], 'Color', cols(j,:), 'DisplayName', col_names(j))
    % end
    %legend({''});
    ylabel('MSD (\mum^2)');
    xlabel('Lag (min)');
    box on;
    %hold off



    % p = get(gca, 'Position');
    % %h = axes('Parent', gcf, 'Position', [p(1)+0.75*p(3) p(2)+0.5*p(4) p(3)/5 p(4)/5]);
    % h = axes(t);%, 'Position', [p(1)+0.75*p(3) p(2)+0.5*p(4) p(3)/5 p(4)/5]);
    % h.Layout.Tile = 'north';
    % hold(h);
    % plot(1:100,'ro-');




    RW_example_legend={'Confined RW','Directed RW','Pure Random Walk','Persistent RW','Levy Walk','Ballistic'};
    clear RW_example
    x=(Track_prop.ActualFrameInterval_s_(1)/60)*(0:0.1:100);
    RW_example{1}=nanmedian(Track_prop.sat_MSD)*(1-nanmedian(Track_prop.tau_c)*exp(-4*nanmedian(Track_prop.conf_D)*x./nanmedian(Track_prop.sat_MSD)));%x+4*x.^2;%%%%eq=msd_sat*(1-par1*exp(-4*confined_D*t/msd_sat))
    RW_example{2}=4*nanmedian(Track_prop.directed_D)*x+(nanmedian(Track_prop.directed_v))^2*x.^2;

    RW_example{3}=4*nanmedian(Track_prop.RMC)*x;
    RW_example{4}=2*(nanmedian(Track_prop.PRWM_speed))^2*nanmedian(Track_prop.PRWM_persistence)*(x-nanmedian(Track_prop.PRWM_persistence)*(1-exp(-1*x./nanmedian(Track_prop.PRWM_persistence))));%predicted=2*P(1)^2*P(2).*(t-P(2).*(1-exp(-t./P(2))));


    RW_example{5}=((nanmedian(Track_prop.directed_v))^1.5)*x.^1.5;%levy
    RW_example{6}=((nanmedian(Track_prop.directed_v))^2)*x.^2;%ballistic

    %RW_example{7}=4*x.^1.5;
    %hold on;
    for RW_example_k=1:length(RW_example)
        plot(x,1*RW_example{RW_example_k},'-','LineWidth',1.5);
    end

    %xlim([0,100]);
    %legend(RW_example_legend,'Location','Northwest');
    ylabel('MSD (\mum^2)');
    xlabel('Lag (min)');
    box on;

    % ax = gca;
    % ax.YScale = 'log';
    % ax.XScale = 'log';

    %hold off
    count_plot=count_plot+1;
    nexttile(count_plot);
    hold on
    for rep_k=1:length(rep_set)
        acf_store=[];
        XY_data_modified_rep=XY_data_modified;
        XY_data_modified_rep(XY_data_modified_rep.rep~=rep_k,:)=[];
        acf_store=calc_acf_afa_v2(XY_data_modified_rep,'dx_step','dy_step','dz_step');
        acf_disp_struct{rep_k,1}=acf_store;
    end
    %autocorr(disp_series(curren_track_block),'NumLags',(sum(~isnan(disp_series(curren_track_block))))-1);

    %plot(mean(acf_store),'r','LineWidth',2);
    %errorbar(mean(acf_store),std(acf_store),'LineWidth',2);
    %shadedErrorBar(linspace(1,size(acf_store,2),size(acf_store,2)),acf_store,{@mean,@std}, 'lineprops', '-r','transparent',false,'patchSaturation',0.075);
    %shadedErrorBar(x, y, {@mean,@std}, 'lineprops', '-r','transparent',false,'patchSaturation',0.075)
    hold on
    %H(1) = shadedErrorBar(linspace(1,size(acf_store_plot,2),size(acf_store_plot,2)),acf_store_plot, {@mean, @(x) 2*std(x)  }, 'lineprops', '-r');
    %H(1) = shadedErrorBar(linspace(1,size(acf_store_plot,2),size(acf_store_plot,2))*(filt_data_ind.ActualFrameInterval_s_(1)/60),acf_store_plot, {@mean, @(x) 1*std(x)  }, 'lineprops', '-k');%, 0);
    %H(3) = shadedErrorBar(linspace(1,size(acf_store_plot,2),size(acf_store_plot,2)),acf_store_plot, {@mean, @(x) 0.5*std(x)},  'lineprops','-b');%, 'LineWidth', 2}, 0);

    %mean(acf_store)
    %x_acf=linspace(1,size(acf_store_plot,2));
    % beta_disp_acf=nan(height(XY_data_modified)/t_width,1);
    % phi_a_disp_acf=nan(height(XY_data_modified)/t_width,1);
    % phi_b_disp_acf=nan(height(XY_data_modified)/t_width,1);
    % phi_c_disp_acf=nan(height(XY_data_modified)/t_width,1);
    beta_disp_acf=nan(sum(no_track_rep),1);
    phi_a_disp_acf=nan(sum(no_track_rep),1);
    phi_b_disp_acf=nan(sum(no_track_rep),1);
    phi_c_disp_acf=nan(sum(no_track_rep),1);
    count_track=0;
    for rep_k=1:length(rep_set)

        acf_store=acf_disp_struct{rep_k,1};
        for track=[]%1:length(acf_store)
            count_track=count_track+1;
            y_acf=(acf_store(track,:))';
            x_acf=(linspace(1,size(y_acf,1),size(y_acf,1)))';

            x_acf_nan_removed=x_acf;
            y_acf_nan_removed=y_acf;

            x_acf_nan_removed(isnan(y_acf_nan_removed))=[];
            y_acf_nan_removed(isnan(y_acf_nan_removed))=[];

            if length(x_acf_nan_removed)>=4
                fit1_eqn = fittype('exp(-1*beta*x)','indep','x');
                [fit1_res1,fit1_res2] = fit(x_acf_nan_removed,y_acf_nan_removed,fit1_eqn,'start',1);

                fit2_eqn = fittype('a*(b/x)^(c)','indep','x');
                [fit2_res1,fit2_res2] = fit(x_acf_nan_removed(2:end),y_acf_nan_removed(2:end),fit2_eqn,'start',[1,2,3],'Lower',[0,0,0],'Upper',[10,100,10]);

                %[fit_res1,fit_res2] = fit(x_acf,y_acf,"exp1");
                %plot(exp_tr,x_acf,y_acf,'-');
                plot(x_acf,y_acf,'-','color',0.8*[1 1 1],'LineWidth',0.5);
                plot(x_acf,exp(-1*fit1_res1.beta*x_acf),'r-');
                % plot(x_acf,fit2_res1.a*((fit2_res1.b)./(x_acf)).^(fit2_res1.c),'g-');

                beta_disp_acf(count_track)=fit1_res1.beta;
                phi_a_disp_acf(count_track)=fit2_res1.a;
                phi_b_disp_acf(count_track)=fit2_res1.b;
                phi_c_disp_acf(count_track)=fit2_res1.c;

                %beta_disp_acf_r2(track,k)=fit1_res2.rsquare;
            end
        end
    end

    median_beta=nanmedian(beta_disp_acf);
    median_a=nanmedian(phi_a_disp_acf);
    median_b=nanmedian(phi_b_disp_acf);
    median_c=nanmedian(phi_c_disp_acf);

    %plot((x_acf-1)*(Track_prop.ActualFrameInterval_s_(1)/60),exp(-1*median_beta*x_acf),'-','LineWidth',1.5);
    %plot((x_acf(2:end)-1)*(Track_prop.ActualFrameInterval_s_(1)/60),median_a*((median_b)./(x_acf(2:end))).^(median_c),'-','LineWidth',1.5);

    yline(.20,'r--');
    yline(-.20,'r--');

    xlim([0,150]);

    txt_slope=sprintf('Median=%.2f',(median_beta));
    title(['\beta (',txt_slope,')']);
    % legend([H(3).mainLine, H.patch], ...
    %     '\mu', '2\sigma', '\sigma', '0.5\sigma', '0.2','-0.2',...
    %     'Location', 'Northwest');

    % legend('\mu', '\sigma', '0.2','-0.2',...
    %     'Location', 'Northwest');

    xlabel('Lag (min)');
    ylabel('ACF');
    box on;
    %ax = gca;
    %ax.YScale = 'log';
    %ax.XScale = 'log';



    count_plot=count_plot+1;
    nexttile(count_plot);
    % ds_series=XY_data_modified.step/(filt_data_ind.ActualFrameInterval_s_(1)/60);
    %
    % n_bin=50;
    % %histogram((ds_series),n_bin,'Normalization','cdf','FaceAlpha',1,'EdgeAlpha',0,'FaceColor','k');
    %
    % [ycdf,xcdf] = cdfcalc(ds_series);
    % xccdf = xcdf;
    % yccdf = 1-ycdf(1:end-1);
    % %plot(xcdf,yccdf,'-k','LineWidth',2);
    %
    % yccdf(xcdf<=0)=[];
    % xcdf(xcdf<=0)=[];
    %
    % % Get coefficients of a line fit through the data.
    % coefficients = polyfit(log(xcdf),log(yccdf), 1);
    % % Create a new x axis with exactly 1000 points (or whatever you want).
    % xFit = log(xccdf);%linspace(min(xcdf), max(xcdf), 1000);
    % % Get the estimated yFit value for each of those 1000 new x locations.
    % yFit = polyval(coefficients , xFit);
    % % Plot everything.
    % plot(xcdf, yccdf, 'k.', 'LineWidth', 1); % Plot training data.
    % hold on; % Set hold on so the next plot does not blow away the one we just drew.
    % plot(exp(xFit), exp(yFit), '-', 'LineWidth', 1.5); % Plot fitted line.
    %
    % ax = gca;
    % ax.YScale = 'log';
    % ax.XScale = 'log';
    % xlabel('s (\mum)');
    % ylabel('P(step length\geqs)');
    % box on;
    n_bin=10;
    hold on
    coef1_step_track=nan(sum(no_track_rep),1);
    mu_step_track=nan(sum(no_track_rep),1);
    tail_threshold=6;
    count_track=0;
    for rep_k=1:length(rep_set)
        x_series_rep=x_series(rep_index==rep_k);
        y_series_rep=y_series(rep_index==rep_k);
        alpha_series_rep=alpha_series(rep_index==rep_k);
        track_ID_rep=track_id_series(rep_index==rep_k);
        movie_ID_rep=movie_id_series(rep_index==rep_k);

        track_set=unique(track_ID_rep);
        movie_set=unique(movie_ID_rep);

        XY_data_modified_rep=XY_data_modified;
        XY_data_modified_rep(XY_data_modified_rep.rep~=rep_k,:)=[];

        t_width_rep(rep_k,1)=nnz(XY_data_modified.('Track_ID')==track_set(1) & XY_data_modified.('MovieID')==movie_set(1) & XY_data_modified.('rep')==rep_k);
        if t_width_rep(rep_k,1) ~=0
            for track=1:length(x_series_rep)/t_width_rep(rep_k,1)
                count_track=count_track+1;
                current_track_block=(track-1)*t_width_rep(rep_k,1)+1:track*t_width_rep(rep_k,1);

                current_ds_series=ds_series(current_track_block);
                [ycdf,xcdf] = cdfcalc(current_ds_series);
                %[f,x]=ecdf(current_ds_series);
                % fc=1-f;
                xccdf = xcdf;
                yccdf = 1-ycdf(1:end-1);


                %plot(xcdf,yccdf,'-k','LineWidth',2);
                yccdf(xccdf<=0)=[];
                xccdf(xccdf<=0)=[];
                xcdf_tail=xccdf(xccdf>tail_threshold);%tail_threshold
                ycdf_tail=yccdf(xccdf>tail_threshold);
                %

                %coefficients = polyfit(log(xcdf),log(yccdf), 1);
                if  length(xcdf_tail)>=4 %&& coefficients(2)<=10
                    coefficients = polyfit(log(xcdf_tail),log(ycdf_tail), 1);
                    coef1_step_track(count_track)=coefficients(2);
                    mu_step_track(count_track)=coefficients(1);
                end

                plot(xccdf, yccdf, '-','Color',0.8*[1,1,1], 'LineWidth', 0.5); % Plot training data.
                yFit_tail_ind = polyval([mu_step_track(count_track),coef1_step_track(count_track)] , log(xcdf_tail));
                plot((xcdf_tail), exp(yFit_tail_ind), '-','Color',0.8*[1,0,0], 'LineWidth', 0.5); % Plot training data.

            end
        end
    end

    % hold on;
    %%%%%taking average method #1
    median_coef1_mu=nanmedian(coef1_step_track);
    median_mu=nanmedian(mu_step_track);
    % xFit = log(xccdf);%linspace(min(xcdf), max(xcdf), 1000);
    xFit = log(linspace((1.2), 30, 1000));
    yFit = polyval([median_mu,median_coef1_mu] , xFit);
    plot(exp(xFit), exp(yFit), 'k-', 'LineWidth', 1.5); % Plot fitted line.



    %%%%%taking average method #2
    [ycdf,xcdf] = cdfcalc(ds_series);
    xccdf = xcdf;
    yccdf = 1-ycdf(1:end-1);
    %plot(xcdf,yccdf,'-k','LineWidth',2);
    yccdf(xccdf<=0)=[];
    xccdf(xccdf<=0)=[];
    xcdf_tail=xccdf(xccdf>tail_threshold);%tail threshold
    ycdf_tail=yccdf(xccdf>tail_threshold);

    %coefficients = polyfit(log(xcdf),log(yccdf), 1);
    if  1%length(xcdf_tail)>=4 %&& coefficients(2)<=10
        coefficients = polyfit(log(xcdf_tail),log(ycdf_tail), 1);
        coef1_step_combined=coefficients(2);
        mu_step_combined=coefficients(1);
    end

    plot(xccdf, yccdf, '-','Color',0.8*[0,0,1], 'LineWidth', 0.5); % Plot training data.
    yFit_tail_ind = polyval([mu_step_combined,coef1_step_combined] , log(xcdf_tail));
    plot((xcdf_tail), exp(yFit_tail_ind), '-','Color',0.8*[0,0,1], 'LineWidth', 1.5); % Plot training data.



    txt_slope=sprintf('Slope=%.2f',(-1*median_mu));
    ylim([0,1]);
    ax = gca;
    ax.YScale = 'log';
    ax.XScale = 'log';
    box on;
    xlabel('s (\mum)');
    ylabel('P(step length\geqs)');
    title(['\mu (',txt_slope,')']);

    xline(tail_threshold, '--','Color',0.8*[1,0,0], 'LineWidth', 0.7);
end

if export_on
    exportgraphics(fig_6,save_figures_as_a_pdf,'Append',true,'ContentType','image');
end
%%


close all
fig_7=figure(7);%,'Renderer', 'painters', 'Position', [300 50 800 600])
fig_7.Position=[300 50 800 600];
t=tiledlayout(3,3);
t.TileSpacing = 'tight';


for i_k=20:length(k_list)%:length(all_filenames)
    count_plot=0;

    %group_Track_prop=combined_Track_prop(strcmp(combined_Track_prop_condition,(condition_names_g{1,g_list(i_g)})),:);
    %group_XY_data=combined_XY_data(strcmp(combined_XY_data_condition,(condition_names_g{1,g_list(i_g)})),:);

    Track_prop=Track_prop_k{1,k_list(i_k)};
    %Track_prop=group_Track_prop;%Track_prop_k{1,k_list(i_k)};

    XY_data_modified=XY_data_modified_k{1,k_list(i_k)};
    %XY_data_modified=group_XY_data;%XY_data_modified_k{1,k_list(i_k)};

    XY_data_modified(XY_data_modified.('Filter1')==0,:)=[];
    Track_prop(Track_prop.('Filter1')==0,:)=[];

    %XYTable_modified =XYTable_modified_k{1,k_list(i_k)};
    %XY_data_modified =XY_data_modified_k{1,g_list(i_g)};

    %XY_data_modified(XY_data_modified.('Filter1')==0,:)=[];

    xPosition=XY_data_modified.('XPositionForPosition_1');
    x_series = XY_data_modified.('x')+0*xPosition;

    yPosition = XY_data_modified.('YPositionForPosition_1');
    y_series = XY_data_modified.('y')+0*yPosition;


    alpha_series=(XY_data_modified.('Alpha'));
    t_width=nnz(XY_data_modified.('Track_ID')==1 & XY_data_modified.('MovieID')==1 & XY_data_modified.('rep')==1);%%%%prone to error
    track_id_series=(XY_data_modified.('Track_ID'));
    movie_id_series=(XY_data_modified.('MovieID'));

    ds_series=XY_data_modified.step/(Track_prop.ActualFrameInterval_s_(1)/60);
    dtheta_series=XY_data_modified.angle;

    dtheta_final_series=XY_data_modified.TrackAngle;

    disp_series=XY_data_modified.tot_disp;
    x_disp_series=XY_data_modified.x_disp;
    y_disp_series=XY_data_modified.y_disp;

    dx_step_series=XY_data_modified.dx_step;
    dy_step_series=XY_data_modified.dy_step;

    time_series=XY_data_modified.time;
    ID_series=XY_data_modified.ID;

    rep_index=XY_data_modified.rep;
    rep_set=unique(XY_data_modified.('rep'));
    t_width_rep=zeros(length(rep_set),1);
    no_track_rep=zeros(length(rep_set),1);

    for rep_k=1:length(rep_set)
        track_ID_rep=track_id_series(rep_index==rep_set(rep_k));
        movie_ID_rep=movie_id_series(rep_index==rep_set(rep_k));

        track_set=unique(track_ID_rep);
        movie_set=unique(movie_ID_rep);
        
        XY_data_modified_rep=XY_data_modified;
        XY_data_modified_rep(XY_data_modified_rep.rep~=rep_set(rep_k),:)=[];

        %t_width_rep(rep_k,1)=nnz(XY_data_modified_rep.('Track_ID')==track_set(1) & XY_data_modified_rep.('MovieID')==movie_set(1) & XY_data_modified_rep.('rep')==rep_set(rep_k));
        t_width_rep(rep_k,1)=nnz(XY_data_modified_rep.('Track_ID')==XY_data_modified_rep.Track_ID(1) & XY_data_modified_rep.('MovieID')==XY_data_modified_rep.MovieID(1) & XY_data_modified_rep.('rep')==rep_set(rep_k));

        if t_width_rep(rep_k,1) ~=0
            no_track_rep(rep_k,1)=height(XY_data_modified_rep)/t_width_rep(rep_k,1);
        end
    end

    count_plot=count_plot+1;
    nexttile(count_plot);
    hold on

    n_bin=10;
    alpha_col_name='alpha';
    c_hist=histogram(Track_prop.('alpha'),n_bin,'Normalization','pdf','FaceAlpha',0,'EdgeAlpha',0,'FaceColor','k');
    plot(conv(c_hist.BinEdges, [0.5 0.5], 'valid'), c_hist.Values,'.-','Color',condition_colormap(g_list(i_g),:));
    xlabel('');
    ylabel('PDF');

    title('\alpha');
    xline(0.95,'r--');
    xline(1.05,'r--');
    xline(2,'r--');
    box on;
    xlim([0,3])


    count_plot=count_plot+1;
    nexttile(count_plot);
    box on;
    hold on
    n_bin=10;

    for rep_k=1:length(rep_set)
        acf_disp=[];
        XY_data_modified_rep=XY_data_modified;
        XY_data_modified_rep(XY_data_modified_rep.rep~=rep_set(rep_k),:)=[];
        acf_disp=calc_acf_afa_v2(XY_data_modified_rep,'dx_step','dy_step','dz_step');
        acf_disp_struct{rep_k,1}=acf_disp;
    end

    beta_disp_acf=nan(sum(no_track_rep),1);
    phi_a_disp_acf=nan(sum(no_track_rep),1);
    phi_b_disp_acf=nan(sum(no_track_rep),1);
    phi_c_disp_acf=nan(sum(no_track_rep),1);
    count_track=0;
    for rep_k=1:length(rep_set)
        %t_width_rep(rep_k,1)=nnz(XY_data_modified.('Track_ID')==track_set(1) & XY_data_modified.('MovieID')==movie_set(1) & XY_data_modified.('rep')==rep_k);
        x_series_rep=x_series(rep_index==rep_set(rep_k));

        acf_disp=acf_disp_struct{rep_k,1};
        if t_width_rep(rep_k,1) ~=0
            %no_track_rep(rep_k,1)=height(XY_data_modified_rep)/t_width_rep(rep_k,1);
            for track=1:length(x_series_rep)/t_width_rep(rep_k,1)
                count_track=count_track+1;

                y_acf=(acf_disp(track,:))';
                x_acf=(linspace(1,size(y_acf,1),size(y_acf,1)))';

                x_acf_nan_removed=x_acf;
                y_acf_nan_removed=y_acf;

                x_acf_nan_removed(isnan(y_acf_nan_removed))=[];
                y_acf_nan_removed(isnan(y_acf_nan_removed))=[];

                if length(x_acf_nan_removed)>=4 %~isempty(x_acf_nan_removed)
                    fit1_eqn = fittype('exp(-1*beta*x)','indep','x');
                    [fit1_res1,fit1_res2] = fit(x_acf_nan_removed,y_acf_nan_removed,fit1_eqn,'start',1);

                    fit2_eqn = fittype('a*(b/x)^(c)','indep','x');
                    [fit2_res1,fit2_res2] = fit(x_acf_nan_removed(2:end),y_acf_nan_removed(2:end),fit2_eqn,'start',[1,2,3],'Lower',[0,0,0],'Upper',[10,100,10]);

                    %[fit_res1,fit_res2] = fit(x_acf,y_acf,"exp1");
                    %plot(exp_tr,x_acf,y_acf,'-');
                    %plot(x_acf,y_acf,'-','color',0.8*[1 1 1],'LineWidth',0.5);
                    % plot(x_acf,exp(-1*fit1_res1.beta*x_acf),'r-');
                    % plot(x_acf,fit2_res1.a*((fit2_res1.b)./(x_acf)).^(fit2_res1.c),'g-');

                    beta_disp_acf(count_track)=fit1_res1.beta;
                    phi_a_disp_acf(count_track)=fit2_res1.a;
                    phi_b_disp_acf(count_track)=fit2_res1.b;
                    phi_c_disp_acf(count_track)=fit2_res1.c;

                    %beta_disp_acf_r2(track,k)=fit1_res2.rsquare;
                end
            end
        end
    end


    c_hist=histogram(beta_disp_acf,n_bin,'Normalization','pdf','FaceAlpha',0,'EdgeAlpha',0,'FaceColor','k');
    plot(conv(c_hist.BinEdges, [0.5 0.5], 'valid'), c_hist.Values,'.-','Color',condition_colormap(g_list(i_g),:));
    xlabel('');
    ylabel('PDF');

    title('\beta_{Disp}');

    count_plot=count_plot+1;
    nexttile(count_plot);
    box on;
    hold on
    n_bin=10;

    c_hist=histogram(phi_c_disp_acf,n_bin,'Normalization','pdf','FaceAlpha',0,'EdgeAlpha',0,'FaceColor','k');
    plot(conv(c_hist.BinEdges, [0.5 0.5], 'valid'), c_hist.Values,'.-','Color',condition_colormap(g_list(i_g),:));
    xlabel('');
    ylabel('PDF');

    title('\phi_{Disp}');

    count_plot=count_plot+1;
    nexttile(count_plot);
    box on;
    hold on
    n_bin=10;

    for rep_k=1:length(rep_set)
        acf_angle=[];
        XY_data_modified_rep=XY_data_modified;
        XY_data_modified_rep(XY_data_modified_rep.rep~=rep_set(rep_k),:)=[];
        acf_angle=calc_acf_afa_v2(XY_data_modified_rep,'angle','dz_step','dz_step');
        acf_angle_struct{rep_k,1}=acf_angle;
    end

    beta_angle_acf=nan(sum(no_track_rep),1);
    phi_a_angle_acf=nan(sum(no_track_rep),1);
    phi_b_angle_acf=nan(sum(no_track_rep),1);
    phi_c_angle_acf=nan(sum(no_track_rep),1);
    count_track=0;
    for rep_k=1:length(rep_set)
        %t_width_rep(rep_k,1)=nnz(XY_data_modified.('Track_ID')==track_set(1) & XY_data_modified.('MovieID')==movie_set(1) & XY_data_modified.('rep')==rep_k);
        x_series_rep=x_series(rep_index==rep_set(rep_k));

        acf_angle=acf_angle_struct{rep_k,1};
        if t_width_rep(rep_k,1) ~=0
            %no_track_rep(rep_k,1)=height(XY_data_modified_rep)/t_width_rep(rep_k,1);
            for track=1:length(x_series_rep)/t_width_rep(rep_k,1)
                count_track=count_track+1;

                y_acf=(acf_angle(track,:))';
                x_acf=(linspace(1,size(y_acf,1),size(y_acf,1)))';

                x_acf_nan_removed=x_acf;
                y_acf_nan_removed=y_acf;

                x_acf_nan_removed(isnan(y_acf_nan_removed))=[];
                y_acf_nan_removed(isnan(y_acf_nan_removed))=[];

                if length(x_acf_nan_removed)>=4 %~isempty(x_acf_nan_removed)
                    fit1_eqn = fittype('exp(-1*beta*x)','indep','x');
                    [fit1_res1,fit1_res2] = fit(x_acf_nan_removed,y_acf_nan_removed,fit1_eqn,'start',1);

                    fit2_eqn = fittype('a*(b/x)^(c)','indep','x');
                    [fit2_res1,fit2_res2] = fit(x_acf_nan_removed(2:end),y_acf_nan_removed(2:end),fit2_eqn,'start',[1,2,3],'Lower',[0,0,0],'Upper',[10,100,10]);

                    %[fit_res1,fit_res2] = fit(x_acf,y_acf,"exp1");
                    %plot(exp_tr,x_acf,y_acf,'-');
                    %plot(x_acf,y_acf,'-','color',0.8*[1 1 1],'LineWidth',0.5);
                    % plot(x_acf,exp(-1*fit1_res1.beta*x_acf),'r-');
                    % plot(x_acf,fit2_res1.a*((fit2_res1.b)./(x_acf)).^(fit2_res1.c),'g-');

                    beta_angle_acf(count_track)=fit1_res1.beta;
                    phi_a_angle_acf(count_track)=fit2_res1.a;
                    phi_b_angle_acf(count_track)=fit2_res1.b;
                    phi_c_angle_acf(count_track)=fit2_res1.c;

                    %beta_disp_acf_r2(track,k)=fit1_res2.rsquare;
                end
            end
        end
    end


    c_hist=histogram(beta_angle_acf,n_bin,'Normalization','pdf','FaceAlpha',0,'EdgeAlpha',0,'FaceColor','k');
    plot(conv(c_hist.BinEdges, [0.5 0.5], 'valid'), c_hist.Values,'.-','Color',condition_colormap(g_list(i_g),:));
    xlabel('');
    ylabel('PDF');

    title('\beta_{Angle}');


    count_plot=count_plot+1;
    nexttile(count_plot);
    n_bin=10;
    hold on
    x_kurtosis=nan(sum(no_track_rep),1);
    y_kurtosis=nan(sum(no_track_rep),1);
    count_track=0;

    for rep_k=1:length(rep_set)
        x_disp_series_rep=x_disp_series(rep_index==rep_set(rep_k));
        y_disp_series_rep=y_disp_series(rep_index==rep_set(rep_k));
        track_ID_rep=track_id_series(rep_index==rep_set(rep_k));
        movie_ID_rep=movie_id_series(rep_index==rep_set(rep_k));

        track_set=unique(track_ID_rep);
        movie_set=unique(movie_ID_rep);
        
        XY_data_modified_rep=XY_data_modified;
        XY_data_modified_rep(XY_data_modified_rep.rep~=rep_set(rep_k),:)=[];

        t_width_rep(rep_k,1)=nnz(XY_data_modified_rep.('Track_ID')==XY_data_modified_rep.Track_ID(1) & XY_data_modified_rep.('MovieID')==XY_data_modified_rep.MovieID(1) & XY_data_modified_rep.('rep')==rep_set(rep_k));
        if t_width_rep(rep_k,1) ~=0
            for track=1:length(x_disp_series_rep)/t_width_rep(rep_k,1)
                count_track=count_track+1;
                current_track_block=(track-1)*t_width_rep(rep_k,1)+1:track*t_width_rep(rep_k,1);
                
                current_x_disp_series_rep=x_disp_series_rep(current_track_block);
                current_y_disp_series_rep=y_disp_series_rep(current_track_block);
                
                
                x_kurtosis(count_track,1)=kurtosis(current_x_disp_series_rep);
                y_kurtosis(count_track,1)=kurtosis(current_y_disp_series_rep);
            end
        end
    end

    %yyaxis right
    c_hist=histogram(x_kurtosis,n_bin,'Normalization','pdf','FaceAlpha',0,'EdgeAlpha',0,'FaceColor','k');
    plot(conv(c_hist.BinEdges, [0.5 0.5], 'valid'), c_hist.Values,'.-','Marker','square','MarkerSize',3,'Color',condition_colormap(g_list(i_g),:));

    %yyaxis left
    c_hist=histogram(y_kurtosis,n_bin,'Normalization','pdf','FaceAlpha',0,'EdgeAlpha',0,'FaceColor','k');
    plot(conv(c_hist.BinEdges, [0.5 0.5], 'valid'), c_hist.Values,'.-','Marker','diamond','MarkerSize',3,'Color',condition_colormap(g_list(i_g),:));

    xlabel('');
    ylabel('PDF');
    title('Kurtosis');
    box on;

    count_plot=count_plot+1;
    nexttile(count_plot);
    n_bin=10;
    hold on
    x_skewness=nan(sum(no_track_rep),1);
    y_skewness=nan(sum(no_track_rep),1);
    count_track=0;

    for rep_k=1:length(rep_set)
        x_disp_series_rep=x_disp_series(rep_index==rep_set(rep_k));
        y_disp_series_rep=y_disp_series(rep_index==rep_set(rep_k));
        track_ID_rep=track_id_series(rep_index==rep_set(rep_k));
        movie_ID_rep=movie_id_series(rep_index==rep_set(rep_k));

        track_set=unique(track_ID_rep);
        movie_set=unique(movie_ID_rep);
        
        XY_data_modified_rep=XY_data_modified;
        XY_data_modified_rep(XY_data_modified_rep.rep~=rep_set(rep_k),:)=[];

        t_width_rep(rep_k,1)=nnz(XY_data_modified_rep.('Track_ID')==XY_data_modified_rep.Track_ID(1) & XY_data_modified_rep.('MovieID')==XY_data_modified_rep.MovieID(1) & XY_data_modified_rep.('rep')==rep_set(rep_k));
        if t_width_rep(rep_k,1) ~=0
            for track=1:length(x_disp_series_rep)/t_width_rep(rep_k,1)
                count_track=count_track+1;
                current_track_block=(track-1)*t_width_rep(rep_k,1)+1:track*t_width_rep(rep_k,1);
                
                current_x_disp_series_rep=x_disp_series_rep(current_track_block);
                current_y_disp_series_rep=y_disp_series_rep(current_track_block);
                
                
                x_skewness(count_track,1)=skewness(current_x_disp_series_rep);
                y_skewness(count_track,1)=skewness(current_y_disp_series_rep);
            end
        end
    end

    %yyaxis right
    c_hist=histogram(x_skewness,n_bin,'Normalization','pdf','FaceAlpha',0,'EdgeAlpha',0,'FaceColor','k');
    plot(conv(c_hist.BinEdges, [0.5 0.5], 'valid'), c_hist.Values,'.-','Marker','square','MarkerSize',3,'Color',condition_colormap(g_list(i_g),:));

    %yyaxis left
    c_hist=histogram(y_skewness,n_bin,'Normalization','pdf','FaceAlpha',0,'EdgeAlpha',0,'FaceColor','k');
    plot(conv(c_hist.BinEdges, [0.5 0.5], 'valid'), c_hist.Values,'.-','Marker','diamond','MarkerSize',3,'Color',condition_colormap(g_list(i_g),:));

    xlabel('');
    ylabel('PDF');
    title('Skewness');
    box on;


    count_plot=count_plot+1;
    nexttile(count_plot);
    % hold on
    % [ycdf,xcdf] = cdfcalc(ds_series);
    % xccdf = xcdf;
    % yccdf = 1-ycdf(1:end-1);
    % %plot(xcdf,yccdf,'-k','LineWidth',2);
    % yccdf(xcdf<=0)=[];
    % xcdf(xcdf<=0)=[];
    % coefficients = polyfit(log(xcdf),log(yccdf), 1);
    % xFit = log(xccdf);
    % yFit = polyval(coefficients , xFit);
    %
    %
    % plot(xcdf, yccdf, 'b.', 'LineWidth', 2); % Plot training data.
    % hold on; % Set hold on so the next plot does not blow away the one we just drew.
    % plot(exp(xFit), exp(yFit), 'r-', 'LineWidth', 1); % Plot fitted line.
    %
    % txt_slope=sprintf('Slope=%.2f',(-1*coefficients(1)));
    % legend(txt_slope);
    %
    % ax = gca;
    % ax.YScale = 'log';
    % ax.XScale = 'log';
    % xlabel('s (\mum)');
    % ylabel('P(step length\geqs)');
    % title('\mu');
    % box on;

    n_bin=10;
    hold on
    coef1_step_track=nan(sum(no_track_rep),1);
    mu_step_track=nan(sum(no_track_rep),1);
    tail_threshold=6;
    count_track=0;
    for rep_k=1:length(rep_set)
        x_series_rep=x_series(rep_index==rep_set(rep_k));
        y_series_rep=y_series(rep_index==rep_set(rep_k));
        alpha_series_rep=alpha_series(rep_index==rep_set(rep_k));
        track_ID_rep=track_id_series(rep_index==rep_set(rep_k));
        movie_ID_rep=movie_id_series(rep_index==rep_set(rep_k));

        track_set=unique(track_ID_rep);
        movie_set=unique(movie_ID_rep);
        
        XY_data_modified_rep=XY_data_modified;
        XY_data_modified_rep(XY_data_modified_rep.rep~=rep_set(rep_k),:)=[];

        t_width_rep(rep_k,1)=nnz(XY_data_modified_rep.('Track_ID')==XY_data_modified_rep.Track_ID(1) & XY_data_modified_rep.('MovieID')==XY_data_modified_rep.MovieID(1) & XY_data_modified_rep.('rep')==rep_set(rep_k));
        if t_width_rep(rep_k,1) ~=0
            for track=1:length(x_series_rep)/t_width_rep(rep_k,1)
                count_track=count_track+1;
                current_track_block=(track-1)*t_width_rep(rep_k,1)+1:track*t_width_rep(rep_k,1);

                current_ds_series=ds_series(current_track_block);
                [ycdf,xcdf] = cdfcalc(current_ds_series);
                %[f,x]=ecdf(current_ds_series);
                % fc=1-f;
                xccdf = xcdf;
                yccdf = 1-ycdf(1:end-1);


                %plot(xcdf,yccdf,'-k','LineWidth',2);
                yccdf(xccdf<=0)=[];
                xccdf(xccdf<=0)=[];
                xcdf_tail=xccdf(xccdf>tail_threshold);%tail_threshold
                ycdf_tail=yccdf(xccdf>tail_threshold);
                %

                %coefficients = polyfit(log(xcdf),log(yccdf), 1);
                if  length(xcdf_tail)>=4 %&& coefficients(2)<=10
                    coefficients = polyfit(log(xcdf_tail),log(ycdf_tail), 1);
                    coef1_step_track(count_track)=coefficients(2);
                    mu_step_track(count_track)=coefficients(1);
                end

                % plot(xccdf, yccdf, '-','Color',0.8*[1,1,1], 'LineWidth', 0.5); % Plot training data.
                % yFit_tail_ind = polyval([mu_step_track(count_track),coef1_step_track(count_track)] , log(xcdf_tail));
                % plot((xcdf_tail), exp(yFit_tail_ind), '-','Color',0.8*[1,0,0], 'LineWidth', 0.5); % Plot training data.

            end
        end
    end


    %yyaxis right
    c_hist=histogram(-1*mu_step_track,n_bin,'Normalization','pdf','FaceAlpha',0,'EdgeAlpha',0,'FaceColor','k');
    plot(conv(c_hist.BinEdges, [0.5 0.5], 'valid'), c_hist.Values,'.-','Color',condition_colormap(g_list(i_g),:));

    %xlim([0,5]);
    ax = gca;
    % ax.YScale = 'log';
    % ax.XScale = 'log';
    xlabel('\mu');
    ylabel('PDF');
    title('\mu');
    box on;
    xline(1,'r--');
    xline(3,'r--');


    count_plot=count_plot+1;
    nexttile(count_plot);
    box on;
    hold on
    title('\lambda_1/\lambda_2');
    %%%%anisotropic persistent random walk
    %%%
    %
    % % close all
    % dt=1;
    % tlag=1;%time lag to calculate intial disp directions
    % param.dim=2;
    % param.saveres=0;
    % param.showfig=1;
    % param.outfigurenum=352;
    % param.markertype='o';
    % param.binnum=10;
    % param.dxmax=30;
    % param.binn=30;
    % param.tlag=1;
    % xys_control=[ID_series,time_series,x_series,y_series];
    %
    % for track=1:height(XY_data_modified)/t_width
    %     current_track_block=(track-1)*t_width+1:track*t_width;
    %     xys_cell{track}=xys_control(current_track_block,:);
    % end
    % [outp_aprw]=fit_APRW(xys_cell,dt,tlag,param);
    % %[outp_prw]=fit_PRW(xys_cell,dt,tlag,param);
    %
    % %[outp_msd]=get_MSD(xys_cell,dt,param);
    % %acf=get_ACF(xys_cell,dt,param);
    %
    % %[dR_of_theta]=get_dR_polarity(xys_cell,tlag,param);
    % %[feq,bin]=get_voft(xys,tlag0,param);
    % %[feq,bin]=get_dtheta_PDF(xys_cell,tloi);
    % %[feq,bin]=get_dR_PDF(xys_cell,tlag,param);
    %%%

    %%%%get moment of inertia and lambda 1 and lambda 2
    %function calc_lambda_moment()
    % % close all
    ratio_lambda=nan(sum(no_track_rep),1);
    count_track=0;
    for rep_k=1:length(rep_set)
        x_disp_series_rep=x_disp_series(rep_index==rep_set(rep_k));
        y_disp_series_rep=y_disp_series(rep_index==rep_set(rep_k));
        track_ID_rep=track_id_series(rep_index==rep_set(rep_k));
        movie_ID_rep=movie_id_series(rep_index==rep_set(rep_k));

        track_set=unique(track_ID_rep);
        movie_set=unique(movie_ID_rep);
        
        XY_data_modified_rep=XY_data_modified;
        XY_data_modified_rep(XY_data_modified_rep.rep~=rep_set(rep_k),:)=[];

        t_width_rep(rep_k,1)=nnz(XY_data_modified_rep.('Track_ID')==track_set(1) & XY_data_modified_rep.('MovieID')==movie_set(1) & XY_data_modified_rep.('rep')==rep_set(rep_k));
        if t_width_rep(rep_k,1) ~=0
            for track=1:length(x_disp_series_rep)/t_width_rep(rep_k,1)
                count_track=count_track+1;
                current_track_block=(track-1)*t_width_rep(rep_k,1)+1:track*t_width_rep(rep_k,1);

                x_disp_track=x_disp_series_rep(current_track_block,:);
                y_disp_track=y_disp_series_rep(current_track_block,:);

                I_xx=nansum(x_disp_track.*x_disp_track);
                I_xy=-1*nansum(x_disp_track.*y_disp_track);
                I_yx=-1*nansum(y_disp_track.*x_disp_track);
                I_yy=nansum(y_disp_track.*y_disp_track);

                Moment_I=[I_xx,I_xy;I_yx,I_yy];

                [lambda(count_track,:)]=(eig(Moment_I))';
                lambda_max(count_track)=max(lambda(count_track,:));
                lambda_min(count_track)=min(lambda(count_track,:));

                if lambda_min(count_track)~=0
                    ratio_lambda(count_track,1)=lambda_max(count_track)/lambda_min(count_track);
                end
                asphericity_num(count_track)=(0.5*(lambda(count_track,1)+lambda(count_track,2))^2-2*lambda(count_track,1)*lambda(count_track,2));
                asphericity_den(count_track)=(0.5*(lambda(count_track,1)+lambda(count_track,2))^2);
            end
        end
    end
    mean_asphericity=mean(asphericity_num)/mean(asphericity_den);%0.57 for RW, 1 for directed,0 for circular

    ratio_avg_lambda=mean(lambda_max)/mean(lambda_min);
    avg_ratio_lambda=mean(ratio_lambda);

    n_bin=15;
    ratio_lambda_hist=ratio_lambda;
    ratio_lambda_hist(isnan(ratio_lambda_hist))=[];
    ratio_lambda_hist((ratio_lambda_hist)==0)=[];
    c_hist=histogram((ratio_lambda_hist),n_bin,'Normalization','pdf','FaceAlpha',0,'EdgeAlpha',0,'FaceColor','k');
    plot(conv(c_hist.BinEdges, [0.5 0.5], 'valid'), c_hist.Values,'.-','Color',condition_colormap(g_list(i_g),:));
    xlabel('Log(\lambda_1/\lambda_2)');
    ylabel('PDF');
    % ax=gca;
    % ax.XScale='log';
    % ax.YScale='log';



    count_plot=count_plot+1;
    nexttile(count_plot);
    %hold on;
    % clear freq_RW_value
    freq_RW_name={'R2_alpha','R2_confined','R2_convect','R2_pure','R2_PRWM','alpha'};
    freq_RW_legend={'Linear','Confined RW','Directed RW','Pure Random Walk','Persistent RW','Levy Walk','Ballistic'};

    for freq_RW_index=1:3%length(freq_RW_name)
        freq_RW_name_k=freq_RW_name{freq_RW_index};
        freq_RW_value(freq_RW_index,g_list(i_g))=sum(Track_prop.(freq_RW_name_k)>=0.8);
    end

    freq_RW_value(4,g_list(i_g))=sum(Track_prop.('R2_pure')>=0.8 & Track_prop.('alpha')>=0.95 & Track_prop.('alpha')<=1.05);
    freq_RW_value(5,g_list(i_g))=sum(Track_prop.('R2_PRWM')>=0.8);
    freq_RW_value(6,g_list(i_g))=sum(Track_prop.('alpha')>=1 & Track_prop.('alpha')<=2);
    freq_RW_value(7,g_list(i_g))=sum(Track_prop.('alpha')>=2);


    bh=bar(freq_RW_value./sum(freq_RW_value,1),'FaceAlpha',1,'EdgeAlpha',0,'FaceColor',condition_colormap(g_list(i_g),:));
    %bh.FaceColor = {'flat','flat'};
    % bh(1).FaceColor = 'flat';
    % bh(2).FaceColor = 'flat';

    bh(1).FaceColor = condition_colormap(1,:);
    if size(bh)>1
        bh(2).FaceColor = condition_colormap(2,:);
    end

    % bh(1).CData = condition_colormap(1,:); % set the colors.
    % bh(2).CData = condition_colormap(2,:); % set the colors.

    xticks([1:7]);
    xticklabels(freq_RW_legend);
    ylim([0,1]);
    ylabel('Fraction of Tracks');
    box on;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Track_prop.beta_disp_acf=beta_disp_acf;
    Track_prop.beta_angle_acf=beta_angle_acf;
    Track_prop.x_kurtosis=x_kurtosis;
    Track_prop.y_kurtosis=y_kurtosis;
    Track_prop.x_skewness= x_skewness;
    Track_prop.y_skewness= y_skewness;
    Track_prop.mu_step_track=mu_step_track;
    Track_prop.ratio_lambda=ratio_lambda;

    Track_prop_k{1,k_list(i_k)}=Track_prop;

end

if export_on
    exportgraphics(fig_7,save_figures_as_a_pdf,'Append',true,'ContentType','image');
end

%legend at the top
%,'Color',condition_colormap(g_list(i_g),:)

%% Same plots above but with conditions side by side

%% Now assign each trajectories their population
% close all
count_plot=0;
% fig_2=figure(2);%,'Renderer', 'painters', 'Position', [300 50 800 600])
% fig_2.Position=[300 50 600 600];
% t=tiledlayout(4,2);
% t.TileSpacing = 'tight';

condition_colormap=lines(5);

for i_k=1:length(k_list)%:length(all_filenames)
    %group_Track_prop=combined_Track_prop(strcmp(combined_Track_prop_condition,(condition_names_g{1,g_list(i_g)})),:);
    %group_XY_data=combined_XY_data(strcmp(combined_XY_data_condition,(condition_names_g{1,g_list(i_g)})),:);
    i_k
    Track_prop=Track_prop_k{1,k_list(i_k)};
    XY_data_modified=XY_data_modified_k{1,k_list(i_k)};

    XY_data_modified(XY_data_modified.('Filter1')==0,:)=[];
    Track_prop(Track_prop.('Filter1')==0,:)=[];


    xPosition=XY_data_modified.('XPositionForPosition_1');
    x_series = XY_data_modified.('x')+0*xPosition;

    yPosition = XY_data_modified.('YPositionForPosition_1');
    y_series = XY_data_modified.('y')+0*yPosition;


    alpha_series=(XY_data_modified.('Alpha'));

    %%%% just need one member in the list which is present
    %that_one_member=min(XY_data_modified.('Track_ID'));
    %t_width=nnz(XY_data_modified.('Track_ID')==1 & XY_data_modified.('MovieID')==1);%%%%prone to error
    t_width=max(XY_data_modified.('time'));
    


    ds_series=XY_data_modified.step/(Track_prop.ActualFrameInterval_s_(1)/60);
    dtheta_series=XY_data_modified.angle;

    dtheta_final_series=XY_data_modified.TrackAngle;

    disp_series=XY_data_modified.tot_disp;
    x_disp_series=XY_data_modified.x_disp;
    y_disp_series=XY_data_modified.y_disp;

    dx_step_series=XY_data_modified.dx_step;
    dy_step_series=XY_data_modified.dy_step;

    time_series=XY_data_modified.time;
    ID_series=XY_data_modified.ID;

    count_plot=count_plot+1;
    %nexttile(1);

    % Define population criteria functions and corresponding column names
    criteriaAndColumns = {
        % 'RMC', @(x) (x >= 0 && x < inf),
        % 'med_speed', @(x) (x >= 0 && x < inf),
        % 'confinement', @(x) (x >= 0 && x < inf),
        % 'alpha', @(x) (x >= 0 && x <= inf),%1.8
        % 'no_of_spot', @(x) (x >= 50 && x <= inf),%20

        % 'cell_density',@(x) (x >= 0 && x <= inf) ,
        % 'norSpotDensity',@(x) (x >= 0 && x <= inf) ,%0.8
        %
        % 'track_density',@(x) (x >= 0 && x <= inf) ,
        % 'norTrackDensity',@(x) (x >= 0 && x <= inf) ,%0.8
        %
        % 'ZPositionForPosition_1',@(x) ((x)<=inf && (x)>=-inf),%-0.5
        %
        % 'In_or_out',@(x) ((x)==1),%-0.5
        %
        % 'track_mean_qual',@(x) ((x)>0),%-0.5

        'alpha', @(x) (x >= 1 && x <= inf),%20

        % Add more combined criteria and column name pairs for other columns as needed
        };

    % Initialize a logical filter with all 'true' values
    population_criteria = true(size(Track_prop, 1), 1);

    % Apply combined criteria to the specified columns
    for i = 1:size(criteriaAndColumns,1)
        columnName = criteriaAndColumns{i,1};
        criteriaFunction = criteriaAndColumns{i,2};

        columnCriteria = arrayfun(criteriaFunction, Track_prop.(columnName));
        population_criteria = population_criteria & columnCriteria;%%%&&  ||wont work
    end

    % Extract the filtered rows
    %ind_filteredData_k{1,k_list(i_k)} = Track_prop(population_criteria, :);
    Track_prop.population=population_criteria;
    population_criteria_k{1,k_list(i_k)}=population_criteria;
    Track_prop_k{1,k_list(i_k)}=Track_prop;


    current_population_criteria_XY=nan(height(XY_data_modified)/t_width,1);
    current_population_criteria=population_criteria_k{1,k_list(i_k)};
    for track=1:length(current_population_criteria)
        current_population_criteria_XY((track-1)*t_width+1:(track*t_width),1)=repmat(current_population_criteria(track),t_width,1);
    end

    XY_data_modified.population=current_population_criteria_XY;
    XY_data_modified_k{1,k_list(i_k)}=XY_data_modified;

end

%% Re grouping as some new variables have been added along the way

combined_Track_prop=[];
for i_g=1:length(g_list)
    combined_Track_prop=[combined_Track_prop;Track_prop_k{1,g_list(i_g)}];
end

combined_XY_data=[];
for i_g=1:length(g_list)%length(all_filenames)
    combined_XY_data=[combined_XY_data;XY_data_modified_k{1,k_list(i_g)}];
end


%% Now that the potential population have been made, evaluate other properties population-wise

% close all
close all
count_plot=0;
fig_8=figure(8);%,'Renderer', 'painters', 'Position', [300 50 800 600])
fig_8.Position=[50 50 1100 700];
% t=tiledlayout(2,8);
% t.TileSpacing = 'tight';

%header_name={'mean_speed','linearity','alpha','RMC','track_disp','mean_dirn_change'};
header_name={'alpha','beta_disp_acf','beta_angle_acf','x_kurtosis','y_kurtosis','x_skewness','y_skewness','mu_step_track','ratio_lambda'};

plot_these_data=header_name;
plot_these_data_lables={'\alpha','\beta_{disp}','\beta_{angle}','Kurtosis_X','Kurtosis_Y','Skewness_X','Skewness_Y','\mu','\lambda_{max}/\lambda_{min}'};
%plot_these_data_lables=header_name;

masterColumn = 'population';  % Replace with your actual master column name

weightColumn = 'track_t_length';  % Replace with your actual master column name
weightColumn = 'no_of_spot';  % Replace with your actual master column name


subplot_row=ceil(sqrt(length( ...
    plot_these_data)));
subplot_column=ceil((length(plot_these_data))/subplot_row);

% Create subplots
for i = 1:length(plot_these_data)
    columnName = plot_these_data{i};
    subplot(subplot_row, subplot_column, i);

    % group_Track_prop_k=Track_prop_modified;
    yData_combined=[];
    count_k=0;
    for i_g=1:length(g_list) %%%should be from 1

        if 1%ismember(k,[1,7,8])==1
            count_k=count_k+1;
            %group_Track_prop=group_Track_prop_k{1,k};
            combined_Track_prop_condition=combined_Track_prop.condition;
            group_Track_prop=combined_Track_prop(strcmp(combined_Track_prop_condition,(condition_names_g{1,g_list(i_g)})),:);
            group_Track_prop(group_Track_prop.Filter1==0,:)=[];

            xData = 1+0*group_Track_prop.(columnName);%filteredData.(columnName);
            yData = group_Track_prop.(columnName);
            yData_combined{1,count_k}=1*yData;
            master_column_data{1,count_k}=group_Track_prop.(masterColumn);%master column or alpha values
            weight_column_data{1,count_k}=group_Track_prop.(weightColumn);%weight column usually no of spots in a a trcak
            file_x_axis_label_k{1,count_k}=file_x_axis_label{1,g_list(i_g)};
        end
    end


    %yData_combined={yData_combined};
    % Color code points based on master column values
    %scatter(xData, yData, 30, 'filled');
    %colormap(colors);

    %visualizeDataWithOptions({yData,2*yData,3*yData});
    visualizeDataWithOptions(yData_combined,master_column_data,weight_column_data,'population');
    ax = gca;
    ax.YLabel.String = plot_these_data_lables{i};
    ax.XTick=linspace(1,length(yData_combined),length(yData_combined));
    ax.XTickLabels= file_x_axis_label_k;
    ax.XTickLabelRotation =0;
    ax.XLabel.FontSize = 5;
    if strcmp(columnName,'RMC')==1
        ax.YScale = 'log';
        ax.YTick=[0.0001,0.1,1,10,100,1000];
        %ax.YLim=[0,1];
    end

end

if export_on
    exportgraphics(fig_8,save_figures_as_a_pdf,'Append',true,'ContentType','image');
end

%% plotting distributions population wise

close all
%figure
yData_combined=[];
count_k=0;
%k_list=[1];

count_plot=0;
fig_9=figure(9);%,'Renderer', 'painters', 'Position', [300 50 800 600])
fig_9.Position=[50 150 1200 300];
t=tiledlayout(length(g_list),8);
t.TileSpacing = 'tight';

for i_g=1:2%length(g_list)%:length(all_filenames)
    combined_Track_prop_condition=combined_Track_prop.condition;
    combined_XY_data_condition=combined_XY_data.condition;
    group_Track_prop=combined_Track_prop(strcmp(combined_Track_prop_condition,(condition_names_g{1,g_list(i_g)})),:);
    group_XY_data=combined_XY_data(strcmp(combined_XY_data_condition,(condition_names_g{1,g_list(i_g)})),:);

    Track_prop=group_Track_prop;%Track_prop_k{1,k_list(i_k)};
    XY_data_modified=group_XY_data;%XY_data_modified_k{1,k_list(i_k)};

    Track_prop(Track_prop.('Filter1')==0,:)=[];
    XY_data_modified(XY_data_modified.('Filter1')==0,:)=[];

    xPosition=XY_data_modified.('XPositionForPosition_1');
    x_series = XY_data_modified.('x')+0*xPosition;

    yPosition = XY_data_modified.('YPositionForPosition_1');
    y_series = XY_data_modified.('y')+0*yPosition;


    alpha_series=(XY_data_modified.('Alpha'));
    t_width=nnz(XY_data_modified.('Track_ID')==1 & XY_data_modified.('MovieID')==20);%%%%prone to error


    ds_series=XY_data_modified.step/(Track_prop.ActualFrameInterval_s_(1)/60);
    dtheta_series=XY_data_modified.angle;

    dtheta_final_series=XY_data_modified.TrackAngle;

    disp_series=XY_data_modified.tot_disp;
    x_disp_series=XY_data_modified.x_disp;
    y_disp_series=XY_data_modified.y_disp;

    dx_step_series=XY_data_modified.dx_step;
    dy_step_series=XY_data_modified.dy_step;


    population_XY_filter=(XY_data_modified.('population'));

    %ds_series(~(XYTable.('Speed')>0))=nan;
    %dtheta_series(~(XYTable.('Speed')>0))=nan;

    ds_series1=ds_series;
    ds_series2=ds_series;
    ds_series3=ds_series;
    ds_series4=ds_series;
    ds_series5=ds_series;

    dtheta_series1=dtheta_series;
    dtheta_series2=dtheta_series;
    dtheta_series3=dtheta_series;
    dtheta_series4=dtheta_series;
    dtheta_series5=dtheta_series;




    filter_hist_list_1=(population_XY_filter==0);
    filter_hist_list_2=(population_XY_filter==1);
    filter_hist_list_3=~(population_XY_filter>100 & population_XY_filter<inf);
    filter_hist_list_4=~(population_XY_filter>0 & population_XY_filter<0.1);
    filter_hist_list_5=~(population_XY_filter>1 & population_XY_filter<inf);

    ds_series1(filter_hist_list_1)=nan;
    ds_series2(filter_hist_list_2)=nan;
    ds_series3(filter_hist_list_3)=nan;
    ds_series4(filter_hist_list_4)=nan;
    ds_series5(filter_hist_list_5)=nan;

    dtheta_series1(filter_hist_list_1)=nan;
    dtheta_series2(filter_hist_list_2)=nan;
    dtheta_series3(filter_hist_list_3)=nan;
    dtheta_series4(filter_hist_list_4)=nan;
    dtheta_series5(filter_hist_list_5)=nan;

    disp_series1=disp_series;
    disp_series2=disp_series;
    disp_series3=disp_series;
    disp_series4=disp_series;
    disp_series5=disp_series;


    disp_series1(filter_hist_list_1)=nan;
    disp_series2(filter_hist_list_2)=nan;
    disp_series3(filter_hist_list_3)=nan;
    disp_series4(filter_hist_list_4)=nan;
    disp_series5(filter_hist_list_5)=nan;

    x_disp_series1=x_disp_series;
    x_disp_series2=x_disp_series;
    x_disp_series3=x_disp_series;
    x_disp_series4=x_disp_series;
    x_disp_series5=x_disp_series;

    y_disp_series1=y_disp_series;
    y_disp_series2=y_disp_series;
    y_disp_series3=y_disp_series;
    y_disp_series4=y_disp_series;
    y_disp_series5=y_disp_series;



    x_disp_series1(filter_hist_list_1)=nan;
    x_disp_series2(filter_hist_list_2)=nan;
    x_disp_series3(filter_hist_list_3)=nan;
    x_disp_series4(filter_hist_list_4)=nan;
    x_disp_series5(filter_hist_list_5)=nan;


    y_disp_series1(filter_hist_list_1)=nan;
    y_disp_series2(filter_hist_list_2)=nan;
    y_disp_series3(filter_hist_list_3)=nan;
    y_disp_series4(filter_hist_list_4)=nan;
    y_disp_series5(filter_hist_list_5)=nan;



    %(alpha_quality_series>5)
    % ds_series(ds_series<=str2double((filt_data_ind.VoxelSizeX{1})))=nan;
    % dtheta_series(ds_series<=str2double((filt_data_ind.VoxelSizeX{1})))=nan;

    count_plot=count_plot+1;
    nexttile(count_plot)
    hold on;


    n_bin=10;
    N_obs=100;
    method_type=2;
    edge_value=edges_for_equal_count_histogram_afa(ds_series1,N_obs,method_type);

    histogram((ds_series1),n_bin,'Normalization','pdf','FaceAlpha',0.5,'EdgeAlpha',0,'FaceColor','k');
    % histogram((ds_series2),n_bin,'Normalization','pdf','FaceAlpha',0.5,'EdgeAlpha',0,'FaceColor','r');

    %histogram((ds_series1),'BinEdges',edge_value,'Normalization','pdf','FaceAlpha',0.5,'EdgeAlpha',0,'FaceColor','k');
    %histogram((ds_series2),'BinEdges',edge_value,'Normalization','pdf','FaceAlpha',0.5,'EdgeAlpha',0,'FaceColor','r');


    % histogram((ds_series2),n_bin,'Normalization','count','FaceAlpha',0.5,'EdgeAlpha',0);
    % histogram((ds_series3),n_bin,'Normalization','count','FaceAlpha',0.5,'EdgeAlpha',0);

    % histogram((ds_series3),50);
    % histogram((ds_series4),50);
    % histogram((ds_series5),50);

    % %normrnd vs lognrnd
    %
    % % r = gamrnd(a,b)
    %
    % %histogram(lognrnd(log(nanmean(ds_series)),log(nanstd(ds_series)),[1,nnz(~isnan(ds_series))]),30,'FaceAlpha',0.1,'EdgeAlpha',0);
    % %histogram(normrnd((nanmean(ds_series)),(nanstd(ds_series)),[1,nnz(~isnan(ds_series))]),30,'FaceAlpha',0.1,'EdgeAlpha',0);
    % mean_gamma_1=1.312;%nanmean(ds_series);
    % sd_gamma_1=8.433357e-8;%nanstd(ds_series);
    % gamma_a=(mean_gamma_1)/(sd_gamma_1);
    % gamma_b=(mean_gamma_1)/(sd_gamma_1)^2;
    % %histogram(gamrnd(gamma_a,gamma_b,[1,nnz(~isnan(ds_series))]),30,'FaceAlpha',0.1,'EdgeAlpha',0);
    % plot(linspace(0.00001,5,100),gampdf(linspace(0.00001,5,100),gamma_a,gamma_b),'g-');
    %
    %
    % mean_gamma_2=4.94;%nanmean(ds_series);
    % sd_gamma_2=3.89069;%nanstd(ds_series);
    % gamma_a=(mean_gamma_2)/(sd_gamma_2);
    % gamma_b=(mean_gamma_2)/(sd_gamma_2)^2;
    % %histogram(gamrnd(gamma_a,gamma_b,[1,floor(0.01*nnz(~isnan(ds_series)))]),30,'FaceAlpha',0.1,'EdgeAlpha',0);
    % plot(linspace(0.00001,5,100),gampdf(linspace(0.00001,5,100),gamma_a,gamma_b),'r-');
    %
    %
    % legend('Data','State 1','State 2');

    ylabel('PDF');
    xlabel('Step length (um)');
    box on
    %ylim([0,5000]);
    %set(gca,'XScale','log')
    %set(gca,'YScale','log')
    %xlim([0,10]);

    count_plot=count_plot+1;
    nexttile(count_plot)
    hold on;


    nbin_theta=12;
    dtheta_series1_mod=dtheta_series;
    %dtheta_series1_mod(dtheta_series1<=0 | isnan(dtheta_series1))=[];
    histogram((dtheta_series1),nbin_theta,'Normalization','pdf','FaceAlpha',0.5,'EdgeAlpha',0,'FaceColor','k');
    histogram((dtheta_series2),nbin_theta,'Normalization','pdf','FaceAlpha',0.5,'EdgeAlpha',0,'FaceColor','r');

    % histogram(abs(dtheta_series2),nbin_theta,'Normalization','count','FaceAlpha',0.5,'EdgeAlpha',0);
    % histogram(abs(dtheta_series3),nbin_theta,'Normalization','count','FaceAlpha',0.5,'EdgeAlpha',0);

    % kappa_vm=0.5;%concentration of mean
    % no_valid_dtheta_points=floor(1*nnz(~isnan(dtheta_series1_mod) & dtheta_series1_mod>0));
    % no_valid_dtheta_points=length(dtheta_series1_mod);
    % histogram(vmrand(3.136,1.698086,[1,no_valid_dtheta_points]),30,'FaceAlpha',0.5,'EdgeAlpha',0,'FaceColor','g');
    % histogram(vmrand(-3.1049,0.2409242,[1,floor(0.1*no_valid_dtheta_points)]),30,'FaceAlpha',0.5,'EdgeAlpha',0,'FaceColor','r');
    %
    % legend('Data','State 1','State 2');
    %
    ylabel('PDF');
    xlabel('Turning Angle (Rad)');

    set(gca,'XTick',-pi:pi/2:pi)
    set(gca,'XTickLabel',{'-\pi','-\pi/2','0','\pi/2','\pi'});
    box on
    %set(gca,'YScale','log')



    count_plot=count_plot+1;
    nexttile(count_plot)
    hold on

    [ycdf,xcdf] = cdfcalc(ds_series1);
    xccdf = xcdf;
    yccdf = 1-ycdf(1:end-1);
    yccdf(xcdf<=0)=[];
    xcdf(xcdf<=0)=[];
    coefficients = polyfit(log(xcdf),log(yccdf), 1);
    xFit = log(xccdf);%linspace(min(xcdf), max(xcdf), 1000);
    yFit = polyval(coefficients , xFit);
    plot(xcdf, yccdf, 'k.', 'LineWidth', 2); % Plot training data.
    hold on; % Set hold on so the next plot does not blow away the one we just drew.
    plot(exp(xFit), exp(yFit), 'k-', 'LineWidth', 1); % Plot fitted line.
    txt_slope=sprintf('Slope=%.2f',(-1*coefficients(1)));


    [ycdf,xcdf] = cdfcalc(ds_series2);
    xccdf = xcdf;
    yccdf = 1-ycdf(1:end-1);
    yccdf(xcdf<=0)=[];
    xcdf(xcdf<=0)=[];
    coefficients = polyfit(log(xcdf),log(yccdf), 1);
    xFit = log(xccdf);%linspace(min(xcdf), max(xcdf), 1000);
    yFit = polyval(coefficients , xFit);
    plot(xcdf, yccdf, 'r.', 'LineWidth', 2); % Plot training data.
    hold on; % Set hold on so the next plot does not blow away the one we just drew.
    plot(exp(xFit), exp(yFit), 'r-', 'LineWidth', 1); % Plot fitted line.
    txt_slope=sprintf('Slope=%.2f',(-1*coefficients(1)));


    %legend(txt_slope);
    xlim([0,150]);
    ylim([0,1]);


    ax = gca;
    ax.YScale = 'log';
    ax.XScale = 'log';
    xlabel('s (\mum)');
    ylabel('P(step length\geqs)');
    xticks(10.^(linspace(-8,2.5,5)));
    yticks(10.^(linspace(-8,0,5)));

    box on;

    count_plot=count_plot+1;
    nexttile(count_plot)
    hold on;
    c_hist=histogram((1)*disp_series1(1:end),'Normalization','pdf','FaceColor','k','FaceAlpha',0,'EdgeAlpha',0);%, 'DisplayStyle', 'stairs'
    plot(conv(c_hist.BinEdges, [0.5 0.5], 'valid'), c_hist.Values,'.-','Color','k');

    hold on;
    c_hist=histogram((1)*disp_series2(1:end),'Normalization','pdf','FaceColor','r','FaceAlpha',0,'EdgeAlpha',0);%, 'DisplayStyle', 'stairs'
    plot(conv(c_hist.BinEdges, [0.5 0.5], 'valid'), c_hist.Values,'.-','Color','r');


    xlabel('Displacement');
    ylabel('PDF');
    box on;
    %legend(file_x_axis_label);



    ax = gca;
    ax.YScale = 'log';
    ax.XScale = 'log';

    % xlim([0,500]);
    % ylim([0,1]);
    xticks(10.^(linspace(-8,3,5)));
    yticks(10.^(linspace(-8,0,5)));


    count_plot=count_plot+1;
    nexttile(count_plot)


    hold on
    nbin=50;
    edges_bin=linspace(-40,40,nbin);
    x_disp_series1(isnan(x_disp_series1))=[];
    c_hist=histogram(x_disp_series1(1:(end)),edges_bin,'Normalization','pdf','FaceColor','k','FaceAlpha',0.5,'EdgeAlpha',0);
    % plot(conv(c_hist.BinEdges, [0.5 0.5], 'valid'), c_hist.Values,'r-');


    x_disp_series2(isnan(x_disp_series2))=[];
    c_hist=histogram(x_disp_series2(1:(end)),edges_bin,'Normalization','pdf','FaceColor','r','FaceAlpha',0.5,'EdgeAlpha',0);
    % plot(conv(c_hist.BinEdges, [0.5 0.5], 'valid'), c_hist.Values,'r-');


    % gm = fitgmdist(x_disp_series(1:(end)),2);
    % % histogram(normrnd(gm.mu(1),gm.Sigma(1,1),[floor(gm.ComponentProportion(1)*(sum(~isnan(x_disp_series(1:(end)))))),1]),edges_bin,'FaceColor','r','FaceAlpha',0.5,'EdgeAlpha',0);
    % % histogram(normrnd(gm.mu(2),gm.Sigma(1,2),[floor(gm.ComponentProportion(2)*(sum(~isnan(x_disp_series(1:(end)))))),1]),edges_bin,'FaceColor','g','FaceAlpha',0.5,'EdgeAlpha',0);
    % %
    % plot(linspace(-40,40,100),normpdf(linspace(-40,40,100),gm.mu(1),gm.Sigma(1,1)),'r-');
    % plot(linspace(-40,40,100),normpdf(linspace(-40,40,100),gm.mu(2),gm.Sigma(1,2)),'g-');
    %
    %
    % lgd=legend('Data','Gaussian 1','Gaussian 2','Location','northoutside');
    % fontsize(lgd,6,'points')
    %lgd.NumColumns = 2;

    xlabel('X Displacement');
    ylabel('PDF');
    box on;

    % gmm_AIC=[];
    % options = statset('MaxIter',3000);
    % for gmm_realization=1:4
    %     gm = fitgmdist(x_disp_series(1:(end)),gmm_realization,'CovType','full','Options',options);
    %     gmm_AIC(gmm_realization)=gm.AIC;
    %
    % end


    % p = get(gca, 'Position');
    % h = axes('Parent', gcf, 'Position', [p(1)+0.75*p(3) p(2)+0.5*p(4) p(3)/5 p(4)/5]);
    % hold(h);
    %
    % plot(1:gmm_realization,gmm_AIC,'k-s','LineWidth',1);
    % xlabel('Components');
    % ylabel('AIC (dx)');
    % xticks(1:gmm_realization);
    % box on;
    % % ax = gca;
    % h.FontSize = 5;

    count_plot=count_plot+1;
    nexttile(count_plot)
    hold on;

    hqqp=qqplot(x_disp_series1(1:(end)));
    title('');
    xlabel('Normal Quantiles');
    ylabel('Sample Quantiles');
    hqqp(1).MarkerFaceColor = 'k'; %data
    hqqp(1).MarkerEdgeColor = 'k'; %data

    hqqp=qqplot(x_disp_series2(1:(end)));
    title('');
    xlabel('Normal Quantiles');
    ylabel('Sample Quantiles');
    hqqp(1).MarkerFaceColor = 'r'; %data
    hqqp(1).MarkerEdgeColor = 'r'; %data

    box on;

    count_plot=count_plot+1;
    nexttile(count_plot)
    hold on
    edges_bin=linspace(-40,40,nbin);
    y_disp_series1(isnan(y_disp_series1))=[];
    histogram(y_disp_series1(1:(end)),edges_bin,'Normalization','pdf','FaceColor','k','FaceAlpha',0.5,'EdgeAlpha',0);

    y_disp_series2(isnan(y_disp_series2))=[];
    histogram(y_disp_series2(1:(end)),edges_bin,'Normalization','pdf','FaceColor','r','FaceAlpha',0.5,'EdgeAlpha',0);


    % gm = fitgmdist(y_disp_series(1:end),2);
    %
    % plot(linspace(-40,40,100),normpdf(linspace(-40,40,100),gm.mu(1),gm.Sigma(1,1)),'r-');
    % plot(linspace(-40,40,100),normpdf(linspace(-40,40,100),gm.mu(2),gm.Sigma(1,2)),'g-');
    %
    %
    % %histogram(normrnd(gm.mu(1),gm.Sigma(1,1),[floor(gm.ComponentProportion(1)*(sum(~isnan(y_disp_series(1:end))))),1]),edges_bin,'FaceColor','r','FaceAlpha',0.5,'EdgeAlpha',0);
    % %histogram(normrnd(gm.mu(2),gm.Sigma(1,2),[floor(gm.ComponentProportion(2)*(sum(~isnan(y_disp_series(1:end))))),1]),edges_bin,'FaceColor','g','FaceAlpha',0.5,'EdgeAlpha',0);
    %
    % lgd=legend('Data','Gaussian 1','Gaussian 2','Location','northoutside');
    % fontsize(lgd,6,'points');

    xlabel('Y Displacement');
    ylabel('PDF');
    box on;



    gmm_AIC=[];
    options = statset('MaxIter',1000);
    for gmm_realization=1:4
        gm = fitgmdist(y_disp_series(1:(end)),gmm_realization,'CovType','full','Options',options);
        gmm_AIC(gmm_realization)=gm.AIC;
    end

    % p = get(gca, 'Position');
    % h = axes('Parent', gcf, 'Position', [p(1)+0.75*p(3) p(2)+0.5*p(4) p(3)/5 p(4)/5]);
    % hold(h);
    %
    % plot(1:gmm_realization,gmm_AIC,'k-s','LineWidth',1);
    % xlabel('Components');
    % ylabel('AIC (dy)');
    % xticks(1:gmm_realization);
    % box on;
    % h.FontSize = 5;




    count_plot=count_plot+1;
    nexttile(count_plot)


    hold on
    %y = pdf(gm,[-40:40]');
    %pd = y;%makedist('Weibull');
    hqqp=qqplot(y_disp_series1(1:(end)));
    %hqqp_fitted=qqplot(y_disp_series(1:(end)),pd);
    title('');
    xlabel('Normal Quantiles');
    ylabel('Sample Quantiles');
    hqqp(1).MarkerFaceColor = 'k'; %data
    hqqp(1).MarkerEdgeColor = 'k'; %data


    hqqp=qqplot(y_disp_series2(1:(end)));
    %hqqp_fitted=qqplot(y_disp_series(1:(end)),pd);
    title('');
    xlabel('Normal Quantiles');
    ylabel('Sample Quantiles');

    hqqp(1).MarkerFaceColor = 'r'; %data
    hqqp(1).MarkerEdgeColor = 'r'; %data
    box on;


end

%% colocalization plots


%filename_pre_red_full = [FilePath '\' filename_pre_red];
filename_pre_red=new_filename_individual(1:(end-32));


colocalization_plot_v8(filename_pre_red,XY_data_modified,t_width)

% exportgraphics(fig_9,save_figures_as_a_pdf,'Append',true,'ContentType','image');
% close all
%
%
% fig_10=figure(10);
% bar([1:10]);
% exportgraphics(fig_10,save_figures_as_a_pdf,'Append',true,'ContentType','image');

