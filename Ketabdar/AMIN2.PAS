uses ncrt,graph,easyer;
var i:array[1..10] of integer;
    i1,i2,i3:integer;
    c1,c2:char;
    s1,s2:string;
begin
Screen (2,2,'e:\compiler\bp\bgi');
settextstyle (7,0,2);
{                                   M SC SD}
i[1]:=0;
i[2]:=0;
s1:='';
setcolor(10);
i1:=0;
i2:=0;
i3:=0;
repeat
if keypressed then begin
c1:=readkey;
if c1<>#0 then begin
outtextxy(100,100,'Salam');
setcolor(8);
for i[1]:=1 to 5 do
outtextxy(textwidth(s1)+i[1],50+I[1],c1);
setcolor(15);
outtextxy(textwidth(s1),50,c1);
s1:=s1+c1;
end else begin
c1:=readkey;
if c1=#72 then i1:=i1-1;
if c1=#80 then i1:=i1+1;
c1:=#255;
end;
end;
{i[2]:=i[2]+i[3];}
setrgbpalette (15,i1,63-i2,i3);
delay(100);
until c1=#27;

{wrga('Mohsendeh is Khar',getx,gety,10,1,01,01,1,getx,gety,10,120,false,true);}
end.