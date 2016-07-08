
%% Function where our program starts
function part3()
%----------------------------------------------------------------
% USAGE: asg22_part_1
% Output: Applying various rotation operations
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
    figure(1)
    h1=subplot(2,3,1); imshow(var_gmat);
    axis on
    title('Original Image');
    h2=subplot(2,3,2); imshow(imrotate(var_gmat, 45, 'crop'));
    axis on
    title('Rotated - Cropped');
    h3=subplot(2,3,3); imshow(imrotate(var_gmat, 45, 'loose'));
    axis on
    title('Rotated - Not Cropped');
    h4=subplot(2,3,4); imshow(var_cmat);
    axis on
    title('Original Image');
    h5=subplot(2,3,5); imshow(imrotate(var_cmat, 45, 'crop'));
    axis on
    title('Rotated - Cropped');
    h6=subplot(2,3,6); imshow(imrotate(var_cmat, 45, 'loose'));
    axis on
    title('Rotated - Not Cropped');
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

