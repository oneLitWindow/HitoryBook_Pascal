unit support;
interface{..................................................................}
procedure screeninit (x:boolean;s:string);
procedure getkeys;
procedure outit(x,y,d,c:integer;s:string);
procedure mouseon;
procedure nograph;
procedure cadr (x1,y1,barsize,x2,y2,mainc,barc:integer;title:string;sc:integer);
procedure rtr (x,y:integer);
procedure barcadr(color,dly:integer);
procedure drawbar (x,y:integer;plus:boolean);
function choosewitch(x:integer;b:boolean):integer;
function menuch:integer;
function pass:string;
function pass2:string;

implementation{.............................................................}
uses dos,crt,graph,mousedrv;

procedure screeninit (x:boolean;s:string);
var i,j:integer;
begin
textcolor (15);
writeln ('Screen not Changed to graphic mode ... Invalid Bgi (SVga/EgaVga) or No Bgi...');
writeln ('Bgi and Chr files must be in : ''ThisDrirectory\Bgi\*.bgi''');
textcolor (7);
if x then i:=installuserdriver ('svga256',nil) else i:=detect;
j:=1;
initgraph (i,j,s);
getkeys;
end;

procedure getkeys;
begin
while keypressed do readkey;
end;

procedure outit(x,y,d,c:integer;s:string);
var i:integer;
begin
setcolor (8);
for i:=1 to length (s) do begin
outtextxy (x,y,copy (s,1,i));
delay (d);
if keypressed then break;
end;
delay (100);
setcolor (c);
for i:=1 to length (s) do begin
outtextxy (x,y,copy (s,1,i));
delay (d);
if keypressed then break;
end;
outtextxy (x,y,s);
end;
procedure mouseon;
begin
initmouse;
showmouse;
end;

procedure nograph;
begin
getkeys;
readkey;
closegraph;
end;

procedure cadr (x1,y1,barsize,x2,y2,mainc,barc:integer;title:string;sc:integer);
var i1,i2,i3,i4,i5:integer;
begin
setcolor (barc);
for i1:=x1 to x2 do begin
line (x1,y1,i1,y1);
delay (1);
end;
setfillstyle (10,barc);
for i1:=y1 to y1+barsize do begin
bar (x1,y1,x2,i1);
rectangle (x1,y1,x2,i1);
delay (5);
end;
setcolor (mainc+8);
setfillstyle (7,mainc);
for i1:=x1+1 to x2-1 do begin
bar (x1+1,y1+1+barsize+5,i1,y2-1);
rectangle (x1,y1+barsize+5,i1+1,y2);
delay (1);
end;
outit (x1+3,y1-1,20,15,title);
{procedure outit(x,y,d,c:integer;s:string);}
end;

procedure rtr (x,y:integer);
var a:integer;
begin
for a:=x to y do
setrgbpalette (a,0,0,0);
end;

procedure barcadr(color,dly:integer);
var j:array[1..5] of integer;
begin
rtr(200,210);
if color =10 then setcolor (10);
if color =11 then setcolor (11);
if color =12 then setcolor (12);
if color =13 then setcolor (13);
if color =14 then setcolor (14);
if color =15 then setcolor (15);
if color =16 then setcolor (12);
rectangle (11,11,getmaxx-11,getmaxy-11);
for j[5]:=1 to 10 do
begin
setcolor (199+j[5]);
if color =10 then setrgbpalette (199+j[5],0,trunc(j[5]*6.3),0);
if color =11 then setrgbpalette (199+j[5],0,trunc(j[5]*6.3),trunc(j[5]*6.3));
if color =12 then setrgbpalette (199+j[5],trunc(j[5]*6.3),0,0);
if color =13 then setrgbpalette (199+j[5],trunc(j[5]*6.3),0,trunc(j[5]*6.3));
if color =14 then setrgbpalette (199+j[5],trunc(j[5]*6.3),trunc(j[5]*6.3),0);
if color =15 then setrgbpalette (199+j[5],trunc(j[5]*6.3),trunc(j[5]*6.3),trunc(j[5]*6.3));
if color =16 then setrgbpalette (199+j[5],trunc(j[5]*6.3),trunc((j[5]*6.3)/4),0);
rectangle (10-j[5],10-j[5],(getmaxx-10)+j[5],(getmaxy-10)+j[5]);
end;
delay (dly);
end;

procedure drawbar (x,y:integer;plus:boolean);
begin
if plus then setfillstyle (1,9) else setfillstyle (1,12);
setcolor (14);
fillellipse (x,y,5,5);
setcolor (14);
if plus then outtextxy (x-3,y-3,'+') else outtextxy (x-3,y-3,'-')
end;

function choosewitch(x:integer;b:boolean):integer;
var a:integer;
begin
{
drawbar (508+000+1,45,true );
drawbar (508+015+2,45,true );
drawbar (508+030+3,45,true );
drawbar (508+045+4,45,true );
-----------------------------
drawbar (508+060+5,45,false);
drawbar (508+075+6,45,false);
drawbar (508+090+7,45,false);
drawbar (508+105+8,45,false);
}
if (x>=(508+000+1)-5) and (x<=(508+000+1)+5) then a:=1;
if (x>=(508+015+2)-5) and (x<=(508+015+2)+5) then a:=2;
if (x>=(508+030+3)-5) and (x<=(508+030+3)+5) then a:=3;
if (x>=(508+045+4)-5) and (x<=(508+045+4)+5) then a:=4;

if (x>=(508+060+5)-5) and (x<=(508+060+5)+5) then a:=5;
if (x>=(508+075+6)-5) and (x<=(508+075+6)+5) then a:=6;
if (x>=(508+090+7)-5) and (x<=(508+090+7)+5) then a:=7;
if (x>=(508+105+8)-5) and (x<=(508+105+8)+5) then a:=8;
choosewitch:=a;
setcolor (15);
if b then begin
if a=1 then circle (508+000+1,45,4);
if a=2 then circle (508+015+2,45,4);
if a=3 then circle (508+030+3,45,4);
if a=4 then circle (508+045+4,45,4);
if a=5 then circle (508+060+5,45,4);
if a=6 then circle (508+075+6,45,4);
if a=7 then circle (508+090+7,45,4);
if a=8 then circle (508+105+8,45,4);
end;
end;

function menuch:integer;
begin
closegraph;
halt;
end;

function pass:string;
begin
pass:= 'AA' + CHR(255) + '-' + CHR(159) + CHR(229) + 'AA';
end;

function pass2:string;
begin
pass2:= chr(0)+' ' + CHR(44) + chr(255) + CHR(1) + CHR(147);
end;

end.{.......................................................................}