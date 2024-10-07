close("*")

//path = "/Volumes/SarahANew/PDX_IM7/20220819/";
//ext = newArray("20220819_MayoPDX_IM7_10min_20x_2022_08_19__08_20_21__p");
//startp = newArray("1");
//maxp = newArray("12");
//Zstartn = "3 1 3 3 2 3 3 3 3 3 4 4";
//Zendn = "8 9 9 9 9 8 7 8 9 9 9 9";

//path="F:/Aamir experiment data/Mice brain slices/Mouse T cells in brain slices/";
path="F:/Aamir experiment data/Mice brain slices/Human T cells in brain slices/";

///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

/////////// Folders

folder_name=newArray(

//Mouse T cells
"Zen_21Jun23_Tcells_in_brain/"//1
,"Zen_22Jun23_Tcells_in_brain/"//2
,"Zen_22Jun23_Tcells_in_brain/"//3
,"Zen_25Jun23_Tcells_in_brain/"//4
,"Zen_25Jun23_Tcells_in_brain/"//5

,"Zen_27Jun23_Tcells_in_brain/"//6
,"Zen_27Jun23_Tcells_in_brain/"//7
,"Zen_27Jun23_Tcells_in_brain/"//8
,"Zen_27Jun23_Tcells_in_brain/"//9

,"Zen_22Aug23_MTcells_in_the_brain_high_res/"//10
,"Zen_22Aug23_MTcells_in_the_brain_high_res/"//11

,"Zen_25Aug23_MTcells_in_brain_slices_embd_collagen/"//12
,"Zen_25Aug23_MTcells_in_brain_slices_embd_collagen/"//13

,"Zen_23Aug23_MTcells_in_the_brain_high_res_rep2/"//14


//IM7 
,"Zen_28Jun23_Tcells_in_brain_20ug_ml_IM7/" //15
,"Zen_30Jun23_Tcells_in_brain_100ug_ml_IM7/" //16
,"Zen_21Sep23_Tcells_in_the_bran_IM7_20ugml_rep2/"//17//T cells prolly died
,"Zen_29Sep23_Tcells_in_brain_slices_full_IM7_block_120ul_in_brain_20x2_in_T/"//18
,"Zen_01Oct23_Tcells_in_brain_CD44_block_120ul_brain_slices_20ul_in_T/"//19


//CalA
,"Zen_09Nov23_Tcells_in_brain_CalA_1nM_rep1/"//20
,"Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2/"//21//it has two sets of big data
,"Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep3/"//22//this is empty


//LatA
,"Zen_08Nov23_Tcells_in_brain_LatA_500nM_rep1/"//23
,"Zen_08Nov23_Tcells_in_brain_LatA_500nM_rep2/"//24
,"Zen_15Nov23_Tcells_in_brain_LatA_500nM_rep3/"//25


//Nocodazole
,"Zen_15Jul23_Tcells_in_brain_1000uM_Nocadazole/"//26
,"Zen_12Jul23_Tcells_in_brain_10uM_Nocadazole/"//27
,"Zen_30Sep23_Tcells_in_brain_10uM_Nocodazole/"//28
,"Zen_11Oct23_Tcells_in_brain_10uM_Nocodazole_rep3/"//29


//Taxol
,"Zen_14Jul23_Tcells_in_brain_100nM_Taxol/"//30
,"Zen_11Jul23_Tcells_in_brain_1000nM_Taxol/"//31
,"Zen_11Jul23_Tcells_in_brain_1000nM_Taxol/"//32
,"Zen_29Sep23_Tcells_in_brain_Taxol_100nM/"//33
,"Zen_10Oct23_Tcells_in_brain_Taxol_100nM_Rep3/"//34


// Human T cells from Joseph
,"Zen_29Jul23_RhoA_HTcells_in_brain/"//35
,"Zen_29Jul23_RhoA_HTcells_in_brain/"//36

,"Zen_24Jul23_HTcells_in_brain_no_incubation/"//37
,"Zen_21Jul23_HTcells_in_brain_NoCO2/"//38
,"Zen_20Jul23_HTcells_in_brain/"//39


// Human CAR T cells from COH
,"Zen_17May24_CART_COH_in_the_brain_rep1/"//40
,"Zen_18May24_CART_COH_in_the_brain_rep3_IM7_rep1/"//41
,"Zen_20May24_CART_COH_in_the_brain_IM7_rep2_rep3/"//42
,"Zen_28Jun24_CART_COH_in_the_brain_rep4_im7_rep4/"//43

,"Zen_05Jun24_CART_COH_blebb_10uM_cRGD_1uM_rep1/"//44
,"Zen_06Jun24_CART_COH_blebb_10uM_cRGD_1uM_rep2/"//45
);


