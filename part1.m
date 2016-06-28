%Read and display RGB and gray image (.pgm)
%Filename: asg1_part_1.m
%Updated 13-JUN-2016

%% Function where our program starts
function asg1_part_1()
%----------------------------------------------------------------
% USAGE: asg1_part_1
% Output: Displays the RGB and Grayscale images
%----------------------------------------------------------------
    % Given the Image filename/path
    pic1_name = 'download.png';
    pic2_name = 'lenaTest3.jpg';
    % Calls the imagecheck function to check image type
    img1_type = imagecheck(pic2_name);
    % Reads the image specified the image name
    var_gmat = imread(pic2_name,'jpg');
    % Calls the imagecheck function to check image type
    img2_type = imagecheck(pic1_name);
    % Reads the image specified the image name
    var_cmat = imread(pic1_name,'png');
    % Calls the displayimages function to plot the data/images
    displayimages(var_cmat,img2_type,var_gmat,img1_type);
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

%% Function to display images
function displayimages(var1,var2,var3,var4)
%----------------------------------------------------------------
% USAGE: displayimages(pic1,pic1_type,pic2,pic2_type);
% Inputs: var1 = Matrix of the Image
%         var2 = Image type of Image var1
%         var3 = Matrix of the Image
%         var4 = Image type of Image var3
% Output: this function does not return anything
%----------------------------------------------------------------
    % created the subplots to display the images
    subplot(1,2,1);
    % Dispalys the image
    imshow(var1);
    title(var2);
    % creates tiles like position
    subplot(1,2,2);
    imshow(var3);
    % Shows the title of the plot
    title(var4);
end