%code for registering brain slice images using red and green channels
%By Chao Liu
%edited by Sarah Anderson

clear all
close all


%input number of frames
%framenums=[48 48 45 48 48 48 44 34];
framenums=[20];
maxp = [1];
startp = [1];
%F:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\Zen_09Nov23_Tcells_in_brain_CalA_1nM_rep1
%Zen_09Nov23_Tcells_in_brain_CalA_1nM_rep1_2023_11_09__20_07_06__p01_trim_red

%filenames= {'Zen_21Jun23_Tcells_in_brain_2023_06_21__19_02_26__p'};
filenames= {'Zen_09Nov23_Tcells_in_brain_CalA_1nM_rep1_2023_11_09__20_07_06__p'};


%2+2filenames = {'20220905_Tcells_calyculin_5min_20x_2022_09_05__16_23_03__p','20220906_Tcells_calyculin_5min_20x_2022_09_06__15_28_09__p'};
%folders = {'Zen_21Jun23_Tcells_in_brain'};
folders = {'Zen_09Nov23_Tcells_in_brain_CalA_1nM_rep1'};


%filenames = {'20210112_U251TLN1_cRGD_20x_2021_01_12__14_05_59__p','20210114_U251TLN1_cRGD_20x_2021_01_14__14_14_40__p','20210112_U251CD44_crgd_20x_2021_01_13__12_52_30__p','20210116_U251CD44_crgd_20x_2021_01_16__13_08_27__p','20210120_U251CD44_crgd_20x_2021_01_20__15_40_06__p','20210114_MayoPDXGBM16_drugs_20x_2021_01_15__17_23_53__p','20210119_MayoGBM64_drugs_20x_2021_01_19__15_20_35__p','20210121_MayoGBM80_drugs_20x_2021_01_21__16_15_39__p'};
%folders = {'BrainSlice_TLN_KO/20210112','BrainSlice_TLN_KO/20210114','BrainSlice_CD44_KO/20210113','BrainSlice_CD44_KO/20210116','BrainSlice_CD44_KO/20210120','BrainSlice_MayoPDX/20210115','BrainSlice_MayoPDX/20210119','BrainSlice_MayoPDX/20210121'};

%number of pos
for file=1%:length(filenames)
    framenum = framenums(file);
    filename = filenames{file};
    folder = folders{file};
    
    for p=1%startp(file):maxp(file)
        
        p
        %working directory
        dirPath=strcat('F:\Aamir experiment data\Mice brain slices\Mouse T cells in brain slices\', folder, '\');
        
        %   if p<10
        %      pstr = strcat('0',num2str(p));
        %   else
        %       pstr = num2str(p);
        %   end
        
        pstr = ['0',num2str(p)];
        
        %filename of red image, to be used for registration
        
        redname=strcat(dirPath,filename,pstr,'_trim_red.tif');
        red=imread(redname);
        
        redsaveName=strcat(dirPath,filename,pstr,'_trim_red_reg.tif');
        
        [M, N]=size(red);
        ImageSize = imref2d(size(red));
        
        %filename for green, registration will be applied to this
        
        greenname=strcat(dirPath,filename,pstr,'_trim_green.tif');
        green=imread(greenname);
        
        greensaveName=strcat(dirPath, filename,pstr,'_trim_green_reg.tif');
        
        %parameters for registration
        [optimizer, metric] = imregconfig('multimodal');
        optimizer.InitialRadius = 0.001;
        optimizer.Epsilon = 1.5e-4;
        optimizer.GrowthFactor = 1.01;
        optimizer.MaximumIterations = 400;
        
        %get first frame
        frame1red=imread(redname, 1);
        frame1green=imread(greenname, 1);
        
        tformredname=strcat(dirPath,'tformred_p',pstr,'.mat');
        
        k=1;
        
        framePreRed=frame1red;
        imwrite(frame1red, redsaveName);
        
        % use previous red as reference to register the following
        %loop through each frame, register using previous image
        for i=2:framenum
            
            temp = imread(redname, i);
            %temp=red(i).data;
            [movingRegistered,tform] = imregister_tform(temp, framePreRed, 'similarity', optimizer, metric);
            tformred(i-1,:)=tform;
            framePreRed = movingRegistered;
            i
        end
        
        
        %transform the red image
        imwrite(frame1red, redsaveName);
        for k = 2:framenum
            RedReg=imwarp(imread(redname,k),tformred(k-1,:), 'OutputView', ImageSize);
            %RedReg = RedReg(1:M, 1:N);
            %RedReg=imtransform(red(k).data,tformred(k-1,:),...
            %               'XData', [1 N], 'YData', [1 M],'Size', [M N]);
            imwrite(RedReg, redsaveName, 'WriteMode', 'append');
            clear RedReg
        end
        
        
        %transform the green image
        imwrite(frame1green, greensaveName);
        for k = 2:framenum
            GreenReg=imwarp(imread(greenname, k),tformred(k-1,:),'OutputView', ImageSize);
            %GreenReg = GreenReg(1:M, 1:N);
            imwrite(GreenReg, greensaveName, 'tiff', 'WriteMode', 'append');
            clear GreenReg
        end
        
        
        
        save(tformredname,'tformred');
        
    end
end

