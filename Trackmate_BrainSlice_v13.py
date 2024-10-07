import sys

from ij import IJ
from ij import WindowManager

from fiji.plugin.trackmate import Model
from fiji.plugin.trackmate import Settings
from fiji.plugin.trackmate import TrackMate
from fiji.plugin.trackmate import SelectionModel
from fiji.plugin.trackmate import Logger
from fiji.plugin.trackmate.detection import LogDetectorFactory
from fiji.plugin.trackmate.detection import ThresholdDetectorFactory
from fiji.plugin.trackmate.tracking.jaqaman import LAPUtils# new definitions
from fiji.plugin.trackmate.tracking.jaqaman import SparseLAPTrackerFactory #new definitions
from fiji.plugin.trackmate.gui.displaysettings import DisplaySettingsIO

from fiji.plugin.trackmate.gui.displaysettings.DisplaySettings import TrackMateObject


import fiji.plugin.trackmate.visualization.hyperstack.HyperStackDisplayer as HyperStackDisplayer
import fiji.plugin.trackmate.features.FeatureFilter as FeatureFilter
import fiji.plugin.trackmate.io.TmXmlWriter as TmXmlWriter
#import fiji.plugin.trackmate.util.TMUtils.otsuThreshold

from fiji.plugin.trackmate.action import ExportTracksToXML
from os import listdir
from ij import IJ
import java.io.File as File
from loci.plugins import BF
#from ij import setAutoThreshold

import ij.plugin.ZProjector as ZProjector
#import scyjava as sj

# import ZProjector
#ZProjector = sj.jimport("ij.plugin.ZProjector")()



import ij.plugin.HyperStackConverter as HyperStackConverter


# We have o do the following to avoid errors with UTF8 chars generated in 
# TrackMate that will mess with our Fiji Jython.


# Get currently selected image
# imp = WindowManager.getCurrentImage()
#imp = IJ.openImage('https://fiji.sc/samples/FakeTracks.tif')
#imp.show()

#########################################################################################################################
to_avoid = [
 (3, 2)
,(3, 3)
,(3, 4)
,(3, 7)
,(3, 8)
,(4, 2)
,(4, 4)
,(4, 8)
,(35,9)
]; 

#########################################################################################################################
#########################################################################################################################

#path="H:/Aamir experiment data/PA Gels/Human T cells on 2D gels/"

#H:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_21Jun23_Tcells_in_brain

#path="F:/Aamir experiment data/Mice brain slices/Mouse T cells in brain slices/"
path="F:/Aamir experiment data/Mice brain slices/Human T cells in brain slices/"

#########################################################################################################################
#########################################################################################################################

