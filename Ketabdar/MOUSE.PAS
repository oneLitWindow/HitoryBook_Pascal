{$O-,R-,I-,V-,F+}
Unit Mouse;
{$UNDEF  GMouse}
{$DEFINE GMouse} {<-- if you are not using graphics remove this definition}

{***************************************************************************}
{*		Mouse - Turbo Pascal Mouse Unit Version 3.1		   *}
{*			by Michael Day	05/28/89			   *}
{*									   *}
{*    Based on the Mouse4 unit developed by Richard Sadowsky 11/20/87	   *}
{*	     Graphics cursor procedure borrowed from EgaMouse		   *}
{*		      by Eduardo Martins 02/02/88			   *}
{*									   *}
{*	     This program is released to the public domain		   *}
{*									   *}
{*	  This program assumes that you have a MS (or compatible)	   *}
{*		   mouse driver installed on the computer.		   *}
{*									   *}
{***************************************************************************}

{ History }

{ V2.0 First release under this package unkown date -med}
{ V2.1 as of 09/10/88 First full release of this package -med}
{ V2.2 as of 09/15/88 Corrected Graphic cursor bug in V2.1 which had }
{ incorrect tables for some cursors. Also improved the table structure }
{ at the same time. -med }
{ V2.3 as of 09/28/88 Corrected bug in release V2.2 to fix mouse detect }
{ crash when running under DOS 2.x. -med }
{ V2.4 as of 04/08/89 fixed checkmark cursor and circle target cursor -med}
{ V3.0 as of 05/23/89 added BGI mouse emulation for EGA debugging -med}
{ V3.1 as of 05/29/89 added Hercules page control fix BGI mouse cursor}
{ to deal with BGI screen edge problem (redraws mouse at edge). -med}

{***************************************************************************}


Interface

{$IFDEF GMouse}
  Uses DOS,Graph{,ncrt};
{$ELSE}
  Uses DOS;
{$ENDIF}

{---------------------------------------------------------------------------}
{Externally accessable constants}

const

  MouseLeftButton   = 1;			       {what the buttons are}
  MouseRightButton  = 2;
  MouseCenterButton = 4;

  MouseStandard     = 1;			 {graphic cursor definitions}
  MouseUpArrow	    = 2;
  MouseDownArrow    = 3;
  MouseLeftArrow    = 4;
  MouseRightArrow   = 5;
  MouseCheckMark    = 6;
  MouseUpHand	    = 7;
  MouseDownHand     = 8;
  MouseLeftHand     = 9;
  MouseRightHand    = 10;
  MouseStopHand     = 11;
  MouseHourGlass    = 12;
  MouseDiagCross    = 13;
  MouseRectCross    = 14;
  MouseRectBox	    = 15;
  MouseTargetCross  = 16;
  MouseTargetCircle = 17;
  MouseTargetBox    = 18;
  MouseQuestionMark = 19;

  MaxMouseGraphShape = 19;
  MaxMouseTextShape  = 15;

{---------------------------------------------------------------------------}
{Externally accessable variables}

var  CrtMode : Byte absolute $40:$49;		    {BIOS nCrt mode flag byte}
     CrtCols : Word absolute $40:$4A;		      {BIOS nCrt column count}
     CrtRows : Byte absolute $40:$84;			 {BIOS nCrt row count}
     SysClk  : Word absolute $40:$6C;		  {BIOS system clock counter}
     CursorMode : Word absolute $40:$60;	   {BIOS cursor mode storage}

var
  MouseInstalled   : Boolean;	{InitMouse - True if mouse is operable}
  MouseError	   : Integer;	{InitMouse - Error code}
  MouseType	   : Integer;	{InitMouse - Mouse Type}

  MouseClicked	   : Boolean;	{ReadMouse - True if button was clicked}
  MouseButtons	   : Word;	{ReadMouse - Current mouse button status}
  MouseClickButton : Word;	{ReadMouse - Click button status}
  MouseX	   : Integer;	{ReadMouse - Mouse X Position}
  MouseY	   : Integer;	{ReadMouse - Mouse Y Position}
  ClickMouseX	   : Integer;	{ReadMouse - Mouse X Click Position}
  ClickMouseY	   : Integer;	{ReadMouse - Mouse Y Click Position}
  MousePressX	   : Integer;	{last mouse button press position}
  MousePressY	   : Integer;
  MouseReleaseX    : Integer;	{last mouse button release position}
  MouseReleaseY    : Integer;

  MouseHideX1	   : Integer;
  MouseHideY1	   : Integer;	{HideMouseArea - Mouse hide area}
  MouseHideX2	   : Integer;
  MouseHideY2	   : Integer;
  MouseAreaX1	   : Integer;	{SetMouseArea - Mouse bounded area}
  MouseAreaY1	   : Integer;
  MouseAreaX2	   : Integer;
  MouseAreaY2	   : Integer;

