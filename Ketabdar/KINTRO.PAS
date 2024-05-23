{Programmed by Amin Safinejad,       }
{              Ali Golbin,           }
{              Mohammad Ostadhashemi }
{        http://tetta.5u.com         }
{        amin1986@gmail.com          }
unit kintro;
interface
procedure ndelay(i:integer);
procedure fullgrow(x,y,s1:integer;s:string);
procedure growtext(x,y,s1:integer;s:string);
procedure growfont(x,y,fs,s1,s2:integer;s:string);
procedure movetext(x1,y1,x2,y2,d,st:integer;s:string);
procedure textcenter(f,s,c,m,sm,strt:integer;t:string);
procedure fullcadr(m:integer);
procedure intro;
implementation
uses easyer,graph,mousedrv,ncrt,ketabsup;
var i:array[1..10] of integer;
    font:array[1..10] of integer;
homa,sina,italic,fantasy,roya,kids,
trafic,titr,arial,kamran,modern,homanew,
clara,prince,titrnew,traffic2,tehran,
bulb,electral,boldest,fantait,jadid,straight,zar :integer;
P: Pointer;
size:longint;
procedure ndelay(i:integer);
begin
if not keypressed then delay(i);
end;
procedure fullgrow(x,y,s1:integer;s:string);
var i,j:integer;
begin
i:=0;
j:=0;
repeat
if i<s1 then i:=i+1;
if i>s1 then i:=i-1;
setusercharsize(i,1,1,1);
outtextxy(((getmaxx-(2*17))-textwidth(s))div 2,y,s);
ndelay(250);
bar (x-(textwidth(s)),y-(textheight(s) div 2),x+trunc(textwidth(s)*1.5),y+trunc(textheight(s)*2));
until i=s1;
outtextxy(((getmaxx-(2*17))-textwidth(s))div 2,y,s);
end;

procedure growtext(x,y,s1:integer;s:string);
var i:integer;
begin
i:=0;
repeat
setusercharsize(1,s1-i,1,1);
if i<s1 then i:=i+1;
if i>s1 then i:=i-1;
outtextxy(x,y,s);
ndelay(250);
bar (x,y+(textheight(s) div 2),x+textwidth(s),y+trunc(textheight(s)*1.5));
until i=s1;
outtextxy(x,y,s);
end;

procedure growfont(x,y,fs,s1,s2:integer;s:string);
var i,j,k:integer;
begin
i:=s1;
k:=0;
setcolor(180);
repeat
k:=k+(63 div (s2-s1));
setrgbpalette(180,k,k,0);
if i<s2 then i:=i+1;
if i>s2 then i:=i-1;
settextstyle (fs,0,i);
outtextxy(((getmaxx-(2*17))-textwidth(s))div 2,y,s);
ndelay(350);
bar (x,y,x+textwidth(s),y+trunc(textheight(s)*1.5));
until i=s2;
setcolor (181);
outtextxy((((getmaxx-(2*17))-textwidth(s))div 2)+1,y+1,s);
setcolor(180);
outtextxy(((getmaxx-(2*17))-textwidth(s))div 2,y,s);
for i:=0 to 32 do begin
setrgbpalette (181,i,i,i);
ndelay(100);
end;
repeat
for i:=63 downto 0 do begin
setrgbpalette (180,i,i,63-i);
ndelay(100);
end;
for i:=0 to 63 do begin
setrgbpalette (180,i,i,63-i);
ndelay(100);
if keypressed then break;
end;
until keypressed;
end;

procedure movetext(x1,y1,x2,y2,d,st:integer;s:string);
begin
repeat
if x1<x2 then x1:=x1+st;
if x1>x2 then x1:=x1-st;
if y1>y2 then y1:=y1-st;
if y1<y2 then y1:=y1+st;
outtextxy(x1,y1,s);
ndelay(d);
setfillstyle (1,0);
bar(x1,y1+(textheight(s)div 2) ,x1+textwidth(s)+10,y1+textheight(s)+10);
until (abs(x1-x2)<st) and (abs(y1-y2)<st);
outtextxy(x1,y1,s);
end;

procedure textcenter(f,s,c,m,sm,strt:integer;t:string);
var myx,myy:integer;
begin
myy:=gety;
settextstyle (f,0,s);
myx:=(((getmaxx-(32))-textwidth(t))div 2)-20;
{ wrga('Amin is good!',getx,gety,10,1,01,01,1,getx,gety,10,120,false,true); }
  wrga(t,myx,myy,c,sm,m,0100,1,0,0,5,strt,false,true);
end;                          {X,y}
procedure fullcadr(m:integer);
var i:integer;
begin
for i:=0 to 63 div 4 do begin
setcolor (200+i);
sendrgb(m,63-(i*4),200+i);
rectangle(i,i,getmaxx-i,getmaxy-i);
ndelay(100);
end;
setcolor(200);
sendrgb(m,63,200);
rectangle(i+1,i+1,getmaxx-i-1,getmaxy-i-1);
end;
procedure intro;
begin
while keypressed do readkey;
i[1]:=installuserdriver ('svga256',nil);
i[2]:=2;
initgraph (i[1],i[2],'bgi\');
homanew :=  installuserfont('homb');
bulb    :=  installuserfont('CTGR');
homa    :=  installuserfont('brdb');
sina    :=  installuserfont('sinb');
italic  :=  installuserfont('klab');
straight:=  installuserfont('motb');
tehran  :=  installuserfont('yasr');
titrnew :=  installuserfont('titb');
jadid   :=  installuserfont('jadh');

fantasy :=  installuserfont('lnsr');
roya    :=  installuserfont('royr');
kids    :=  installuserfont('tchr');
trafic  :=  installuserfont('trfh');
titr    :=  installuserfont('yasb');
arial   :=  installuserfont('avlr');
kamran  :=  installuserfont('brdr');
modern  :=  installuserfont('crnr');


clara   :=  installuserfont('klar');
prince  :=  installuserfont('plgr');
titrnew :=  installuserfont('titb');
traffic2:=  installuserfont('trfr');
tehran  :=  installuserfont('yasr');
electral:=  installuserfont('pngb');
boldest :=  installuserfont('tmpb');
fantait :=  installuserfont('brsx');
jadid   :=  installuserfont('jadh');
straight:=  installuserfont('motb');
zar     :=  installuserfont('zarb.chr');


{sscreen (2,2,'bgi\');}

cleardevice;
ndelay(3600);
rp2(0,100,0,0,0);
fullcadr(6);
{changergb(0,0,0,0,0,0,32,150);}
SetViewPort(17, 17, getmaxx-17, getmaxy-17,true);
line(0,(getmaxy div 2)-50,getmaxx,(getmaxy div 2)-50);
SetViewPort(17, 17, getmaxx-17, (getmaxy div 2)-51,true);
setcolor(100);
setrgbpalette (100,0,0,63);
textcenter(bulb,4,100,3,1,120,'Ketabdar - 1.00');
moveto(0,0);
changergb(100,0,0,63,32,63,0,150);
setcolor(101);
settextstyle (homanew,0,3);
movetext(120,getmaxy div 2,120,100,150,4,'³T—oz¼QºnAkMATŸ nAq—A¨o¯ ,nAkMBTŸ');
SetViewPort(17, 17, getmaxx-17, getmaxy-17,true);
settextstyle (italic,0,5);
setcolor(2);
setrgbpalette (2,0,63,63);
growtext(0,200,10,'Designers:');
settextstyle (italic,0,1);
setcolor(9);
setrgbpalette (9,0,0,63);
growtext(0,250,10,'Amin Safinejad');
setcolor(10);
setrgbpalette (10,0,0,50);
growtext(0,300,10,'Ali Golbin');
growtext(0,350,9,'Mohammad Ostad hashemi');
{centertext('jAs¯ »– ­¼«G')}
setcolor (2);
settextstyle (titrnew,0,3);
movetext(getmaxx,210,510,210,150,4,':pA ºnBŸ');
setcolor(9);
movetext(getmaxx,260,450,260,150,4,'jAs¯ »– ­¼«A');
setcolor (10);
movetext(getmaxx,310,495,310,150,4,'­¼L¦£»¦');
movetext(getmaxx,360,400,360,150,4,'»ª{BµjBTwAkªd«');
ndelay (3000);
for i[1]:=getmaxy downto 200 do begin
setcolor(0);
line (0,i[1],getmaxx,i[1]);
ndelay(50);
end;
moveto(0,200);
textcenter(sina,4,100,3,3,180,':Bª®µAnjBTwA');
moveto(0,300);
setrgbpalette (12,63,0,0);
textcenter(sina,4,12,7,3,230,'»¯Be°ntk®´«ºB›C');
ndelay (3000);
for i[1]:=0 to ((getmaxx div 2)-(17)) do begin
setcolor(2);
line (i[1],(getmaxy div 2)-49,i[1],getmaxy);
line ((getmaxx-(2*17))-i[1],(getmaxy div 2)-49,(getmaxx-(2*17))-i[1],getmaxy);
ndelay(50);
setcolor(0);
line (i[1],(getmaxy div 2)-49,i[1],getmaxy);
setcolor(0);
line ((getmaxx-(2*17))-i[1],(getmaxy div 2)-49,(getmaxx-(2*17))-i[1],getmaxy);
end;
growfont(100,300,7,0,5,'Hit any key to Begin...');
while keypressed do readkey;
{setcolor(2);}
fullgrow(100,300,10,'Hit any key to Begin...');
setviewport(0,0,getmaxx,getmaxy,false);
for i[1]:=63 downto 0 do begin
setrgbpalette (180,0,0,i[1]);
ndelay(50);
end;
i[1]:=0;
i[2]:=0;
repeat
setcolor(200);
rectangle (i[1],i[2],getmaxx-i[1],getmaxy-i[2]);
ndelay (20);
setcolor(0);
rectangle (i[1],i[2],getmaxx-i[1],getmaxy-i[2]);
if i[1]<getmaxx div 2 then i[1]:=i[1]+1;
if i[2]<getmaxy div 2 then i[2]:=i[2]+1;
until (i[1]=getmaxx div 2) and (i[2]=getmaxy div 2);
closegraph;
while keypressed do readkey;
end;
end.
{Programmed by Amin Safinejad,       }
{              Ali Golbin,           }
{              Mohammad Ostadhashemi }
{        http://tetta.5u.com         }
{        amin1986@gmail.com          }
