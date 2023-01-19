function coins = MaximaHarris(D,Coins1,Coins2)  %Permet de détecter les coins 
    coins=zeros(size(Coins1,1),size(Coins1,2));

    for i = 1:size(Coins1,1)
        coins(i,:)= MaximumHarris(D,Coins1(i,:),Coins2(i,:));
    end


