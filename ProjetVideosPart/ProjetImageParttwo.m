
video = VideoReader("video.mp4");

if hasFrame(video)
    img = readFrame(video);
    
    figure, imshow(img) 
    
    x = [685;1340;1427;628];
    y = [413;242;583;773];

    line(x,y)

    A = imread("index.jpg");

    H = [1 0 0; 0 1 0; 0 0 1/1.25];

    P = meshgrid(163,310);

    Pf = H*P;

    % Partie homographie sur l'image

end

%% Test sur un point 

clear all

fe = 1;

X1 = [100*fe 100*fe fe];
H = [1 0 0 ; 0 1 0 ; 0 0 (1/1.25)];
X2 = X1*H;

%%
clear all

img = imread("index.jpg");

x = 1:310;
y = 1:163;

[X1,Y1] = meshgrid(x,y);

FE1 = ones(163, 310);

imgOmo = cat(3, X1,Y1,FE1);

H = [1 0 0 ; 0 1 0 ; 0 0 (1/1.25)];

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

load('pointxy.mat')

line(x,y)

%% Couple construction

img = imread("index.jpg");

CPSB = [];
for x = 0:size(img, 1)-1
    for y = 0:size(img, 2)-1
        CPSB = [CPSB; x y 1];
    end
end

CPS = CPSB.';

%% Définition d'une matric homographique

H = [1 0 0 ; 0 1 0 ; 0 0 (1/1.25)];

CPSR = H*CPS;

x = CPSR(1,:) ./ CPSR(3,:);
y = CPSR(2,:) ./ CPSR(3,:);

MaxX = max(x);
MaxY = max(y);

MinX = min(x);
MinY = min(y);


%% Image try 2

img = imread("index.jpg");

[h,w,c] = size(img);

sortie=[ 1 1; w 1 ;w h;1 h];

H = CalculHomographie([x y], sortie);
I = frame;

Masque = CreationMasque(frame);

figure, imshow(Masque);


for i=1:h
    for j=1:w
        H2=H*[j;i;1];

        H2(H2 < 1) = 1;
        H2(H2 > h - 0.001) = h - 0.001;
        x1 = floor(x);
        x2 = x1 + 1;
        
        H2(H2 < 1) = 1;
        H2(H2 > w - 0.001) = w - 0.001;
        y1 = floor(y);
        y2 = y1 + 1;

        alpha = x-x1;
        beta = y-y1;

        I11 = I(y1,x1);
        I12 = I(y1,x2);
        I21 = I(y2,x1); 
        I22 = I(y2,x2);


        if (Masque(y2,x2)~=0)
            frame(i,j) = (1-alpha)*(1-beta)*I11 + (1-alpha)*beta*I12 + alpha*(1-beta)*I21 + alpha*beta*I22;
        end
    end
end

figure,imshow(frame)









