uses ncrt;
var i:array[1..10] of integer;
    s1,s2:string;
    c:char;
begin
textbackground(1);
clrscr;
textbackground(2);
textcolor(15);
writeln('Salam');
textcolor(7);
writeln('Salam');
textbackground(1);
textcolor(14);
s1:='';
i[1]:=4;
repeat
c:=readkey;
if c=#8 then begin
   if length(s1)=1 then s1:='';
   if length(s1)>1 then s1:=copy(s1,1,length(s1)-1);
end;
if c=#13 then begin;i[1]:=i[1]+2;s1:='';end;
if (c<>#8) and (c<>#13) and (c<>#27) then s1:=s1+c;
gotoxy(1,i[1]);
textcolor(15);
write (s1,' ');
textcolor(7);
gotoxy(1,i[1]+1);
write(s1,' ');
gotoxy(length(s1)+1,i[1]);
delay(50);
until c=#27;
writeln;
writeln;
end.