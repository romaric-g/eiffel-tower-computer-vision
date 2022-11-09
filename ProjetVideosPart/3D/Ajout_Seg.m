function [Seg] = Ajout_Seg(Seg,numD,nbreP)
   
    for i=1:nbreP-1
        Seg=[Seg;numD+i-1 numD+i];
    end
    Seg=[Seg;numD+nbreP-1 numD];
end