

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

figure,imshow(frame2)

