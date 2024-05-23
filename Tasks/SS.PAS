USES graph,ncrt,easyer;
function isavval(i:integer):boolean;
var j:integer;
    myflag:boolean;
begin
myflag:=false;
for j:=2 to round(sqrt(i)) do begin
if i mod j =0 then begin;myflag:=true;break;end;
end;
if i=1 then myflag:=true;
isavval:=not myflag;
end;
procedure cadr(x1,y1,x2,y2:integer);
var j:integer;
begin
for j:=0 to (63 div 4) do begin
   setrgbpalette (20+(j*4),0,63-(j*4),63-(j*4));
   setcolor (20+(j*4));
   rectangle (x1+(j),y1+(j),x2-(j),y2-(j));
delay (100);
end;
setcolor(11);
rectangle (x1+(j),y1+(j),x2-(j),y2-(j));
end;
var i:array[1..10] of integer;
    x,y:integer;
begin
i[1]:=installuserdriver ('svga256',nil);
i[2]:=2;
initgraph(i[1],i[2],'e:\compiler\bp\bgi');
delay(3000);
cadr (0,0,getmaxx,getmaxy);
settextstyle (4,0,4);
setcolor (15);
setrgbpalette (15,63,63,63);
setcolor(8);
setrgbpalette (8,0,0,0);
outtextxy(17,17,'Adade avvale 1 ta 20:');
setcolor(16);
setrgbpalette (16,0,0,0);
outtextxy(18,18,'Adade avvale 1 ta 20:');
setcolor(17);
setrgbpalette (17,0,0,0);
settextstyle (7,0,3);
x:=64;
y:=120;
for i[1]:=1 to 20 do begin
if isavval(i[1]) then begin;outtextxy(x,y,stri(i[1]));x:=x+textwidth(stri(i[1]))+40;end;
end;
for i[1]:=0 to 63 do begin
setrgbpalette (8,0,0,round(i[1] * 0.7));
setrgbpalette (16,i[1],0,0);
setrgbpalette (17,i[1],i[1],0);
delay (100);
{flashrgb (,r1,g1,b1,r2,g2,b2,d,r,c:integer);                    {{³}
end;
settextstyle (10,0,3);
wrga('Hit any key to Exit...',17,410-17,15,1,2,0,1,1,1,20,150,false,false); { Writes a String is graphical Screen  }
                           {                     o}
{xx,yy:integer;d:real;{ Effects ,S is your string , & Y are }
 {           cs:integer;yn,ny:boolean);{ giving Starting pixel , C is Color , }
i[1]:=0;
i[2]:=1;
repeat
i[1]:=i[1]+i[2];
if i[1]=63 then i[2]:=-1;
if i[1]=00 then i[2]:=+1;
setrgbpalette (15,63-i[1],63-i[1],63);
delay (50);
until keypressed;
readkey;
end.
