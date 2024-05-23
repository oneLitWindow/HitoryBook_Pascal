uses Graph,ncrt;

var Gd,q,Gm,x1,x2,y1,y2,i,j,a,b,h: Integer;
    c:char;
    s:boolean;
begin
     h:=0;
     Gd := Detect;
     InitGraph(Gd, Gm, 'e:\compiler\bp\bgi');
     if GraphResult <> grOk then
        Halt(1);
     setbkcolor(1);
     setcolor(7);
     Line(200, 250, 240, 250);
     Line(200, 230, 240, 230);
     Line(240, 250, 260, 240);
     Line(240, 230, 260, 240);
     Line(200, 250, 200, 230);
     Line(215, 250, 215, 270);
     Line(225, 250, 225, 270);
     Line(215, 250, 225, 250);
     Line(215, 270, 225, 270);
     setcolor(0);
     settextstyle(2,0,4);
     outtextxy(205,233,'School');
     setcolor(15);
     settextstyle(1,0,4);
     outtextxy(215,50,'Farid Tamimi');
     outtextxy(215,150,'Rahim Tofigh');
     outtextxy(300,100,'&');
     setcolor(7);
     Line(0,  270, 565, 270);
     Line(35, 350, 600, 350);
     Line(0,  270, 35 , 350);
     Line(565,270, 600, 350);
     setcolor(5);
     Line(565, 170, 600, 250);
     Line(566, 270, 566, 170);
     Line(601, 350, 601, 250);
     Line(566, 270, 601, 350);
     setcolor(5);
     Line(580, 205, 580, 303);
     x1:=60;
     x2:=75;
     y1:=300;
     y2:=330;
     c:=#1;
     s:=false;
     j:=24;
     q:=14;
     setfillstyle(1,15);
     FloodFill(210, 240, 7);
     FloodFill(220, 260, 7);
     setfillstyle(1,8);
     FloodFill(20, 300, 7);
     setfillstyle(1,6);
     FloodFill(570, 190, 5);
     Floodfill(582, 217, 5);
     setcolor(13);
     circle(584,264,2);
     setfillstyle(1,14);
     FloodFill(584, 264, 13);
     setcolor(15);
     setfillstyle(4,10);
     fillEllipse(x1,y1, 10, 5);
     fillEllipse(x2,y2, 10, 5);
     while h<>20 do
     begin
          if keypressed then c:=readkey;
          if s then
          begin
               a:=x1;
               b:=y1
          end
          else
          begin
               a:=x2;
               b:=y2
          end;
          if (c='a') then
          begin
               for i:=1 to 15 do
               begin
                    setcolor(8);
                    fillEllipse(a,b-i+1,10, 5);
                    setcolor(15);
                    fillEllipse(a,b-i, 10, 5);
                    delay(q);
               end;
               if s then
                   b:=285
               else
                   b:=315;
               for i:=1 to j do
               begin
                    setcolor(8);
                    fillEllipse(a+i-1,b,10, 5);
                    setcolor(15);
                    fillEllipse(a+i,b,10, 5);
                    delay(q);
               end;
               if x2=75 then
                   a:=99
               else
                   a:=a+48;
               for i:=1 to 15 do
               begin
                    setcolor(8);
                    fillEllipse(a,b+i-1,10, 5);
                    setcolor(15);
                    fillEllipse(a,b+i,10, 5);
                    delay(q);
               end;
               if s then
                   x1:=x1+48
               else
                   if x2=75 then
                       x2:=x2+24
                   else
                       x2:=x2+48;
               s:=not(s);
               j:=48;
               h:=h+1;
          end;
          if (c=#27) then
          begin
               q:=7;
               c:='a';
          end;
     end;
     for i:=1 to 15 do
     begin
          setcolor(8);
          fillEllipse(x2,y2-i+1,10, 5);
          setcolor(15);
          fillEllipse(x2,y2-i, 10, 5);
          delay(q);
     end;
     y2:=315;
     for i:=1 to 24 do
     begin
          setcolor(8);
          fillEllipse(x2+i-1,y2,10, 5);
          setcolor(15);
          fillEllipse(x2+i,y2,10, 5);
          delay(q);
     end;
     x2:=x2+24;
     for i:=1 to 15 do
     begin
          setcolor(8);
          fillEllipse(x2,y2+i-1,10, 5);
          setcolor(15);
          fillEllipse(x2,y2+i,10, 5);
          delay(q);
     end;
     delay(5000);
     CloseGraph;
end.
