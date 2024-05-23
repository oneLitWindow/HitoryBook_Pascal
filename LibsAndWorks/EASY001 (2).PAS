{$A+,B-,D+,E+,F-,G-,I+,L+,N-,O-,P-,Q-,R+,S+,T-,V+,X+,Y+}
{$M 16384,0,655360}
{show path}
{it is a good day to die}
{ננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננ}
unit easyer;
{============================================================================}
InterFace
{-  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -}
procedure swpi(var x,y:integer);
procedure swpL(var x,y:LONGint);
procedure swpr(var x,y:real);
procedure swps(var x,y:string);
procedure swpc(var x,y:char);
procedure rp(x,y:integer);
procedure snd(x,y:integer);
function vali(s:string):integer;
function vall(s:string):longint;
function valr(s:string):real;
function stri(x:integer):string;
function strr(x:real):string;
function strl(x:longint):string;
function rights(s:string;x:integer):string;
function lefts(s:string;x:integer):string;
function ltrims(s:string):string;
function rtrims(s:string):string;
function dtrims(s:string):string;
procedure bgmouse;
procedure EDmouse;
function leftmb:boolean;
function rightmb:boolean;
procedure cadrt(s:string;x1,y1,x2,y2,c,cb,tc,ttb,tb,r1:integer);
procedure colorst(x,y:integer;z:boolean);
procedure colorsg(x,y:integer);
function backw(s:string):string;
function chcolor (s:string):integer;
procedure wrta(s:string;n,z,tj:integer;d:real;yn,ny:boolean);
{----------------------------------------------------------------------------}
Implementation
Uses crt,graph,mousedrv,dos;
{-  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -}

procedure swpi(var x,y:integer);
var z:integer;
begin
z:=x;x:=y;y:=z;
end;
procedure swpL(var x,y:LONGint);
var z:longint;
begin
z:=x;x:=y;y:=z;
end;
procedure swpr(var x,y:real);
var z:real;
begin
z:=x;x:=y;y:=z;
end;
procedure swps(var x,y:string);
var z:string;
begin
z:=x;x:=y;y:=z;
end;
procedure swpc(var x,y:char);
var z:char;
begin
z:=x;x:=y;y:=z;
end;
procedure rp(x,y:integer);
var z:integer;
begin
if y>x then swpi(x,y);
for z:=x to y do
setrgbpalette (z,0,0,0);
end;
procedure snd(x,y:integer);
begin
sound (x);
if y>-1 then begin
delay(y);
nosound;
end;
end;
function vali(s:string):integer;
var e,x:integer;
begin
val(s,x,e);
if e=0 then x:=0;
if e>1 then begin;s:=copy(s,1,e-1);val(s,x,e);end;
vali:=x;
end;

function vall(s:string):longint;
var x:longint;
	 e:integer;
begin
val(s,x,e);
if e=0 then x:=0;
if e>1 then begin;s:=copy(s,1,e-1);val(s,x,e);end;
vall:=x;
end;
function valr(s:string):real;
var x:real;
	 e:integer;
begin
val(s,x,e);
if e=0 then x:=0;
if e>1 then begin;s:=copy(s,1,e-1);val(s,x,e);end;
valr:=x;
end;
function stri(x:integer):string;
var s:string;
begin
str(x,s);
stri:=s;
end;
function strr(x:real):string;
var s:string;
begin
str(x,s);
strr:=s;
end;
function strl(x:longint):string;
var s:string;
begin
str(x,s);
strl:=s;
end;
function rights(s:string;x:integer):string;
var i:integer;
begin
i:=length(s);
i:=(i-x+1);
rights:=copy (s,i,x);
end;
function lefts(s:string;x:integer):string;
begin
lefts:=copy (s,1,x);
end;
function ltrims(s:string):string;
begin
repeat
if copy (s,1,1)=' ' then s:=copy(s,2,length(s)-1);
until copy (s,1,1)<>' ';
ltrims:=s;
end;
function rtrims(s:string):string;
begin
repeat
if rights(s,1)=' ' then s:=lefts(s,length(s)-1);
until rights(s,1)<>' ';
rtrims:=s;
end;
function dtrims(s:string):string;
begin
dtrims:=ltrims(rtrims(s));
end;
procedure bgmouse;
begin
initmouse;
showmouse;
end;
procedure edmouse;
begin
hidemouse;
end;
FUNCTION leftmb:boolean;
begin
leftmb:=leftbuttonpressed;
end;
FUNCTION rightmb:boolean;
begin
rightmb:=rightbuttonpressed;
end;
procedure cadrt(s:string;x1,y1,x2,y2,c,cb,tc,ttb,tb,r1:integer);
var u,d,r,l,ur,ul,dr,dl:string;
    z,i,j:integer;
begin

