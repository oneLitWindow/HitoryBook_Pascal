uses ncrt,dos,screen,easyer,ketabsup,mousedrv;
var s:string;
    i,j:integer;
    h,m,ss,p:word;
mys:savescreen;
begin
initmouse;
showmouse;
mys.init;
mys.setcursor($2000);
textbackground(0);
clrscr;
j:=0;
repeat
gettime(h,m,ss,p);
s:='Ali is the best - '+fixof(stri(h),'0',2)+':'+fixof(stri(m),'0',2)+':'+fixof(stri(ss),'0',2);
if (j=0) and ((p mod 2) =0) then begin
j:=1;
i:=i+1;
if s[i]=' ' then i:=i+1;
if i>length(s) then i:=1;
textcolor(1);
gotoxy(1,1);
write (s);
textcolor(9);
gotoxy(i,1);
write (s[i]);
end;
if p mod 2<>0 then j:=0;
if i>=length(s) then i:=0;
gotoxy(1,2);
write (mousex:3,',',mousey:3);
until keypressed or leftbuttonpressed;
end.