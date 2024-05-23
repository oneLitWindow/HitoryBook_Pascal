uses graph,crt,mousedrv,support,logos;
type Meidan=record
            X,Y : real;
            act : boolean;
            end;
     ja    =record
            x,y:real;
            end;
     niro  =record
            x,y,e:integer;
            end;
var
br:array[1..4] of niro;
i:array[1..10] of integer;
e:array[1..8] of meidan;
ej:array[1..8] of ja;
etot:meidan;
px:ja;
e1,et,e2,f1,f2:real;
c:char;
j:array[1..5] of real;
label resel,began,restart;
{
function InitMouse: Boolean;
procedure ShowMouse;
procedure HideMouse;
function MouseButtons: Word;
function MouseX: Word;
function MouseY: Word;
function LeftButtonPressed: Boolean;
function RightButtonPressed: Boolean;
function BothButtonsPressed: Boolean;
procedure MoveMouseCursor(X, Y: Word);
procedure MouseXY ( X, Y : Word) ;
procedure ResetMouse ;
}

BEGIN;
if paramstr(1)<>pass2 then begin
textcolor (12);
writeln (paramstr(1));
writeln ('Run ----- Elm.exe ----- , not Sup.exe!!');
sound (1000);
delay (300);
sound (800);
delay (300);
sound (1000);
nosound;
delay (2000);
getkeys;
halt;
end;
screeninit(true,'d:\compiler\bp\bgi');{................................}
i[10]:=0;
logo;
restart:
closegraph;
screeninit(false,'d:\compiler\bp\bgi');
delay (1500);
settextstyle (1,0,1);
setcolor (12);
rectangle (0,0,getmaxx,getmaxy);
cadr (500,5,23,634,55,2,9,'Now Select :',14);
mouseon;
settextstyle (0,0,1);
setfillstyle (7,2);
drawbar (508+000+1,45,true);
drawbar (508+015+2,45,true);
drawbar (508+030+3,45,true);
drawbar (508+045+4,45,true);

drawbar (508+060+5,45,false);
drawbar (508+075+6,45,false);
drawbar (508+090+7,45,false);
drawbar (508+105+8,45,false);
setfillstyle (1,13);
bar (623+5,28+5+1,633,53);
resel:
repeat
if mousex<499 then movemousecursor(499,45);
if mousex>634 then movemousecursor(634,45);
if (mousey<45) or (mousey>45) then movemousecursor(mousex,45);
if (leftbuttonpressed) then begin
if getpixel(mousex-1,45)=13 then goto began else if
(((getpixel (mousex-1,mousey)=9) or (getpixel (mousex-1,mousey)=12) or (getpixel (mousex-1,mousey)=14)))
and not e[choosewitch(mousex,false)].act then break;
end;

if keypressed then begin
c:=readkey;
if c=chr(27) then if menuch=1 then goto restart;
getkeys;
end;

until 1=2;
i[2]:=mousex;
movemousecursor(320,240);
i[1]:=choosewitch(i[2],true);
e[i[1]].act:=true;
i[5]:=i[1];
repeat
if mousex<10 then movemousecursor(10,mousey);
if mousex>630 then movemousecursor(630,mousey);
if mousey<10 then movemousecursor(mousex,10);
if mousey>470 then movemousecursor(mousex,470);

if (leftbuttonpressed) and (not ((mousex>=494) and (mousey<=62))) then break;

if keypressed then begin
c:=readkey;
if c=chr(27) then if menuch=1 then goto restart;
getkeys;
end;

until 1=2;
i[1]:=mousex;i[2]:=mousey;
movemousecursor (getmaxx,gety);
drawbar (i[1],i[2],(i[5]<5));
ej[i[5]].x:=i[1];
ej[i[5]].y:=i[2];
i[4]:=0;
for i[1]:=1 to 8 do
if e[i[1]].act then begin;i[4]:=i[4]+1;end;

if i[4]<4 then goto resel;
began:
i[2]:=0;
for i[1]:=1 to 8 do
if e[i[1]].act then begin;i[2]:=1;break;end;
{closegraph;
writeln (ej[1].x,' ',ej[1].y);
writeln (ej[2].x,' ',ej[2].y);}
if i[2]=0 then goto resel;
{--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---}
getkeys;
closegraph;
delay (1000);
for i[2]:=1 to 4 do begin
br[i[2]].e:=0;
br[i[2]].x:=trunc(ej[i[1]].x);
br[i[2]].y:=trunc(ej[i[1]].y);
end;
i[2]:=0;

for i[1]:=1 to 8 do begin
if e[i[1]].act then begin
i[2]:=i[2]+1;
br[i[2]].e:=10;
br[i[2]].x:=trunc(ej[i[1]].x);
br[i[2]].x:=trunc(ej[i[1]].y);
end;end;
gotoxy (1,5);
writeln(pass,br[1].e,',',br[1].x,',',br[1].y,',',br[2].e,',',br[2].x,',',br[2].y,',',br[3].e,',',br[3].x,',',br[3].y,',',
br[4].e,',',br[4].x,',',br[4].y);
{--- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---}{$I+}
end.{................................................................}