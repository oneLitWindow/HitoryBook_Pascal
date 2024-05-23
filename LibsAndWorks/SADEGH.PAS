program mark2 ;
uses ncrt;
var x:integer;
begin
  repeat
     writeln;
     Write('Enter a mark: ');
     readln(x);
  write('the range of this mark is: ');
  case x of
       0..20: writeln('E');
       21..40:writeln('D');
       41..60:writeln('c');
       61..80:writeln('B');
       81..100:writeln('A')
  else
     begin
       writeln('                               invalid mark'       );
       writeln('              your entered mark should be between 0 and 100'    );
     end;
  end;
       writeln('   if you want to know the range of another mark please enter another mark');
       writeln('              press ESC to exit or any other key to Continue...          ');
  until readkey=#27;
end.
