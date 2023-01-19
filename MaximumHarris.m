function Xt = MaximumHarris(D,X1,X2)   %Permet de détecter le coin en déterminant le maximum du détecteur de Harris dans une fenêtre de recherche
    
    %Taille de la fenêtre de recherche du maximum
    fenetre = 37;

    % Position approximative du coin = le centre de la fenêtre 
    centre = round((3.*X2 - X1)./2);

    %Initialisation du max et des coordonnées du coin recherché 
    max = D(centre(2),centre(1));
    Xt = X2;

    for i=(centre(1)-(fenetre-1)/2):(centre(1)+(fenetre-1)/2)
        for j=(centre(2)-(fenetre-1)/2):(centre(2)+(fenetre-1)/2)
            if(max < D(j,i))
                max = D(j,i);
                Xt = [i j];
            end
        end
    end
end

