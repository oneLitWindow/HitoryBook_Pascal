uses ncrt;
var c:char;
begin
repeat
     c:=readkey;
     writeln(ord(c),' ');
until c='0';
end.
