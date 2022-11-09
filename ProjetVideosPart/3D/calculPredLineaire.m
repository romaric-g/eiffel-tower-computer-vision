function [pred] = calculPredLineaire(coinsPreced, coinsPreced2)

    pred = [0 0; 0 0; 0 0; 0 0; 0 0; 0 0];
    
    for i = 1:6
        pred(i,1) = coinsPreced(i,1)+(coinsPreced(i,1)-coinsPreced2(i,1))/2;
        pred(i,2) = coinsPreced(i,2)+(coinsPreced(i,2)-coinsPreced2(i,2))/2;
    end
       
end