
%{
%% lines detection:
f=imread('lines.tif');
g1 = linesdetect1(f);
g2 = linesdetect2(f);
figure,imshow(f); title ('original image')
figure,imshow(g1); title ('adding')
figure,imshow(g2); title ('comparison')

 %}



%{
%% edges detection:
f=imread('house.tif');
g = edge(f, 'sobel', 'both');     %binary img
figure,imshow(f); title ('original image')
figure,imshow(g); title ('edges')
}%


%{
f=imread('house.tif');
hmask=fspecial('sobel');
vmask=hmask';
b_h=imfilter(f,hmask,'replicate');
b_v=imfilter(f,vmask,'replicate');
grad=abs(b_h)+abs(b_v);
figure,imshow(f)
figure,imshow(grad)
}%