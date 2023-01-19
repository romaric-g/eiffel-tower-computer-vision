function D = DetecteurDeHarris(SigmaG,SigmaC1,SigmaC2,lambda,I)
    D1 = Harris(SigmaG,SigmaC1,lambda,I);
    D2 = Harris(SigmaG,SigmaC2,lambda,I);
    
    D = min(D1.*abs(D2),D2.*abs(D1));
end