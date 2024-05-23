const  n=10;
var
   X:array [1..10] of integer;
   m:array [1..11] of integer;
   j,i,r,num,temp,k:integer;
begin
     i:=1;
     writeln('enter 10 number');
     for i:=1 to n do
      read(x[i]);
     for j:=1 to n do
      for i:=1 to 10-j do
       if x[i+1]<x[i] then
            begin
              temp:=x[i];
              x[i]:=x[i+1];
              x[i+1]:=temp;
            end;
     for i:=1 to n do
      write(x[i],', ');
       writeln('enter a number');
       readln(num);
       i:=1;
       while i<=n do
       begin
            if x[i]=num then
            begin
                 k:=i;
                 m[k]:=num;
                 m[k+1]:=x[i];
                 break;
            end
            else if x[i]<num then
            begin
                 K:=i;
                 m[k]:=x[i];
            end
            else
            begin
                 k:=i;
                 m[k]:=x[i];
            end;
            i:=i+1;
        end;
        for r:=i to n do
        begin
             k:=k+1;
             m[k]:=x[r];
        end;
        for k:=1 to n+1 do
            writeln(m[k]);
         readln;
end.
