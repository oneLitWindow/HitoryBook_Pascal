uses ncrt,Dos,ssaver,graph{,kbmpload};
var
  ProgramName, CmdLine: string;
  screensaver:newscreensaver;
label lbl;
    procedure showscreensaver(x:integer);
     begin
     screensaver.init;
     screensaver.select(x);
     screensaver.start;
     if x>1 then begin
                 {$M $8000,4000,4000 }
                 Exec('farsi.com','');
                 if DosError <> 0 then begin
                                       WriteLn('Memory error #', DosError,' Please Restart Ketabdar!');
                                       sound (100);delay(100);nosound;{getakey;}end;
                 {$M $8000,0,320000 }
     end;
    end;
begin
  randomize;
lbl:
while keypressed do readkey;
showscreensaver(0);
while keypressed do readkey;
delay (1000);
if not keypressed then goto lbl;
end.

