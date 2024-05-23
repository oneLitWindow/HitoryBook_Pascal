uses ncrt,dos;
var c:char;
begin
repeat
if keypressed then begin;c:=readkey;writeln(ord(c));end;
until c=#27;
end.