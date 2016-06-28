
%% Function where our program starts
function asg1_part_2()
%----------------------------------------------------------------
% USAGE: asg1_part_2
% Output: Displays the enhanced image by linear stretching
%----------------------------------------------------------------
    % Given the Image filename/path
    pic1_name = 'yose05.jpg';
    pic2_name = 'BAND1.pgm';
    % Calls the imagecheck function to check image type
    img1_type = imagecheck(pic2_name);
    % Reads the image specified the image name
    var_gmat = imread(pic2_name,'pgm');
    % Calls the imagecheck function to check image type
    img2_type = imagecheck(pic1_name);
    % Reads the image specified the image name
    var_cmat = imread(pic1_name,'jpg');
    % Performing linear stretching for grayscale/RGB image
    enhanceImageByStretching(img1_type,var_gmat);
    enhanceImageByStretching(img2_type,var_cmat);
end

%% Function to check Image Type
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

%% Function to enhance image by linear stretching
function enhanceImageByStretching(var1,var2)
%---------------------------------------------------------------
% USAGE: enhanceImageByStretching(typeOfImage,MatOfImage);
% Inputs: var1 = Type of Image
%         var2 = Matrix of Image
% Output: This function does not return anything
%----------------------------------------------------------------
    figure
    if(strcmp(var1,'GrayScale Image'))
        % Plots the data/images
        subplot(2,2,1); imshow(var2);
        title('Original Image');
        subplot(2,2,2); imhist(var2);
        title('Histogram of Original Image');
        % Used imadjust() to perform linear streatching
        output_var = imadjust(var2);
        subplot(2,2,3); imshow(output_var);
        title('Enhanced Image');
        subplot(2,2,4); imhist(output_var);
        title('Histogram of Enhanced Image');
    end
    if(strcmp(var1,'Color Image'))
        rchannel = var2(:, :, 1);
        gchannel = var2(:, :, 2);
        bchannel = var2(:, :, 3);
        subplot(4,4,[1:2 5:6]); imshow(var2);
        title('Original Image');
        subplot(4,4,3); imhist(rchannel);
        title('Red Channel - Original Image');
        subplot(4,4,4); imhist(gchannel);
        title('Green Channel - Original Image');
        subplot(4,4,7); imhist(bchannel);
        title('Blue Channel - Original Image');
        output_var = imadjust(var2, [.0 .0 .0; .6 .8 .8], []);
        output_red = output_var(:, :, 1);
        output_green = output_var(:, :, 2);
        output_blue = output_var(:, :, 3);
        subplot(4,4,[9:10 13:14]); imshow(output_var);
        title('Enhanced Image');
        subplot(4,4,11); imhist(output_red);
        title('Red Channel - Enhanced Image');
        subplot(4,4,12); imhist(output_green);
        title('Green Channel - Enhanced Image');
        subplot(4,4,15); imhist(output_blue);
        title('Blue Channel - Enhanced Image');
    end
end
