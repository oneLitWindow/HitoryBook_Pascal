{unit f;}
uses screen,mousedrv,ncrt;
var
ss:cursor;
    yy,xx,ij:integer;
x,y:integer;
begin
clrscr;
initmouse;
showmouse;
ss.init;
ss.setcursor($2000);
while not keypressed do begin
if leftbuttonpressed then writeln('Left!');
if rightbuttonpressed then writeln('Right!');
if wherey>23 then clrscr;
x:=wherex;
y:=wherey;
if wherey>23 then clrscr;
gotoxy(1,1);
write ('X: ',mousex:3,' , Y: ',mousey:3);
gotoxy(x,y);
end;
end.