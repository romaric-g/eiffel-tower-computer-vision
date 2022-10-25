

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

%% Image try 2

load('pointxy.mat')

I = imread("index.jpg");

[Iheight,Iwidth,Ic] = size(I);
[frameHeight,frameWidth,frameC] = size(frame);

sortie=[ 1 1; Iwidth 1 ;Iwidth Iheight;1 Iheight];

H = CalculHomographie([x y], sortie);


Masque = CreationMasque(frame);

figure,imshow(Masque)

frame2 = frame;



for i=1:frameHeight
    for j=1:frameWidth
        H2=H*[j;i;1];

        x=H2(1)/H2(3);
        y=H2(2)/H2(3);

        if (x > 0 && x < Iwidth && y > 0 && y < Iheight)

            x1 = min(max(floor(x), 1), Iwidth);
            y1 = min(max(floor(y), 1), Iheight);
    
            x2 = max(min(x1 + 1, Iwidth), 1);
            y2 = max(min(y1 + 1, Iheight), 1);
    
            alpha = x-x1;
            beta = y-y1;
    
            I11 = I(y1,x1);
            I12 = I(y1,x2);
            I21 = I(y2,x1); 
            I22 = I(y2,x2);
    
            % if (Masque(i,j)~=0)
                frame2(i,j) = (1-alpha)*(1-beta)*I11 + (1-alpha)*beta*I12 + alpha*(1-beta)*I21 + alpha*beta*I22;
            % end
        end
    end
end

figure,imshow(frame)
figure,imshow(frame2)


