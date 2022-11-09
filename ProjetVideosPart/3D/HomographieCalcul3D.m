function [ H ] = HomographieCalcul3D( pin, pout )

% les coins ou on doit intégrer l'image
x2 = pin(1,1);
y2 = pin(1,2);

x4 = pin(2,1);
y4 = pin(2,2);

x6 = pin(3,1);
y6 = pin(3,2);

x8 = pin(4,1);
y8 = pin(4,2);

x10 = pin(5,1);
y10 = pin(5,2);

x12 = pin(6,1);
y12 = pin(6,2);

% les coins de l'image à intégrer
x1 = pout(1,1);
y1 = pout(1,2);
z1 = pout(1,3);

x3 = pout(2,1);
y3 = pout(2,2);
z3 = pout(2,3);

x5 = pout(3,1);
y5 = pout(3,2);
z5 = pout(3,3);

x7 = pout(4,1);
y7 = pout(4,2);
z7 = pout(4,3);

x9 = pout(5,1);
y9 = pout(5,2);
z9 = pout(5,3);

x11 = pout(6,1);
y11 = pout(6,2);
z11 = pout(6,3);


A = [
    x1 y1 z1 1 0 0 0 0 (-x2*x1) (-x2*y1) (-x2*z1); 
    0 0 0 0 x1 y1 z1 1 (-y2*x1) (-y2*y1) (-y2*z1);
    x3 y3 z3 1 0 0 0 0 (-x4*x3) (-x4*y3) (-x4*z3); 
    0 0 0 0 x3 y3 z3 1 (-y4*x3) (-y4*y3) (-y4*z3);
    x5 y5 z5 1 0 0 0 0 (-x6*x5) (-x6*y5) (-x6*z5); 
    0 0 0 0 x5 y5 z5 1 (-y6*x5) (-y6*y5) (-y6*z5);
    x7 y7 z7 1 0 0 0 0 (-x8*x7) (-x8*y7) (-x8*z7); 
    0 0 0 0 x7 y7 z7 1 (-y8*x7) (-y8*y7) (-y8*z7);
    x9 y9 z9 1 0 0 0 0 (-x10*x9) (-x10*y9) (-x10*z9); 
    0 0 0 0 x9 y9 z9 1 (-y10*x9) (-y10*y9) (-y10*z9);
    x11 y11 z11 1 0 0 0 0 (-x12*x11) (-x12*y11) (-x12*z11); 
    0 0 0 0 x11 y11 z11 1 (-y12*x11) (-y12*y11) (-y12*z11);
    ];

B = [x2 ; y2 ; x4 ; y4 ; x6 ; y6 ; x8 ; y8 ; x10 ; y10 ; x12 ; y12];

X = (A.' * A)\(A.' * B);

H = [
    X(1) X(2) X(3) X(4);
    X(5) X(6) X(7) X(8);
    X(9) X(10) X(11) 1 ;
    ];

return;


end

