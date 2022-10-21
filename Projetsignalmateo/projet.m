video = VideoReader("video.mp4");
if hasFrame(video)
    %img = readFrame(video, [5 10]);
    frame = read(video,150);
   
    figure, imshow(frame);
   
end

R=frame(442,844,1);
V=frame(442,844,2);
B=frame(442,844,3);

%%[xdistance1,ydistance1]=ginput(2);
%%xdistance1=fix(xdistance1);
%%ydistance1=fix(ydistance1);
%%distance1 =  sqrt(norm(xdistance1)+norm(ydistance1));
[x1_coord, y1_coord]=ginput(1);
[x2_coord, y2_coord]=ginput(2);
[x3_coord, y3_coord]=ginput(3);
[x4_coord, y4_coord]=ginput(4);
%%[xdistance2,ydistance2]=ginput(2);
%%xdistance2=fix(xdistance2);
%%ydistance2=fix(ydistance2);
%%distance2 =  sqrt(norm(xdistance2)+norm(ydistance2));

frame = rectangle('Position',[ginput(1) ginput(2) ginput(3) ginput(4) ]);
frm = getframe( fh );


for x = 1 : 1080
    for y = 1 : 1920
       if (75<frame(x,y,1) && frame(x,y,1)<140) && (120<frame(x,y,2) && frame(x,y,2)<180) && (110<frame(x,y,3) && frame(x,y,3)<190)
             frame(x,y,1)=255;
             frame(x,y,2)=255;
             frame(x,y,3)=255;
       end
    end
end


figure, imshow(frame)