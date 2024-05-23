uses graph,ncrt;
type binary=array[1..5] of byte;
function tobin(x:integer);
begin
while x>=
end;
var n,m,i:integer;
    a:array[1..32] of integer;
function pow(x,y:longint):longint;
var i:integer;
begin
for i:=2 to y do
x:=x*y;
pow:=x;
end;
begin
clrscr;
textcolor (10);
write ('Enter number of variables(maximume 5): ');
textcolor (11);
readln(n);
i:=0;
textcolor (14);
writeln ('negative value to finish...');
repeat
i:=i+1;
textcolor (11);
write ('Enter value number 00',i:2,': ');
textcolor (10);
readln(a[i]);
if (i>=pow(2,n)) then break;
until (a[i]<0);
end.