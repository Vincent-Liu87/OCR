function features = segment2features(I)
    stats = regionprops(I, 'Image', 'MinorAxisLength', 'Circularity', 'EulerNumber', 'Orientation', 'Eccentricity', 'Area');
    %height and width of image
    [~, im_height] = size(stats.Image);
    pixels = numel(I);
    %calculate the proportion of white pixels
    white = sum(I(:));
    white_proportion = white./pixels; 
    %minor axis length 
    minorAxisLength = stats.MinorAxisLength;
    %segmenting the image in upper and lower half might reveal more
    %information
    half_height = floor(im_height/2);
    upper_half = stats.Image(:,1:half_height);
    lower_half = stats.Image(:,half_height:end);
    %areas of the image
    total_area = stats.Area;
    upper_area = regionprops(upper_half, 'Area').Area;
    lower_area = regionprops(lower_half, 'Area').Area;
    %upper half white proportion
    white_ratio = sum(upper_half(:))./sum(lower_half(:));
    
    %circularity of image
    total_circularity = stats.Circularity;
    upper_circularity = regionprops(upper_half, 'Circularity').Circularity;
    lower_circularity = regionprops(lower_half, 'Circularity').Circularity;
    
    %eccentricity of image
    eccentricity = stats.Eccentricity;
    
    %Orientation of image
    Orientation = stats.Orientation;
    %euler number: the number of holes in the image
    euler_num=stats.EulerNumber;
    features = normalize([white_proportion, white_ratio, total_circularity, upper_circularity, lower_circularity, eccentricity]);
end