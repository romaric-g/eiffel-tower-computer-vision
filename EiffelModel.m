
function [Seg,Pts] = EiffelModel()
    global Pts; 
    global Seg;
    global N2Elevation;
    global N3Elevation;
    global N4Elevation;

    N2Elevation = 60;
    N3Elevation = 60;
    N4Elevation = 240;

    Pts = [];
    Seg = [];
    
    AddEiffelPart1(0, 0);
    AddEiffelPart1(1, 0);
    AddEiffelPart1(0, 1);
    AddEiffelPart1(1, 1);

    AddEiffelPart2();

    AddEiffelPart3(0, 0);
    AddEiffelPart3(1, 0);
    AddEiffelPart3(0, 1);
    AddEiffelPart3(1, 1);

    AddEiffelPart4();

    AddEiffelPart5(0, 0);
    AddEiffelPart5(1, 0);
    AddEiffelPart5(0, 1);
    AddEiffelPart5(1, 1);

    AddEiffelPart6();

    
    Pts = Pts ./ [12 12 1];

    function AddEiffelPart1(originX, originY)
        
        n2DecalageX = abs(originX-1)*2;
        n2DecalageY = abs(originY-1)*2;

        PtsBase = [0 0 0; 4 0 0; 4 4 0; 0 4 0];
        SegBase = [1 2; 2 3; 3 4; 4 1];
        
        PtsN2Base = [0 0 0; 2 0 0; 2 2 0 ; 0 2 0] + [n2DecalageX n2DecalageY N2Elevation];
        SegN2 = [5 6; 6 7; 7 8; 8 5];
        
        SegBaseToN2 = [1 5; 2 6; 3 7; 4 8];
        
        NewPts=cat(1, PtsBase, PtsN2Base) + [originX*8 originY*8 0];
        NewSeg=cat(1, SegBase, SegN2, SegBaseToN2) + size(Pts, 1);
    
        Pts = cat(1, Pts, NewPts) ;
        Seg = cat(1, Seg, NewSeg);
    end

    function AddEiffelPart2()
        
        PtsBottom = [2 2 0; 2 10 0; 10 10 0; 10 2 0];
        SegBottom = [1 2; 2 3; 3 4; 4 1];
        
        Height = 10;

        PtsTop = [2 2 0; 2 10 0; 10 10 0; 10 2 0] + [0 0 Height];
        SegTop = [5 6; 6 7; 7 8; 8 5];
        
        SegBottomToTop = [1 5; 2 6; 3 7; 4 8];
        
        NewPts=cat(1, PtsBottom, PtsTop) + [0 0 N2Elevation];
        NewSeg=cat(1, SegBottom, SegTop, SegBottomToTop) + size(Pts, 1);
    
        Pts = cat(1, Pts, NewPts) ;
        Seg = cat(1, Seg, NewSeg);
    end

    function AddEiffelPart3(originX, originY)
        
        n3DecalageX = -(originX-0.5)*2;
        n3DecalageY = -(originY-0.5)*2;

        PtsBase = [0 0 0; 2 0 0; 2 2 0; 0 2 0];
        SegBase = [1 2; 2 3; 3 4; 4 1];
        
        PtsN3Base = [0 0 0; 2 0 0; 2 2 0 ; 0 2 0] + [n3DecalageX n3DecalageY N3Elevation];
        SegN3 = [5 6; 6 7; 7 8; 8 5];
        
        SegBaseToN3 = [1 5; 2 6; 3 7; 4 8];
        
        NewPts=cat(1, PtsBase, PtsN3Base) + [originX*6 originY*6 0] + [2 2 N2Elevation];
        NewSeg=cat(1, SegBase, SegN3, SegBaseToN3) + size(Pts, 1);
    
        Pts = cat(1, Pts, NewPts);
        Seg = cat(1, Seg, NewSeg);
    end

    function AddEiffelPart4()
        PtsBottom = [3 3 0; 3 9 0; 9 9 0; 9 3 0];
        SegBottom = [1 2; 2 3; 3 4; 4 1];
        
        Height = 10;

        PtsTop = [3 3 0; 3 9 0; 9 9 0; 9 3 0] + [0 0 Height];
        SegTop = [5 6; 6 7; 7 8; 8 5];
        
        SegBottomToTop = [1 5; 2 6; 3 7; 4 8];
        
        NewPts=cat(1, PtsBottom, PtsTop) + [0 0 N2Elevation + N3Elevation];
        NewSeg=cat(1, SegBottom, SegTop, SegBottomToTop) + size(Pts, 1);
    
        Pts = cat(1, Pts, NewPts) ;
        Seg = cat(1, Seg, NewSeg);
    end

    function AddEiffelPart5(originX, originY)
        n4DecalageX = abs(originX-1) -(originX-0.5)*2;
        n4DecalageY = abs(originY-1) -(originY-0.5)*2;

        PtsN3 = [0 0 0; 2 0 0; 2 2 0 ; 0 2 0];
        SegN3 = [1 2; 2 3; 3 4; 4 1];

        PtsN4 = [0 0 0; 1 0 0; 1 1 0 ; 0 1 0] + [n4DecalageX n4DecalageY N4Elevation];
        SegN4 = [5 6; 6 7; 7 8; 8 5];
        
        SegN3ToN4 = [1 5; 2 6; 3 7; 4 8];
        
        NewPts=cat(1, PtsN3, PtsN4) + [originX*4 originY*4 0] + [3 3 N2Elevation + N3Elevation];
        NewSeg=cat(1, SegN3, SegN4, SegN3ToN4) + size(Pts, 1);
    
        Pts = cat(1, Pts, NewPts);
        Seg = cat(1, Seg, NewSeg);
    end

    function AddEiffelPart6()
        PtsBottom = [5 5 0; 5 7 0; 7 7 0; 7 5 0];
        SegBottom = [1 2; 2 3; 3 4; 4 1];
        
        Height = 10;

        PtsTop = [5 5 0; 5 7 0; 7 7 0; 7 5 0] + [0 0 Height];
        SegTop = [5 6; 6 7; 7 8; 8 5];
        
        SegBottomToTop = [1 5; 2 6; 3 7; 4 8];
        
        NewPts=cat(1, PtsBottom, PtsTop) + [0 0 N2Elevation + N3Elevation + N4Elevation];
        NewSeg=cat(1, SegBottom, SegTop, SegBottomToTop) + size(Pts, 1);
    
        Pts = cat(1, Pts, NewPts) ;
        Seg = cat(1, Seg, NewSeg);
    end
end

