uses ncrt;
var x,y:integer;
procedure swap (var i,j:integer);
var temp:integer;
begin
temp:=i;
i:=j;
j:=temp;
end;
begin
x:=10;
y:=20;
write ('X: ',x,' Y: ',y);
swap(x,y);
write ('X: ',x,' Y: ',y);
readkey;
end.