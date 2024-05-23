uses ncrt;
var c:char;
    s:string;
begin
repeat
s:='';
c:=readkey;
{if (c=#0) and (keypressed) then begin;c:=readkey;s:=#0+c;end;}
if c<>#0 then writeln (c,': ',ord(c):3) else write ('CHR(0) + ');
until c=#27;
end.