//////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////// Sub folders


ext_series=newArray(

//Mouse T cells
"Zen_21Jun23_Tcells_in_brain_2023_06_21__19_02_26__p"//1//frame=100maxp_number=4//100//4
,"Zen_22Jun23_Tcells_in_brain_2023_06_22__18_08_10__p"//2//frame=100maxp_number=4//100//4
,"Zen_22Jun23_Tcells_in_brain_rep3_2023_06_22__23_31_59__p"//3//frame=100maxp_number=4//100//4
,"Zen_25Jun23_Tcells_in_brain_2023_06_25__19_01_09__p"//4//frame=55maxp_number=14//100(55)//14
,"Zen_25Jun23_Tcells_in_brain_2023_06_25__21_01_08__p"//5//frame=100maxp_number=14//100//14

,"Zen_27Jun23_Tcells_in_brain_35ul_50uM_Cal_2023_06_28__00_14_13__p"//6//1//frame=80maxp_number=14//80//14
,"Zen_27Jun23_Tcells_in_brain_2023_06_27__20_43_29__p"//7//frame=50maxp_number=13//50//13
,"Zen_27Jun23_Tcells_in_brain_2023_06_27__22_17_36__p"//8//frame=30maxp_number=15//50(30)//15
,"Zen_27Jun23_Tcells_in_brain_2023_06_27__22_51_21__p"//9//frame=50maxp_number=15//50//15

,"Zen_22Aug23_MTcells_in_the_brain_high_res_2023_08_22__19_06_19__p"//10//frame=60maxp_number=17//60//17
,"Zen_22Aug23_MTcells_in_the_brain_high_res_a_day_aftr_2023_08_23__19_02_42__p"//11//frame=100maxp_number=16//100//16

,"Zen_25Aug23_MTcells_in_brain_slices_embd_collagen_2023_08_25__20_34_46__p"//12//frame=100maxp_number=19//100//19
,"Zen_25Aug23_MTcells_in_brain_slices_embd_collagen_2023_08_26__01_28_30__p"//13//frame=400maxp_number=16//400//16

,"Zen_23Aug23_MTcells_in_the_brain_high_res_3hr_2023_08_23__22_40_50__p"//14//frame=73maxp_number=18//73//18


//IM7
,"Zen_28Jun23_Tcells_in_brain_20ugml_IM7apriori_2023_06_28__04_04_23__p"//15//frame=150
,"Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49__p"//16//frame=100
,"Zen_21Sep23_Tcells_in_the_bran_IM7_20ugml_rep2_2023_09_21__21_46_45__p"//17//frame=73maxp_number=14//t cells proll died
,"en_29Sep23_Tcells_in_brain_slices_full_IM7_block_120ug_in_brain_20x2_in_T_3hr_2023_09_29__02_48_37__p"//18//frame=2000maxp_number=22
,"Zen_01Oct23_Tcells_in_brain_CD44_block_120ul_brain_slices_20ul_in_T_2023_10_01__05_53_53__p"//19//frame=10000maxp_number=10000
 

// CalA
,"Zen_09Nov23_Tcells_in_brain_CalA_1nM_rep1_2023_11_09__20_07_06__p"//20//
,"Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37__p"//21//
,"Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__15_10_26__p"//22//No files


// LatA
,"Zen_08Nov23_Tcells_in_brain_LatA_500nM_rep1_2023_11_08__01_56_23__p"//23//
,"Zen_08Nov23_Tcells_in_brain_LatA_500nM_rep2_2023_11_08__12_53_43__p"//24//
,"Zen_15Nov23_Tcells_in_brain_LatA_500nM_rep3_2023_11_15__01_47_09__p"//25//


// Nocodazole
,"Zen_15Jul23_Tcells_in_brain_1000uM_Nocadazole_2023_07_14__23_27_53__p"//26//frame=100
,"Zen_12Jul23_Tcells_in_brain_10uM_Nocadazole_2023_07_13__00_56_57__p"//27//frame=100
,"Zen_30Sep23_Tcells_in_brain_10uM_Nocodazole_2023_10_01__02_20_18__p"//28//
,"Zen_11Oct23_Tcells_in_brain_10uM_Nocodazole_rep3_2023_10_11__23_10_58__p"//29//


// Taxol
,"Zen_14Jul23_Tcells_in_brain_100nM_Taxol_2023_07_14__01_08_06__p"//30//frame=100
,"Zen_11Jul23_Tcells_in_brain_1000nM_Taxol_2023_07_12__02_31_38__p"//31//frame=100//3-100
,"Zen_11Jul23_Tcells_in_brain_control_2023_07_12__01_10_08__p"//32//frame=50
,"en_29Sep23_Tcells_in_brain_Taxol_100nM_2023_09_30__06_00_08__p"//33 //1//frames only, nothing after that
,"Zen_10Oct23_Tcells_in_brain_Taxol_100nM_Rep3_2023_10_10__23_44_47__p" //34 //1//frames only, nothing after that


// human T cells
,"Zen_29Jul23_RhoA_HTcells_in_brain_2023_07_29__01_18_16__p"//35//frame=231maxp_number=22//231//22
,"Zen_29Jul23_RhoA_HTcells_in_brain_18hr_later_2023_07_29__20_34_26__p"//36//frame=9maxp_number=22//9//22

,"Zen_24Jul23_HTcells_in_brain_no_incubation_2023_07_25__00_24_15__p"//37//frame=169maxp_number=16//169//16
,"Zen_21Jul23_HTcells_in_brain_NoCO2_2023_07_21__21_57_50__p"//38//frame=150maxp_number=19//150//19
,"Zen_20Jul23_HTcells_in_brain_2023_07_20__17_21_30__p"//39//frame=200maxp_number=19//200//19


// Human CAR T cells from COH
,"Zen_17May24_CART_COH_in_the_brain_rep1_2024_05_18__03_31_48__p"//40//frame=200//maxp_number=24
,"Zen_18May24_CART_COH_in_the_brain_rep3_IM7_rep1_13_onward_2024_05_18__11_04_50__p"//41//frame=200//maxp_number=24
,"Zen_20May24_CART_COH_in_the_brain_IM7_rep2_rep3_2024_05_20__21_13_17__p"//42//frame=200//maxp_number=28
,"Zen_28Jun24_CART_COH_in_the_brain_rep4_im7_rep4_2024_06_28__18_13_29__p"//43//frame=200//maxp_number=24

,"Zen_05Jun24_CART_COH_blebb_10uM_cRGD_1uM_rep1_2024_06_05__22_00_12__p"//44//frame=400//maxp_number=24
,"Zen_06Jun24_CART_COH_blebb_10uM_cRGD_1uM_rep2_2024_06_06__21_31_00"//45//frame=169maxp_number=16//need to split into positions
);