folder_name=[

##Mouse T cells
"Zen_21Jun23_Tcells_in_brain/"##1
,"Zen_22Jun23_Tcells_in_brain/"##2
,"Zen_22Jun23_Tcells_in_brain/"##3
,"Zen_25Jun23_Tcells_in_brain/"##4
,"Zen_25Jun23_Tcells_in_brain/"##5

,"Zen_27Jun23_Tcells_in_brain/"##6
,"Zen_27Jun23_Tcells_in_brain/"##7
,"Zen_27Jun23_Tcells_in_brain/"##8
,"Zen_27Jun23_Tcells_in_brain/"##9

,"Zen_22Aug23_MTcells_in_the_brain_high_res/"##10
,"Zen_22Aug23_MTcells_in_the_brain_high_res/"##11

,"Zen_25Aug23_MTcells_in_brain_slices_embd_collagen/"##12
,"Zen_25Aug23_MTcells_in_brain_slices_embd_collagen/"##13

,"Zen_23Aug23_MTcells_in_the_brain_high_res_rep2/"##14


##IM7 
,"Zen_28Jun23_Tcells_in_brain_20ug_ml_IM7/" ##15
,"Zen_30Jun23_Tcells_in_brain_100ug_ml_IM7/" ##16
,"Zen_21Sep23_Tcells_in_the_bran_IM7_20ugml_rep2/"##17##T cells prolly died
,"Zen_29Sep23_Tcells_in_brain_slices_full_IM7_block_120ul_in_brain_20x2_in_T/"##18
,"Zen_01Oct23_Tcells_in_brain_CD44_block_120ul_brain_slices_20ul_in_T/"##19


##CalA
,"Zen_09Nov23_Tcells_in_brain_CalA_1nM_rep1/"##20
,"Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2/"##21##it has two sets of big data ##not anymore
,"Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep3/"##22##this is empty


##LatA
,"Zen_08Nov23_Tcells_in_brain_LatA_500nM_rep1/"##23
,"Zen_08Nov23_Tcells_in_brain_LatA_500nM_rep2/"##24
,"Zen_15Nov23_Tcells_in_brain_LatA_500nM_rep3/"##25


##Nocodazole
,"Zen_15Jul23_Tcells_in_brain_1000uM_Nocadazole/"##26
,"Zen_12Jul23_Tcells_in_brain_10uM_Nocadazole/"##27
,"Zen_30Sep23_Tcells_in_brain_10uM_Nocodazole/"##28
,"Zen_11Oct23_Tcells_in_brain_10uM_Nocodazole_rep3/"##29


##Taxol
,"Zen_14Jul23_Tcells_in_brain_100nM_Taxol/"##30
,"Zen_11Jul23_Tcells_in_brain_1000nM_Taxol/"##31
,"Zen_11Jul23_Tcells_in_brain_1000nM_Taxol/"##32
,"Zen_29Sep23_Tcells_in_brain_Taxol_100nM/"##33
,"Zen_10Oct23_Tcells_in_brain_Taxol_100nM_Rep3/"##34


## Human T cells
,"Zen_29Jul23_RhoA_HTcells_in_brain/"##35
,"Zen_29Jul23_RhoA_HTcells_in_brain/"##36

,"Zen_24Jul23_HTcells_in_brain_no_incubation/"##37
,"Zen_21Jul23_HTcells_in_brain_NoCO2/"##38
,"Zen_20Jul23_HTcells_in_brain/"##39


## Human CAR T cells from COH
,"Zen_17May24_CART_COH_in_the_brain_rep1/"##40
,"Zen_18May24_CART_COH_in_the_brain_rep3_IM7_rep1/"##41
,"Zen_20May24_CART_COH_in_the_brain_IM7_rep2_rep3/"##42
,"Zen_28Jun24_CART_COH_in_the_brain_rep4_im7_rep4/"##43

,"Zen_05Jun24_CART_COH_blebb_10uM_cRGD_1uM_rep1/"##44
,"Zen_06Jun24_CART_COH_blebb_10uM_cRGD_1uM_rep2/"##45


];


##################################################################
################################################################## Sub folders


