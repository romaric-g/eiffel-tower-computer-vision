function I = ColorerCoins(position,XcoinsFeuille,YcoinsFeuille,image,i)

    for j = 1:size(XcoinsFeuille,2)
        position(j,:) = [XcoinsFeuille(i,j),YcoinsFeuille(i,j)];

        image(YcoinsFeuille(i,j), XcoinsFeuille(i,j), 1) = 255;
    end 

    I = image;
    % I = insertMarker(double(image),position,'x','color','red','size',10);
end
