var
        a:record
                name:string;
                number:integer;
                user:array[1..10] of string;
        end;
begin
     a.name:='amin';           (*)
     a.number:=10;             (*)
     a.user[1]:='ashkan';      (*)
     a.user[2]:='bashmagh';    (*)

     with (a) do begin         (*)
          name:='amin';        (*)
          number:=10;          (*)
          user[1]:='ashkan';   (*)
          user[2]:='bashmagh'; (*)
     end;                      (*)
end;
end.