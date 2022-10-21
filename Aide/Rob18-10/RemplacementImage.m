function [ feuille ] = RemplacementImage( feuille, image, H )

[h,w,c] = size(image);
masque=DetectionMain(feuille);
figure,imshow(masque);
for j=1:h
    for i=1:w
            q=H*[i;j;1];
            coordoneesFin= round([q(1)/q(3); q(2)/q(3)]);   
            for k=1:c
                if(masque(coordoneesFin(2),coordoneesFin(1))~=0)
                    feuille(coordoneesFin(2),coordoneesFin(1),k)=image(j,i,k);
                end
            end
    end
end

end