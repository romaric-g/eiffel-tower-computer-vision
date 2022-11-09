function [Seg,Pts] = Points_Segments()
%liste de points fixe
Pts=[0 0 0; 1 0 0; 1 1 0; 0 1 0; 1/2 1/2 80];
Seg=[1 2; 2 3; 3 4;4 1;1 5;2 5;3 5;4 5]; %socle de base de la pyramide

for i=1:10
    %NewP=zeros(4,3);
    cpt=size(Pts,1)+1;
    for j=1:4
        x=Pts(j,1)+(Pts(5,1)-Pts(j,1))*i/10;
        y=Pts(j,2)+(Pts(5,2)-Pts(j,2))*i/10;
        z=Pts(5,3)*(i/10);
        Pts=[Pts;x y z];
        %NewP(j,1)=x;
        %NewP(j,2)=y;
        %NewP(j,3)=z;    
    end
    Seg=Ajout_Seg(Seg,cpt,4)

end