const
  MouseGShape	     : Integer = 1;	       {selected graphic mouse shape}
  MouseTShape	     : Integer = 0;		  {selected text mouse shape}
  MouseState	     : Integer = -1;		    {Negative = mouse hidden}
  MouseVisible	     : Boolean = false; 	    {true = mouse is visible}
  MouseCondo	     : Boolean = false;     {true = conditional mouse hiding}
  MouseReDraw	     : Boolean = false;    {true = mouse needs to be redrawn}
  MouseHooked	     : Boolean = false;    {true = mouse hooked to clock int}
  TextMouse	     : Boolean = false; 	{true = text mode type mouse}
  ZeroMouse	     : Boolean = false;       {true = text mouse starts at 0}
  HercGraphMouse     : Boolean = false;        {true = Herc graph mode mouse}

  MouseTextWidth     : Word = 8;	   {size of text on screen for mouse}
  MouseTextHeight    : Word = 8;
  MaxCrtX	     : Word = 80;		  {screen size in characters}
  MaxCrtY	     : Word = 25;

  MouseColor	     : Word =  $FFFF;			  {mouse cursor color}
  UseMouseSim	     : Boolean = false;   {true = use simulated mouse cursor}
  MouseImageX	     : Integer = 0;	    {current mouse XY image position}
  MouseImageY	     : Integer = 0;

{---------------------------------------------------------------------------}
type	  MaskType = record		    {mouse graphic cursor definition}
		  Def: array [0..1, 0..15] of word;	{graphics cursor def}
		  HotX, HotY: integer;			     { hot spot X,Y }
		end;

{ define what the mouse text cursor definition array looks like }
type MouseTextType = record
		  Select : Word;
		  Start  : Word;
		  Stop	 : Word;
		end;

{---------------------------------------------------------------------------}
{Note: You must set the MouseTextWidth and MouseTextHeight values}
{to the current character pixel width and height to properly use the}
{mouse text X,Y coordinate system. Startup Default is 8x8.}
{To start up the mouse you should do the following: }
{InitMouse; ReadMouse; ShowMouse; - This insures that the mouse is}
{properly setup and ready to run. Additionally, if you have a Hercules}
{display, you must call SetHercPage prior to calling InitMouse to properly}
{initialize the mouse driver for the Hercules display.}

