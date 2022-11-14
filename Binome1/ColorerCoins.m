function  I = ColorerCoins(position,XcoinsFeuille,YcoinsFeuille,image,i)

    for j = 1:size(XcoinsFeuille,2)
        position(j,:) = [XcoinsFeuille(i,j),YcoinsFeuille(i,j)];
    end 

    I = insertMarker(image,position,'x','color','red','size',10);
end
