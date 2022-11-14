function I = CouleursIndexees(Img)
    R=Img(:,:,1); 
    G=Img(:,:,2); 
    B=Img(:,:,3);
    I = 0.299*R+0.587*G+0.114*B;
end