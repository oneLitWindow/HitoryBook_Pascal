uses ncrt,dos,screen,mousedrv;
var c:char;
    i,j,k:integer;
    s:string[20];
    h,m,ss,p:word;
    mys:savescreen;
{************************************}
procedure men;
begin
textcolor(7);
textbackground(1);
gotoxy(20,6);
write(' lended       ');
gotoxy(20,7);
write(' repaired     ');
gotoxy(20,8);
write(' lost         ');
gotoxy(20,9);
write(' notdefined   ');
end;
{************************************}
procedure wri;
begin
gettime(h,m,ss,p);
if (k=0) and (p mod 2=0) then begin
k:=1;
j:=j+1;
while s[j]=' ' do
j:=j+1;
if j>length(s) then j:=1;
gotoxy(20,i);
textcolor(6);
textbackground(4);
write(s);
gotoxy(19+j,i);
textcolor(14);
write(s[j]);
end;
if (p mod 2)<>0 then k:=0;
end;
{************************************}
begin
j:=0;
k:=0;
mys.init;
mys.setcursor($2000);
initmouse;
showmouse;
textbackground(0);
clrscr;
i:=6;
men;
s:=' lended       ';
wri;
repeat
c:=#2;
 if keypressed then begin
   c:=readkey;
   if (c=#0) and keypressed then begin
   men;
   c:=readkey;
   if c=#80 then i:=i+1;
   if c=#72 then i:=i-1;
   if i>9 then i:=i-4;
   if i<6 then i:=i+4;
 end;
 end;

  case i of
     6:begin; textbackground(4); s:=' lended       '; wri; end;
     7:begin; textbackground(4); s:=' repaired     '; wri; end;
     8:begin; textbackground(4); s:=' lost         '; wri; end;
     9:begin; textbackground(4); s:=' notdefined   '; wri; end;
 end;

until (c=#27) or (c=#13) or (leftbuttonpressed);
end.
