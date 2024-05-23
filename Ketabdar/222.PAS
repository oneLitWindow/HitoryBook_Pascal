uses ncrt;
var i:integer;
begin
clrscr;
for i:=10 to 255 do begin
write (i:6,':',chr(i));
end;
{write ('13:',chr(13));
write ('Salam')}
end.