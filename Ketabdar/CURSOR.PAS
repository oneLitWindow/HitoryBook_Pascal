uses ncrt,easyer,ketabsup,screen;
var
  ss        : SaveScreen;
  m,i,j,k:integer;
c:char;
begin
  ss.Init;
  TextBackground(BLACK);
  ClrScr;
  ss.SetCursor($2000);
j:=1;
k:=1;
i:=0;
m:=20;
repeat
gotoxy (1,1);
write (i,'-->');
ss.SetCursor(i);
c:=#0;
if (j<>-1) or (keypressed) then c:=readkey else delay(m);
if (c='s') or (c='S') then j:=-j;
if c='h' then m:=1;
if c='m' then m:=20;
if c='l' then m:=50;
if c='a' then k:=1;
if c='z' then k:=-1;
i:=i+k;
write(' <-');
until c=#27;
end.
