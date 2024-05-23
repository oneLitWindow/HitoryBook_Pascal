uses ncrt;
var myfile:text;
    s:string;
begin
clrscr;
assign (myfile,'1.txt');
{rewrite(myfile);   append(myfile);}reset(myfile);
while not eof(myfile) do begin
  readln(myfile,s);
  write(s);
if pos('Gol',s) <> 0 then write (' ****');
writeln;
end;
close(myfile);
readln;
end.