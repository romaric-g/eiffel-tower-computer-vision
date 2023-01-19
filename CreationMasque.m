function [M]=CreationMasque(frame)

R1=frame(:,:,1);
G1=frame(:,:,2);
B1=frame(:,:,3);
Y1=0.299*R1+0.587*G1+0.114*B1; % changement d'espace
Cr1=0.713*(R1-Y1)+128; %composante rouge
M=double(Cr1<133); %on applique le masque sur une intervallep

end 