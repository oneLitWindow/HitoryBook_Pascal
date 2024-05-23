unit textef;
interface
procedure clscr;
procedure stepcadr (x1,y1,x2,y2,cc,cb,ib:integer; title:string);
procedure txtcolor (c,b:integer);
procedure scrleft (x,y,d:integer;s:string);
procedure scrright (x,y,d:integer;s:string);
procedure scrcol (x,y,d:integer;s:string);
implementation
uses ncrt,mousedrv,graph;
const clrs:array[0..9] of integer = (02 , 09, 12, 13, 10, 11, 14, 15, 10, 03);

var ite:array[1..10] of integer;
    s1,s2:string;
    c:char;
procedure scrleft (x,y,d:integer;s:string);
begin
gotoxy(x,y);
for ite[1]:=1 to length(s) do begin
write (copy (s,1,ite[1]));
delay (d);
gotoxy (x-ite[1],y);
end;
gotoxy(x,y);
end;

procedure scrright (x,y,d:integer;s:string);
begin
gotoxy(x,y);
for ite[1]:=0 to length(s)-1 do begin
write (copy (s,length(s)-ite[1],ite[1]+1));
delay (d);
gotoxy (x,y);
end;
write (s);
end;

procedure txtcolor (c,b:integer);
begin
textcolor(c);
textbackground (b);
end;

procedure scrcol (x,y,d:integer;s:string);
begin
for ite[2]:=1 to length(s)*2 do begin
gotoxy (x,y);
for ite[1]:=1 to length(s) do begin
textcolor(clrs [ ((length(s)*10)+ite[1]-ite[2]) mod 10 ] );
write (copy(s,ite[1],1));
if ite[2]=1 then delay (round(d*0.7));
gotoxy (x+ite[1],y);
end;
if keypressed then break;
delay ((d div 2)+ (ite[2])*2);
if (ite[2] - length(s)*2) <6 then delay ((d div 2)+ (ite[2])*2);
end;
end;

procedure stepcadr (x1,y1,x2,y2,cc,cb,ib:integer; title:string);
var d:integer;
begin
txtcolor (cc,cb);
d:=20;
gotoxy (x1,y1);
write ('É');
delay (d);
for ite[1]:= x1+1 to x2 -1 do begin
gotoxy (ite[1],y1);
write ('Í');
delay (d);
end;
gotoxy (x2,y1);
write ('»');
delay (d);
for ite[1]:= y1+1 to y2 -1 do begin
gotoxy (x2-1,ite[1]);
write (' º');
delay (round(d*1.7));
end;
gotoxy (x2,y2);
write ('¼');
delay (d);
for ite[1]:= x2-1 downto x1 +1 do begin
gotoxy (ite[1],y2);
write ('Í');
delay (d);
end;
gotoxy (x1,y2);
write ('È');
delay (d);
for ite[1]:= y2-1 downto y1 +1 do begin
gotoxy (x1,ite[1]);
write ('º ');
delay (round(d*1.7));
end;
textbackground (ib);
for ite[1]:=x1+2 to x2-2 do begin
for ite[2]:=y1+1 to y2-1 do begin
gotoxy (ite[1],ite[2]);
write (' ');
gotoxy ((x2-ite[1])+1,ite[2]);
write (' ');
end;
delay (20);
end;
textbackground (cb);
scrright (((x2-length(title))div 2)+x1,y1,100,title);
end;
procedure clscr;
begin
textbackground (0);
textcolor(9);
for ite[1]:=1 to 40 do begin
for ite[2]:=1 to 25 do begin
gotoxy (ite[1],ite[2]);
write (' ³');
gotoxy ((80-ite[1]),ite[2]);
if (ite[1]<>1) or (ite[2]<>25) then write ('³ ');
end;
delay (20+ite[1]);
end;
clrscr;
end;

end.