
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

