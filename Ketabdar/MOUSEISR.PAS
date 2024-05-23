
{ This is the MOUSEISR.PAS include file for the MOUSE.PAS unit }
{ This include file contains the mouse ISR routines and Exit handlers }

{***************************************************************************}
{  ****   These are special procedures -- Caution: handle with care   ****  }

{ special global variables localized to this area}
const ClkVect = $1C;                     {55ms system clock interrupt number}
var ExitSave:Pointer;                        {saved previous ExitPoc pointer}
    Old1Cvect:Pointer;                            {old 55ms interrupt vector}
    Int1Cvect:Pointer absolute $00:$70;    {address of 55ms interrupt vector}

{---------------------------------------------------------------------------}
{Exit procedure}
{ restores stuff on exit from main program }

{$F+} procedure MouseExit;                                  {<-- must be far}
begin
   ExitProc := ExitSave;                   {restore next exit procedure call}
   if MouseVisible then           {make sure the mouse is off before exiting}
     HideMouse;
   if HercGraphMouse then               {turn off the Herc mouse if it is on}
     SetHercMouse(-1);
   if MouseHooked then                             {if mouse hooked to clock}
     SetIntVec(ClkVect,Old1Cvect);            {then restore old clock vector}
end;

{---------------------------------------------------------------------------}
{ mouse clock ISR routine }
{ hooks the ReadMouse routine to the system clock }
{ Use the MouseClock procedure to attach or detach this ISR }

{$F+} procedure ClockMouseRead; interrupt;    {<-- must be far and interrupt}
begin
  inline($FB);                                         {re-enable interrupts}
  if not(MouseBusy) then          {if mouse is still busy, we wrapped around}
  begin
    ReadMouse;                                               {read the mouse}
    { Additional or alternate ISR code can go here - See warning note below }
  end;

  {Finally, we end the ISR with a link to the existing clock routines}
  inline($9C/$FF/$1E/Old1Cvect);   {pushf;  call far old1cvect  ;link to old}
end;

{ Warning: If you add code to this routine, or change it, use extreme care }
{ in what you do. Poorly created ISR routines can create major problems }
{ that cannot be readily detected. Remember that most debugger's }
{ (including Borland's) are not able to trace into an ISR. You will need a }
{ low-level debugger like Periscope to do that sort of thing. }
{ Caution: Since the ClockMouseRead interrupt procedure is hooked to the }
{ system clock, it is repeated at 55ms intervals. Do not allow the code }
{ in the routine to exceed that time frame or it will cause the stack to }
{ overflow. You can add code after the ReadMouse procedure call, or replace }
{ the ReadMouse procedure call with your own, but use extreme care in doing }
{ so, since it is easy to break this code, and you can't easily debug it if }
{ something is wrong. }

{---------------------------------------------------------------------------}
{Hooks the Mouse function to the system clock}
{State = true hooks the mouse up, State = false disconnects the mouse}
{This function calls the ReadMouse function once every 55ms. This can}
{help speed up the mouse control and make it more consistant, especially}
{when using simulated BGI mouse cursor. When the mouse is hooked to the}
{system clock you do not need to continuously poll the ReadMouse procedure}

procedure MouseClock(State:Boolean);
begin
  if State then
  begin
    if MouseHooked then Exit;      {the mouse is already hooked to the clock}
    MouseHooked := true;                   {if the mouse is not hooked, then}
    Old1Cvect := Int1Cvect;                       {save old clock vector and}
    SetIntVec(ClkVect,@ClockMouseRead);                      {attach our own}
  end
  else
  begin
    if not(MouseHooked) then Exit;       {if mouse currently hooked to clock}
    SetIntVec(ClkVect,Old1Cvect);             {then restore old clock vector}
    MouseHooked := false;                                     {and unhook it}
  end;
end;

{---------------------------------------------------------------------------}
{ End Of MOUSEISR.PAS include file }

