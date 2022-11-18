function [frame2] = RemplacerPapierParImage(frame, I, x, y)
    [Iheight,Iwidth,Ic] = size(I);
    [frameHeight,frameWidth,frameC] = size(frame);
    
    sortie=[ 1 1; Iwidth 1 ;Iwidth Iheight;1 Iheight];
    
    H = HomographiePlusieursPoints(sortie,[x y]);
    
    Masque = CreationMasque(frame);
    
    %figure,imshow(Masque)
    
    frame2 = frame;

    for i=1:frameHeight
        for j=1:frameWidth
            H2=H*[j;i;1];
    
            x=H2(1)/H2(3);
            y=H2(2)/H2(3);
    
            if (x > 0 && x < Iwidth && y > 0 && y < Iheight)
    
                x1 = min(max(floor(x), 1), Iwidth);
                y1 = min(max(floor(y), 1), Iheight);
        
                x2 = max(min(x1 + 1, Iwidth), 1);
                y2 = max(min(y1 + 1, Iheight), 1);
        
                alpha = x-x1;
                beta = y-y1;
    
                for c = 1:3
                    I11 = I(y1,x1,c);
                    I12 = I(y2,x1,c);
                    I21 = I(y1,x2,c); 
                    I22 = I(y2,x2,c);
            
                    if (Masque(i,j)~=0)
                        frame2(i,j,c) = (1-alpha)*(1-beta)*I11 + (1-alpha)*beta*I12 + alpha*(1-beta)*I21 + alpha*beta*I22;
                    end
                end
        
                
            end
        end
    end
end


