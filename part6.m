
%% Function where our program starts
function asg22_part_1()
%----------------------------------------------------------------
% USAGE: asg22_part_1
% Output: Applying various edge detection operations
%----------------------------------------------------------------
    % Given the Image filename/path
    pic1_name = 'lena_color.tiff';
    pic2_name = 'lena_gray.pgm';
    % Calls the imagecheck function to check image type
    img1_type = imagecheck(pic2_name);
    % Reads the image specified the image name
    var_gmat = imread(pic2_name,'pgm');
    % Calls the imagecheck function to check image type
    img2_type = imagecheck(pic1_name);
    % Reads the image specified the image name
    var_cmat = imread(pic1_name,'tiff');
    % Performing rescaling for grayscale/RGB image
    grayOutput_1 = imresize(var_gmat, 0.3, 'nearest', 0);
    grayOutput_2 = imresize(var_gmat, 0.5, 'bilinear', 0);
    grayOutput_3 = imresize(var_gmat, 0.8, 'Bicubic', 0);
    rgbOutput_1 = imresize(var_cmat, 0.4, 'nearest', 0);
    rgbOutput_2 = imresize(var_cmat, 0.7, 'bilinear', 0);
    rgbOutput_3 = imresize(var_cmat, 0.9, 'Bicubic', 0);
    figure(1)
    h1=subplot(2,4,1); imshow(var_gmat);
    axis on
    title('Original Image');
    h2=subplot(2,4,2); imshow(grayOutput_1);
    axis on
    title('Nearest Neighbor');
    h3=subplot(2,4,3); imshow(grayOutput_2);
    axis on
    title('Bilinear');
    h4=subplot(2,4,4); imshow(grayOutput_3);
    axis on
    title('Bicubic');
    h5=subplot(2,4,5); imshow(var_cmat);
    axis on
    title('Original Image');
    h6=subplot(2,4,6); imshow(rgbOutput_1);
    axis on
    title('Nearest Neighbor');
    h7=subplot(2,4,7); imshow(rgbOutput_2);
    axis on
    title('Bilinear');
    h8=subplot(2,4,8); imshow(rgbOutput_3);
    axis on
    title('Bicubic');
    linkaxes([h1,h2,h3,h4,h5,h6,h7,h8])
end

function[img_check] = imagecheck(var_img)
%----------------------------------------------------------------
% USAGE: x = imagecheck(image_path);
% Inputs: image_path = Image filename/URL
% Output: x = Type of the Image('GrayScale Image'/'Color Image')
%----------------------------------------------------------------
    % var_info get information about the image file
    var_info = imfinfo(var_img);
    % Checks if the image is grayscale/color and return image type
    if(strcmp(var_info.ColorType,'grayscale'))
        img_check = 'GrayScale Image';
    elseif(strcmp(var_info.ColorType,'truecolor'))
        img_check = 'Color Image';
    else
        img_check = 'Invalid';
    end
end

