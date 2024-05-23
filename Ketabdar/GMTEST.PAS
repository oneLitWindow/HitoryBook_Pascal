{ a program to test a graphics based mouse }
program GmTest;
uses ncrt,Graph,Mouse;

type string80 = string[80];
var gm,gd,i:integer;
    R,X,Y:integer;
    MaxLen : integer;
    Done:boolean;
    OmouseX,OmouseY:integer;
    OldClk : word;
    SysClk : word absolute $40:$6C;
    ch : char;
    S : string[80];

const
   KeyHome = #199;
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

{convert an integer to a string}
function fstr(I:integer):string80;
var temp:string80;
begin
  str(i,temp);
  fstr := temp;
end;

{show the current mouse status}
procedure ShowPosition;
begin
   HideMouse;
{   HideMouseArea(PutMx(0),PutMy((GetMaxY-10)-16), }  {alternate hide for}
{		  PutMx(GetMaxX),PutMy(GetMaxY));  }  {non-EGA screens}

   S := 'X:'+fstr(GetMx(MouseX))+
       ' Y:'+fstr(GetMy(MouseY))+
       ' CrtMode:'+fstr(CrtMode)+
       ' MouseType:'+fstr(MouseType);
   if ((length(S)+5)*TextWidth('X')) > MaxLen then
   begin
     MaxLen := (length(S)+5)*TextWidth('X');
     Rectangle(0,GetMaxY-(TextHeight('X')+4),MaxLen,GetMaxY);
   end;
   SetFillStyle(SolidFill,black);
   Bar(1,GetMaxY-(TextHeight('X')+4)+1,MaxLen-1,GetMaxY-1);
   SetColor(MouseColor);
   OutTextXY(4,GetMaxY-9,S);
   ShowMouse;
end;

begin
   Done := false;
   gd := 0;{installuserdriver('svga256',nil);	     {<- you can force a display type here}
   gm := 3;
   InitGraph(gd,gm,'d:\compiler\bp\bgi');      {init the graphics display}
   setbkcolor (0);
   if gd = HercMono then     {if Herc display, set Herc mouse page to 0}
     SetHercMouse(0);
   SetColor(GetMaxColor);
   MaxLen := 1;
   for i := 1 to 50 do	      {put some circles on the screen}
   begin				{to make it look busy}
     R := random(40)+10;
     X := random(GetMaxX);
     Y := random(GetMaxY);
     Circle(X,Y,R);
   end;

{UseMouseSim := true;} {<-- uncomment this to use mouse emulation}

   MouseColor := white;
   InitMouse;

{   MouseInstalled := false;}  {<-- uncomment to disable existing mouse}

   MouseClock(true);	{<-- uncomment to hook mouse to clock ISR }

   SetMouseArea(PutMx(0),PutMy(0),PutMx(GetMaxX),PutMy(GetMaxY));
   SetMousePosition(PutMx(GetMaxX shr 1),PutMy(GetMaxY shr 1));
   ShowMouse;
   while not(Done) do
   begin		    {we can also use the keyboard to move the mouse}
{     setrgbpalette (0,random(63),0,0);}
     if KeyPressed then
     begin
       ch := upcase(ReadKey);
       if ch = #0 then
	 ch := char(ord(ReadKey) or $80);
       case ch of
	 KeyHome : begin SetMousePosition(PutMx(0),MouseY); end;
	 KeyEnd  : begin SetMousePosition(PutMx(GetMaxX),MouseY); end;
	 KeyPgUp : begin SetMousePosition(MouseX,PutMy(0)); end;
	 KeyPgDo : begin SetMousePosition(MouseX,PutMy(GetMaxY)); end;
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

     if not(MouseHooked) then ReadMouse;  {if polled mode, poll the mouse}
     if MouseClick then 		     {was a mouse button clicked?}
     begin
       if MouseClickButton = MouseLeftButton then    {left button clicked}
       begin					       {so do a floodfill}
	 HideMouse;				    {at the current mouse}
	 SetFillStyle(solidfill,MouseColor);		 {cursor position}
	 FloodFill(GetMx(MouseX),GetMy(MouseY),GetMaxColor);
	 ShowPosition;
	 ShowMouse;
       end;
       if MouseClickButton = MouseRightButton then    {right button pressed}
       begin					     {so change mouse shape}
	 inc(MouseColor);				 {and working color}
	 if MouseColor > GetMaxColor then MouseColor := 1;
	 ShowPosition;
	 inc(MouseGShape);
	 if MouseGShape > MaxMouseGraphShape then MouseGShape := 1;
	 MouseGraphicCursor(MouseGShape);
	 MouseReDraw := true;
	 ShowMouse;
       end;
     end;

     {if nothing else is happening, periodically update the mouse status}
     if (OldClk <> SysClk) and
	((MouseX <> OMouseX) or (MouseY <> OMouseY)) then
     begin
       OMouseX := MouseX;
       OMouseY := MouseY;
       OldClk := SysClk;
       ShowPosition;
     end;
   end;
   HideMouse;		    {hide the mouse before we exit}
   CloseGraph;		    {then turn off the graphics mode}
end.

