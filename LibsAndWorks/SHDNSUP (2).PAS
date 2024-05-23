uses graph,mousedrv,crt,bmpload,dos,easyer;
type
    string_10=string[10];
    security=record
                NUMI:BYTE;
                temp1:byte;
                end;
function ranchr:char;
begin
ranchr:=chr(random(250)+4);
end;
procedure filldata (var data:security);
var x:integer;
begin
randomize;
with data do
begin
temp1:=random(255);
end;
end;
var
i:array[1..20] of integer;
s:array[1..5] of string;
c:array[1..5] of char;
r:array[1..10] of real;
l:array[1..5] of longint;
f:text;
file1 : file of security;
data  :         security;
label holdup;
begin
{$i-}
initmouse;
cOLORST(10,0,false);
gotoxy (1,10);
cadrt('',30, 9,48,15,10,2,14,4,1,0);
cadrt('Tab/Mouse1 = More',8,17,70,19,14,5, 10,1,6,2);
colorst(15,1,false);
wrta ('Shut Down : Arrows / Mouse left = move , Esc = Exit , ...',1,-1,2,5.01,false,true);
gotoxy (1,10);
colorst (14,5,false);
wrta ('[>] Shut Down   ',1,-1,2,5.01,false,true);
colorst (10,4,false);
wrta ('[ ] Restart     ',1,-1,2,5.01,false,true);
wrta ('[ ] Screen Saver',1,-1,2,5.01,false,true);
colorst (10,2,false);
wrta ('麺様様様様様様様様郵',1,-1,2,0,false,true);
colorst (11,1,false);
gotoxy (33,14);
wrta ('  OK    Cancel' ,3,-1,2,0,false,false);
colorst (11,4,false);
wrta (#8+#8+#8+#8+#8#8' Cancel ',0,-1,2,0,false,true);
i[7]:=1;
i[1]:=1;
i[3]:=1;
i[2]:=1;

movemousecursor (29*8,8*8);
showmouse;
while 1=1 do begin
while not keypressed do begin
if leftmb then begin
c[1]:=#255;
i[5]:=mousex div 8;
i[6]:=mousey div 8;
movemousecursor (30*8,8*8);
if (i[6]=17) and (i[5]>08) and (i[5]<69) then begin;i[7]:=-i[7];goto holdup;end;
if (i[5]>30) and (i[5]<47) then begin
if (i[6]>8) and (i[6]<12) then begin
if i[1]<>i[6]-8 then i[1]:=i[6]-8 else if i[2]<>i[1] then i[2]:=i[1] else c[1]:=#13;
goto holdup;
end;
if i[6]=13 then begin
if i[5]<38 then if i[3]<>1 then i[3]:=1 else c[1]:=#13;
if i[5]>=38 then if i[3]<>-1 then i[3]:=-1 else c[1]:=#27;
goto holdup;
end;
end;
end;
end;
c[1]:=readkey;
if c[1]=#0 then c[1]:=readkey;
holdup:
if c[1]=#72 then i[1]:=i[1]-1;
if c[1]=#80 then i[1]:=i[1]+1;
if c[1]=#75 then i[3]:=-i[3];
if c[1]=#77 then i[3]:=-i[3];
if c[1]=#9 then i[7]:=-i[7];
if c[1]=#27 then halt;
if c[1]=#13 then break;
if c[1]=#32 then i[2]:=i[1];
if i[1]<1 then i[1]:=3;
if i[1]>3 then i[1]:=1;
gotoxy (1,10);
colorst (10,4,false);
if i[1]=1 then colorst (14,5,false);
wrta ('[ ] Shut Down   ',1,-1,2,0,false,true);
colorst (10,4,false);
if i[1]=2 then colorst (14,5,false);
wrta ('[ ] Restart     ',1,-1,2,0,false,true);
colorst (10,4,false);
if i[1]=3 then colorst (14,5,false);
wrta ('[ ] Screen Saver',1,-1,2,0,false,true);
colorst(14,5,false);
if i[2]=1 then gotoxy(33,10);
if i[2]=2 then gotoxy(33,11);
if i[2]=3 then gotoxy(33,12);
if i[2]<>i[1] then colorst (10,4,false);
write('>');
colorst (11,4,false);
writeln;
if i[3]=1 then colorst (11,1,false);
gotoxy (33,14);
wrta ('  OK    Cancel' ,3,-1,2,0,false,false);
colorst (11,4,false);
if i[3]=-1 then colorst (11,1,false);
wrta (#8+#8+#8+#8+#8#8' Cancel ',0,-1,2,0,false,true);

{cadrt('Tab/Mouse1 = More',8,17,70,19,14,5, 10,1,6,2);}
gotoxy (9,18);
colorst(15,1,false);
if i[7]=1 then
      wrta ('Shut Down : Arrows / Mouse left = move , Esc = Exit , ...',1,-1,2,0,false,true)
else  wrta ('Space / Mouse left = Select , Enter / Mouse left = Accept',1,-1,2,0,false,true);
movemousecursor(i[5]*8,i[6]* 8);

end;
assign (f,'c:\work.inp');
rewrite(f);
if i[2]=2 then begin;write (f,'RESET');end;
if i[2]=3 then begin;write (f,'STANDBY');end;
if i[2]=1 then begin;write (f,'SHUTDOWN');end;
close(f);
if i[2]>1 then halt;
clrscr;
i[1]:=installuserdriver('svga256',nil);
i[2]:=2;
initgraph (i[1],i[2],'d:\compiler\bp\bgi');
settextstyle (7,0,3);
setcolor (100);
setrgbpalette(100,0,0,63);
outtextxy (getx+150,gety+50,'MS DOS is Shutting Down...');
load ('c:\dos\asp\logo\logos.dsy',0,0,-1,-1,1,1);
setrgbpalette (0,0,0,0);
setcolor (100);
outtextxy (getx+300,gety,'By Amin Safinezhad');
asm
int 200
end;
end.

