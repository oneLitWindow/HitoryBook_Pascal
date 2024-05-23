uses textef,easyer,graph,ncrt,mousedrv,screen;
var ss:savescreen;
    i:array[1..10] of integer;
label yy;
begin
yy:
TextMode(3);
initmouse;
showmouse;
ss.Init;
ss.SetCursor($2000);
txtcolor (10,0);
scrleft  (80,10,10,'vahid says: salam chetori? khoobi? mana khoolam! 1');
txtcolor (11,0);
scrright (1,11,50,'vahid says: salam chetori? khoobi? manam kholam! 2');
scrcol   (1,12,20,'vahid says: salam chetori? khoobi? manam kholam! 3');
stepcadr (1,1,50,20,14,4,1,' Salam ');
delay (2000);
clscr;
if not keypressed then goto yy;
end.