
clear all

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
