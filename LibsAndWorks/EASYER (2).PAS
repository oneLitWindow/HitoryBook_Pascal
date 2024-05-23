unit easyer;                          { For HELP Go to Implementation,Down >¿}
                                                                           {³}
                                                                           {³}
interface                                                                  {³}
function timer:real;                                                       {³}
function ords(s:string):byte;                                              {³}
function chrs(s:string):char;                                              {³}
procedure snd (x,y:word);                                                  {³}
function eqt(r:real):boolean;                                              {³}
procedure screen (d,m:integer;p:string);                                   {³}
procedure sendnum (m,n:integer;var x1,x2,x3:integer);                      {³}
procedure sendrgb (m,n,x:integer);                                         {³}
procedure changergb (x,r1,g1,b1,r2,g2,b2,d:integer);                       {³}
procedure flashrgb (x,r1,g1,b1,r2,g2,b2,d,r,c:integer);                    {³}
procedure swpi(var x,y:integer);                                           {³}
procedure swpL(var x,y:LONGint);                                           {³}
procedure swpr(var x,y:real);                                              {³}
procedure swps(var x,y:string);                                            {³}
procedure swpc(var x,y:char);                                              {³}
procedure rp(x,y:integer);                                                 {³}
function vali(s:string):integer;                                     {Down >´}
function vall(s:string):longint;                                           {³}
function valr(s:string):real;                                              {³}
function stri(x:integer):string;                                           {³}
function strr(x:real):string;                                              {³}
function strl(x:longint):string;                                           {³}
function rights(s:string;x:integer):string;                                {³}
function lefts(s:string;x:integer):string;                                 {³}
function ltrims(s:string):string;                                          {³}
function rtrims(s:string):string;                                          {³}
function dtrims(s:string):string;                                          {³}
procedure bgmouse;                                                         {³}
procedure EDmouse;                                                         {³}
function leftmb:boolean;                                                   {³}
function rightmb:boolean;                                                  {³}
procedure cadrt(s:string;x1,y1,x2,y2,c,cb,tc,tb,ttb,r1:integer);           {³}
procedure colorst(x,y:integer;z:boolean);                                  {³}
procedure colorsg(x,y:integer);                                            {³}
function backw(s:string):string;                                           {³}
function chcolor (s:string):integer;                                       {³}
procedure wrta(s:string;n,z,tj:integer;d:real;yn,ny:boolean);        {Down >´}
procedure wrga(s:string;x,y,c,m,sc,sd:integer;ss:real;xx,yy:integer;d:real;{³}
               cs:integer;yn,ny:boolean);                                     {³}
                                                                           {³}
{=========================================================================}{³}
implementation                                                             {³}
                                                                           {³}
uses graph,crt,dos,mousedrv;                                               {³}
                                      {ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´}
function ords(s:string):byte;         { ORD of String , S is String         ³}
var x:integer;                                                             {³}
begin                                                                      {ú}
if length(s)>1 then s:=copy (s,1,1);                                       {ú}
for x:=0 to 255 do                                                         {ú}
if chr(x)=s then break;
if chr(x)<>s then x:=-1;
ords:=x;
end;

function chrs(s:string):char;         { CHaRacter of String , S is String    }
begin
chrs:=chr(ords(s));
end;

procedure snd (x,y:word);             { SouND : Sound X with delay Y ,       }
begin                                 { If Y was less than zero then :       }
sound (x);                            { NoSound and Delay will be Disabled.  }
if y>=0 then
begin
delay (y);
nosound;
end;
end;

