uses ncrt;
var
  v:array[1..11]of integer;
  i,j,n,help:integer;
 begin
 clrscr;
 for i:=1to 10 do
 readln (v[i]);
  for i:=1to 10 do
   for j:=1to 10-i do
    if v[j+1]> v[j] then
     begin
      help:=v[j];
      v[j]:=v[j+1];
      v[j+1]:=help;
     end;
     for i:=1 to 10 do
       write(v[i]:4);
   readln(n);
   i:=1;
   while (n<v[i])  do
    i:=i+1;
      for j:=10 downto i  do
    v[j+1]:=v[j];
    v[i]:=n;
    for i:=1 to 11 do
      write(v[i]:4);
   readln;
   end.



