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

from fiji.plugin.trackmate.tracking import LAPUtils
from fiji.plugin.trackmate.tracking.sparselap import SparseLAPTrackerFactory
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



import ij.plugin.HyperStackConverter as HyperStackConverter


# We have to do the following to avoid errors with UTF8 chars generated in 
# TrackMate that will mess with our Fiji Jython.


# Get currently selected image
# imp = WindowManager.getCurrentImage()
#imp = IJ.openImage('https://fiji.sc/samples/FakeTracks.tif')
#imp.show()

path="H:/Aamir experiment data/PA Gels/Human T cells on 2D gels/"

#path = "D:/Aamir data/"
#path = "H:/Aamir data/"
#path = "C:/"


#folder ="All_IM7/"
#folder ="all_collagen/"
#folder ="all_fibronectin/"
#folder ="all_laminin/"
#folder ="all_icam1/"
#folder ="all_im7_blebb/"
#folder ="all_cd11/"
#folder="icam1_next_day/"
#folder="cd11_next_day/"


#folder="All HT on IM7/"

folder="All HT on fibronectin/"

#ext_series = ["20220701_Tcells_Fibronectin_20x_5min_XY","20220722_Tcells_Fibronectin_20x_5min_XY","20220804_Tcells_Fibronetin_20x_5min_XY"];

#ext_series = ["20220630_Tcells_collagen_5mins_20x_XY","20220701_Tcells_collagen_5mins_20x003_XY","20220714_Tcells_Collagen_2.5mins_20x001_XY"];
#ext_series = ["20220630_Tcells_collagen_5mins_20x_XY","20220701_Tcells_collagen_5mins_20x003_XY"];
#ext_series = ["20220714_Tcells_Collagen_2.5mins_20x001_XY"];
#ext_series = ["20220630_Tcells_collagen_5mins_20x_XY","20220714_Tcells_Collagen_2.5mins_20x001_XY"];

#ext_series = ["20220701_Tcells_laminin_5mins_20x001_XY","20220708_Tcells_laminin_5mins_20x004_XY","20220715_Tcells_Laminin_5min_20x002_XY"];
#ext_series = ["20220630_Tcells_IM7_20x_5min_XY","20220707_Tcells_IM7_20x_5min_XY","20220721_Tcells_IM7_20x_5min_XY"];

#ext_series=["20220729_Tcells_IM7_10kpa_20x_5min_Bleb_XY","20220811_Tcells_IM7_20x_5min_bleb_XY","20220812_Tcells_IM7_20x_5min_bleb_XY"]
#ext_series=["20220714_Tcells_CD11a_20_10min_XY","",""]
#ext_series=["20220714_Tcells_CD11a_20_10min_XY"]
#"20220729_Tcells_CD11a_10kpa_20x_1min_XY09","20220803_Tcells_10kpa_20x_2min30sec_XY"

#ext_series=["20220714_Tcells_CD11a_20_10min_XY","20220729_Tcells_CD11a_10kpa_20x_1min_XY","20220803_Tcells_10kpa_20x_2min30sec_XY"]
#ext_series=["20220811_Tcells_ICAM1_5min_20x_XY_XY","20220812_Tcells_ICAM1_2min30sec_20x_XY_XY","20220803_Tcells_10kpa_20x_2min30sec_XY"]
#ext_series=["20220811_Tcells_ICAM1_5min_20x_XY","20220812_Tcells_ICAM1_2min30sec_20x_XY"]

#ext_series=["03242023_NoCART_10kP_20x_089_XY"]

ext_series=["03242023_NoCART_10kP_20x_089_"]
#03242023_NoCART_10kP_20x_089_XY11_BW

#ext_series=["20220804_Tcells_10kpa_20x_2min30sec_XY"]


#ext_series=["20220803_Tcells_10kpa_20x_2min30sec_XY"]
#factor_series=[1,0.5]

#factor_series=[0.5]hhhhhhhhh
#factor_series=[1,0.2,0.5]

#this for icam 1= 0.5 is for 2.5 mins and another 0.5 is for 
#factor_series=[0.25,0.25]

factor_series=[1]

#n_start=[1,1]
#n_files=[11,11]l

n_start=[3]
n_files=[4]