ext_series=[

##Mouse T cells
"Zen_21Jun23_Tcells_in_brain_2023_06_21__19_02_26_Z23_p"##1##frame=100maxp_number=4##100##4
,"Zen_22Jun23_Tcells_in_brain_2023_06_22__18_08_10_Z23_p"##2##frame=100maxp_number=4##100##4
,"Zen_22Jun23_Tcells_in_brain_rep3_2023_06_22__23_31_59_Z23_p"##3##frame=100maxp_number=4##100##4
,"Zen_25Jun23_Tcells_in_brain_2023_06_25__19_01_09_Z23_p"##4##frame=55maxp_number=14##100(55)##14 ## error on p02
,"Zen_25Jun23_Tcells_in_brain_2023_06_25__21_01_08_Z23_p"##5##frame=100maxp_number=14##100##14

,"Zen_27Jun23_Tcells_in_brain_35ul_50uM_Cal_2023_06_28__00_14_13_Z23_p"##6##1##frame=80maxp_number=14##80##14
,"Zen_27Jun23_Tcells_in_brain_2023_06_27__20_43_29_Z23_p"##7##frame=50maxp_number=13##50##13
,"Zen_27Jun23_Tcells_in_brain_2023_06_27__22_17_36_Z23_p"##8##frame=30maxp_number=15##50(30)##15
,"Zen_27Jun23_Tcells_in_brain_2023_06_27__22_51_21_Z23_p"##9##frame=50maxp_number=15##50##15

,"Zen_22Aug23_MTcells_in_the_brain_high_res_2023_08_22__19_06_19_Z23_p"##10##frame=60maxp_number=17##60##17
,"Zen_22Aug23_MTcells_in_the_brain_high_res_a_day_aftr_2023_08_23__19_02_42_Z23_p"##11##frame=100maxp_number=16##100##16

,"Zen_25Aug23_MTcells_in_brain_slices_embd_collagen_2023_08_25__20_34_46_Z23_p"##12##frame=100maxp_number=19##100##19
,"Zen_25Aug23_MTcells_in_brain_slices_embd_collagen_2023_08_26__01_28_30_Z23_p"##13##frame=400maxp_number=16##400##16

,"Zen_23Aug23_MTcells_in_the_brain_high_res_3hr_2023_08_23__22_40_50_Z23_p"##14##frame=73maxp_number=18##73##18


##IM7
,"Zen_28Jun23_Tcells_in_brain_20ugml_IM7apriori_2023_06_28__04_04_23_Z23_p"##15##frame=150
,"Zen_30Jun23_Tcells_in_brain_100ugml_IM7apriori_3hrs_2023_06_30__04_56_49_Z23_p"##16##frame=100
,"Zen_21Sep23_Tcells_in_the_bran_IM7_20ugml_rep2_2023_09_21__21_46_45_Z23_p"##17##frame=73maxp_number=14##t cells proll died
,"en_29Sep23_Tcells_in_brain_slices_full_IM7_block_120ug_in_brain_20x2_in_T_3hr_2023_09_29__02_48_37_Z23_p"##18##frame=2000maxp_number=22
,"Zen_01Oct23_Tcells_in_brain_CD44_block_120ul_brain_slices_20ul_in_T_2023_10_01__05_53_53_Z23_p"##19##frame=10000maxp_number=10000
 

## CalA
,"Zen_09Nov23_Tcells_in_brain_CalA_1nM_rep1_2023_11_09__20_07_06_Z23_p"##20##
,"Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__13_03_37_Z23_p"##21##
,"Zen_16Nov23_Tcells_in_brain_CalA_1nM_rep2_2023_11_16__15_10_26_Z23_p"##22##


## LatA
,"Zen_08Nov23_Tcells_in_brain_LatA_500nM_rep1_2023_11_08__01_56_23_Z23_p"##23##
,"Zen_08Nov23_Tcells_in_brain_LatA_500nM_rep2_2023_11_08__12_53_43_Z23_p"##24##
,"Zen_15Nov23_Tcells_in_brain_LatA_500nM_rep3_2023_11_15__01_47_09_Z23_p"##25##


## Nocodazole
,"Zen_15Jul23_Tcells_in_brain_1000uM_Nocadazole_2023_07_14__23_27_53_Z23_p"##26##frame=100
,"Zen_12Jul23_Tcells_in_brain_10uM_Nocadazole_2023_07_13__00_56_57_Z23_p"##27##frame=100
,"Zen_30Sep23_Tcells_in_brain_10uM_Nocodazole_2023_10_01__02_20_18_Z23_p"##28##
,"Zen_11Oct23_Tcells_in_brain_10uM_Nocodazole_rep3_2023_10_11__23_10_58_Z23_p"##29##


## Taxol
,"Zen_14Jul23_Tcells_in_brain_100nM_Taxol_2023_07_14__01_08_06_Z23_p"##30##frame=100
,"Zen_11Jul23_Tcells_in_brain_1000nM_Taxol_2023_07_12__02_31_38_Z23_p"##31##frame=100##3-100
,"Zen_11Jul23_Tcells_in_brain_control_2023_07_12__01_10_08_Z23_p"##32##frame=50
,"en_29Sep23_Tcells_in_brain_Taxol_100nM_2023_09_30__06_00_08_Z23_p"##33 ##1##frames only, nothing after that
,"Zen_10Oct23_Tcells_in_brain_Taxol_100nM_Rep3_2023_10_10__23_44_47_Z23_p" ##34 ##1##frames only, nothing after that


## human T cells
,"Zen_29Jul23_RhoA_HTcells_in_brain_2023_07_29__01_18_16_Z23_p"##35##frame=231maxp_number=22##231##22
,"Zen_29Jul23_RhoA_HTcells_in_brain_18hr_later_2023_07_29__20_34_26_Z23_p"##36##frame=9maxp_number=22##9##22

,"Zen_24Jul23_HTcells_in_brain_no_incubation_2023_07_25__00_24_15_Z23_p"##37##frame=169maxp_number=16##169##16
,"Zen_21Jul23_HTcells_in_brain_NoCO2_2023_07_21__21_57_50_Z23_p"##38##frame=150maxp_number=19##150##19
,"Zen_20Jul23_HTcells_in_brain_2023_07_20__17_21_30_Z23_p"##39##frame=200maxp_number=19##200##19


## Human CAR T cells from COH
,"Zen_17May24_CART_COH_in_the_brain_rep1_2024_05_18__03_31_48_Z23_p"##40//frame=200//maxp_number=24
,"Zen_18May24_CART_COH_in_the_brain_rep3_IM7_rep1_13_onward_2024_05_18__11_04_50_Z23_p"##41//frame=200//maxp_number=24
,"Zen_20May24_CART_COH_in_the_brain_IM7_rep2_rep3_2024_05_20__21_13_17_Z23_p"##42//frame=200//maxp_number=28
,"Zen_28Jun24_CART_COH_in_the_brain_rep4_im7_rep4_2024_06_28__18_13_29_Z23_p"##43//frame=200//maxp_number=24

,"Zen_05Jun24_CART_COH_blebb_10uM_cRGD_1uM_rep1_2024_06_05__22_00_12_Z23_p"##44//frame=400//maxp_number=24
,"Zen_06Jun24_CART_COH_blebb_10uM_cRGD_1uM_rep2_2024_06_06__21_31_00"##45//frame=169maxp_number=16//need to split into positions

];



