function [ H ] = HomographiePlusieursPoints( ImageInitiale, ImageFinale  )
A=[];
B=[];
taille = size(ImageInitiale);
for i=1:taille(1)
    xf = ImageInitiale(i,1);
    yf = ImageInitiale(i,2);

    xi = ImageFinale(i,1);
    yi = ImageFinale(i,2);


    Mat2 = [ 
           xi yi 1 0 0 0 (-xi*xf) (-xf*yi);
           0 0 0 xi yi 1 (-xi*yf) (-yi*yf)
           ];

    A = [A;Mat2];
    
    B = [B;xf;yf];

end

    X = A\B;

    H = [
    X(1) X(2) X(3) ;
    X(4) X(5) X(6) ;
    X(7) X(8) 1 ;
    ];

end