///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

//ext=newArray("");
//frame=100;
//frame=1500;//maxp_number=10000;
//maxp_number=2;//200000;
//startp = newArray("1");
//maxp = newArray(""+maxp_number);
end_frame=newArray(
 100
,100
,100
,50//55
,100
,80
,50
,30
,50
,60
,100
,100
,400
,70//73
,150
,100
,70//73
,100//200
,100
,200
,90
,100
,200
,200
,200
,100
,100
,100
,150
,100
,100
,50
,120
,120
,200//231
,8//9
,150//169
,150
,200

// CART from 40 onwaedrs
,200
,200
,200
,200

,400
,00
);

start_frame=newArray(
 1
,1
,1
,1
,1
,1
,1
,1
,1
,1
,1
,1
,1
,1
,1
,1
,1
,1
,1
,1
,1
,1
,15
,1
,1
,1
,1
,1
,1
,1
,1
,1
,1
,1
,1
,1
,1
,1
,1
// CART from 40 onwaedrs

,1
,1
,1
,1

,1
,1
);


startp = 1;
maxp=newArray(
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

// CART from 40 onwaedrs
,24
,24
,28
,24

,24
,0
);


no_frame_afa=1;
//slice_keeper="first=1 last="+no_frame_afa+" increment=1" 
// you might have to change this to remove first few and last few slides for some files


//Zstartn = "1 1";
//Zendn = "3 3";

trial_Zstartn="2";//check this
trial_Zendn="3";
for(mm=0;mm<50-1;mm++){
	trial_Zstartn=trial_Zstartn+" 2";
	trial_Zendn=trial_Zendn+" 3";
	}
	
