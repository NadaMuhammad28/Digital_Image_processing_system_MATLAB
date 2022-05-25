% Note: we don't have images deformed by such noise, for trying to restore it. 
% Hence, we firstly add some noise to an image, then applying an image restoration filter.


%% restoring an image deformed by gaussian noise, using Harmonic mean filter
%{
f=imread('cameraman.tif');
g=imnoise(f,'gaussian');    % adding gaussian noise   
h=imrest(g,'amean',3,3);
imshow(g),title('noisy image');
figure,
imshow(h),title('restored image');
%}

%{
%% restoring an image deformed by gaussian noise, using midpoint filter
f=imread('cameraman.tif');
g=imnoise(f,'gaussian');    % adding gaussian noise  
h=imrest(g,'midpoint',3,3);
imshow(g),title('noisy image');
figure,
imshow(h),title('restored image');
%}

%{
%% restoring an image deformed by salt noise only, using Contraharmonic mean filter with Q = -ve value
f=imread('cameraman.tif');
g=noise('cameraman.tif', 'salt & pepper',0,.05);    % adding salt noise only
h=imrest(g,'chmean',3,3,-3);
imshow(g),title('noisy image');
figure,
imshow(h),title('restored image');
%}

%{
%% restoring an image deformed by pepper noise only, using Contraharmonic mean filter with Q = +ve value
f=imread('cameraman.tif');
g=noise('cameraman.tif', 'salt & pepper',0.05,0);    % adding pepper noise only
h=imrest(g,'chmean',3,3,3);
imshow(g),title('noisy image');
figure,
imshow(h),title('restored image');
%}

%{
%% restoring an image deformed by speckle noise, using Harmonic mean filter
f=imread('cameraman.tif');
g= imnoise(f, 'speckle');     % adding speckle noise  
h=imrest(g,'hmean',3,3);
imshow(g),title('noisy image');
figure,
imshow(h),title('restored image');
%}



