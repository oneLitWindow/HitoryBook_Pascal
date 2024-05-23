{Program Example of Graphical Border}
uses graph,ncrt;

{Procedure Graphical Border              }
procedure gBorder(x1,y1,x2,y2:integer);
var i:integer;
begin
for i:=0 to 63 do begin
if i mod 3 =0 then begin
setcolor(100+i);
setrgbpalette (100+i,63-i,63-i,0);
rectangle(x1+(i div 3),y1+(i div 3),x2-(i div 3),y2-(i div 3));
delay(100);
end;
end;
setcolor(100);
rectangle(x1+(i div 3)+1,y1+(i div 3)+1,x2-(i div 3)-1,y2-(i div 3)-1);
end;
{End of Graphical Border Procedure      }

var driver,mode:integer;
    c:char;
begin
     driver:=installuserdriver ('svga256',nil);
     mode:=1;
     initgraph (driver,mode,'e:\compiler\bp\bgi');
     settextstyle (7,0,2);
     setbkcolor(1);
     setcolor(15);
     delay(1000);
     outtextxy(150,80,'Press any key to begin Test!');
     readkey;
     cleardevice;


     {*Graphical Border, Draws a border on screen (x1,y1,x2,y2) *}
     {*}   gborder (0,0,getmaxx,getmaxy);                      {*}
     {*}{*****************************************************}{*}


     setcolor(8);
     outtextxy(120,300,'Press any key to Exit Example . . .');
     delay(500);
     setcolor(15);
     outtextxy(120,300,'Press any key to Exit Example . . .');

     readkey;
     closegraph;
end.