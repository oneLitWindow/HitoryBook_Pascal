type myrec=record
                 name:string;
                 number:integer;
                 ismaried:boolean;
                 end;
var
student:array[1..10] of myrec;
c:char;
begin
write ('Enter name: ');
readln(student[1].name);
write ('is he/she maried? (y/n) ');
readln(c);

writeln(student[1].name);
student[1].number   := 10;
student[1].ismaried := false;
end.