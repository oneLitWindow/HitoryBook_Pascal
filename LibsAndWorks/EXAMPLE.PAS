{Program Example of Graphical ReadLN}
uses graph,ncrt;

{Function Graphical Readln              }
function gread(x,y:integer):char;
  var c:char;
begin
    setfillstyle (1,2);
    bar (x-2,y-3,x+10,y+10);
    c:=readkey;
    setcolor(15);
    outtextxy(x,y,c);
    delay(500);
    setcolor(10);
    outtextxy(x,y,c)
end;
{End of Function Graphical Readln       }

var driver,mode:integer;
    c:char;
begin
     driver:=detect;
     mode:=0;
     initgraph (driver,mode,'d:\bp\bgi');
     setbkcolor(1);
     setcolor(15);
     delay(1000);
     outtextxy(200,10,'Press any key to begin Test!');
     readkey;
     cleardevice;
     setcolor(14);
     outtextxy(100,100,'Enter S to Exit or any other key to continue: ');
     delay(500);
     setcolor(9);
     outtextxy(100,100,'Enter S to Exit or any other key to continue: ');


     {*}{ Graphical Readkey, Gets akey and writes it on x,y }{*}
     {*}   c:=gread(470,100);                                {*}
     {*}{***************************************************}{*}


     setcolor(8);
     outtextxy(180,300,'Press any key to Exit Example...');
     delay(500);
     setcolor(15);
     outtextxy(180,300,'Press any key to Exit Example...');

     readkey;
     closegraph;
end.