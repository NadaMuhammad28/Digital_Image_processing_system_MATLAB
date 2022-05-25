
%% single thresholding:
f=imread('septagon.tif');
g=globalthreshold(f);
%h=imhist(f);
%plot(h);
%figure,
subplot(1,2,1);imshow(f);title('original image');
subplot(1,2,2);imshow(g);title('segmented image');


%{
%% single thresholding, using otsu's method:
f=imread('septagon.tif');
T = graythresh (f); 
g=im2bw(f, T);
subplot(1,2,1);imshow(f);title('original image');
subplot(1,2,2);imshow(g);title('segmented image');
%}

%{
%% Double thresholding:
f=imread('bottles.tif');
t1 = 30; 
t2 = 220;
g=f;
g(find(f < t1)) = 0;
g(find(f >= t1 & f < t2)) = 100;
g(find(f >= t2)) = 255;
subplot(1,2,1);imshow(f);title('original image');
subplot(1,2,2);imshow(g);title('segmented image');
%}

%{
%% adaptive thresholding:
f=imread('septagon_shaded.tif');

p1 = f(1:324,1:203);
p2 = f(1:324,204:406);
p3 = f(1:324,407:609);
p4 = f(1:324,610:812);
p5 = f(325:648,1:203);
p6 = f(325:648,204:406);
p7 = f(325:648,407:609);
p8 = f(325:648,610:812);

g1 = globalthreshold(p1);
g2 = globalthreshold(p2);
g3 = globalthreshold(p3);
g4 = globalthreshold(p4);
g5 = globalthreshold(p5);
g6 = globalthreshold(p6);
g7 = globalthreshold(p7);
g8 = globalthreshold(p8);
g= [g1 g2 g3 g4 ; g5 g6 g7 g8];

subplot(1,2,1);imshow(f);title('original image');
subplot(1,2,2);imshow(g);title('segmented image');
%}