Z_kept="Z23";

Zstartn=trial_Zstartn;
Zendn=trial_Zendn;

//print(Zstartn)
//print(Zendn)

Zstartvals = split(Zstartn);
Zendvals = split(Zendn);


//GreenTimeVals = newArray("1-"+frame,"1-"+frame);
//GreenTimeVals = newArray("6-26", "6-26", "6-46", "6-46","6-26", "6-26","1-22", "9-20","1-20","1-46","1-46","1-46");
c = 0;

ext=ext_series;//to call the file, you use this
ext_p_removed=newArray(lengthOf(ext_series));


//print(ext_p_removed)

for (i=41-1; i<=(0*lengthOf(ext)+48-1); i++) {
	
	slice_keeper="first="+start_frame[i]+" last="+end_frame[i]+" increment=1";
	//GreenTime = GreenTimeVals[i];
	current_ext=ext_series[i];
	ext_p_removed[i]=substring(current_ext,0,lengthOf(current_ext)-2); // to save the file you use this
	
	//for (j=parseInt(startp[i]); j<parseInt(maxp[i])+1; j++){

	for (j=parseInt(startp); j<parseInt(maxp[i])*1+1; j++){
		print("j=", j);
		close("*");
		Zstart = Zstartvals[j-1];
		Zend = Zendvals[j-1];
		//Zend = substring(Zendvals[i],j-startp[i], j-startp[i]+1);
		print("zstart" + Zstart + " Zend" + Zend);
		//GreenTime = GreenTimeVals[j-1];

		if (parseInt(j)<10){
			p="0"+j;} 
		else { p=j; }
		
		if (maxp[i]<10){
			p=""+j;}
		
		print("Calculating p " + p );
		print("Bio-Formats Importer", "open=" + path+folder_name[i]+ext[i]+ p +".lsm");
		
		run("Bio-Formats Importer", "open=[" + path+folder_name[i] + ext[i] + p +".lsm]" + " autoscale color_mode=Default display_metadata view=Hyperstack stack_order=XYCZT");
        //run("Bio-Formats Importer", "open="+"[H:/Aamir experiment data/Mice brain slices/Mouse T cells in brain slices/Zen_21Jun23_Tcells_in_brain/Zen_21Jun23_Tcells_in_brain_2023_06_21__19_02_26__p1.lsm]"+ " autoscale color_mode=Default view=Hyperstack stack_order=XYCZT");
		
		selectWindow("Original Metadata - "+ext[i] + p +".lsm");
		//Table.deleteRows(13, 13);
		meta_data_address=path+folder_name[i]+ext_p_removed[i]+Z_kept+"_p"+ p +"_MD.csv";
		saveAs("Text",meta_data_address);
		run("Read and Write Excel");
		close("Original Metadata - "+ext[i] +p+".lsm");
		
		rename(ext[i]+".lsm");
		
		
		
		run("Z Project...", "start=" + Zstart + " stop=" + Zend + " projection=[Max Intensity] all");
		run("Split Channels");
		close(path+folder_name[i]+ext[i]+ p +".lsm");
				
		selectWindow("C1-MAX_"+ext[i] +".lsm");
		//selectWindow("C1-MAX_"+path+ext[i]+ p +".lsm");

		//run("Enhance Contrast", "saturated=0.35");
		//run("Make Substack...", "frames="+GreenTime);
		run("Slice Keeper", slice_keeper);
		close("C1-MAX_"+ext[i] +".lsm");

		run("Re-order Hyperstack ...", "channels=[Channels (c)] slices=[Frames (t)] frames=[Slices (z)]");
		saveAs("Tiff", path+folder_name[i]+ext_p_removed[i]+Z_kept+"_p"+ p+"_red.tif");
		close("C1-MAX_"+ext[i] +".lsm");

		selectWindow("C2-MAX_"+ext[i] +".lsm");
		//run("Enhance Contrast", "saturated=0.35");
		//run("Make Substack...", "frames="+GreenTime);
		run("Slice Keeper", slice_keeper);
		close("C1-MAX_"+ext[i] +".lsm");
		run("Re-order Hyperstack ...", "channels=[Channels (c)] slices=[Frames (t)] frames=[Slices (z)]");
		saveAs("Tiff", path+folder_name[i]+ext_p_removed[i]+Z_kept+"_p"+ p +"_green.tif");
		close("*");

	}
	
}

