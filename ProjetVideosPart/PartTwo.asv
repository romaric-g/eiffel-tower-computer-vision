

%% --------
%
% V1
%
% ----------

%% Lecture d'une frame

clear all
close all

video = VideoReader("video.mp4");

frame = read(video, 60);

figure, imshow(frame) 

load('pointxy4.mat')

line(x,y)

I = imread("petite.jpg");

frame2 = RemplacerPapierParImage(frame, I, x, y);

figure, imshow(frame2) 

%% 3D

load('pointxy.mat')

[h,w,c] = size(frame2);
pout=[ 0 0 0; 1 0 0;1 1 0;0 1 0; 1/8 1/2 10; 1/2 1/4 20];
pin=[x y];

transform=TransformationRigide(pin,pout);

[segments,points]=Points_Segments();

dimPoints=size(points);
pointsFrame=zeros(dimPoints(1),2);

for i=1:dimPoints(1)
    q=transform*[points(i,1);points(i,2);points(i,3);1];
    coordoneesFin= round([q(1)/q(3); q(2)/q(3)]);
    pointsFrame(i,1)=coordoneesFin(1);
    pointsFrame(i,2)=coordoneesFin(2);
end

frame3=Segments(frame2,segments,pointsFrame);
figure,imshow(frame3)
