uses ncrt;
var c:char;
begin
repeat
if keypressed then c:=readkey;
gotoxy(1,1);
writeln(port[$60]:4);
until c=#27;
end.