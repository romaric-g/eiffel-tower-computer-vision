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

ImIncruste=imread('petite.jpg');
[h,w,c] = size(ImIncruste);
pout=[ 1 1; w 1 ;w h;1 h]; %Prend les 4 coins de l'image à incruster(ordre haut gauche/haut droit/bas droit/bas gauche)
pin=[x y];

%On calcul l'homographie
H=HomographieCalcul(pin,pout);

%On incruste l'image à incruster grâce à l'homographie
frame=RemplacementImage(frame,ImIncruste,H);

figure,imshow(frame)

%Remplacement 3D

[h,w,c] = size(frame);
pout=[ 0 0 0; 1 0 0;1 1 0;0 1 0; 1/8 1/2 10; 1/2 1/4 20]; %Prend les points d'intérêts sur le plan de la feuille(ordre haut gauche/haut droit/bas droit/bas gauche/haut gauche structure bleue/ haut gauche structure blanche)
pin=[x y];

%On calcul la matrice de transfo 3D-2D
H3D=HomographiePlusieursPoints3D(pin,pout);

%On détermine les extrémités des segments que nous souhaitons tracer dans le plan de la
%feuille
%segments = [1 1 1;w/2 h/2 10; w 1 1; w/2 h/2 10;w h 1; w/2 h/2 10;1 h 1; w/2 h/2 10;  %segments verticaux et toit de la maison
    %w 1 1;w h 1; w h 1; 1 h 1; 1 h 1; 1 1 1; 1 1 1; w 1 1; (5/6)*w h/6 4; (5/6)*w (5/6)*h 4;(5/6)*w (5/6)*h 4;(1/6)*w (5/6)*h 4;(1/6)*w (5/6)*h 4;(1/6)*w (1/6)*h 4;(1/6)*w (1/6)*h 4;(5/6)*w (1/6)*h 4; %segments horizontaux
    %w/2-80 h 1; w/2-80 h 3; w/2-80 h 3; w/2+80 h 3; w/2+80 h 3; w/2+80 h 1; w/2 h 1; w/2 h 3 %porte
    %w/2-15 h 2; w/2-11 h 2; w/2+11 h 2; w/2+15 h 2; w/2-13 h 1.9; w/2-13 h 2.1; w/2+13 h 1.9; w/2+13 h 2.1]; %poignées de la porte

[segments,points]=Points_Segments();
%On trace les segments dans l'image 
PointsFinaux=Remplacement3D(H3D, points);
frame=TraceSegments(frame,segments,PointsFinaux);

figure,imshow(frame)


