unit abbas;

interface
         procedure write2(s:string);
         function numdiv2(i:integer):real;

implementation
         procedure write2(s:string);
         begin
          writeln ('***',s,'***');
         end;

         function numdiv2(i:integer):real;
         begin
         numdiv2:=i/2;
         end;
end.