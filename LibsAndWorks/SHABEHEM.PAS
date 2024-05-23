uses ncrt;
var a:array[1..10] of integer;
i,temp:integer;
begin
clrscr;
for i:=1 to 10 do
readln(a[i]);
for i:=1 to 9 do
if a[i+1]>a[i] then
begin
temp:=a[i+1];
a[i+1]:=a[i];
a[i]:=temp;
end;
writeln;
for i:=1 to 10 do
write(a[i]:3);
end.