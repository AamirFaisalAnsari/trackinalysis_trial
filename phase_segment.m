
function [BWfill]=phase_segment(Im,strel_size, thresh2)

%apply a Gaussian filter with a 3-by-3 kernel to remove noise
x = -4:4;
y = -4:4;
[X,Y] = meshgrid(x,y);
Gauss = 1/(2*pi)*exp(-(X.^2 + Y.^2)/2);
ImGF = conv2(Im,Gauss,'same');
%imshow(Im, [])

%Apply a Sobel filter for edge detection
[ImThresh,~]=edge(ImGF,'sobel','nothinning');

%Apply a morphological closing on the image
Closed = ImThresh;
if isnan(strel_size)==0
    Closed = imclose(Closed,strel('disk',strel_size));
end

%Remove all objects that touch the border or that are too small to be a
%cell and fill holes in remaining regions
Closed = imclearborder(Closed);
BW = bwareaopen(Closed, thresh2); % remove small object
BWfill=imfill(BW,'holes');

%Create label matrix for the remaining objects
%[L,n] = bwlabel(BWfill);

end

