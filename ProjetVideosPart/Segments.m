function [ frame ] = Segments( frame, segments, points )

dimSegments=size(segments);
[h,w,c] = size(frame);

for k=1:dimSegments(1)
    a = points(segments(k,1),:);
    b = points(segments(k,2),:);
         
    xa = a(1);
    ya = a(2);
    xb = b(1);
    yb = b(2);

    diffX=xb-xa;
    diffY=yb-ya;
    
    alpha=2;
    
    L=floor(alpha*sqrt((diffX)^2+(diffY)^2));
     
    nx=-1*((diffY)/(sqrt((diffX)^2+(diffY)^2)));
    ny=((diffX)/sqrt((diffX)^2+(diffY)^2));
     
    for j=-2:2 
        for i=0:(L-1)

            xi=xa+(i/(L-1))*diffX;
            yi=ya+(i/(L-1))*diffY;  

            xf=round(xi+j*nx);
            yf=round(yi+j*ny);

            % On verifie qu'on ne sort pas de l'image
            if((yf>=1) && (yf<=h) && (xf>=1) && (xf<=w)) 
                frame(yf,xf,1)=0;
                frame(yf,xf,2)=60;
                frame(yf,xf,3)=120;
                end
             end
        end
    end
end