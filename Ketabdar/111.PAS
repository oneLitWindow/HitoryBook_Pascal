uses ncrt;
procedure textcadr(x1,y1,x2,y2:integer);
var i:integer;
begin
textcolor(15);
textbackground(1);
gotoxy(x1,y1);
write('É');
gotoxy(x1,y2);
write ('È');
gotoxy(x2,y1);
write('»');
gotoxy(x2,y2);
write ('¼');
for i:=x1+1 to x2-1 do begin
gotoxy(i,y1);
write ('Í');
gotoxy(i,y2);
write ('Í');
end;
for i:=y1+1 to y2-1 do begin
gotoxy (x1,i);
write ('º');
gotoxy (x2,i);
write ('º');
end;
window (x1+1,y1+1,x2-1,y2-1);
clrscr;
end;
var c:char;
    i:integer;
begin
textbackground(0);
clrscr;
textcadr (1,1,80,23);
i:=1;
repeat
gotoxy (1,1);
if i=1 then textbackground(2) else textbackground(3);
textcolor(14);
gotoxy(1,1);
write (' Amin! ');

textcolor(8);
textbackground(1);
writeln ('Ü');
gotoxy(1,2);
writeln (' ßßßßßßß');

gotoxy (10,1);
if i=2 then textbackground(2) else textbackground(3);
textcolor(14);
gotoxy(10,1);
write (' !¢þ¤ê ');

textcolor(8);
textbackground(1);
writeln ('Ü');
gotoxy (10,2);
writeln (' ßßßßßßß');

gotoxy (20,1);
if i=3 then textbackground(2) else textbackground(3);
textcolor(14);
write (' Vahid ');

textcolor(8);
textbackground(1);
writeln ('Ü');
gotoxy(20,2);
writeln (' ßßßßßßß');
c:=readkey;
if c=#75 then i:=i-1;
if c=#77 then i:=i+1;
if i<1 then i:=3;
if i>3 then i:=1;
until (c=#27) or (c=#13);
if (c=#27) then writeln ('ESC Pressed!') else begin
writeln ('Item selected: ',i);
if i=1 then writeln ('Amin khoobe!');
if i=2 then writeln ('Farid is ok!');
if i=3 then writeln ('Vahid khare!');
end;
{                    }
{     OK  Ü         }
{   ßßßßßßß         }
readln;
end.
