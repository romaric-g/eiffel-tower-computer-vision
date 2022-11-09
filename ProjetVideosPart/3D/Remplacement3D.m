function [ PointsFin ] = Remplacement3D(H3D, points )

dimPoints=size(points);
PointsFin=zeros(dimPoints(1),2);

for i=1:dimPoints(1)
    q=H3D*[points(i,1);points(i,2);points(i,3);1];
    coordoneesFin= round([q(1)/q(3); q(2)/q(3)]);
    PointsFin(i,1)=coordoneesFin(1);
    PointsFin(i,2)=coordoneesFin(2);
end
end