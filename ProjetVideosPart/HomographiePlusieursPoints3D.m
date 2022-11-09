function [ H ] = HomographiePlusieursPoints3D( ImageInitiale , ImageFinale )
A=[];
B=[];
taille = size(ImageInitiale);
for i=1:taille(1)
    xi = ImageInitiale(i,1);
    yi = ImageInitiale(i,2);

    xf = ImageFinale(i,1);
    yf = ImageFinale(i,2);
    zf = ImageFinale(i,3);


    Mat2 = [ 
           xf yf zf 1 0 0 0 0 (-xf*xi) (-xi*yf) (-xi*zf);
           0 0 0 0 xf yf zf 1 (-xf*yi) (-yf*yi) (-yi*zf);
           ];

    A = [A;Mat2];
    
    B = [B;xi;yi];

end
    X = (A.' * A)\(A.' * B);

    H = [
    X(1) X(2) X(3) X(4);
    X(5) X(6) X(7) X(8);
    X(9) X(10) X(11) 1 ;
    ];
 
end