if ((r1<>2) and (r1<>3) and (r1<>4)) then begin
u:='Í';d:='Í';l:='÷ ';r:=' ÷';ur:='Í»';ul:='ÉÍ';dr:='Í¼';dl:='ÈÍ';
end;
if r1=2 then begin
u:='Ä';d:='Ä';l:='³ ';r:=' ³';ur:='Ä¿';ul:='ÚÄ';dr:='ÄÙ';dl:='ÀÄ';
end;
if r1=3 then begin
u:='‗';d:='Ü';l:='Û ';r:=' Û';ur:='‗Û';ul:='Û‗';dr:='ÜÛ';dl:='ÛÜ';
end;
if r1=4 then begin
u:='Û';d:='Û';l:='ÛÛ';r:='ÛÛ';ur:='ÛÛ';ul:='Û';dr:='ÛÛ';dl:='Û';
end;
TEXTcolor (c);textbackground(cb);gotoxy(x1,y1);write(ul);gotoxy(x2,y1);write(ur);
gotoxy(x1,y2);write(dl);gotoxy(x2,y2);write(dr);
for z:=(y1+1) to (y2-1) do
begin
gotoxy(x1,z);write(l);gotoxy(x2,z);write(r);
end;
for z:=(x1+1) to (x2-1) do
begin
gotoxy(z,y1);write(u);gotoxy(z,y2);write(d);
end;
if tb>-1 then begin
textbackground (tb);
for i:=(x1+length(l)) to (x2-1) do
begin
for j:=(y1+1) to (y2-1) do
begin
gotoxy(i,j);write(' ');
end;
end;
end;
textcolor (tc);
textbackground(ttb);
if s<>'' then begin
s:=' '+s+' ';
if x1>x2 then swpi(x1,x2);
i:=trunc(((x2-x1)-(length(s)))/2)+x1;
gotoxy(i,y1);write(s);
end;
gotoxy(x1+1+length(l),y1+1);
end;

procedure colorst(x,y:integer;z:boolean);
begin
if x>-1 then textcolor(x);
if y>-1 then textbackground(y);
if z then clrscr;
end;
procedure colorsg(x,y:integer);
begin
if x>-1 then setcolor (x);
if y>-1 then setbkcolor (y);
end;
function backw(s:string):string;
var i:integer;s1:string;
begin
s1:='';
for i:=1 to length(s) do
s1:=copy (s,i,1)+s1;
backw:=s1;
end;
function ords(s:string):integer;
var i,j:integer;c:char;s1:string;
begin
j:=0;if length(s)>1 then s:=lefts(s,1);
for i:=0 to 255 do
begin
c:=chr(i);
s1:=c;
if s1=s then begin;j:=i;break;end;
end;
ords:=j;
end;
function chrs(s:string):char;
begin
chrs:=chr(ords(s));
end;
function chcolor (s:string):integer;
var i,j:integer;
begin
i:=ords(s);
case i of
39,34,1,2,24..1:j:=14;
63,41,42,19,33,11,12:j:=12;
13..15:j:=6;
29..31,23..27,16..18:j:=15;
42..47,94,36,35,37:j:=3;
60..62,48..57:j:=9;
97..122,65..90:j:=10;
128..175,224..254:j:=11;
176..218:j:=13;
91..96:j:=2;
123..127:j:=5;
98,99:j:=4;
3:j:=28;
else j:=14;
end;
chcolor:=j;
end;
procedure wrta(s:string;n,z,tj:integer;d:real;yn,ny:boolean);
var sou,x,y,i,d2,xp,yp,p,t,mx,my :integer;
	 stt1:array[1..78] of string[1];
label augh;
begin
if (length(s)<=0) or (abs(n)>6) or (length(s)>78) then goto augh;
if abs(n)<4 then if z>0 then y:=z else y:=wherey;
if abs(n)>3 then if z>0 then x:=z else x:=wherex;
if d>0 then begin
sou:=500;if (d-trunc(d))>0.1 then sou:=trunc(frac(d)*100);
end;
d2:=trunc(d);
if yn then s:=backw(s);
for i:=1 to length(s) do
STT1[I]:=copy (s,i,1);
if n=0 then n:=1;
xp:=0;yp:=0;t:=abs(tj);
i:=length(s);
p:=1;
if (t<1) or (t>3) then t:=1;
if t=1 then begin;mx:=80;my:=25;end;
if t=2 then begin;mx:=80;my:=50;end;
if t=3 then begin;mx:=40;my:=12;end;
case abs(n) of
1: x:=trunc(((mx+1)-i)/2);
2: x:=(mx-i)+1;
3: x:=wherex;
4: y:=trunc(((my+1)-i)/2);
5: y:=(my-i)+1;
6: y:=wherey;
end;
if n<0 then begin
p:=-1;
if abs(n)<4 then x:=x+i;
if abs(n)>3 then y:=y+i;
end;
if abs(n)<4 then xp:=p;
if abs(n)>3 then yp:=p;
for p:=1 to i do begin
if tj<0 then colorst(chcolor(stt1[p]),-1,false);
gotoxy (x,y);write (stt1[p]);x:=x+xp;y:=y+yp;
{if d1>0 then}
end;
augh:
end;

{============================================================================}
end.
{ננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננ}