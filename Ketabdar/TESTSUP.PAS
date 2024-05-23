uses ketabsup,easyer,mousedrv,ncrt;
var i:integer;
    c:char;
begin
drawframe1;
readkey;
textbackground(0);
clrscr;
bgmouse;
i:=choose('1begin,2delete,3enter,4insert,5quite,6ok,7last,8end',10,10,1);
gotoxy(1,15);write ('-',i,'-');
repeat
gotoxy(30,1);
write (port[$60],'  -',mousetx,'-',mousety,'-');
if keypressed then begin
c:=readkey;
write('-- Key: ',c,'--');
if c=#0 then begin;c:=readkey;write('-- Key: ',c,'--');end else write ('------------');
end;
until (c=#27);
end.