type
 pobject=object
               procedure num2(i:integer);
               private
               mynum:integer;
               end;
procedure pobject.num2(i:integer);
begin
writeln (i*mynum);
end;



var amin:pobject;
begin
amin.mynum:=10;
amin.num2(2);
end.