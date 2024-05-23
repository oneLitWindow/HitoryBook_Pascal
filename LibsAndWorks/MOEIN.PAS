uses ncrt;
var k,i,j,f:integer;
    str1,str2,r,a:string;
    s,name:array[1..5]of string;
begin
     clrscr;
     textcolor(11);
     textbackground(0);
     writeln('enter name:');
     for i:=1 to 5 do
         readln(name[i]);
     for k:=5 downto 1 do
         for i:=1 to k-1 do
         begin
              if name[i]>name[i+1] then
              begin
                   a:=name[i];
                   name[i]:=name[i+1];
                   name[i+1]:=a;
              end;
              writeln('',name[i]);
         end;
         for i:=1 to 5 do
             write(name[i]:10);
         readln
end.