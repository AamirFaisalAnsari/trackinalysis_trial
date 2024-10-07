clc
clear all;
close all;

[folder, name, ext] = fileparts( mfilename('fullpath'));
cd(folder);


[FileName_old,FilePath]=uigetfile({'*.tif'},...
    'Select Image File', 'MultiSelect', 'on');

if iscell(FileName_old)
    movie_num = size(FileName_old,2);
else
    movie_num = 1;
end

strel_disk=3;
minimum_pixel_size = 200;

%gcf = figure('Position',[200,100,600,600]);
%hold on

for movie_i = 1:movie_num
    %
    if iscell(FileName_old)
        %MultiTiff=tiffread([FilePath FileName_old{fileno}]);
        MultiTiff=loadtiff([FilePath FileName_old{movie_i}]);
    else
        %MultiTiff=tiffread([FilePath FileName_old]);
        MultiTiff=loadtiff([FilePath FileName_old]);
    end
    
    if iscell(FileName_old)
        temp=FileName_old{1,movie_i};
        FileName{movie_i}=temp(1:end-4);
        filename_save = strcat(FilePath,FileName{movie_i},'_BW.tif');
    else
        FileName=FileName_old(1:end-4);
        filename_save = strcat(FilePath,FileName,'_BW.tif');
    end
    
    delete(filename_save);
    
    for frameno=1:1:size(MultiTiff,3)
        frameno
        figure(1)        
        temp_tiff = MultiTiff(:,:,frameno);
        
        image_double=im2double(temp_tiff);
        auto_threshold=graythresh(image_double);
        [im]=phase_segment(image_double,strel_disk,minimum_pixel_size);
        
        ColorImage = repmat(im,[1,1,3])*255;
        grayScaleImage = rgb2gray(ColorImage);

        subplot1 = subplot(1,2,1);
        imshow(temp_tiff,[])
        set(subplot1, 'Position', [0 0.3 0.5 0.5]);

        subplot2 = subplot(1,2,2);
        imshow(grayScaleImage)
        set(subplot2, 'Position', [0.51 0.3 0.5 0.5]);
        
        options.append = true;
        saveastiff(grayScaleImage,filename_save,options)
        clear temp_tiff image_double im ColorImage grayScaleImage
    end
end