#########################################################################################################################
#########################################################################################################################






cell_size=8.0;#also in um ##smaller to not miss anything ##have kept it at 8 for most analyses during second round xmas
max_speed=25.0;#um/min, also in um #max speed target=20-30 µm/min
min_spot_contrast=0.15; #to remove debris ==> 0.15 would work, but can also be used to remove out of focus/dim points

#factor_series=[0.25,0.25]
factor_series=[1];

#n_start=[1,1]
#n_files=[11,11]

n_start=1;
n_end=[
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

##CART from 40 onwaedrs
,24
,24
,28
,24

,24
,0
];

frame_interval=[
151.2504
,152.0399
,152.0749
,120.0157
,62.3246
,66.0382
,60.0151
,67.5739
,67.5351
,77.3254
,74.8096
,85.6939
,72.8907
,84.9669
,89.9829
,89.5380
,62.5202
,97.8461
,95.4169
,98.8687
,84.1500
,84.1735
,90.3915
,89.7797
,97.0536
,98.4124
,103.0645
,90.5221
,98.9435
,94.9342
,89.3545
,90.1149
,84.9105
,111.0968
,103.6773
,103.6807
,293.9973
,89.9999
,87.3516

## CART from 40 onwaedrs
,96.69##have to change it
,96.69
,96.69
,96.69

,96.69
,96.69

];##seconds

ext_series_pass=ext_series;


#(Folder, movie no pxx)


