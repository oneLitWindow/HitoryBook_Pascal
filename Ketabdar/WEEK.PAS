
program DATEWEEK ; uses Dos ;

(*
  #! rnews 1747
  From: Sven Pran <Sven.Pran@alcatel.no>
  Newsgroups: comp.lang.pascal.borland &c
  Subject: Re: Calender program
  Date: Mon, 03 Feb 1997 09:14:38 +0100
  Organization: Alcanet International Scandinavia

  A very handsome algorithm valid for any year in the Gregorian calendar is:
  *)

function DOW(y, m, d : word) : word { re-presented by JRS } ;
begin if m<3 then begin Inc(m, 12) ; Dec(y) end ;
  DOW := ( ( (3*m + 3) div 5 ) + 2*m + d + y +
    (y div 4) - (y div 100) + (y div 400) ) mod 7 ;
  end {DOW} ;

(* The answer is 0 for Monday through 6 for Sunday. *)

(*** JRS's test : ***)

function Leap(Y : word) : boolean ;
begin {known good}
  Leap := (Y mod 4 = 0) xor (Y mod 100 = 0) xor (Y mod 400 = 0) end {Leap} ;

var Yr, Mo, Dy, D, ShouldBe : word ;
const DiM : array [1..12] of byte =
  (31, 28, 31,  30, 31, 30,  31, 31, 30,  31, 30, 31) ;

BEGIN
Writeln('DOW = ', DOW(2005, 12, 30),
 ' : Today ; DOS DoW (Sun..Sat = 0..6) is ', ShouldBe, '.') ;
END.
