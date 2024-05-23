{program to test a text based Mouse}
program TmTest;
uses ncrt,Mouse;

type string80 = string[80];
var gm,gd,i:integer;
    R,X,Y:integer;
    OmouseX,OmouseY:integer;
    Done:boolean;
    OldClk : word;
    SysClk : word absolute $40:$6C;
    ch : char;
    S : string80;

const
   KeyHome = #199;	{ defs for simulated cursor movement via keyboard }
   KeyEnd  = #207;
   KeyPgUp = #201;
   KeyPgDo = #209;
   KeyArUp = #200;
   KeyArDo = #208;
   KeyArLft = #203;
   KeyArRgt  = #205;
   KeyL = 'L';
   KeyR = 'R';
   KeyRet = #13;


{ convert an integer to a string }
function fstr(I:integer):string80;
var temp:string80;
begin
  str(i,temp);
  fstr := temp;
end;


{ show the current mouse status info }
procedure ShowPosition;
begin
   HideMouse;

   {HideMouseArea is an alternate hide for non-EGA type screens}
{   HideMouseArea(PutMx(1),PutMy(1),PutMx(MaxCrtX),PutMy(MaxCrtY)); }

   TextColor(MouseColor);
   S := 'X:'+fstr(GetMx(MouseX))+' Y:'+fstr(GetMy(MouseY))+
       ' CrtMode:'+fstr(CrtMode)+' MouseType:'+fstr(MouseType);
   gotoxy(1,MaxCrtY);
   for i := 1 to length(S)+5 do write(' ');
   gotoxy(1,MaxCrtY);
   Write(s);
   Gotoxy(GetMx(MouseX),GetMy(MouseY));
   ShowMouse;
end;


{--------------------------------------------}
{ begin main program }
begin
   ClrScr;
   TextColor(White);
{   TextMode(3); }	   {text mode override}
   for i := 1 to 50 do	       { put some random splats on the screen }
   begin		       { to make it look busy }
     X := random(MaxCrtX)+1;
     Y := random(MaxCrtY)+1;
     gotoXY(X,Y);
     write('*');
   end;

   MouseColor := white; 	{ intialize the mouse }
   InitMouse;
{   MouseClock(true);	     }	{<-- uncomment this to use mouse ISR }
{   MouseInstalled := false;   {<-- uncomment this to disable installed mouse}
   MouseTextCursor(0);	   { Starting text cursor style }
   SetMouseArea(PutMx(1),PutMy(1),PutMx(MaxCrtX),PutMy(MaxCrtY));
   SetMousePosition(PutMx(MaxCrtX shr 1),PutMy(MaxCrtY shr 1));
   ShowMouse;

   Done := false;
   while not(Done) do
   begin
     if KeyPressed then       {we can also move the mouse via the keyboard}
     begin
       ch := upcase(ReadKey);
       if ch = #0 then
	 ch := char(ord(ReadKey) or $80);
       case ch of
	 KeyHome : begin SetMousePosition(PutMx(1),MouseY); end;
	 KeyEnd  : begin SetMousePosition(PutMx(MaxCrtX),MouseY); end;
	 KeyPgUp : begin SetMousePosition(MouseX,PutMy(1)); end;
	 KeyPgDo : begin SetMousePosition(MouseX,PutMy(MaxCrtY)); end;
	 KeyArUp : begin SetMousePosition(MouseX,PutMy(GetMy(MouseY)-1)); end;
	 KeyArDo : begin SetMousePosition(MouseX,PutMy(GetMy(MouseY)+1)); end;
	 KeyArLft : begin SetMousePosition(PutMx(GetMx(MouseX)-1),MouseY); end;
	 KeyArRgt : begin SetMousePosition(PutMx(GetMx(MouseX)+1),MouseY); end;
	 KeyL : begin MouseClicked := true; MouseClickButton := 1; end;
	 KeyR : begin MouseClicked := true; MouseClickButton := 2; end;
	 KeyRet : begin end;
       else
	 if ch < #33 then Done := true;
       end;
     end;

     { key not pressed, so look at mouse }
     if not(MouseHooked) then ReadMouse;  {if polled mode, poll the mouse}
     if MouseClick then 			 {check if button pressed}
     begin
       if MouseClickButton = MouseLeftButton then
       begin
	 HideMouse;
	 GotoXY(GetMx(MouseX),GetMy(MouseY));	{left button press,}
	 TextColor(MouseColor); 		{so put a splat on the}
	 write('*');				{screen in the specified}
	 ShowPosition;				{color at the mouse position}
	 ShowMouse;
       end;
       if MouseClickButton = MouseRightButton then
       begin					   {if right button pressed}
	 inc(MouseColor);				{change mouse shape}
	 if MouseColor > White then MouseColor := 1;	 {and working color}
	 ShowPosition;
	 inc(MouseTShape);
	 if MouseTShape < 2 then MouseTShape := 2;
	 if MouseTShape > MaxMouseTextShape then MouseTShape := 0;
	 MouseTextCursor(MouseTShape);
	 MouseReDraw := true;
	 ShowPosition;
	 ShowMouse;
       end;
     end;

     { if nothing else is happening, periodically update the mouse status}
     if (OldClk <> SysClk) and
	((MouseX <> OMouseX) or (MouseY <> OMouseY)) then
     begin
       OMouseX := MouseX;
       OMouseY := MouseY;
       OldClk := SysClk;
       ShowPosition;
     end;
   end;
end.
