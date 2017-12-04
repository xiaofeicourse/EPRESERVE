% Demonstrate face image relighting
%
% Jiansheng Chen, Guangda Su, Jinping He, Shenglan Ben, "Face Image 
% Relighting using Locally Constrained Global Optimization", ECCV'10
%
%01-10-10, Jiansheng Chen
% 
close all;
% relight( ...
%         imresize(im2double(imread('imgs/potter.bmp')), 0.5), ...
%         readfp('imgs/potter.fp')/2, ...
%         im2double(imread('imgs/yaleB01_P00A+050E+00.bmp')), ...
%         readfp('imgs/yaleB01_P00A+050E+00.fp'), ...
%         im2double(imread('imgs/yaleB01_P00A+000E+00.bmp')), ...
%         readfp('imgs/yaleB01_P00A+000E+00.fp') ...
%     );

source_name = 'ss2';
ref_name = 'ref1';
img=  imresize(im2double(imread(['nimg/' source_name '.PNG'])), 1);
shape_pt = load(['nimg/' source_name '.mat']);
shape_pt =double(shape_pt.shape);

imgA=  imresize(im2double(imread(['nimg/' ref_name '.PNG'])), 1);
shape = load(['nimg/' ref_name '.mat']);
shape =double(shape.shape);

results=relight( ...
        img, ...
        shape_pt, ...
        imgA, ...
        shape ...
        );
    
figure(1);
subplot(131);imshow(img);title('Source');
subplot(132);imshow(imgA);title('Reference');
subplot(133);imshow(results.out_img);title('Output');
    imwrite(results.out_img./(max(results.out_img(:))),[source_name '_' ref_name '_ours.png']);