{$M 4000,0,0}
unit suprun;
interface
function ss(x:integer):string;
function pass:string;
procedure runsup(ee1,x1,y1,ee2,x2,y2,ee3,x3,y3,ee4,x4,y4:integer);
implementation
uses dos,crt;
function ss(x:integer):string;
var a:string;
begin
str (x,a);
ss:=a;
end;

function pass:string;
begin
pass:= '';{chr(219) + CHR(255) + ' ' + CHR(159) + CHR(741);}
end;

procedure runsup(ee1,x1,y1,ee2,x2,y2,ee3,x3,y3,ee4,x4,y4:integer);
{$M 4000,0,0}
var s:string;
begin
s:=pass+
   ss(ee1)+','+ss(x1)+','+ss(y1) +','+
   ss(ee2)+','+ss(x2)+','+ss(y2) +','+
   ss(ee3)+','+ss(x3)+','+ss(y3) +','+
   ss(ee4)+','+ss(x4)+','+ss(y4) (***);
swapvectors;
exec ('sup.exe ',pass);
swapvectors;
end;
end.