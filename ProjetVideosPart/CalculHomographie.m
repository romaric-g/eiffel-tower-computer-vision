function [ H ] = CalculHomographie( entrer, sortie )

% les 4 point ou on doit mettre l'image
x2 = entrer(1,1);
y2 = entrer(1,2);

x4 = entrer(2,1);
y4 = entrer(2,2);

x6 = entrer(3,1);
y6 = entrer(3,2);

x8 = entrer(4,1);
y8 = entrer(4,2);

% Les 4 points de l'image 
x1 = sortie(1,1);
y1 = sortie(1,2);

x3 = sortie(2,1);
y3 = sortie(2,2);

x5 = sortie(3,1);
y5 = sortie(3,2);

x7 = sortie(4,1);
y7 = sortie(4,2);

% Matrice de l'homographie

A = [
    x1 y1 1 0 0 0 (-x1*x2) (-x2*y1) ; 
    0 0 0 x1 y1 1 (-x1*y2) (-y1*y2) ;
    x3 y3 1 0 0 0 (-x3*x4) (-x4*y3) ; 
    0 0 0 x3 y3 1 (-x3*y4) (-y3*y4) ;
    x5 y5 1 0 0 0 (-x5*x6) (-x6*y5) ; 
    0 0 0 x5 y5 1 (-x5*y6) (-y5*y6) ;
    x7 y7 1 0 0 0 (-x7*x8) (-x8*y7) ; 
    0 0 0 x7 y7 1 (-x7*y8) (-y7*y8) ;
    ];

% Vecteur des coins donner par l'autre gourpe

B = [x2 ; y2 ; x4 ; y4 ; x6 ; y6 ; x8 ; y8];

X = A\B;

% Matrice de l'homographie aprés calcul
H = [
    X(1) X(2) X(3) ;
    X(4) X(5) X(6) ;
    X(7) X(8) 1 ;
    ];

end