{For more information on the mouse interface and programming with }
{with a mouse refer to the MicroSoft Mouse Programmer's Reference Guide}
{Available from MicroSoft Corporation.}

{Warning: All mouse drivers are not created equal. Nor are programs that }
{use them. Be especially careful with the MouseAreaHide function, if you }
{are using an EGA display with Turbo Pascal it will not work. The area }
{hide function requires that certain EGA display calls be performed through }
{an extended video BIOS call so that it can know what to expect in how the }
{display is setup. Since Turbo Pascal does not do this, The MouseAreaHide }
{function will not currently work under Turbo Pascal. With other displays }
{you shouldn't have a problem. Also be aware that some mouse drivers do not }
{impliment all functions exactly the same, and that the early MS mouse driver}
{did not impliment all the functions listed here. If you have any questions}
{check with your mouse manufacture. The MS mouse Tech ref guide is an }
{invaluable reference if you intend to do mouse programming. You can get it}
{for $25 if you bought an MS mouse. For other mice, check with the}
{manufacture most of them provide Tech ref manuals.}


{---------------------------------------------------------------------------}
{ Function 0 - Initialize mouse software and hardware }
procedure InitMouse;


{---------------------------------------------------------------------------}
{ Function 1 - show mouse cursor }
procedure ShowMouse;


{---------------------------------------------------------------------------}
{ Function 2 - hide mouse cursor }
procedure HideMouse;


{---------------------------------------------------------------------------}
{ Function 3 - read mouse position and button status }
{ Use GetMx, GetMy to read the mouse position info in MouseX, MouseY, }
{ or ClickMouseX, ClickMouseY }
procedure ReadMouse;


{---------------------------------------------------------------------------}
{ function 4 - sets mouse position }
{ Recommended calling method: }
{ SetMousePosition(PutMx(X),PutMy(Y)); }
procedure SetMousePosition(X,Y:Integer);


{---------------------------------------------------------------------------}
{ function 5 - gets button press information  }
{ Recommended calling method: }
{ Status := MousePress(Button,Count); }
{ Click position is available in vars ClickMouseX and ClickMouseY}
function MousePress(Button:Word; var Count:Word):Word;


{---------------------------------------------------------------------------}
{ function 6 - gets button release information	}
{ Recommended calling method: }
{ Status := MouseRelease(Button,Count); }
{ Click position is available in vars ClickMouseX and ClickMouseY}
function MouseRelease(Button: Word; var Count:Word):Word;


{---------------------------------------------------------------------------}
{ functions 7 and 8 - sets area where the mouse is allowed to run }
{ Recommended calling method: }
{ SetMouseArea(PutMx(x1),PutMy(y1),PutMx(x2),PutMy(y2)); }
procedure SetMouseArea(x1,y1,x2,y2:Integer);


{---------------------------------------------------------------------------}
{ function 9 - sets the graphics cursor shape }
procedure MouseGraphicCursor(Shape:Integer);


{---------------------------------------------------------------------------}
{ function 9 - sets a custom graphics cursor shape }
procedure SetMouseGraphicCursor(var Mask:MaskType);


{---------------------------------------------------------------------------}
{ function 10 - sets the text cursor shape }
procedure MouseTextCursor(Shape:Integer);


{---------------------------------------------------------------------------}
{ function 10 - sets a custom text cursor shape }
procedure SetMouseTextCursor(Select,Start,Stop:Word);


{---------------------------------------------------------------------------}
{ function 11 - Read Mouse Motion counters }
procedure ReadMickey(var X,Y:Integer);


{---------------------------------------------------------------------------}
{ function 12 - Set Mouse Interrupt service routine and mask }
procedure SetMouseISR(Mask:Word; Address:Pointer);


{---------------------------------------------------------------------------}
{ function 13 and 14 - Light pen emulation on/off }
procedure LightPen(Flag:Boolean);


{---------------------------------------------------------------------------}
{ function 15 - sets the mickey to pixel ratio }
procedure SetPixeltoMickey(X,Y:Integer);


{---------------------------------------------------------------------------}
{ function 16 - Conditional Mouse Hide - hides mouse if in area }
{ use ShowMouse after using this function - just like regular HideMouse }
{Recommended calling method: }
{If HideMouseArea(PutMx(x1),PutMy(y1),PutMx(x2),PutMy(y2)) then DoSomething;}
procedure HideMouseArea(x1,y1,x2,y2:Integer);


{---------------------------------------------------------------------------}
{ function 19 - Set Double Speed Threshold }
procedure MouseThreshold(Threshold:Integer);


{---------------------------------------------------------------------------}
{ function 20 - Swap current Mouse ISR with a new one}
{ Returns old ISR and mask in the calling variables }
procedure SwapMouseISR(var Mask:Word; var Address:Pointer);


{---------------------------------------------------------------------------}
{ function 29 - Set Mouse Page }
procedure SetMousePage(Page:Word);


{---------------------------------------------------------------------------}
{ function 30 - Get Mouse Page }
function GetMousePage:Word;


{---------------------------------------------------------------------------}
{ Set Hercules Graphics page for Mouse (not a standard mouse function) }
{ 0= graph pg 0,   1= graph pg 1,   -1 = text mode  (see note in procedure) }
procedure SetHercMouse(Pg:Integer);


{+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}
{ The following procedures use the mouse functions to provide }
{ a higher level of control over the mouse }

{---------------------------------------------------------------------------}
{ Normalizes a mouse X position to standard position info }
function GetMx(X:Integer):Integer;


{---------------------------------------------------------------------------}
{ Normalizes a mouse Y position to standard position info }
function GetMy(Y:Integer):Integer;


{---------------------------------------------------------------------------}
{ converts a standard X position to a mouse X position }
function PutMx(X:Integer):Integer;


{---------------------------------------------------------------------------}
{ converts a standard Y position to a mouse Y position }
function PutMy(Y:Integer):Integer;


{---------------------------------------------------------------------------}
{ Check if a mouse point is currently in the specified area}
{ returns true if it is, false if not}
{  Recommended calling method: }
{  If MousePointIn(GetMx(Mx),GetMy(My), x1,y1,x2,y2) then DoSomething;}
function MousePointIn(Mx,My, x1,y1,x2,y2:Integer):Boolean;


{---------------------------------------------------------------------------}
{has the mouse been clicked recently?}
function MouseClick:Boolean;


{---------------------------------------------------------------------------}
{Hooks the Mouse function to the system clock}
{State = true hooks the mouse up, State = false disconnects the mouse}
procedure MouseClock(State:Boolean);


{---------------------------------------------------------------------------}
{Pushes current mouse status on the mouse stack}
{Returns false if not enough heap space to push}
function PushMouse:Boolean;


{---------------------------------------------------------------------------}
{Pops mouse status from the mouse stack.}
function PopMouse:Boolean;


{---------------------------------------------------------------------------}
{Get rid of mouse stack}
procedure ZapMouseStack;


{***************************************************************************}

implementation

{---------------------------------------------------------------------------}
{private variables}

var  MouseBusy	 : Boolean;		   {true = mouse routines are in use}
     OldMouseX	 : Integer;			  {Previous mouse X Position}
     OldMouseY	 : Integer;			  {Previous mouse Y Position}
     CustomMask  : MaskType;	       {storage for custom mouse cursor data}
     CustomText  : MouseTextType;      {storage for custom text mouse cursor}
     MouseReg	 : Registers;	     {registers used to call mouse interrupt}
     MouseTemp	 : Integer;			{Temp mouse storage variable}

{---------------------------------------------------------------------------}
{$IFDEF GMouse} 		{ if we are using graphics enable this stuff}

const MouseBack : pointer = nil;	  {^old image under BGI mouse cursor}
      MouseMask : pointer = nil;		     {^BGI mouse cursor mask}
      MouseFore : pointer = nil;		  {^BGI mouse cursor overlay}
      MouseSize : word = 0;	       {storage size for mouse image 0=emtpy}
      EndImageX : Integer = 0;			       {End of Mouse X image}
      EndImageY : Integer = 0;			       {End of Mouse Y image}
      OldImageX : integer = 0;		      {position of image under mouse}
      OldImageY : integer = 0;
{$ENDIF}


{++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}
{ mouse include files }

{$I MOUSECUR.PAS}    {include the mouse cursor definition table}
{$I MOUSESUB.PAS}    {include special mouse subroutines and code}
{$I MOUSESTK.PAS}    {include the mouse stack routines}
{$I MOUSEISR.PAS}    {include the mouse ISR routines}


{+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++}
{ the following are the standard mouse driver interface routines }
{ these routines use a mouse driver to communicate with the attached }
{ mouse. If a mouse is not there, then you can still simulate a mouse, }
{ but you will have to do much of the handling yourself. See the }
{ MOUSE.DOC documentation file for more information on using the MOUSE unit.}


{***************************************************************************}
{ Function 0 - Initialize mouse software and hardware }
{ returns MouseError = 1 if no driver, 0 if driver but no mouse, }
{ or -1 if all ok. (I know it's messy, but you can blame MS for that.) }

procedure InitMouse;
var Mint : Pointer absolute $0000:$00CC;   {<-- this points to the mouse int}
begin
   MouseBusy := true;	    {disallow re-entrant use of routine by mouse ISR}
   MouseState := -1;				  {<-- clear the mouse state}
   MouseGShape := 1;			{<-- switch to std graph mouse shape}
   MouseTShape := 0;			 {<-- switch to std text mouse shape}
   MouseVisible := false;		  {<-- mouse starts off as invisible}
   MouseReDraw := false;
   MouseCondo := false;
   MouseClicked := false;
   MouseButtons := 0;				      {<-- reset the buttons}
   MouseClickButton := 0;
   ClickMouseX := 0;			       {<-- clear mouse XY locations}
   ClickMouseY := 0;
   MousePressX := 0;
   MousePressY := 0;
   MouseReleaseX := 0;
   MouseReleaseY := 0;

   MouseX := 0;
   MouseY := 0;
   OldMouseX := 0;
   OldMouseY := 0;
   MouseHideX1 := -1;
   MouseHideX2 := -1;		       {Save HideMouseArea - Mouse hide area}
   MouseHideY1 := -1;
   MouseHideY2 := -1;

   InitMouseMode;		  {<-- Init the text/graphic mode parameters}

   MouseInstalled := false;				 {<-- assume failure}
   MouseType := 0;
   MouseError := 1;			   {<-- 1 means driver not installed}
   if Mint = nil then Exit;		    {<-- if vector is nil, no driver}
   if byte(Mint^) = $CF then Exit;	   {<-- if points to IRET, no driver}

   MouseReg.AX := 0;		  {tell the mouse to start over from scratch}
   MouseReg.BX := 0;
   Intr($33,MouseReg);
   MouseError := MouseReg.AX;
   MouseType := MouseReg.BX;
   MouseInstalled := MouseError = -1;	    {<-- check if mouse is out there}
			      { 0 means mouse not available, -1 means all ok}
   if MouseInstalled then
   begin
     MouseReg.AX := 3;
     Intr($33,MouseReg);		     {Get the current mouse location}
     MouseX := MouseReg.CX;			  {save mouse X and Y values}
     MouseY := MouseReg.DX;
   end
   else
   begin
     MouseX := MouseAreaX2 shr 1;	      {start with calculated default}
     MouseY := MouseAreaY2 shr 1;		  {screen center if no mouse}
   end;

{$IFDEF GMouse} 				  { if we are using graphics}
   if not(MouseInstalled) then			 { and if there is no mouse,}
   begin					 { then set it to the center}
     MouseX := GetMaxX shr 1;				     { of the screen}
     MouseY := GetMaxY shr 1;
   end;

   if MouseBack <> nil then	    { if BGI mouse cursor is on, turn it off}
   begin
     PutImage(OldImageX,OldImageY,MouseBack^,NormalPut);
     FreeMem(MouseBack,sizeof(MouseBack^));
   end;
   if MouseMask <> nil then			 { release all cursor memory}
     FreeMem(MouseMask,sizeof(MouseMask^));
   if MouseFore <> nil then
     FreeMem(MouseFore,sizeof(MouseFore^));
   MouseSize := 0;				  {<-- mark that it is empty}
{$ENDIF}

  OldMouseX := MouseX;
  OldMouseY := MouseY;
  MouseBusy := false;		       {Polled use of read mouse is done now}
end;

{---------------------------------------------------------------------------}
{ function 1 - show mouse cursor }

procedure ShowMouse;
var OldBusy : Boolean;
begin
  OldBusy := MouseBusy; 			      {save old mouse status}
  MouseBusy := true;	    {disallow re-entrant use of routine by mouse ISR}
  if MouseState < 0 then
    inc(MouseState);		   {<-- adjust current mouse state indicator}
  MouseCondo := false;

  {if using mouse driver and it is available do it this way}
  if not(UseMouseSim) and MouseInstalled then
  begin
    MouseReg.AX := 1;		      {if mouse is out there call the driver}
    Intr($33,MouseReg); 	      {to pick up the current mouse position}
    MouseVisible := true;
    MouseBusy := OldBusy;		 {restore previous mouse busy status}
    Exit;
  end;

  {if using simulator and mouse driver is available get position from mouse}
  if MouseInstalled then
  begin
    MouseReg.Ax := 3;			       { first find out where we are}
    Intr($33,MouseReg);
    MouseX := MouseReg.CX;		 { and update our location registers}
    MouseY := MouseReg.DX;
  end;

  ShowMouseSim; 			      {display simulated mouse image}
  MouseBusy := OldBusy; 		 {restore previous mouse busy status}
end;


{---------------------------------------------------------------------------}
{ function 2 - hide mouse cursor }

procedure HideMouse;
var OldBusy : Boolean;
begin
  OldBusy := MouseBusy; 			      {save old mouse status}
  MouseBusy := true;	    {disallow re-entrant use of routine by mouse ISR}
  dec(MouseState);		   {<-- adjust current mouse state indicator}
  MouseVisible := false;
  MouseCondo := false;

  {if using mouse driver and it is available do it this way}
  if not(UseMouseSim) and MouseInstalled then
  begin
    MouseReg.AX := 2;			     {use mouse driver to hide mouse}
    Intr($33,MouseReg);
  end
  else
  begin
    if MouseState = -1 then		 { If mouse was visible, hide it now}
      HideMouseSim;				{use simulator to hide mouse}
  end;
  MouseBusy := OldBusy; 		 {restore previous mouse busy status}
end;


{---------------------------------------------------------------------------}
{ function 3 - read current mouse position and button status }
{ Use GetMx, GetMy to read the mouse position info in MouseX, MouseY, }
{ or ClickMouseX, ClickMouseY }

procedure ReadMouse;
begin
  MouseBusy := true;	    {disallow re-entrant use of routine by mouse ISR}
  if MouseInstalled then    {if mouse installed, then use it for positioning}
  begin
    MouseReg.AX := 3;
    Intr($33,MouseReg); 		       {Get the current mouse status}
    with MouseReg do
    begin
      OldMouseX := MouseX;			    {save old mouse position}
      OldMouseY := MouseY;
      MouseX := CX;			      {save new mouse X and Y values}
      MouseY := DX;
      if (BX <> MouseButtons) and (BX <> 0) then       {<-- new button down?}
      begin
	MouseClickButton := BX; 	      {if button down save which one}
	ClickMouseX := MouseX;				{and the current X,Y}
	ClickMouseY := MouseY;
	MouseClicked := true;			   {tell them it was clicked}
      end;
      MouseButtons := BX;		 {<-- save the current button status}
    end;
  end;

  if UseMouseSim then		      {only do this if using simulated mouse}
  begin
    if ((OldMouseX <> MouseX) or       {if the mouse has moved and is active}
       (OldMouseY <> MouseY)) and		     {then update the cursor}
       (MouseState >= 0) then
    begin
       if not(MouseInstalled) then		   {if mouse isn't installed}
       begin
	 OldMouseX := MouseX;			    {save old mouse position}
	 OldMouseY := MouseY;		   {otherwise we let mouse do update}
       end;

       if not(MouseCondo) then	   {area hide is not active, so just show it}
       begin
	 ShowMouse;
	 MouseBusy := false;	       {Polled use of read mouse is done now}
	 Exit;
       end;

       {area hide is active, so see if mouse is in hidden area}
       if (MouseX >= MouseHideX1) or (MouseX <= MouseHideX2) or
	  (MouseY >= MouseHideX2) or (MouseY <= MouseHideY2) then
       begin
	 if MouseVisible then	  {mouse in hidden area & visible so hide it}
	   HideMouse;
       end
       else
       begin
	 ShowMouse;			     {mouse position is ok, so show it}
       end;
       MouseCondo := true;			 {restore MouseCondo condition}
    end;

  end;	{if UseMouseSim then}
  MouseBusy := false;		       {Polled use of read mouse is done now}
end;

{---------------------------------------------------------------------------}
{ function 4 - sets mouse position }
{ Recommended calling method: }
{ SetMousePosition(PutMx(X),PutMy(Y)); }

procedure SetMousePosition(X,Y:Integer);
begin
  MouseBusy := true;	    {disallow re-entrant use of routine by mouse ISR}
  MouseX := IntLimit(X,MouseAreaX1,MouseAreaX2);	     {limit mouse to}
  MouseY := IntLimit(Y,MouseAreaY1,MouseAreaY2);	       {defined area}

  if MouseInstalled then			{<-- can't do this, no mouse}
  begin
    MouseReg.AX := 4;
    MouseReg.CX := X;				     {tell mouse where to go}
    MouseReg.DX := Y;
    intr($33,MouseReg);
  end;
  MouseBusy := false;		       {Polled use of read mouse is done now}
end;

{---------------------------------------------------------------------------}
{ function 5 - gets button press information  }
{ Recommended calling method: }
{ Status := MousePress(Button,Count); }
{ Click position is available in vars MousePressX and MousePressY}

function MousePress(Button:Word; var Count:Word):Word;
begin
  if not(MouseInstalled) then			   {check if mouse installed}
  begin
    MousePress := 0;		  {if no mouse everything comes back as zero}
    Count := 0;
    Exit;
  end;

  MouseBusy := true;	    {disallow re-entrant use of routine by mouse ISR}
  MouseReg.AX := 5;
  MouseReg.BX := Button;			 {request info on the button}
  intr($33,MouseReg);
  MousePress := MouseReg.AX;
  Count := MouseReg.BX; 		     {return the info for the button}
  MousePressX := MouseReg.CX;
  MousePressY := MouseReg.DX;	       {position info returned in press vars}
  MouseBusy := false;		       {Polled use of read mouse is done now}
end;

{---------------------------------------------------------------------------}
{ function 6 - gets button release information	}
{ Recommended calling method: }
{ Status := MouseRelease(Button,Count); }
{ Click position is available in vars MouseReleaseX and MouseReleaseY}

function MouseRelease(Button: Word; var Count:Word):Word;
begin
  if not(MouseInstalled) then			   {check if mouse installed}
  begin
    MouseRelease := 0;		  {if no mouse everything comes back as zero}
    Count := 0;
    Exit;
  end;

  MouseBusy := true;	    {disallow re-entrant use of routine by mouse ISR}
  MouseReg.AX := 6;
  MouseReg.BX := Button;			 {request info on the button}
  intr($33,MouseReg);
  MouseRelease := MouseReg.AX;
  Count := MouseReg.BX; 		     {return the info for the button}
  MouseReleaseX := MouseReg.CX;
  MouseReleaseY := MouseReg.DX;      {position info returned in release vars}
  MouseBusy := false;		       {Polled use of read mouse is done now}
end;

{---------------------------------------------------------------------------}
{ functions 7 and 8 - sets area where the mouse is allowed to run }
{ Recommended calling method: }
{ SetMouseArea(PutMx(x1),PutMy(y1),PutMx(x2),PutMy(y2)); }

procedure SetMouseArea(x1,y1,x2,y2:Integer);
begin
  MouseBusy := true;	    {disallow re-entrant use of routine by mouse ISR}
  MouseAreaX1 := x1;				     {save active mouse area}
  MouseAreaY1 := y1;
  MouseAreaX2 := x2;
  MouseAreaY2 := y2;

  if MouseInstalled then	    {if no mouse we can't send it new values}
  begin
    MouseReg.CX := x1;					   {set the X values}
    MouseReg.DX := x2;
    MouseReg.AX := 7;
    intr($33,MouseReg);

    MouseReg.CX := y1;					   {set the Y values}
    MouseReg.DX := y2;
    MouseReg.AX := 8;
    intr($33,MouseReg);
  end;

  MouseBusy := false;		       {Polled use of read mouse is done now}
end;

{---------------------------------------------------------------------------}
{ function 9 - sets a custom graphics cursor shape }

procedure SetMouseGraphicCursor(var Mask:MaskType);
begin
   MouseBusy := true;	     {disallow re-entrant use of routine by mouse ISR}
   move(Mask,CustomMask,sizeof(Mask));		   { copy to local variable }
   MouseGShape := -1;				 { -1 = custom mouse cursor }

   if MouseInstalled then	      {if no mouse we can't send it new data}
   begin
     MouseReg.AX := 9;
     MouseReg.BX := Mask.HotX;				 { set the Hot Spot }
     MouseReg.CX := Mask.HotY;
     MouseReg.ES := seg(Mask.Def);
     MouseReg.DX := ofs(Mask.Def);		 { set the new cursor shape }
     Intr($33, MouseReg);
   end;

   MouseBusy := false;		       {Polled use of read mouse is done now}
end;

{---------------------------------------------------------------------------}
{ function 9 - sets the graphics cursor shape }
{ Graphic cursor routine borrowed from EGAMouse }
{ (and then re-written) }

procedure MouseGraphicCursor(Shape:Integer);
begin
   MouseGShape := IntLimit(Shape,1,MaxMouseGraphShape);   {save shape number}
   if not(MouseInstalled) then Exit;		{<-- can't do this, no mouse}

   with MouseGCursor[MouseGShape] do
   begin
     MouseBusy := true;     {disallow re-entrant use of routine by mouse ISR}
     MouseReg.AX := 9;
     MouseReg.BX := HotX;				 { set the Hot Spot }
     MouseReg.CX := HotY;
     MouseReg.ES := seg(Def);
     MouseReg.DX := ofs(Def);			 { set the new cursor shape }
     Intr($33, MouseReg);
     MouseBusy := false;	       {Polled use of read mouse is done now}
   end;
end;

{---------------------------------------------------------------------------}
{ function 10 - sets a custom text cursor shape }

procedure SetMouseTextCursor(Select,Start,Stop:Word);
begin
   MouseTShape := -1;				 { -1 = custom mouse cursor }
   if not(MouseInstalled) then Exit;		{<-- can't do this, no mouse}

   MouseBusy := true;	    {disallow re-entrant use of routine by mouse ISR}
   MouseReg.AX := 10;
   MouseReg.BX := Select;			     { set the select value }
   MouseReg.CX := Start;			  { set the new start value }
   MouseReg.DX := Stop; 			   { set the new stop value }
   Intr($33, MouseReg);
   MouseBusy := false;		       {Polled use of read mouse is done now}
end;

{---------------------------------------------------------------------------}
{ function 10 - sets the text cursor shape }

procedure MouseTextCursor(Shape:Integer);
begin
   MouseTShape := IntLimit(Shape,0,MaxMouseTextShape);	  {save shape number}
   if not(MouseInstalled) then Exit;		{<-- can't do this, no mouse}

   MouseBusy := true;	    {disallow re-entrant use of routine by mouse ISR}
   if Shape > 0 then	      {greater than zero means get values from array}
   begin
     with MouseTCursor[MouseTShape] do
      begin
	MouseReg.BX := Select;			     { set the select value }
	MouseReg.CX := Start;			  { set the new start value }
	MouseReg.DX := Stop;			   { set the new stop value }
     end;
   end
   else 	     { zero means to use current hardware cursor definition }
   begin
     MouseReg.BX := 1;				     { set the select value }
     MouseReg.CX := hi(CursorMode);		  { set the new start value }
     MouseReg.DX := lo(CursorMode);		   { set the new stop value }
   end;
   MouseReg.AX := 10;
   Intr($33, MouseReg);
   MouseBusy := false;		       {Polled use of read mouse is done now}
end;

{---------------------------------------------------------------------------}
{ function 11 - Read Mouse Motion counters }

procedure ReadMickey(var X,Y:Integer);
begin
  if not(MouseInstalled) then			   {check if mouse installed}
  begin
    X := 0;				     {if no mouse return zero values}
    Y := 0;
    Exit;
  end;

  MouseBusy := true;	    {disallow re-entrant use of routine by mouse ISR}
  MouseReg.AX := 11;
  Intr($33, MouseReg);
  X := MouseReg.CX;				       {return mickey values}
  Y := MouseReg.DX;
  MouseBusy := false;		       {Polled use of read mouse is done now}
end;

{---------------------------------------------------------------------------}
{ function 12 - Set Mouse Interrupt service routine and mask }

procedure SetMouseISR(Mask:Word; Address:Pointer);
type Arec = record Lo, Hi: Word; end;
var A : Arec absolute Address;
begin
  if not(MouseInstalled) then Exit;		{<-- can't do this, no mouse}

  MouseBusy := true;	    {disallow re-entrant use of routine by mouse ISR}
  MouseReg.CX := Mask;			       {<-- set the ISR service mask}
  MouseReg.ES := A.Hi;
  MouseReg.DX := A.Lo;				{set the ISR service address}
  MouseReg.AX := 12;
  Intr($33, MouseReg);
  MouseBusy := false;		       {Polled use of read mouse is done now}
end;

{---------------------------------------------------------------------------}
{ function 13 and 14 - Light pen emulation on/off }

procedure LightPen(Flag:Boolean);
begin
  if not(MouseInstalled) then Exit;		{<-- can't do this, no mouse}

  MouseBusy := true;	    {disallow re-entrant use of routine by mouse ISR}
  if Flag then
    MouseReg.AX := 13				 {set light pen emulation on}
  else
    MouseReg.AX := 14;				{set light pen emulation off}
  Intr($33,MouseReg);
  MouseBusy := false;		       {Polled use of read mouse is done now}
end;


{---------------------------------------------------------------------------}
{ function 15 - sets the mickey to pixel ratio }

procedure SetPixeltoMickey(X,Y:Integer);
begin
  if not(MouseInstalled) then Exit;		{<-- can't do this, no mouse}

  MouseBusy := true;	    {disallow re-entrant use of routine by mouse ISR}
  MouseReg.AX := 15;
  MouseReg.CX := X;				  {set the new mickey values}
  MouseReg.DX := Y;
  Intr($33,MouseReg);
  MouseBusy := false;		       {Polled use of read mouse is done now}
end;


{---------------------------------------------------------------------------}
{ function 16 - Conditional Mouse Hide - hides mouse if in text area }
{ use ShowMouse after using this function - just like regular HideMouse }
{Recommended calling method: }
{If HideMouseArea(PutMx(x1),PutMy(y1),PutMx(x2),PutMy(y2)) then DoSomething;}

procedure HideMouseArea(x1,y1,x2,y2:Integer);
begin
  MouseBusy := true;	    {disallow re-entrant use of routine by mouse ISR}
  MouseCondo := true;			{<-- flag conditional hideing active}
  MouseHideX1 := x1;
  MouseHideX2 := x2;		       {Save HideMouseArea - Mouse hide area}
  MouseHideY1 := y1;
  MouseHideY2 := y2;

  if MouseInstalled then		 {if mouse is out there, then set it}
  begin
    MouseReg.CX := x1;				     {set the X and Y values}
    MouseReg.DX := x2;
    MouseReg.SI := y1;
    MouseReg.DI := y2;
    MouseReg.AX := 16;
    intr($33,MouseReg);
  end;

  if (MouseX >= MouseHideX1) or (MouseX <= MouseHideX2) or
     (MouseY >= MouseHideX2) or (MouseY <= MouseHideY2) then
  begin
    if MouseVisible then	    {if mouse is in hidden area then hide it}
      HideMouse;
  end
  else
    ShowMouse;		      {if mouse not in area, then keep mouse visible}
  MouseCondo := true;	      {indicate that we are in conditional hide mode}
  MouseBusy := false;		       {Polled use of read mouse is done now}
end;

{---------------------------------------------------------------------------}
{ function 19 - Set Double Speed Threshold }

procedure MouseThreshold(Threshold:Integer);
begin
  if not(MouseInstalled) then Exit;		{<-- can't do this, no mouse}

  MouseBusy := true;	    {disallow re-entrant use of routine by mouse ISR}
  MouseReg.AX := 19;
  MouseReg.DX := Threshold;			{set the new threshold value}
  Intr($33,MouseReg);
  MouseBusy := false;		       {Polled use of read mouse is done now}
end;


{---------------------------------------------------------------------------}
{ function 20 - Swap current Mouse ISR with a new one}
{ Returns old ISR and mask in the calling variables }

procedure SwapMouseISR(var Mask:Word; var Address:Pointer);
type Arec = record Lo, Hi: Word; end;
var A : Arec absolute Address;
begin
  if not(MouseInstalled) then Exit;		{<-- can't do this, no mouse}

  MouseBusy := true;	    {disallow re-entrant use of routine by mouse ISR}
  MouseReg.CX := Mask;			       {<-- set new ISR service mask}
  MouseReg.ES := A.Hi;
  MouseReg.DX := A.Lo;				{set new ISR service address}
  MouseReg.AX := 20;
  Intr($33,MouseReg);
  Mask := MouseReg.CX;			       {<-- Get old ISR service mask}
  A.Hi := MouseReg.ES;
  A.Lo := MouseReg.DX;				{Get old ISR service address}
  MouseBusy := false;		       {Polled use of read mouse is done now}
end;

{---------------------------------------------------------------------------}
{ function 29 - Set Mouse Page }

procedure SetMousePage(Page:Word);
begin
  if not(MouseInstalled) then Exit;		{<-- can't do this, no mouse}

  MouseBusy := true;	    {disallow re-entrant use of routine by mouse ISR}
  MouseReg.AX := 29;
  MouseReg.BX := Page;				{set the new threshold value}
  Intr($33,MouseReg);
  MouseBusy := false;		       {Polled use of read mouse is done now}
end;

{---------------------------------------------------------------------------}
{ function 30 - Get Mouse Page }

function GetMousePage:Word;
begin
  if not(MouseInstalled) then Exit;		{<-- can't do this, no mouse}

  MouseBusy := true;	    {disallow re-entrant use of routine by mouse ISR}
  MouseReg.AX := 29;
  Intr($33,MouseReg);
  GetMousePage := MouseReg.BX;			{get the new threshold value}
  MouseBusy := false;		       {Polled use of read mouse is done now}
end;


{***************************************************************************}
{Initialization section}

begin
{$IFDEF GMouse} 		{ if we are using graphics enable this stuff}
  MouseBack := nil;				 {start with no mouse cursor}
  MouseMask := nil;
  MouseFore := nil;
  MouseSize := 0;
{$ENDIF}

  MouseHooked := false; 	   {mouse starts out disconnected from clock}
  MouseBusy := false;			      {start off with mouse not busy}
  Old1CVect := Int1CVect;	    {save current vector for clock interrupt}
  ExitSave := ExitProc; 			 {hook up the Exit procedure}
  ExitProc := @MouseExit;
  MouseStack := nil;				     {no mouse stack present}
  InitMouse;					       {initialize the mouse}
end.

{***************************************************************************}
{ EOF }

