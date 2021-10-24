function features = segment2features(I)
    stats = regionprops(I, 'Image', 'Circularity', 'EulerNumber', 'Eccentricity', 'Area');
    %height and width of image
    [im_width, im_height] = size(stats.Image);
    pixels = numel(I);
    %calculate the proportion of white pixels
    white = sum(I(:));
    white_proportion = white./pixels; 
    %minor axis length 
    %minorAxisLength = stats.MinorAxisLength;
    %segmenting the image in upper and lower half might reveal more
    %information
    half_height = floor(im_height/2);
    upper_half = stats.Image(:,1:half_height);
    lower_half = stats.Image(:,half_height:end);
    half_width = floor(im_width/2);
    left_half = stats.Image(1:half_width, :);
    right_half = stats.Image(half_width:end, :);
    
    %areas of the image
    total_area = stats.Area;
    upper_area = regionprops(upper_half, 'Area').Area;
    lower_area = regionprops(lower_half, 'Area').Area;
    left_area = regionprops(left_half, 'Area').Area;
    right_area = regionprops(right_half, 'Area').Area;
    
    %upper half white proportion
    white_ratio = sum(upper_half(:))./sum(lower_half(:));
    
    %circularity of image
    total_circularity = stats.Circularity;
    upper_circularity = regionprops(upper_half, 'Circularity').Circularity;
    lower_circularity = regionprops(lower_half, 'Circularity').Circularity;
    %left_circularity = regionprops(left_half, 'Circularity').Circularity;
    %right_circularity = regionprops(right_half, 'Circularity').Circularity;
    
    %eccentricity of image
    total_eccentricity = stats.Eccentricity;
    %upper_eccentricity = regionprops(upper_half, 'Eccentricity').Eccentricity;
    %lower_eccentricity = regionprops(lower_half, 'Eccentricity').Eccentricity;
    
    %euler number: the number of holes in the image
    euler_num=stats.EulerNumber;
    features = normalize([white_proportion, white_ratio, total_area, upper_area, lower_area, left_area, right_area, total_circularity, upper_circularity, lower_circularity, total_eccentricity, euler_num]);
end