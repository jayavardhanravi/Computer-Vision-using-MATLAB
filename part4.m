
%% Function where our program starts
function asg1_part_4()
%----------------------------------------------------------------
% USAGE: asg1_part_4
% Output: Adds and removes noise from the image
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
    % Performing linear stretching for grayscale/RGB image
    [grayOutput, rgbOutput] = processImg(img1_type,var_gmat);
    [grayOutput_1, rgbOutput_1] = processImg(img2_type,var_cmat);
    subplot(2,2,1); imshow(grayOutput);
    title('Grayscale - With Noise(salt & pepper)');
    subplot(2,2,2); imshow(rgbOutput);
    title('Grayscale - Without Noise');
    subplot(2,2,3); imshow(grayOutput_1);
    title('RGB Image - With Noise(salt & pepper)');
    subplot(2,2,4); imshow(rgbOutput_1);
    title('RGB Image - Without Noise');
end

%% Function to check the type of image
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

%% Function to process the image
function[gOut, cOut] = processImg(var1,var2)
%---------------------------------------------------------------
% USAGE: processImg(typeOfImage,MatOfImage);
% Inputs: var1 = Type of Image
%         var2 = Matrix of Image
% Output: gOut - Image with noise
%         cOut - Image without noise
%----------------------------------------------------------------
    if(strcmp(var1,'GrayScale Image'))
        gOut = imnoise(var2,'salt & pepper');
        cOut = medfilt2(gOut);
    end
    if(strcmp(var1,'Color Image'))
        rchan = var2(:, :, 1);
        gchan = var2(:, :, 2);
        bchan = var2(:, :, 3);
        gOut1 = imnoise(rchan,'salt & pepper');
        gOut2 = imnoise(gchan,'salt & pepper');
        gOut3 = imnoise(bchan,'salt & pepper');
        gOut = cat(3,gOut1,gOut2,gOut3);
        cOut1 = medfilt2(gOut1);
        cOut2 = medfilt2(gOut2);
        cOut3 = medfilt2(gOut3);
        cOut = cat(3,cOut1,cOut2,cOut3);
    end
end
