uses easyer,mousedrv,ncrt,dos,screen,kdbtype,ketabsup;
var
{Book types}
defined,thisbook:booktype;
book:booklisttype;
Itemp:array[1..20] of integer;
reference: file of booktype;
bookinlist:array[1..10] of bookinlisttype;
listfile:file of booklisttype;
numberofbooks:longint;
begin
writeln;
assign (reference,'database.kdd');
rewrite(reference);
numberofbooks:=1;
thisbook.name:=farsinum(strl(numberofbooks))+' World';
thisbook.recnumber:=strl(filepos(reference));
thisbook.number:=strl(numberofbooks);
thisbook.statue:=lost;
thisbook.lostdate:='€…/€…/‚€';
thisbook.lostmsg:='¢ª ¢øìêõ –ê‘à÷ ô‘ğ÷û ù“÷ª ’‘—î öş';
{thisbook.borrower[1]:=fixof(farsinum(STRl(numberofbooks)),'€',8);
thisbook.borrowdate[1]:='€…/‚€';
thisbook.givebackdate[1]:='€/‚€';}
thisbook.group:='üõóä';
{for itemp[1]:=1 to 223 do thisbook.description:='/'+thisbook.description;}
thisbook.description:=farsinum(strl(numberofbooks))+'.’‘—î öş';
{+thisbook.description+'<'}
write (reference,thisbook);
thisbook.recnumber:=strl(filepos(reference));
thisbook.name:=farsinum(strl(numberofbooks))+' World2';
thisbook.number:=strl(numberofbooks+1);
thisbook.statue:=repair;
{thisbook.lostdate:='€…/€…/‚€';}
thisbook.repairmsg:='–¨ ¤şõã— –¨¢ ¤¢ ¤‘“öşõ—êû ı¤“ ’‘—î öş ù¥¤şª';
{thisbook.lostmsg:=' !‘ş÷ş‘—÷õ';
thisbook.borrower[1]:=fixof(farsinum(STRl(numberofbooks)),'€',8);
thisbook.borrowdate[1]:='€…/‚€';
thisbook.givebackdate[1]:='€/‚€';}
thisbook.group:='üõóä';
{for itemp[1]:=1 to 223 do thisbook.description:='/'+thisbook.description;}
thisbook.description:=farsinum(strl(numberofbooks))+'.1’‘—î öş';
{+thisbook.description+'<'}
write (reference,thisbook);

for numberofbooks:=3 to 32000 do begin
thisbook.recnumber:=strl(filepos(reference));
thisbook.name:=farsinum(strl(numberofbooks))+' ù¤‘õª Š’‘¡—÷ –‘ş®‘ş¤';
thisbook.number:=strl(numberofbooks);
thisbook.statue:=lended;
thisbook.borrower[1]:={fixof(}farsinum(STRl(numberofbooks)){,'€',8)};
thisbook.borrower[2]:='€€€‚';{fixof(farsinum(STRl(numberofbooks)),'-',8);}
thisbook.borrower[3]:={fixof(}farsinum(STRl(numberofbooks)){,'+',8)};
thisbook.borrowdate[1]:='€…/€/‚€';
thisbook.givebackdate[1]:='€†/€/‚€';
if numberofbooks<945 then thisbook.group:='üõóä' else
if numberofbooks<1732 then thisbook.group:='ü“û£õ ü÷ş¢' else
if numberofbooks<4970 then thisbook.group:='ü“¢-ö‘õ¤' else
if numberofbooks<9991 then thisbook.group:='ü¡ş¤‘—' else
if numberofbooks<16032 then thisbook.group:='â›¤õ' else
thisbook.group:='üõóä';
{for itemp[1]:=1 to 223 do thisbook.description:='/'+thisbook.description;}
thisbook.description:=fixof(farsinum(strl(numberofbooks)),'€',15)+
' .ƒ†ˆ üû‘ğª÷¢ ¤ª÷ ¥î¤õ ö¤ú—.ü“£›ñø—“Šı¢şõä üóä ùõ›¤— .–¨ ù¢ª ù—ªø÷ öøş÷öøş ¯¨ø— ‰…ñ‘¨ ¤¢ ’‘—î öş';
{+thisbook.description+'<'}
write (reference,thisbook);
end;
close(reference);
end.