#if tuple(current_i_ext_and_i) in to_avoid:
#(i_ext in i_ext_to_avoid) and (i in i_to_avoid):
#i_ext_to_avoid=[3];
#i_to_avoid=[2,3,4];
for i_ext in range(41-1,50+0*len(ext_series_pass),1):

    #search_distance=40.0*1.0;#10*(1/0.33)*(1.75)*factor_series[i_ext]
	#this is in um because the the images are alrteady converetd
	#u can check this by opening trackmate of any zeiss tracked file and all distances are um already
	#5.94*(1/0.33)*(1.75)*factor_series[i_ext]
    #20220630_Tcells_collagen_5mins_20x_XY22_morph
    #ext="20220526_Tcells_20x_XY12-1_rolling";
    #imp=IJ.openImage(path + folder_name + ext +".tif");
    #imp.show()
    #range(21,21,1):
    #array_multi=[3,11,12,13,21,22,23,31,32,33]
    #array_multi=[1,2,3,11,12,13,21,22,23,31,32,33]
    search_distance=max_speed*(frame_interval[i_ext]/60);
    array_multi=range(n_start,n_end[i_ext]+1,1);

    for i in array_multi:

        #print("i = " , i);	
        #close("*");
        current_i_ext_and_i = (i_ext, i);
        if tuple(current_i_ext_and_i) in to_avoid:
        	continue;
			
        if i<10:
            p="0"+str(i);
        else:
            p=str(i);
            
        if n_end[i_ext]<10:
        	p=str(i);

        print(path + folder_name[i_ext] + ext_series_pass[i_ext] + p + ".lsm");

        #imp=IJ.openImage(path + folder_name + ext+ p + ".tif_morph.tiff");
        #imps=BF.openImagePlus(path + folder_name + ext+ p + ".lsm");
        imps=BF.openImagePlus(path + folder_name[i_ext] + ext_series_pass[i_ext]+ p+ "_green.tif");
        # Extract metadata with key "X"
        #metadata_x = imps.getMetadata().get("Recording Images Height")
        
        #print(metadata_x)
        #imp=IJ.openImage(path + folder_name + ext+ p + "_BW.tif");
        
        #imp.getCalibration().frameInterval=5
        
        #imp2=imp
        
        #imps = ZProjector.run(imps,"max all");
        
        
        for imp in imps: 
            imp.show()

        reload(sys)

        sys.setdefaultencoding('utf-8')

        #IJ.run(imp, "Re-order Hyperstack ...", "channels=[Channels (c)] slices=[Frames (t)] frames=[Slices (z)]");

        #converter = HyperStackConverter()
        #converter.shuffle(imp, 2)

        #imp.show()


        #----------------------------
        # Create the model object now
        #----------------------------

        # Some of the parameters we configure below need to have
        # a reference to the model at creation. So we create an
        # empty model now.

        model = Model()

        # Send all messages to ImageJ log window.
        model.setLogger(Logger.IJ_LOGGER)



        #------------------------
        # Prepare settings object
        #------------------------

        settings = Settings(imp)

        # Configure detector - We use the Strings for the keys ThresholdDetector



        settings.detectorFactory = LogDetectorFactory()
        settings.detectorSettings = {
            'DO_SUBPIXEL_LOCALIZATION' : True,
            'RADIUS' : cell_size,#all zeiss files are in convberetd unit for distnce, so in um
            'TARGET_CHANNEL' : 1,#only one channel
            'THRESHOLD' : 1.0,#fixed
            'DO_MEDIAN_FILTERING' : False,
        } 
        
        #	threshold = fiji.plugin.trackmate.util.TMUtils.otsuThreshold( values );
        #	print(threshold)
        #	threshold=IJ.setAutoThreshold(imp, "Otsu");
        #	print(threshold)
        

        #IJ.setAutoThreshold(imp2, "Otsu dark stack")
        #imp.show()
        #ImProc = imp.getProcessor()
        #lower_thr = ImProc.getMinThreshold()
        lower_thr=0.994
        print(lower_thr) 
        
#        settings.detectorFactory = ThresholdDetectorFactory()
#        settings.detectorSettings = {
#
#        'TARGET_CHANNEL' : 1,
#
#        'INTENSITY_THRESHOLD' : lower_thr, #550 for rolling # ~1390 for IM7 cut 
#
#        'SIMPLIFY_CONTOURS' : True,
#
#        }

        # Configure spot filters - Classical filter on quality
#        filter1 = FeatureFilter('QUALITY', 7.0, True)
#        settings.addSpotFilter(filter1)
        
        # Here 'false' takes everything BELOW the mean_int value
        
        filter1 = FeatureFilter('CONTRAST_CH1', min_spot_contrast, True) #for tissue harps
        settings.addSpotFilter(filter1)


