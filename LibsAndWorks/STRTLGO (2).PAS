uses graph,mousedrv,crt,bmpload,dos,easyer;
var i:array[1..10] of integer;
begin
i[1]:=installuserdriver('svga256',nil);
i[2]:=2;
initgraph (i[1],i[2],'d:\compiler\bp\bgi');
load ('c:\dos\asp\logo\startup.bmp',0,0,-1,-1,1,1);
delay (3600);
while keypressed do
readkey;
closegraph;
end.