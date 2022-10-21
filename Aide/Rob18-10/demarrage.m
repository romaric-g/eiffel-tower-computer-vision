clear all
close all

object=VideoReader('video.mp4');


%-----Remplacement 2D-------

%On commence par travailler qu'avec une image
frameID=60;
frame=read(object,frameID); %% lecture de la 60eme image de la video

figure,imshow(frame)

[x,y]=ginput(6); %On récupère les 6 points d'intérêts sur la feuille (haut gauche/haut droit/bas droit/bas gauche/haut gauche structure bleue/ haut gauche structure blanche)
%x=round(x); on arrondi aux points les plus proches
%y=round(y);

%% 
ImIncruste=imread('index.jpg');
[h,w,c] = size(ImIncruste);
pout=[ 1 1; w 1 ;w h;1 h]; %Prend les 4 coins de l'image à incruster(ordre haut gauche/haut droit/bas droit/bas gauche)
pin=[x y];

%On calcul l'homographie
H=CalculHomographie(pin,pout);

%On incruste l'image à incruster grâce à l'homographie
frame=RemplacementImage(frame,ImIncruste,H);

figure,imshow(frame)