function eqt(r:real):boolean;         { is the real number EQual with it's   }
begin                                 { Trunc (integer part)? ; 22.0    22.1 }
if (r-trunc(r)<0) or (r-trunc(r)>0)   {                       True<Ù  Fals<Ù }
then eqt:=false else eqt:=true;
end;

procedure screen(d,m:integer;p:string);{ Easyer InitGraph to Change Screen   }
var i,j:integer;                      { If D=1 then Screen Mode is EgaVga's  }
begin                                 { Mode.If D=2 then Screen Mode will be }
if d<=1 then d:=detect;               { Svga256 color mode.and M is mode for }
if d>1 then                           { Number Of Pixels in the Graphic Mode }
d:=installuserdriver ('svga256',nil);
initgraph (d,m,p);
end;

procedure sendnum(m,n:integer;var x1,x2,x3:integer);
begin                                 { Sends N to X1,X2 and X3 with mode m :}
if m<0 then begin                     { (If mode < 0 then -M changes to +M   }
                                      { and then "?" BeComes zero)           }
                                      {  Mode ³ X1 ³ X2 ³ X3                 }
x1:=0;x2:=0;x3:=0;                    { ÄÄÄÄÄÄÅÄÄÄÄÅÄÄÄÄÅÄÄÄÄ                }
m:=abs(m);                            {    1  ³ N  ³ ?  ³ ?                  }
end;                                  {    2  ³ ?  ³ N  ³ ?                  }
m:=(m mod 8);                         {    3  ³ ?  ³ ?  ³ N                  }
if m=1 then begin;x1:=n;end;          {    4  ³ N  ³ N  ³ ?                  }
if m=2 then begin;x2:=n;end;          {    5  ³ N  ³ ?  ³ N                  }
if m=3 then begin;x3:=n;end;          {    6  ³ ?  ³ N  ³ N                  }
if m=4 then begin;x1:=n;x2:=n;end;    {    7  ³ N  ³ N  ³ N                  }
if m=5 then begin;x1:=n;x3:=n;end;
if m=6 then begin;x2:=n;x3:=n;end;
if m=7 then begin;x1:=n;x2:=n;x3:=n;end;
end;

procedure sendrgb (m,n,x:integer);    { Sends N to Red,Green & Blue and sets }
var a,b,c:integer;                    { RGB Palette of X color :             }
begin                                 {  Mode ³ Color       Mode ³ Color     }
m:=abs(m);                            { ÄÄÄÄÄÄÅÄÄÄÄÄÄÄ     ÄÄÄÄÄÄÅÄÄÄÄÄÄÄ    }
sendnum(-m,n,a,b,c);                  {   1   ³ Red          4   ³ Yellow    }
setrgbpalette (x,a,b,c);              {   2   ³ Green        5   ³ Magenta   }
end;                                  {   3   ³ Blue         6   ³ Cyan      }
                                      {        Mode 7 : White Color          }
procedure changergb (x,r1,g1,b1,r2,g2,b2,d:integer);
begin                                 { Turn Palette Of X color to Lighter or}
repeat                                { Darker or Changes Palette to another }
setrgbpalette (x,r1,g1,b1);           { Palette.                             }
if r1>r2 then r1:=r1-1;{=Dec(r1)}     { R/G/B ³ From ³ To ³  D is Delay Of   }
if r1<r2 then r1:=r1+1;{=Inc(r1)}     { ÄÄÄÄÄÄÅÄÄÄÄÄÄÅÄÄÄÄ´  Palette Changing}
if g1>g2 then g1:=g1-1;               { Red   ³  R1  ³ R2 ³  Speed.          }
if g1<g2 then g1:=g1+1;               { Green ³  G1  ³ G2 ³                  }
if b1>b2 then b1:=b1-1;               { Blue  ³  B1  ³ B2 ³                  }
if b1<b2 then b1:=b1+1;
delay(abs(d));
if d<0 then if keypressed then break;
until ((r1=r2) and (g1=g2) and (b1=b2));
setrgbpalette (x,r2,g2,b2);
end;

procedure flashrgb (x,r1,g1,b1,r2,g2,b2,d,r,c:integer);
var i:integer;                        { = ChangeRGB Forward + BackWard       }
begin                                 { R is Rate after one ChangeRGB        }
for i:=1 to abs(c) do                 { C is Flash Count.                    }
begin
changergb (x,r1,g1,b1,r2,g2,b2,d);
delay (abs(r));
if r<0 then if keypressed then break;
changergb (x,r2,g2,b2,r1,g1,b1,d);
delay (abs(r));
if r<0 then if keypressed then break;
end;
end;

procedure swpi(var x,y:integer);      { SWaP two Integer numbers X <--> Y    }
var z:integer;                        { 12 , 100  ----> 100 , 12             }
begin                                 { X  ,  Y          X  ,  Y             }
z:=x;x:=y;y:=z;
end;

procedure swpL(var x,y:LONGint);      { SWaP two Longinteger numbers X <--> Y}
var z:longint;                        { 1205812,-10012133 > -10012133,1205812}
begin                                 { X      ,Y            X       ,Y      }
z:=x;x:=y;y:=z;
end;

procedure swpr(var x,y:real);         { SWaP two Real numbers X <--> Y       }
var z:real;                           { 12.5 , 100.13  ----> 100.13 , 12.5   }
begin                                 { X    , Y             X      , Y      }
z:=x;x:=y;y:=z;
end;

procedure swps(var x,y:string);       { SWaP two Strings X <--> Y            }
var z:string;                         { 'Hello'         ,    'Yester Day' Ä¿ }
begin                                 { 'Yester Day'    ,    'Hello'      <Ù }
z:=x;x:=y;y:=z;                       {      X                  Y            }
end;

procedure swpc(var x,y:char);         { SWaP two Characters X <--> Y         }
var z:char;                           { Q , “ ---> “ , Q º @ , þ ---> þ , @  }
begin                                 { X   Y      X   Y º X   Y      X   Y  }
z:=x;x:=y;y:=z;
end;

procedure rp(x,y:integer);            { Reset Palette of X color to Y color  }
var z:integer;                        { into Black Palette :                 }
begin                                 { Red > 0 , Green > 0 , Blue > 0       }
if y>x then swpi(x,y);
for z:=x to y do
setrgbpalette (z,0,0,0);
end;

function vali(s:string):integer;      { Convert a String to an Integer number}
var e,x:integer;                      { '23.213kjsdf'    ----> 23            }
begin                                 { '-786skjd90d.8d' ----> -786          }
val(s,x,e);                           { 'a122323'        ----> 0             }
if e=0 then x:=0;                     { '.233ds'         ----> 0             }
if e>1 then begin;s:=copy(s,1,e-1);val(s,x,e);end;
vali:=x;
end;

function vall(s:string):longint;      { Convert a String to a LongInteger num}
var x:longint;                        { '65765774.9833'      ----> 65765774  }
    e:integer;                        { '87967asdjh87.sad87' ----> 87967     }
begin
val(s,x,e);
if e=0 then x:=0;
if e>1 then begin;s:=copy(s,1,e-1);val(s,x,e);end;
vall:=x;
end;

function valr(s:string):real;         { Convert a String to a Real number    }
var x:real;                           { '823.5461asd' ----> 823.5461         }
    e:integer;                        { '3429.89.1kl' ----> 3429.89          }
begin
val(s,x,e);
if e=0 then x:=0;
if e>1 then begin;s:=copy(s,1,e-1);val(s,x,e);end;
valr:=x;
end;

function stri(x:integer):string;      { Convert an Integer Number to a String}
var s:string;                         { 12751 ----> '12751'                  }
begin
str(x,s);
stri:=s;
end;

function strr(x:real):string;         { Convert a Real Number to a String    }
var s:string;                         { 675.3041          > '675.3041'       }
begin                                 { 7326.987875463021 > '7326.9878754630'}
str(x:0:10,s);                        {      |__ 10 __|                      }
strr:=s;
end;

function strl(x:longint):string;      { Convert a Longinteger Num to a String}
var s:string;                         { 23967236 ----> '23967236'            }
begin
str(x,s);
strl:=s;
end;

function rights(s:string;x:integer):string;
var i:integer;                        { Result is X letters from right of S  }
begin                                 { (S is a String) :                    }
i:=length(s);                         { Rights ('Hello',3) = 'Hel'           }
i:=(i-x+1);
rights:=copy (s,i,x);
end;

function lefts(s:string;x:integer):string;
begin                                 { Result is X letters from left of S   }
lefts:=copy (s,1,x);                  { (S is a String) :                    }
end;                                  { Lefts ('Hello',3) = 'llo'            }

function ltrims(s:string):string;     { Deletes Blanks from left of String S }
begin                                 { LTrims('  Kooki')    = 'Kooki'       }
repeat                                { LTrims('  Splash  ') = 'Splash  '    }
if copy (s,1,1)=' ' then s:=copy(s,2,length(s)-1);
until copy (s,1,1)<>' ';
ltrims:=s;
end;

function rtrims(s:string):string;     { Deletes Blanks from Right of String S}
begin                                 { RTrims('Kooki ')     = 'Kooki'       }
repeat                                { RTrims('  Splash  ') = '  Splash'    }
if rights(s,1)=' ' then s:=lefts(s,length(s)-1);
until rights(s,1)<>' ';
rtrims:=s;
end;

function dtrims(s:string):string;     { = LTrims + RTrims :                  }
begin                                 { Dtrims (' Woow!    ') = 'Woow!'      }
dtrims:=ltrims(rtrims(s));
end;

procedure bgmouse;                    { Begin Mouse Using :                  }
begin                                 { Works in : Crt mode , EgaVga Mode    }
initmouse;
showmouse;
end;

procedure edmouse;                    { End of Mouse Using :                 }
begin                                 { Works in : Crt mode , EgaVga Mode    }
hidemouse;
end;

FUNCTION leftmb:boolean;              { If Left button of mouse was Pressed  }
begin                                 { Result is True                       }
leftmb:=leftbuttonpressed;
end;

FUNCTION rightmb:boolean;             { If Right button of mouse was Pressed }
begin                                 { Result is True                       }
rightmb:=rightbuttonpressed;
end;

procedure cadrt(s:string;x1,y1,x2,y2,c,cb,tc,tb,ttb,r1:integer);
                                      { Make a Cadr in Text mode (Crt mode)  }
                                      { Frome (X1,Y1) to (X2,y2) ; S is Title}
                                      { ;C is Cadr's Color ; CB is BackGround}
var u,d,r,l,ur,ul,dr,dl:string;       { Of Cadr ; TC is Color of Title ;TB is}
    z,i,j:integer;                    { Title's BackGround ; TTB is InCadr's }
begin                                 { BackGround Color ; R is mode of Cadr }
if ((r1<>2) and (r1<>3) and (r1<>4))  { R ³ Example         R ³ Example      }
then begin                            { ÄÄÅÄÄÄÄÄÄÄÄÄ        ÄÄÅÄÄÄÄÄÄÄÄÄ     }
u:='Í';d:='Í';l:='º ';r:=' º';        {   ³ ÉÍ A Í»           ³  Ûß A ßÛ     }
ur:='Í»';ul:='ÉÍ';dr:='Í¼';dl:='ÈÍ';  { 1 ³ º     º         3 ³  Û     Û     }
end;                                  {   ³ ÈÍÍÍÍÍ¼defult     ³  ÛÜÜÜÜÜÛ     }
if r1=2 then begin                    { ÄÄÅÄÄÄÄÄÄÄÄÄ        ÄÄÅÄÄÄÄÄÄÄÄÄ     }
u:='Ä';d:='Ä';l:='³ ';r:=' ³';        {   ³ ÚÄ A Ä¿           ³  ÛÛÛ A ÛÛÛ   }
ur:='Ä¿';ul:='ÚÄ';dr:='ÄÙ';dl:='ÀÄ';  { 2 ³ ³     ³         4 ³  ÛÛ     ÛÛ   }
end;                                  {   ³ ÀÄÄÄÄÄÙ           ³  ÛÛÛÛÛÛÛÛÛ   }
if r1=3 then begin                    {                                      }
u:='ß';d:='Ü';l:='Û ';r:=' Û';
ur:='ßÛ';ul:='Ûß';dr:='ÜÛ';dl:='ÛÜ';
end;
if r1=4 then begin
u:='Û';d:='Û';l:='ÛÛ';r:='ÛÛ';
ur:='ÛÛ';ul:='Û';dr:='ÛÛ';dl:='Û';
end;
TEXTcolor (c);textbackground(cb);
gotoxy(x1,y1);write(ul);gotoxy(x2,y1);
write(ur);
gotoxy(x1,y2);write(dl);gotoxy(x2,y2);
write(dr);
for z:=(y1+1) to (y2-1) do
begin
gotoxy(x1,z);write(l);gotoxy(x2,z);
write(r);
end;
for z:=(x1+1) to (x2-1) do
begin
gotoxy(z,y1);write(u);gotoxy(z,y2);
write(d);
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
begin                                 { ColorSet in Text mode ,X is ForGround}
if x>-1 then textcolor(x);            { and Y is BackGround Color , If Z was }
if y>-1 then textbackground(y);       { True then Screen Will Be clear after }
if z then clrscr;                     { Color Setting.If X/Y was less than 0 }
end;                                  { X/Y not be Changes .                 }

procedure colorsg(x,y:integer);       { ColorSet in Graphic mode ,X is Color }
begin                                 { Y is Screen Back Ground Color and    }
if x>-1 then setcolor (x);            { Works in EgaVga Driver mode ONLY.    }
if y>-1 then setbkcolor (y);          { If X/Y was less than 0  then X/Y not }
end;                                  { be Changes .                         }

function backw(s:string):string;      { Make a String BackWard :             }
var i:integer;s1:string;              { 'Hello World' --> 'dlroW olleH'      }
begin                                 { It makes Farsi Using , Easyer.       }
s1:='';
for i:=1 to length(s) do
s1:=copy (s,i,1)+s1;
backw:=s1;
end;

function chcolor (s:string):integer;  { Choose a Color for one Letter , so   }
var i,j:integer;                      { Your Strings will be more Pretty than}
begin                                 { Ever.                                }
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

procedure wrta(s:string;n,z,tj        { Writes a letter in Text Mode with    }
               :integer;d:real;yn,ny  { Effects ; S is Your String , N = mode}
               :boolean);             { if n<0 then Writes from last to first}
var sou,x,y,i,d2,xp,yp,p,t,mx,my      { N ³ Mode       , Write at the        }
    :integer;                         {absÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ}
    stt1:array[1..78] of string[1];   { 1 ³ Horizontal , Center              }
label augh;                           { 2 ³ Horizontal , At the end of rows  }
begin                                 { 3 ³ Horizontal , Cursor's Place      }
if (length(s)<=0) or (abs(n)>6) or    { 4 ³ Vertical   , Center              }
(length(s)>78) then goto augh;        { 5 ³ Vertical   , At the end of Clumns}
if abs(n)<4 then if z>0 then y:=z else{ 6 ³ Vertical   , Cursor's Place      }
y:=wherey;                            { Z is a number of Cloumn in 1..3 mode }
if abs(n)>3 then if z>0 then x:=z else{               or Rows   in 4..6 mode }
x:=wherex;                            { If Z was less than 0 then it detects }
if d>0 then begin                     { AutoMaticaly , TJ is Text's Color and}
sou:=0;if (d-trunc(d))>=0 then        { if TJ was less than 0 then it Chooses}
sou:=trunc(frac(d)*10000);            { With ChColor Function , D is Delay & }
end;                                  { Writer Sound it is a Real Number:    }
d2:=trunc(d);                         { Example : 300.0100 ,Sound can be zero}
if yn then s:=backw(s);               {    |Delay <ÄÙ ÀÄ> Sound| (úúú.XXXX)  }
for i:=1 to length(s) do              { , YN is a boolean type and is it was }
STT1[I]:=copy (s,i,1);                { True then String will be Back Ward , }
if n=0 then n:=1;                     { NY is a boolean too ; if ir was true }
xp:=0;yp:=0;t:=abs(tj);               { Writer goes a line downer, as like as}
i:=length(s);                         { Writeln, else cursor stay in a place }
p:=1;                                 { after last Character.                }
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
if d2>0 then if sou<>0 then snd (sou,d2) else delay(d2);
end;
if ny then writeln;
augh:
end;

function timer:real;
var h,m,s,hu:word;
begin
gettime (h,m,s,hu);
timer:=m*60+s+(hu/100)
end;

procedure wrga(s:string;x,y,c,m,sc,sd { Writes a String is graphical Screen  }
:integer;ss:real;xx,yy:integer;d:real;{ Effects ,S is your string ,X & Y are }
            cs:integer;yn,ny:boolean);{ giving Starting pixel , C is Color , }
Var i,j,q,w,e,r,t,u,o:integer;        { M is a mode :                        }
st:array[1..80] of string[1];label aa,{  M ³ Mode                            }
asoi;begin;xx:=-xx;yy:=-yy;           {ÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ}
if length(s)>80 then s:=copy(s,1,80); { <0 ³ Draw Single Shadow with SC color}
j:=0;if m<0 then begin;m:=abs(m);j:=1;{  0 ³ Normal Writing (No Shadow)      }
end;q:=x-xx;w:=y-yy;cs:=cs-1;         {  1 ³ 63 Color shadow : °±²ÛA         }
if j=1 then begin                     {  2 ³ 63 Color shadow : Û²±°A         }
setcolor (sc);outtextxy (q,w,s);      {  3 ³ 63 Color shadow : °±²Û²±°A      }
delay(sd);end;                        {  4 ³ 63 Color shadow : Û²±°±²ÛA      }
if j=0 then begin                     { SC : if mode was less than zero it is}
m:=(m mod 5);                         { Shadows Color , If it was larger than}
if m =0 then goto aa;                 { 0 it is Shadow Color Mode (->SendRGB }
if m<=4 then begin;q:=trunc(q+(15*ss));w:=trunc(w+(15*ss)); { modes),SD is Shadowing Delay,XX & YY:}
for j:=0 to trunc((63 div 4)*ss) do   { Start Pixel of Shadow Drawing (from  }
begin; setcolor (j+cs);               { X and Y of String writing Pixel , SS:}
outtextxy (q,w,s);                    { Shadow Size ; Uses only in  >0  mode }
if xx+x>x then q:=q+1 else q:=q-1;    { D : Delay.Sound (-> Wrta D), YN : is }
if yy+y>y then w:=w+1 else w:=w-1;    { Boolean Type; True means: Turn Cursor}
if m=1 then o:=j;                     { On. CS Palette Changing Color Start  }
if m=2 then o:=trunc((63 div 4)*ss)-j;{ Uses Only in >0 mode.                }
if m=3 then
if j< (trunc((63 div 4)*ss) div 2) then o:=j*2 else o:=(trunc((63 div 4)*ss)-j)*2-2;
if m=4 then
if j> (trunc((63 div 4)*ss) div 2) then o:=(j*2) else o:=((trunc((63 div 4)*ss)-j)*2)+2;
sendrgb(sc,trunc((o*4) / ss) ,j+cs);
delay(sd);
end;
end;
end;
aa:
setcolor (c);
d:=abs(d);
if d>0 then begin
q:=trunc(d);
w:=trunc(frac(d)*10000);
for o:=1 to length(s) do begin
if w>0 then sound (w);
for u:=1 to q do begin
if yn then if (trunc(timer*10) mod 5) =0 then begin;outtextxy(x,y,lefts(s,o)+'_');delay(1);end;
if yn then if (trunc(timer*10) mod 5) =2 then begin
setcolor (0);outtextxy(x,y,lefts(s,o)+'_');setcolor(c);
outtextxy(x,y,lefts(s,o));
if ny then if keypressed then goto asoi;
end;
if yn then if (trunc(timer*10) mod 5) >2 then delay(1);
if not yn then outtextxy(x,y,lefts(s,o));
if not yn then delay(1);
end;
if yn then begin;setcolor (0);outtextxy(x,y,lefts(s,o)+'_');setcolor(c);
outtextxy(x,y,lefts(s,o));end;

if w>0 then nosound;
end;
end else outtextxy (x,y,s);
asoi:
setcolor (c);
outtextxy (x,y,s);
end;
end.