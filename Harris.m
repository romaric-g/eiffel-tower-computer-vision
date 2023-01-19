function D = Harris (sigmaG,sigmaC,lambda,I)
    %Création des filtres dérivés gaussiens de paramètre sigmaG
    [X,Y]=meshgrid(-ceil(3*sigmaG):ceil(3*sigmaG));

    %Calcul des dérivées selon X et Y des gaussiennes
    Gx = -(1/(2*pi*sigmaG^4))*X.*exp(-(X.^2+Y.^2)/(2*sigmaG^2));
    Gy = -(1/(2*pi*sigmaG^4))*Y.*exp(-(X.^2+Y.^2)/(2*sigmaG^2));

    %Convolution des dérivées avec les filtres dérivés gaussiens en tout point de I 
    Ix = conv2(double(I),double(Gx),'same');
    Iy = conv2(double(I),double(Gy),'same');

    % Création du filtre gaussien de paramètre sigmaC
    [X,Y] = meshgrid(-round(3*sigmaC+1):round(3*sigmaC+1));
    Gc = 1/(2*pi*sigmaC^2)*exp(-(X.^2+Y.^2)/(2*sigmaC^2));
    
    %Calcul de la covariance des gradients 
    Cxx = conv2(Ix.^2,Gc,'same');
    Cyy = conv2(Iy.^2,Gc,'same');
    Cxy = conv2(Ix.*Iy,Gc,'same');

    % Calcul du détecteur de Harris
    D = Cxx.*Cyy - Cxy.^2 - lambda*(Cxx+Cyy).^2;
end

    

