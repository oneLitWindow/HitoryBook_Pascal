unit logos;
interface
procedure logo;
implementation
uses crt,graph,support;
procedure logo;
var
i:array [1..10] of integer;
c:char;
begin
delay (1000);
FOR i[1]:=0 to 63 do
begin
setrgbpalette (100+i[1],0,63-i[1],63-i[1]);
SETCOLOR (100+I[1]);
i[2]:=i[1]*7;
i[3]:=i[1]*4;
for i[5]:=1 to 7 do
rectangle (trunc((640/2)-i[2])-i[5],trunc((480/2)-i[3])-40-i[5],trunc((640/2)+i[2])+i[5],trunc((480/2)+i[3])-40+i[5]);
end;
barcadr (14,0);
getkeys;
setrgbpalette (14,0,0,0);
settextstyle (7,0,5);
setcolor (14);
outtextxy (30,50,'Elm By Amin Safinezhad');
setcolor (12);
settextstyle (8,0,5);
outtextxy (30,170,'Tetta_Pixel@yahoo.com');
setcolor (11);
settextstyle (1,0,5);
outtextxy (160,300,'Mr. B.Magham');
setcolor (10);
setcolor (13);
settextstyle (7,0,1);
outtextxy (260,360,'Physics');
while not keypressed do
begin
for i[5]:=1 to 63 do
begin
setrgbpalette (14,i[5],i[5],0);
delay (5);
if keypressed then break;
end;
for i[5]:=63 downto 1 do
begin
setrgbpalette (14,i[5],i[5],0);
delay (5);
if keypressed then break;
end;
end;
setrgbpalette (14,63,0,63);
readkey;
cleardevice;
end;
end.