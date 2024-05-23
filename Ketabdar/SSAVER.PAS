unit ssaver;
interface
const sscount=3;
type
ssnumber=1..sscount;
newScreenSaver=object
constructor init;
procedure start;
procedure select (x:ssnumber);
procedure selectrandom;
private
ScreenSaverNumber:integer;
end;
implementation
uses sass,arss,brss,dos,ncrt;
constructor newscreensaver.init;
begin
screensavernumber:=random(sscount)+1;
end;
procedure newscreensaver.select (x:ssnumber);
begin
if (x>sscount) or (x<1) then newscreensaver.selectrandom else screensavernumber:=x;
end;
procedure newscreensaver.selectrandom;
begin
newscreensaver.select(random(sscount)+1);
end;
procedure newscreensaver.start;
var
  ProgramName, CmdLine: string;
begin
 case screensavernumber of
  1:brstart;
  2:arstart;
  3:sastart
  else begin
  newscreensaver.init;newscreensaver.start;
       end;
 end;{ of case}
end; { of start procedure}

end. { of SSaver unit}