
%% Function where our program starts
function part1()
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
    % Performing edge detection for grayscale/RGB image
    grayOutput_1 = processImgEdge(img1_type,var_gmat,'sobel');
    grayOutput_2 = processImgEdge(img1_type,var_gmat,'roberts');
    grayOutput_4 = processImgEdge(img1_type,var_gmat,'laplacian');
    grayOutput_5 = processImgEdge(img1_type,var_gmat,'prewit');
    rgbOutput_1 = processImgEdge(img2_type,var_cmat,'sobel');
    rgbOutput_2 = processImgEdge(img2_type,var_cmat,'roberts');
    rgbOutput_4 = processImgEdge(img2_type,var_cmat,'laplacian');
    rgbOutput_5 = processImgEdge(img2_type,var_cmat,'prewit');
    figure(1)
    subplot(2,5,1); imshow(var_gmat);
    title('Original Image');
    subplot(2,5,2); imshow(grayOutput_1);
    title('Sobel');
    subplot(2,5,3); imshow(grayOutput_2);
    title('Roberts');
    subplot(2,5,4); imshow(grayOutput_5);
    title('Prewit');
    subplot(2,5,5); imshow(grayOutput_4);
    title('Laplacian');
    subplot(2,5,6); imshow(var_cmat);
    title('Original Image');
    subplot(2,5,7); imshow(rgbOutput_1);
    title('Sobel');
    subplot(2,5,8); imshow(rgbOutput_2);
    title('Roberts');
    subplot(2,5,9); imshow(rgbOutput_5);
    title('Prewit');
    subplot(2,5,10); imshow(rgbOutput_4);
    title('Laplacian');
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

%% Function to process the image
function[mOut] = processImgEdge(var1,var2,var3)
%---------------------------------------------------------------
% USAGE: processImgEdge(typeOfImage,MatOfImage,Filtername);
% Inputs: var1 = Type of Image
%         var2 = Matrix of Image
%         var3 = Filter name
% Output: mOut - Image after applying edge filter
%----------------------------------------------------------------
    if(strcmp(var1,'GrayScale Image'))
        if(strcmp(var3,'sobel'))
            mOut = edge(var2, 'sobel');
        end
        if(strcmp(var3,'roberts'))
            mOut = edge(var2, 'roberts');
        end
        if(strcmp(var3,'prewit'))
            mOut = edge(var2, 'prewitt');
        end
        if(strcmp(var3,'laplacian'))
            h = fspecial('log');
            mOut = imfilter(var2, h);
        end
    end
    if(strcmp(var1,'Color Image'))
       v = rgb2gray(var2); 
       if(strcmp(var3,'sobel'))
            mOut = edge(v, 'sobel');
        end
        if(strcmp(var3,'roberts'))
            mOut = edge(v, 'roberts');
        end
        if(strcmp(var3,'prewit'))
            mOut = edge(v, 'prewitt');
        end
        if(strcmp(var3,'laplacian'))
            h = fspecial('log');
            mOut = imfilter(v, h);
        end
    end
end
