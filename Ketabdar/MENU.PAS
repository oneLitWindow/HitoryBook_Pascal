uses ncrt;
var i:integer;
    io:integer;
    arrow:boolean;
    c:char;
begin
clrscr;
i:=1;
io:=0;
repeat
c:=#2;
if keypressed then c:=readkey;
if c=#0 then begin;arrow:=true;c:=readkey;end;
if (arrow) and (c=#72) then i:=i-1;
if (arrow) and (c=#80) then i:=i+1;
if i<1 then i:=5;
if i>5 then i:=1;
if i<>io then begin
gotoxy(1,1);
writeln ('  1. Menu Item 1');
writeln ('  2. Menu Item 2');
writeln ('  3. Menu Item 3');
writeln ('  4. Menu Item 4');
writeln ('  5. Menu Item 5');
io:=i;
gotoxy(1,i);
writeln('>>');
end;
until (c=chr(27)) or (c=chr(13));
writeln;
writeln;
writeln;
writeln;
writeln;
writeln;
writeln ('Menu Item selected: ',i);
readln;
end.