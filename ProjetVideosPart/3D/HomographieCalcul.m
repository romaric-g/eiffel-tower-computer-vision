function [ H ] = HomographieCalcul( pin, pout )

% les coins ou on doit intégrer l'image
x2 = pin(1,1);
y2 = pin(1,2);

x4 = pin(2,1);
y4 = pin(2,2);

x6 = pin(3,1);
y6 = pin(3,2);

x8 = pin(4,1);
y8 = pin(4,2);

% les coins de l'image à intégrer
x1 = pout(1,1);
y1 = pout(1,2);

x3 = pout(2,1);
y3 = pout(2,2);

x5 = pout(3,1);
y5 = pout(3,2);

x7 = pout(4,1);
y7 = pout(4,2);


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

B = [x2 ; y2 ; x4 ; y4 ; x6 ; y6 ; x8 ; y8];

X = A\B;

H = [
    X(1) X(2) X(3) ;
    X(4) X(5) X(6) ;
    X(7) X(8) 1 ;
    ];

return;
end