for i_ext, ext in enumerate(ext_series):
    #ext = "20220630_Tcells_collagen_5mins_20x_XY";
    #ext = "20220701_Tcells_laminin_5mins_20x001_XY";
    #ext="20220630_Tcells_IM7_20x_5min_XY"
    search_distance=10*(1/0.33)*(1.75)*factor_series[i_ext]

	#5.94*(1/0.33)*(1.75)*factor_series[i_ext]
    #20220630_Tcells_collagen_5mins_20x_XY22_morph
    #ext="20220526_Tcells_20x_XY12-1_rolling";
    #imp=IJ.openImage(path + folder + ext +  "01.tif");
    #imp.show()
    #range(21,21,1):
    #array_multi=[3,11,12,13,21,22,23,31,32,33]
    #array_multi=[1,2,3,11,12,13,21,22,23,31,32,33]

    array_multi=range(n_start[i_ext],n_files[i_ext],1)

    for i in array_multi:

        #print("i = " , i);	
        #close("*");
        

        if i<10:
            p=str(i)
        else:
            p=str(i)

        print(path + folder + ext + p + "_BW.tif(Slow)");

        #imp=IJ.openImage(path + folder + ext+ p + ".tif_morph.tiff");
        imps=BF.openImagePlus(path + folder + ext+ p + ".tif");
        #imp=IJ.openImage(path + folder + ext+ p + "_BW.tif");
        
        #imp.getCalibration().frameInterval=5
        
        #imp2=imp
        
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



        #settings.detectorFactory = LogDetectorFactory()
        #settings.detectorSettings = {
        #    'DO_SUBPIXEL_LOCALIZATION' : True,
        #    'RADIUS' : 12.5,
        #    'TARGET_CHANNEL' : 1,
        #    'THRESHOLD' : 0.9,
        #    'DO_MEDIAN_FILTERING' : False,
        #} 
        
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
        
        settings.detectorFactory = ThresholdDetectorFactory()
        settings.detectorSettings = {

        'TARGET_CHANNEL' : 1,

        'INTENSITY_THRESHOLD' : lower_thr, #550 for rolling # ~1390 for IM7 cut 

        'SIMPLIFY_CONTOURS' : True,

        }

        # Configure spot filters - Classical filter on quality
        #filter1 = FeatureFilter('QUALITY', 250, True)
        #settings.addSpotFilter(filter1)
        
        # Here 'false' takes everything BELOW the mean_int value

        filter1 = FeatureFilter('AREA', 500, True)
        settings.addSpotFilter(filter1)
        
        filter1 = FeatureFilter('AREA', 8000, False)
        settings.addSpotFilter(filter1)	

        
        #filter1 = FeatureFilter('ASPECT_RATIO', 4, False)
        #settings.addSpotFilter(filter1)	
            
        #settings.addSpotFilter(filter1)

        # Configure tracker - We want to allow merges and fusions
        # settings.trackerFactory = SparseLAPTrackerFactory()
        # settings.trackerSettings = LAPUtils.getDefaultLAPSettingsMap() # almost good enough

        settings.trackerFactory = SparseLAPTrackerFactory()
        settings.trackerSettings = LAPUtils.getDefaultLAPSettingsMap()
        settings.trackerSettings['LINKING_MAX_DISTANCE'] = search_distance
        settings.trackerSettings['GAP_CLOSING_MAX_DISTANCE']= search_distance
        settings.trackerSettings['MAX_FRAME_GAP']= 0 ####be careful about this



        #settings.trackerSettings['ALLOW_TRACK_SPLITTING'] = True
        #settings.trackerSettings['ALLOW_TRACK_MERGING'] = True

        # Add ALL the feature analyzers known to TrackMate. They will 
        # yield numerical features for the results, such as speed, mean intensity etc.
        settings.addAllAnalyzers()

        # Configure track filters - We want to get rid of the two immobile spots at
        # the bottom right of the image. Track displacement must be above 10 pixels.

        #filter2 = FeatureFilter('TRACK_DISPLACEMENT', , True)
        #settings.addTrackFilter(filter2)

        #filter2 = FeatureFilter('TRACK_DISPLACEMENT', 400, False)
        #settings.addTrackFilter(filter2)

        filter2 = FeatureFilter('NUMBER_SPOTS',7, True)
        settings.addTrackFilter(filter2)

        
        filter2 = FeatureFilter('TRACK_MEDIAN_SPEED',0.3*(1/0.33)*(1.75)*factor_series[i_ext], True) #remove debris
        settings.addTrackFilter(filter2)
                
        #filter2 = FeatureFilter('LINEARITY_OF_FORWARD_PROGRESSION', 0.5, True)
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

        outputFolder= path + folder
        
        #outFile = File(outputFolder, ext + p+"_Tracks.xml")
        #ExportTracksToXML.export(model, settings, outFile)

        outFile = File(outputFolder, ext + p+"_Slow_Model.xml")
        writer = TmXmlWriter(outFile)
        writer.appendModel(model)
        writer.appendSettings(settings)
        writer.writeToFile()
        print "All Done!"



        # Echo results with the logger we set at start:
        model.getLogger().log( str( model ) )
        
        #imp.close()






#############################################################################
#############################################################################