#        filter1 = FeatureFilter('AREA', 500, True)
#        settings.addSpotFilter(filter1)
#        
#        filter1 = FeatureFilter('AREA', 8000, False)
#        settings.addSpotFilter(filter1)	

        #filter1 = FeatureFilter('SNR_CH1', 0.0, True)
        #settings.addSpotFilter(filter1)	

        
        #filter1 = FeatureFilter('ASPECT_RATIO', 4, False)
        #settings.addSpotFilter(filter1)	
            
        #settings.addSpotFilter(filter1)

        # Configure tracker - We want to allow merges and fusions
        # settings.trackerFactory = SparseLAPTrackerFactory()
        # settings.trackerSettings = LAPUtils.getDefaultLAPSettingsMap() # almost good enough

        settings.trackerFactory = SparseLAPTrackerFactory()
        #settings.trackerSettings = LAPUtils.getDefaultLAPSettingsMap() #outdated
        settings.trackerSettings = settings.trackerFactory.getDefaultSettings()
        settings.trackerSettings['LINKING_MAX_DISTANCE'] = search_distance
        settings.trackerSettings['GAP_CLOSING_MAX_DISTANCE']= 2*search_distance
        settings.trackerSettings['MAX_FRAME_GAP']=2  #usually have tried with 4 


        settings.trackerSettings['ALLOW_TRACK_SPLITTING'] = False
        settings.trackerSettings['ALLOW_TRACK_MERGING'] = False

        # Add ALL the feature analyzers known to TrackMate. They will 
        # yield numerical features for the results, such as speed, mean intensity etc.
        settings.addAllAnalyzers()

        # Configure track filters - We want to get rid of the two immobile spots at
        # the bottom right of the image. Track displacement must be above 10 pixels.

        #filter2 = FeatureFilter('TRACK_DISPLACEMENT', , True)
        #settings.addTrackFilter(filter2)

        #filter2 = FeatureFilter('TRACK_DISPLACEMENT', 400, False)
        #settings.addTrackFilter(filter2)

        #filter2 = FeatureFilter('NUMBER_SPOTS',10, True)
        #settings.addTrackFilter(filter2)

        
        #filter2 = FeatureFilter('TRACK_MEDIAN_SPEED',0.0*factor_series[i_ext], True) #remove debris
        #settings.addTrackFilter(filter2)
                
        #filter2 = FeatureFilter('LINEARITY_OF_FORWARD_PROGRESSION', 0.95, False)
        #settings.addTrackFilter(filter2)



        #-------------------
        # Instantiate plugin
        #-------------------

        trackmate = TrackMate(model, settings)

        #--------
        # Process
        #--------

        ok = trackmate.checkInput()
        if not ok:
            sys.exit(str(trackmate.getErrorMessage()))

        ok = trackmate.process()
        if not ok:
            sys.exit(str(trackmate.getErrorMessage()))


        #----------------
        # Display results
        #----------------

        # A selection.
        selectionModel = SelectionModel( model )

        # Read the default display settings.
        ds = DisplaySettingsIO.readUserDefault()
        ds.setTrackColorBy( TrackMateObject.TRACKS, 'TRACK_ID' )
        ds.setSpotColorBy( TrackMateObject.TRACKS, 'TRACK_ID' )

        displayer =  HyperStackDisplayer( model, selectionModel, imp, ds )
        displayer.render()
        displayer.refresh()

        outputFolder= path + folder_name[i_ext]
        
        #outFile = File(outputFolder, ext + p+"_Tracks.xml")
        #ExportTracksToXML.export(model, settings, outFile)

        outFile = File(outputFolder, ext_series_pass[i_ext] + p+"_Model_v2.xml")
        writer = TmXmlWriter(outFile)
        writer.appendModel(model)
        writer.appendSettings(settings)
        writer.writeToFile()
        print "All Done!"



        # Echo results with the logger we set at start:
        model.getLogger().log( str( model ) )
        
        imp.close()


print "Truly All Tracking Done!"



#############################################################################
#############################################################################

