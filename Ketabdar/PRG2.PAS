uses ncrt,graph;
{
AVLB.CHR   AVLR.CHR   BBD.CHR    BDRR.CHR   BNFI.CHR   BNKB.CHR   BOLD.CHR
BRDB.CHR   BRDR.CHR   BRG.CHR    BRSX.CHR   BT1R.CHR   BT2R.CHR   BT3R.CHR
C.CHR      COMB.CHR   COMR.CHR   COPB.CHR   CPTB.CHR   CPUR.CHR   CRCB.CHR
CRCR.CHR   CRNR.CHR   CTGR.CHR   DAPR.CHR   DCLB.CHR   EURO.CHR   FUTI.CHR
GEOR.CHR   GHRB.CHR   GOTH.CHR   HERR.CHR   HLVB.CHR   HLVX.CHR   HMMB.CHR
HOLR.CHR   HOMB.CHR   HOUR.CHR   IRLR.CHR   JADH.CHR   KDKB.CHR   KEYR.CHR
KLAB.CHR   KLAR.CHR   KMM.CHR    KMN.CHR    KRMB.CHR   LCOM.CHR   LITT.CHR
LNSR.CHR   LTKB.CHR   LTKR.CHR   MHRB.CHR   MODH.CHR   MOTB.CHR   PDSR.CHR
PHTR.CHR   PLGR.CHR   PNGB.CHR   PRSB.CHR   PRSR.CHR   RFWR.CHR   ROYB.CHR
ROYR.CHR   SANS.CHR   SCRI.CHR   SHLR.CHR   SIMP.CHR   SINB.CHR   TAMB.CHR
TCHR.CHR   TITB.CHR   TMPB.CHR   TMSB.CHR   TMSR.CHR   TMSX.CHR   TRFB.CHR
TRFH.CHR   TRFR.CHR   TRIP.CHR   TSCR.CHR   TYPB.CHR   WDGR.CHR   YAGR.CHR
YASB.CHR   YASR.CHR   YSMB.CHR   ZAKR.CHR   ZARB.CHR   ZARJ.CHR   ZURR.CHR
}
{'jAsØ ªñ ≠º´G'':pA ∫nBü''≠ºL£ª¶è''ª™{BµjBTwAk™d´'':B™ÆµAnjBTwA''ªØBe∞ntkÆ¥´∫BõC'}
                   { Font name Here}                 { Graphic mode here}
const fname:string='royr' ; fsize:integer=01 ; gm:integer=02;
                                         { font size here}
var i,l:array[1..10] of integer;
    farsifont:array[1..10] of integer;
    s:string;
label lbl,lbl2;   {bdrr,brdb,sinb,royb,titb}
function nreadkey(var k,j:integer):char;
begin
if j<-1 then j:=-1;
if j=00 then j:=+1;
if j>+1 then j:=+1;
if k>62 then k:=62;
if k<01 then k:=01;
l[1]:=k;
l[2]:=j;
repeat
l[1]:=l[1]+l[2];
l[3]:=l[3]+l[4];
if l[1]>=63 then l[2]:=-1;
if l[1]<=00 then l[2]:=+1;
if l[3]<=0000000 then l[4]:=+1;
if l[3]>=getmaxx div 2 then l[4]:=-1;
delay (10);
setrgbpalette (4,l[1],0,0);
setrgbpalette (5,63-l[1],0,0);
for l[9]:=0 to (getmaxx div 130) do begin
setcolor (4);
line (0,l[9],l[3],l[9]);
line (getmaxx,l[9],getmaxx-l[3],l[9]);
putpixel (l[3]+1,l[9],14);
putpixel (getmaxx-l[3]-1,l[9],14);
setcolor (5);
line (getmaxx div 2,getmaxy-l[9],(getmaxx div 2)-l[3],getmaxy-l[9]);
putpixel (((getmaxx div 2)-l[3])-1,getmaxy-l[9],10);
if (getmaxx div 2)+l[3] < l[10]-5 then begin
line (getmaxx div 2,getmaxy-l[9],(getmaxx div 2)+l[3],getmaxy-l[9]);
putpixel (((getmaxx div 2)+l[3])+1,getmaxy-l[9],10);
end;
end;
until keypressed;
nreadkey:=readkey;
k:=l[1];
j:=l[2];
end;
begin
{Graphic Driver   }
i[1]:=installuserdriver ('svga256',nil);
i[2]:=gm;
initgraph (i[1],i[2],'..\bgi\');
farsifont[1]:=installuserfont (fname);
settextstyle (farsifont[1],0,fsize);
lbl:
setcolor (10);
i[2]:=0;
i[3]:=0;
i[9]:=0;
i[10]:=1;
cleardevice;
i[4]:=1;
setrgbpalette (00,63,63,63);
setrgbpalette (09,00,00,40);
setrgbpalette (02,00,00,00);
setrgbpalette (03,00,40,40);
setrgbpalette (06,40,00,00);
setrgbpalette (08,00,00,00);
for i[1]:=0 to 255 do begin
str(i[4],s);
settextstyle (0,0,1);
if getmaxx>=799 then settextstyle (farsifont[1],0,3);
outtextxy (getmaxx-textwidth(s)-2,getmaxy-textheight(s),s);
l[10]:=getmaxx-textwidth(s)-2;
settextstyle (farsifont[1],0,fsize);
str (i[1],s);
setcolor (08);
line (i[3],0,i[3],getmaxy);
line ((getmaxx),0,getmaxx,getmaxy);
l[6]:=trunc(i[2] / 1.01);
setcolor (09);
outtextxy (i[3]+5,l[6],s);
setcolor (03);
outtextxy (5+textwidth(s)+i[3],l[6],'ˇ:ˇ');
setcolor (02);
outtextxy (10+textwidth(s+'ˇ:ˇ')+i[3],l[6],chr(i[1]));
setcolor (06);
i[2]:=i[2]+textheight (chr(i[1]));
if i[2]>=(getmaxy-textheight('568 : ZZZ')) then begin;i[2]:=0;i[3]:=i[3]+trunc(textwidth('568 : Z')*1.5);end;
s:='';
i[5]:=0;
if i[3]>=(getmaxx-trunc(textwidth('568 : mm')*1)) then begin;s:=nreadkey(i[9],i[10]);cleardevice;
                                                       i[5]:=i[3];i[3]:=0;i[2]:=0;i[4]:=i[4]+1;end;
if s=chr(8) then goto lbl;
if s=chr(27) then break;
end;
if (s<>chr(27)) then begin;
if not(i[5]>=(getmaxx-trunc(textwidth('568 : mm')*1))) then s:=nreadkey(i[9],i[10]);
if s<>chr(27) then goto lbl;end;
closegraph;
end.
