%% Importation de la vidéo
video = VideoReader("vid.mp4");
%implay("vid.mp4")

%% points 
image = read(video,1);
figure,imshow(image)
I = CouleursIndexees(image);
figure,imshow(I)
D = DetecteurDeHarris(sigma1,sigma2,sigma3,lambda,I);
figure,imshow(D)

%% Initialisation des variables initiales 
nbFrames = video.NumFrames;
lambda = 0.05;
sigma1 = 2;
sigma2 = 3;
sigma3 = 5;

%Détection manuelle des nb coins de la feuille (nb points initiaux)
imag = read(video,1);   %--> Image en "vraies couleurs"
%figure , image(imag)
%les coordonnées des nb coins de la feuille mis dans une matrice 

coinsImag1 = [
    684 412; % feuille (haut, gauche)
    1340 237; % feuille (haut, droite)
    1431 583; % feuille (bas, droite)
    629 767; % feuille (bas, gauche) 
    729 524; % bleu [elever exterieur] (haut, gauche) 
    921 475; % bleu [elever exterieur] (haut, droite) 
    % 882 596; % bleu [elever interieur] (bas, droite) 
    % 1152 451; % blanc [pied] (bas, droite) 
    % 989 436; % blanc [elever exterieur] (bas, gauche) 
    % 1009 489; % blanc [pied] (bas, gauche) 
    % 987 348; % blanc [elever exterieur] (haut gauche)
    % 1126 310; % blanc [elever exterieur] (haut droite)
];

nbCoins = size(coinsImag1, 1);

%% Mettre les points en evidence

figure, imshow(imag) 

line(coinsImag1(:, 1), coinsImag1(:, 2))


%%

% initialisation de la matrice des position x des nb coins coins de la feuille pour chaque frame
XcoinsFeuille = zeros(nbFrames,nbCoins);
% initialisation de la matrice des position y des nb coins coins de la feuille pour chaque frame
YcoinsFeuille = zeros(nbFrames,nbCoins);

%Ajout de la position initiale des nb coins  
XcoinsFeuille(1,:)= coinsImag1(:,1);
YcoinsFeuille(1,:)= coinsImag1(:,2);

%On considère que la position des coins ne change pas de la frame 1 à la
%frame 2 
coinsImag2 = coinsImag1;
%Ajout de la position initiale des 4 coins  
XcoinsFeuille(2,:)= coinsImag1(:,1);
YcoinsFeuille(2,:)= coinsImag1(:,2);



%% Détection des coins sur chaque frame de la vidéo 

for i=1:nbFrames-2
    %Lecture de la frame
    I = read(video,i+2);

    %Passage en couleurs indexées 
    Image = CouleursIndexees(I);

    %Calcul du détecteur de Harris 
    D = DetecteurDeHarris(sigma1,sigma2,sigma3,lambda,Image);
    
    Coins1(:,1) = XcoinsFeuille(i,:);
    Coins1(:,2) = YcoinsFeuille(i,:);
    Coins2(:,1) = XcoinsFeuille(i+1,:);
    Coins2(:,2) = YcoinsFeuille(i+1,:);

    %Détection des coins de l'image
    Max = MaximaHarris(D,Coins1,Coins2);

    %Positions X et Y des coins sauvegardées dans les matrices XcoinsFeuille et YcoinsFeuille
    XcoinsFeuille(i+2,:) = Max(:,1);
    YcoinsFeuille(i+2,:) = Max(:,2);

end



%% Save de la matrice des coins de chaque image 

save("matriceCoinsX.mat","XcoinsFeuille")
save("matriceCoinsY.mat","YcoinsFeuille")

%% pour importer la matrice 

XcoinsFeuille = load('matriceCoinsX.mat') 
YcoinsFeuille = load('matriceCoinsY.mat')



%% Création de la vidéo de vérification de la détection des coins 

videoCoins = VideoWriter('vidéoCoins','MPEG-4');
videoCoins.FrameRate = 25;
open(videoCoins)

position = zeros(nbCoins,2);

for i=1:nbFrames
    image = read(video,i);
    I = ColorerCoins(position,XcoinsFeuille,YcoinsFeuille,image,i);
    writeVideo(videoCoins,I)
end
close(videoCoins)

%% Lancement de la videoCoins

implay('vidéoCoins.mp4')

%% Création de la vidéo avec l'image incrustée 

imageDeRemplacement = imread("francais.jpg");

newVideo = VideoWriter('newVideoReplace','MPEG-4');
newVideo.FrameRate = 25;
open(newVideo)

for i=1:nbFrames 
    XcoinsFeuilleT = XcoinsFeuille(i,:).';
    YcoinsFeuilleT = YcoinsFeuille(i,:).';
    frame = read(video, i);
    frame2 = RemplacerPapierParImage(frame,imageDeRemplacement,XcoinsFeuilleT,YcoinsFeuilleT);
  
    writeVideo(newVideo,frame2)
end
close(newVideo)

%% Création de la vidéo avec l'image incrustée  et 3D

imageDeRemplacement = imread("francais.jpg");

newVideo = VideoWriter('newVideo3D','MPEG-4');
newVideo.FrameRate = 25;
open(newVideo)

pout=[ 
    0 0 0; 
    1 0 0;
    1 1 0;
    0 1 0; 
    1/8 1/2 20; 
    3.2/8 1/2 20
];

[segments,points]=EiffelModel();

for i=1:nbFrames 
    XcoinsFeuilleT = XcoinsFeuille(i,:).';
    YcoinsFeuilleT = YcoinsFeuille(i,:).';
    frame = read(video, i);
    frame2 = RemplacerPapierParImage(frame,imageDeRemplacement,XcoinsFeuilleT,YcoinsFeuilleT);
    
    % 3D
    transform=TransformationRigide([XcoinsFeuilleT, YcoinsFeuilleT],pout);
    
    dimPoints=size(points);
    pointsFrame=zeros(dimPoints(1),2);

    for i=1:dimPoints(1)
        q=transform*[
            points(i,1)/(2*sqrt(2))+1*sqrt(2)/(4);
            points(i,2)/2 + 1/4;
            points(i,3)/2;1
        ];
        coordoneesFin= round([q(1)/q(3); q(2)/q(3)]);
        pointsFrame(i,1)=coordoneesFin(1);
        pointsFrame(i,2)=coordoneesFin(2);
    end
    
    frame3=Segments(frame2,segments,pointsFrame);

    writeVideo(newVideo,frame3)
end
close(newVideo)


%%

implay('newVideo.mp4')


 
