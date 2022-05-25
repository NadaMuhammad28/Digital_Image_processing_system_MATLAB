
%{
%% lines detection:
f=imread('lines.tif');
g1 = linesdetect1(f);
g2 = linesdetect2(f);
figure,imshow(f); title ('original image')
figure,imshow(g1); title ('comparison')
figure,imshow(g2); title ('adding')

 %}


%% edges detection:
f=imread('house.tif');
g = edge(f, 'sobel', 'both');
figure,imshow(f); title ('original image')
figure,imshow(g); title ('edges')
