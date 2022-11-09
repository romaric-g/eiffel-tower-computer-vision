function [ feuille ] = TraceSegments( feuille, segments, points )

dimSegments=size(segments);
[h,w,c] = size(feuille);

for k=1:dimSegments(1)
     a = points(segments(k,1),:);
     b = points(segments(k,2),:);
     
     deltaX=(b(1)-a(1))^2;
     deltaY=(b(2)-a(2))^2;
     L=floor(2*sqrt(deltaX+deltaY)); %notre distance entre les 2pts
     
     nx=-1*((b(2)-a(2))/(sqrt(deltaX+deltaY)));
     ny=((b(1)-a(1))/sqrt(deltaX+deltaY));
     
     for j=-1:1 
         
         for i=0:(L-1)
             diffX=b(1)-a(1);
             diffY=b(2)-a(2);
             qX=diffX*(i/(L-1));
             qY=diffY*(i/(L-1));        
             xi=a(1)+qX;
             yi=a(2)+qY;
             
             xf=round(xi+j*nx);
             yf=round(yi+j*ny);

             if((yf>=1)&&(yf<=h)&&(xf>=1)&&(xf<=w))%modif h et w par des 1
                 if(j==0)
                     couleur=0;
                 else
                     couleur=60;
                 end
                 feuille(yf,xf,1)=couleur;
                 feuille(yf,xf,2)=couleur;
                 feuille(yf,xf,3)=couleur;
             end
         end
     end
    
end
return;
end