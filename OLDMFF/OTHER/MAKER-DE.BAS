DECLARE FUNCTION nofile3$ ()
DECLARE FUNCTION fv2$ (x!)
DECLARE FUNCTION fv$ (x AS LONG)
DECLARE FUNCTION nofile2$ ()
DECLARE FUNCTION ualphabet$ ()
DECLARE FUNCTION tester! (x$)
DECLARE FUNCTION nofile$ ()
DECLARE SUB ctr2 (x!, t$)
DECLARE FUNCTION exitor! ()
DECLARE SUB drawer ()
DECLARE SUB logo ()
DECLARE SUB ctr (x!, t$)
DECLARE FUNCTION directorymethoder! (D!)
DECLARE FUNCTION filesize! ()
DECLARE FUNCTION fixval$ (s!)
DECLARE SUB getkeys ()
DECLARE SUB help (x!)
DECLARE FUNCTION howmany$ (D!)
DECLARE SUB textcadr (x1!, y1!, x2!, y2!, colr!, cc!)
DECLARE SUB writer (x$, c!, cc!, D!)

REM "   "
WIDTH 80, 25
SHELL "e:\compiler\qbx\clock"
LOCATE , , 0
th0:
logo
st1:
COLOR 10, 1: CLS
VIEW PRINT 1 TO 25
COLOR 1, 7
LOCATE 25, 1: PRINT SPACE$(80);
COLOR 0
LOCATE 25, 1: PRINT "Up/Down arrows="; : COLOR 1: PRINT "Up/Down Cursure  "; : COLOR 0: PRINT "Enter="; : COLOR 1: PRINT "Accept  "; : COLOR 0: PRINT "Esc="; : COLOR 1: PRINT "Cancel"; : COLOR 0: PRINT "    Alt+B="; : COLOR 1: PRINT "Back"; : COLOR  _
0: PRINT "   F1="; : COLOR 1: PRINT "Help";
COLOR 10, 1
'SHELL "clock"
 COLOR 10
 ctr 8, "Choose Method..."
 COLOR 14
 ctr 9, "ษออออออออป"
ctr 10, "บ  Make  บ"
ctr 11, "บ Delete บ"
ctr 12, "ศออออออออผ"
 COLOR 10, 1
ctr 10, "  Make  "
ctr 11, " Delete "
COLOR 12
j2 = -10
lin = 1
COLOR 14, 4
ctr 10, "  Make  "
DO
FOR I = 128 TO 152
j = 128 + 152 - I - 1
COLOR 12, 1
j2 = j2 + 1
IF j2 > 152 - 128 THEN j2 = 0
j3 = (152 - 128) - j2
'LOCATE 7, 38: PRINT CHR$(j + 26)
'LOCATE 7, 37: PRINT CHR$(j3 + 128 + 25)
COLOR 15, 2
IF j2 >= 0 THEN ctr 7, ">" + CHR$(j3 + 128 + 25) + CHR$(j + 26) + "<" ELSE ctr 7, "> " + CHR$(j + 26) + "<"
COLOR 12, 1
LOCATE 8, 31: PRINT CHR$(I)
SOUND 0, .8
SOUND 0, .5
I$ = INKEY$

IF I$ <> "" THEN
IF I$ = CHR$(0) + CHR$(48) THEN GOTO th0
 COLOR 10, 1
IF I$ = CHR$(0) + CHR$(72) THEN lin = lin - 1
IF I$ = CHR$(0) + CHR$(80) THEN lin = lin + 1
IF lin < 1 THEN lin = 2
IF lin > 2 THEN lin = 1
ctr 10, "  Make  "
ctr 11, " Delete "
COLOR 14, 4
IF lin = 1 THEN ctr 10, "  Make  "
IF lin = 2 THEN ctr 11, " Delete "
IF I$ = CHR$(13) THEN EXIT DO
IF I$ = CHR$(27) THEN IF exitor = 1 THEN COLOR 7, 0: CLS : END
IF I$ = CHR$(0) + CHR$(59) THEN
help (0)
 COLOR 10
 ctr 8, "Choose Method..."
 COLOR 14, 1
 ctr 9, "ษออออออออป"
ctr 10, "บ  Make  บ"
ctr 11, "บ Delete บ"
ctr 12, "ศออออออออผ"
 COLOR 10, 1
ctr 10, "  Make  "
ctr 11, " Delete "
COLOR 14, 4
IF lin = 1 THEN ctr 10, "  Make  "
IF lin = 2 THEN ctr 11, " Delete "
COLOR 0, 7
LOCATE 25, 1: PRINT SPACE$(80);
LOCATE 25, 1: PRINT "Up/Down arrows="; : COLOR 1: PRINT "Up/Down Cursure  "; : COLOR 0: PRINT "Enter="; : COLOR 1: PRINT "Accept  "; : COLOR 0: PRINT "Esc="; : COLOR 1: PRINT "Cancel"; : COLOR 0: PRINT "    Alt+B="; : COLOR 1: PRINT "Back"; : COLOR  _
0: PRINT "   F1="; : COLOR 1: PRINT "Help";
COLOR 10, 1
END IF
getkeys
END IF
NEXT
'IF i$ <> "" THEN EXIT DO
LOOP
ll = lin
nd2:
rd3:
COLOR 10, 1: CLS
COLOR 1, 7
LOCATE 25, 1: PRINT SPACE$(80);
COLOR 0
LOCATE 25, 1: PRINT "Up/Down arrows="; : COLOR 1: PRINT "Up/Down Cursure  "; : COLOR 0: PRINT "Enter="; : COLOR 1: PRINT "Accept  "; : COLOR 0: PRINT "Esc="; : COLOR 1: PRINT "Cancel"; : COLOR 0: PRINT "    Alt+B="; : COLOR 1: PRINT "Back"; : COLOR  _
0: PRINT "   F1="; : COLOR 1: PRINT "Help";
COLOR 10, 1
'SHELL "clock"
 COLOR 10
 IF ll = 1 THEN ctr 8, "Make what..."
 IF ll = 2 THEN ctr 8, "Delete what..."
 COLOR 14
 ctr 9, "ษอออออออออออป"
ctr 10, "บ    File   บ"
ctr 11, "บ Directory บ"
ctr 12, "ศอออออออออออผ"
 COLOR 10, 1
ctr 10, "    File   "
ctr 11, " Directory "
COLOR 12
j2 = -10
lin = 1
COLOR 14, 4
ctr 10, "    File   "
DO
FOR I = 128 TO 152
j = 128 + 152 - I - 1
COLOR 12, 1
j2 = j2 + 1
IF j2 > 152 - 128 THEN j2 = 0
j3 = (152 - 128) - j2
'LOCATE 7, 38: PRINT CHR$(j + 26)
'LOCATE 7, 37: PRINT CHR$(j3 + 128 + 25)
COLOR 15, 2
IF j2 >= 0 THEN ctr 7, ">" + CHR$(j3 + 128 + 25) + CHR$(j + 26) + "<" ELSE ctr 7, "> " + CHR$(j + 26) + "<"
COLOR 12, 1
IF ll = 1 THEN LOCATE 8, 33: PRINT CHR$(I)
IF ll = 2 THEN LOCATE 8, 32: PRINT CHR$(I)
SOUND 0, .8
SOUND 0, .5
I$ = INKEY$
IF I$ <> "" THEN
IF I$ = CHR$(0) + CHR$(48) THEN GOTO st1
 COLOR 10, 1
IF I$ = CHR$(0) + CHR$(72) THEN lin = lin - 1
IF I$ = CHR$(0) + CHR$(80) THEN lin = lin + 1
IF lin < 1 THEN lin = 2
IF lin > 2 THEN lin = 1
ctr 10, "    File   "
ctr 11, " Directory "
COLOR 14, 4
IF lin = 1 THEN ctr 10, "    File   "
IF lin = 2 THEN ctr 11, " Directory "
IF I$ = CHR$(13) THEN EXIT DO
IF I$ = CHR$(27) THEN IF exitor = 1 THEN COLOR 7, 0: CLS : END
IF I$ = CHR$(0) + CHR$(59) THEN
 help (ll)
 COLOR 10
 IF ll = 1 THEN ctr 8, "Make what..."
 IF ll = 2 THEN ctr 8, "Delete what..."
 COLOR 14, 1
 ctr 9, "ษอออออออออออป"
ctr 10, "บ    File   บ"
ctr 11, "บ Directory บ"
ctr 12, "ศอออออออออออผ"
 COLOR 10, 1
ctr 10, "    File   "
ctr 11, " Directory "
COLOR 14, 4
IF lin = 1 THEN ctr 10, "    File   "
IF lin = 2 THEN ctr 11, " Directory "
COLOR 0, 7
LOCATE 25, 1: PRINT SPACE$(80);
LOCATE 25, 1: PRINT "Up/Down arrows="; : COLOR 1: PRINT "Up/Down Cursure  "; : COLOR 0: PRINT "Enter="; : COLOR 1: PRINT "Accept  "; : COLOR 0: PRINT "Esc="; : COLOR 1: PRINT "Cancel"; : COLOR 0: PRINT "    Alt+B="; : COLOR 1: PRINT "Back"; : COLOR  _
0: PRINT "   F1="; : COLOR 1: PRINT "Help";
COLOR 10, 1
END IF
getkeys
END IF
NEXT
'IF i$ <> "" THEN EXIT DO
LOOP
CLS
lll = lin
IF lll = 1 AND ll = 1 THEN size = filesize: IF size = -1 THEN GOTO rd3
IF lll = 2 THEN method = directorymethoder(ll): IF method = -1 THEN GOTO rd3
th4:
COLOR 13, 1
CLS
COLOR 0, 7
LOCATE 25, 1: PRINT SPACE$(80);
LOCATE 25, 1: PRINT "Alt+Back Space="; : COLOR 1: PRINT "Clear string  "; : COLOR 0: PRINT "Enter="; : COLOR 1: PRINT "Accept  "; : COLOR 0: PRINT "Esc="; : COLOR 1: PRINT "Cancel"; : COLOR 0: PRINT "    Alt+B="; : COLOR 1: PRINT "Back"; : COLOR 0: _
                                                                     PRINT "      F1="; : COLOR 1: PRINT "Help";
COLOR 13, 1
LOCATE 11, 1
PRINT "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
PRINT "บ                                                                            วฤฟ"
PRINT "ศัอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ ณ"
PRINT " ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู"
COLOR 14, 4
LOCATE 12, 2: PRINT SPACE$(76)
LOCATE 12, 3: COLOR 12 + 16: PRINT "_"
j2 = -9
LOCATE 10, 25: COLOR 10, 1
PRINT "Now enter folder of ";
IF lll = 1 THEN PRINT "Files";
IF lll = 2 THEN PRINT "Directories";
PRINT " to ";
IF ll = 1 THEN PRINT "Make"
IF ll = 2 THEN PRINT "Delete"
COLOR , 4
DO
FOR I = 128 TO 152
j = 128 + 152 - I - 1
COLOR 12, 1
j2 = j2 + 1
IF j2 > 152 - 128 THEN j2 = 0
j3 = (152 - 128) - j2
'LOCATE 7, 38: PRINT CHR$(j + 26)
'LOCATE 7, 37: PRINT CHR$(j3 + 128 + 25)
SOUND 0, 1
COLOR 15, 2
IF j2 >= 0 THEN ctr 9, ">" + CHR$(j3 + 128 + 25) + CHR$(j + 26) + "<" ELSE ctr 9, "> " + CHR$(j + 26) + "<"
COLOR 12, 1
LOCATE 10, 24: PRINT CHR$(I)
COLOR , 4
LOCATE 12, 2
IF a$ <> "" THEN writer " " + folder$, 0, 0, 1: COLOR 12 + 16: PRINT "_ "
COLOR 15, 4
a$ = INKEY$
IF a$ = CHR$(0) + CHR$(48) THEN GOTO nd2
IF a$ = CHR$(10) THEN a$ = ""
IF a$ <> "" THEN getkeys
IF a$ = CHR$(0) + CHR$(14) THEN
COLOR 4, 2
FOR a = 1 TO 75
LOCATE 12, a + 1: PRINT "Û ";
SOUND 0, .2
NEXT
getkeys
COLOR 10, 4
folder$ = "": LOCATE 12, 2: PRINT SPACE$(76): a$ = "": COLOR 12 + 16: LOCATE 12, 3: PRINT "_"
END IF
IF a$ = CHR$(0) + CHR$(59) THEN
COLOR 1, 1
LOCATE 11, 1
PRINT "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
PRINT "บ                                                                            วฤฟ"
PRINT "ศัอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ ณ"
PRINT " ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู"

IF lll = 1 AND ll = 1 THEN help (4)
IF lll = 1 AND ll = 2 THEN help (5)
IF lll = 2 AND ll = 1 THEN help (6)
IF lll = 2 AND ll = 2 THEN help (7)
a$ = ""
COLOR 13, 1
COLOR 0, 7
LOCATE 25, 1: PRINT SPACE$(80);
LOCATE 25, 1: PRINT "Alt+Back Space="; : COLOR 1: PRINT "Clear string  "; : COLOR 0: PRINT "Enter="; : COLOR 1: PRINT "Accept  "; : COLOR 0: PRINT "Esc="; : COLOR 1: PRINT "Cancel"; : COLOR 0: PRINT "    Alt+B="; : COLOR 1: PRINT "Back"; : COLOR 0: _
                                                                     PRINT "      F1="; : COLOR 1: PRINT "Help";
COLOR 13, 1
LOCATE 11, 1
PRINT "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป"
PRINT "บ                                                                            วฤฟ"
PRINT "ศัอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ ณ"
PRINT " ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู"
COLOR , 4
LOCATE 12, 2
LOCATE 12, 2: PRINT SPACE$(76)
LOCATE 12, 2
writer " " + folder$, 0, 0, 1: COLOR 12 + 16: PRINT "_ "
LOCATE 10, 25: COLOR 10, 1
PRINT "Now enter folder of ";
IF lll = 1 THEN PRINT "Files";
IF lll = 2 THEN PRINT "Directories";
PRINT " to ";
IF ll = 1 THEN PRINT "Make"
IF ll = 2 THEN PRINT "Delete"
COLOR , 4

END IF
IF a$ = CHR$(13) THEN GOSUB showu
IF a$ = CHR$(27) THEN IF exitor = 1 THEN COLOR 7, 0: CLS : END
IF a$ = CHR$(8) AND LEN(folder$) > 0 THEN folder$ = LEFT$(folder$, LEN(folder$) - 1)
IF a$ = CHR$(8) AND LEN(folder$) < 1 THEN folder$ = ""
IF LEN(a$) > 1 THEN a$ = RIGHT$(a$, 1)
IF a$ <> "" AND a$ <> CHR$(13) AND a$ <> CHR$(27) AND a$ <> CHR$(8) AND LEN(folder$) < 73 THEN
newfolder$ = folder$ + a$
IF tester(newfolder$) = 1 THEN PLAY "MF g60": getkeys: GOTO holl
IF INSTR(nofile$, a$) = 0 THEN folder$ = folder$ + a$ ELSE PLAY "MF g60": getkeys
holl:
END IF
NEXT
LOOP
showu:
ON ERROR GOTO hik
'COLOR 0, 0: CLS
IF folder$ <> "" THEN
IF RIGHT$(folder$, 1) <> "\" THEN folder$ = folder$ + "\"
OPEN folder$ + "testasp.tmp" FOR APPEND AS #1
CLOSE
ELSE
OPEN "testasp.tmp" FOR APPEND AS #2
CLOSE
END IF
COLOR , 1: CLS
ON ERROR RESUME NEXT
showu2:
COLOR 10, 1: CLS
number$ = howmany$(lll)
IF number$ = "xxx" THEN GOTO th4
DIM numbers AS LONG
IF number$ = "38,877,154,474,709,500,800,000,000" THEN numbers = -1: GOTO other
nu$ = ""
FOR num = 1 TO LEN(number$)
mu$ = MID$(number$, num, 1)
IF mu$ <> "," THEN nu$ = nu$ + mu$
NEXT
numbers = VAL(nu$)
other:
COLOR , 1: CLS
COLOR 1, 7
LOCATE 25, 1: PRINT SPACE$(80);
COLOR 0
LOCATE 25, 1: PRINT "Up/Down="; : COLOR 1: PRINT "Up/Down  "; : COLOR 0: PRINT "Space="; : COLOR 1: PRINT "On/Off  "; : COLOR 0: PRINT "Enter="; : COLOR 1: PRINT "Accept  "; : COLOR 0: PRINT "Esc="; : COLOR 1: PRINT "Cancel  "; : COLOR 0: PRINT  _
"  Alt+B="; : COLOR 1: PRINT "Back  "; : COLOR 0: PRINT "  F1="; : COLOR 1: PRINT "Help";
COLOR 10, 1
'SHELL "clock"
 COLOR 10
 ctr 7, "Other Options..."
 COLOR 14
 ctr 8, "ษอออออออออออออออออออออออป"
 ctr 9, "บ [๚] Beep after Done   บ"
ctr 10, "บ [๚] Lock When Started บ"
ctr 11, "บ [๚] Halt after Work   บ"
ctr 12, "บ [๚] End Work on Error บ"
ctr 13, "บ [๚] Trun off Screen   บ"
ctr 14, "ศอออออออออออออออออออออออผ"
 COLOR 10, 1
 ctr 9, " [๚] Beep after Done   "
ctr 10, " [๚] Lock When Started "
ctr 11, " [๚] Halt after Work   "
ctr 12, " [๚] End Work on Error "
ctr 13, " [๚] Turn off Screen   "
COLOR 12
j2 = -10
lin = 1
COLOR 14, 4
 ctr 9, " [ ] Beep after Done   "
ON ERROR RESUME NEXT
DIM OPT$(1 TO 5)
OPT$(1) = CHR$(4)
FOR hg = 2 TO 5
OPT$(hg) = "๚"
NEXT
COLOR 13, 1
FOR hg = 1 TO 5
LOCATE 8 + hg, 30
PRINT OPT$(hg)
NEXT
COLOR 13, 4
LOCATE 9, 30: PRINT CHR$(4): COLOR , 1

DO
FOR I = 128 TO 152
j = 128 + 152 - I - 1
COLOR 12, 1
j2 = j2 + 1
IF j2 > 152 - 128 THEN j2 = 0
j3 = (152 - 128) - j2
'LOCATE 7, 38: PRINT CHR$(j + 26)
'LOCATE 7, 37: PRINT CHR$(j3 + 128 + 25)
COLOR 15, 2
IF j2 >= 0 THEN ctr 6, ">" + CHR$(j3 + 128 + 25) + CHR$(j + 26) + "<" ELSE ctr 6, "> " + CHR$(j + 26) + "<"
COLOR 12, 1
LOCATE 7, 31: PRINT CHR$(I)
SOUND 0, .8
SOUND 0, .5
I$ = INKEY$

IF I$ <> "" THEN
IF I$ = CHR$(0) + CHR$(48) THEN GOTO showu2
 COLOR 10, 1
IF I$ = CHR$(0) + CHR$(72) THEN lin = lin - 1
IF I$ = CHR$(0) + CHR$(80) THEN lin = lin + 1
IF I$ = " " THEN
k$ = OPT$(lin)
IF k$ = CHR$(4) THEN OPT$(lin) = "๚"
IF k$ = "๚" THEN OPT$(lin) = CHR$(4)
END IF
IF lin < 1 THEN lin = 5
IF lin > 5 THEN lin = 1
 ctr 9, " [ ] Beep after Done   "
ctr 10, " [ ] Lock When Started "
ctr 11, " [ ] Halt after Work   "
ctr 12, " [ ] End Work on Error "
ctr 13, " [ ] Turn off Screen   "
COLOR 13
FOR hg = 1 TO 5
LOCATE 8 + hg, 30
PRINT OPT$(hg)
NEXT
COLOR 14, 4
 IF lin = 1 THEN ctr 9, " [ ] Beep after Done   "
IF lin = 2 THEN ctr 10, " [ ] Lock When Started "
IF lin = 3 THEN ctr 11, " [ ] Halt after Work   "
IF lin = 4 THEN ctr 12, " [ ] End Work on Error "
IF lin = 5 THEN ctr 13, " [ ] Turn off Screen   "
COLOR 13
FOR hg = 1 TO 5
LOCATE 8 + hg, 30
IF lin = hg THEN PRINT OPT$(hg)
NEXT

IF I$ = CHR$(13) THEN EXIT DO
IF I$ = CHR$(27) THEN IF exitor = 1 THEN COLOR 7, 0: CLS : END
IF I$ = CHR$(0) + CHR$(59) THEN
help (-1)
 COLOR 10
 ctr 7, "Other Options..."
 COLOR 14, 1
 ctr 8, "ษอออออออออออออออออออออออป"
 ctr 9, "บ [ ] Beep after Done   บ"
ctr 10, "บ [ ] Lock When Started บ"
ctr 11, "บ [ ] Halt after Work   บ"
ctr 12, "บ [ ] End Work on Error บ"
ctr 13, "บ [ ] Trun Off Screen   บ"
ctr 14, "ศอออออออออออออออออออออออผ"
COLOR 13
FOR hg = 1 TO 5
LOCATE 8 + hg, 30
PRINT OPT$(hg)
NEXT

 COLOR 10, 1
 ctr 9, " [ ] Beep after Done   "
ctr 10, " [ ] Lock When Started "
ctr 11, " [ ] Halt after Work   "
ctr 12, " [ ] End Work on Error "
ctr 13, " [ ] Turn off Screen   "
COLOR 13
FOR hg = 1 TO 5
LOCATE 8 + hg, 30
PRINT OPT$(hg)
NEXT

COLOR 14, 4
 IF lin = 1 THEN ctr 9, " [ ] Beep after Done   "
IF lin = 2 THEN ctr 10, " [ ] Lock When Started "
IF lin = 3 THEN ctr 11, " [ ] Halt after Work   "
IF lin = 4 THEN ctr 12, " [ ] End Work on Error "
IF lin = 5 THEN ctr 13, " [ ] Turn off Screen   "
COLOR 13
FOR hg = 1 TO 5
LOCATE 8 + hg, 30
IF hg = lin THEN PRINT OPT$(hg)
NEXT

COLOR 0, 7
LOCATE 25, 1: PRINT SPACE$(80);
LOCATE 25, 1: PRINT "Up/Down="; : COLOR 1: PRINT "Up/Down  "; : COLOR 0: PRINT "Space="; : COLOR 1: PRINT "On/Off  "; : COLOR 0: PRINT "Enter="; : COLOR 1: PRINT "Accept  "; : COLOR 0: PRINT "Esc="; : COLOR 1: PRINT "Cancel  "; : COLOR 0: PRINT  _
"  Alt+B="; : COLOR 1: PRINT "Back  "; : COLOR 0: PRINT "  F1="; : COLOR 1: PRINT "Help";
COLOR 10, 1
END IF
getkeys
END IF
NEXT
'IF i$ <> "" THEN EXIT DO
LOOP
helicops:
COLOR 10, 1: CLS
j2 = -9
w$ = "                              Maker Settings Reviewation! Ready for start!!! "
COLOR , 4
FOR xx = 15 TO 65
FOR yy = 3 TO 13
LOCATE yy, xx: PRINT " "
NEXT: NEXT
textcadr 15, 2, 65, 13, 14, 4
textcadr 1, 13, 80, 15, 14, 4
COLOR , 4
LOCATE 13, 15: PRINT "ส"
LOCATE 13, 65: PRINT "ส"
LOCATE 14, 3: PRINT SPACE$(80 - 3)
folder$ = UCASE$(LTRIM$(RTRIM$(folder$)))
LOCATE 13, 2: PRINT "Folder:"
IF folder$ <> "" THEN LOCATE 14, 3: PRINT folder$ ELSE LOCATE 14, 3: PRINT "<Root Folder>"
COLOR , 1


COLOR 14, 4: LOCATE 3, 16
PRINT " Method     ": LOCATE , 16
PRINT " Work on    ": LOCATE , 16
PRINT " Size       ": LOCATE , 16
PRINT " Work Method": LOCATE , 16
PRINT " How Many   ": LOCATE , 16
PRINT " Done Beep  ": LOCATE , 16
PRINT " Start Lock ": LOCATE , 16
PRINT " Done Halt  ": LOCATE , 16
PRINT " Error Break": LOCATE , 16
PRINT " Screen Off ": LOCATE , 16
COLOR 12: LOCATE 3, 28
FOR yy = 1 TO 10
LOCATE , 28: PRINT ":"
NEXT
COLOR 15: LOCATE 3, 30
IF ll = 1 THEN PRINT "Make"
IF ll = 2 THEN PRINT "Delete"
LOCATE , 30
IF lll = 1 THEN PRINT "Files"
IF lll = 2 THEN PRINT "Directorys"
LOCATE , 30
IF lll = 1 AND ll = 1 THEN
IF size <> 0 THEN
IF size < 1000 THEN PRINT fixval$(size); " Kilo Bytes" ELSE PRINT fixval$(size / 1000); " Mega Byte"; : IF size / 1000 > 1 THEN PRINT "s"
ELSE PRINT "Zero Byte File"
END IF
ELSE PRINT "----------------"
END IF
LOCATE , 30
IF lll = 2 THEN
IF method = 1 THEN PRINT "Directory in Directory"
IF method = 2 THEN PRINT "Directory after Directory"
ELSE PRINT "----------------"
END IF
LOCATE 7, 30: PRINT number$
FOR hg = 1 TO 5
LOCATE , 30
IF OPT$(hg) = CHR$(4) THEN PRINT "Yes" ELSE PRINT "No"
NEXT
COLOR , 7
LOCATE 25, 1: PRINT SPACE$(80);
LOCATE 25, 1: COLOR 0: PRINT "Enter="; : COLOR 1: PRINT "START!  "; : COLOR 0: PRINT "Esc="; : COLOR 1: PRINT "Exit  "; : COLOR 0: PRINT "  Alt+B="; : COLOR 1: PRINT "Back";
COLOR , 1
DO
FOR I = 128 TO 152
j = 128 + 152 - I - 1
a$ = INKEY$
IF a$ = CHR$(0) + CHR$(48) THEN GOTO other
IF a$ = CHR$(13) THEN GOTO hosh
IF a$ = CHR$(27) THEN IF exitor = 1 THEN COLOR 7, 0: CLS : END
COLOR 12, 1
j2 = j2 + 1
IF j2 > 152 - 128 THEN j2 = 0
j3 = (152 - 128) - j2
'LOCATE 7, 38: PRINT CHR$(j + 26)
'LOCATE 7, 37: PRINT CHR$(j3 + 128 + 25)
SOUND 0, 1
COLOR 14, 4
IF j2 >= 0 THEN ctr 2, ">" + CHR$(j3 + 128 + 25) + CHR$(j + 26) + "<" ELSE ctr 2, "> " + CHR$(j + 26) + "<"
'COLOR 12, 1
'LOCATE 2, 24: PRINT CHR$(i)
COLOR 15, 2
'LOCATE 2, 2, 0: PRINT SPACE$(78)
sf = sf + .5
IF sf < 1 THEN sf = 1
LOCATE 1, 24
PRINT CHR$(I); MID$(w$, INT(sf), 30)
LOCATE 1, 55: PRINT CHR$(128 + j3)
IF sf > LEN(w$) THEN sf = 0
NEXT
LOCATE , 30

LOOP
hosh:
DIM sgp AS LONG
COLOR , 1
textcadr 1, 16, 80, 25, 10, 2
COLOR 10, 2
LOCATE 16, 35: PRINT "ห";
LOCATE 25, 35: PRINT "ส";
FOR ggp = 17 TO 24
LOCATE ggp, 34: PRINT " บ "
NEXT
COLOR 14, 1
LOCATE 17, 4
PRINT "Date          : ==-==-====   ": LOCATE , 4
PRINT "Time          : ==:==:==     ": LOCATE , 4
PRINT "Begin Time    : ==:==:==     ": LOCATE , 4
PRINT "Elapsed Time  : ==:==:==     ": LOCATE , 4
PRINT "Remained Time : ==:==:==     ": LOCATE , 4
PRINT "Name          : ========.=== ": LOCATE , 3
COLOR 10, 6
PRINT " [๚] Errors no : ==========    ": LOCATE , 3
COLOR 12
PRINT " [๚] Over flow Error Numbers   "
LOCATE 17, 37
COLOR 10, 5
PRINT " [๚] Done      : ==========               ": LOCATE , 37
COLOR 12
PRINT " [๚] Over flow Number                     ": LOCATE , 37
COLOR 10, 6
PRINT " [๚] Done%     : ==%                      ": LOCATE , 37
COLOR 12
PRINT " [๚] Can't Calculate                      ": LOCATE , 37
COLOR 10, 5
PRINT " [๚] Press Esc to Stop                    ": LOCATE , 37
COLOR 12
PRINT " [๚] Locked! Enter Password :"; : COLOR 15 + 16: PRINT "_            "; : LOCATE , 39
COLOR 12
PRINT OPT$(2): LOCATE , 37
IF OPT$(2) = "๚" THEN LOCATE CSRLIN - 2, 39: PRINT CHR$(4)
PRINT : LOCATE , 37
LOCATE 23
COLOR 10, 6
PRINT " [๚] Last Work Was OK!                    ": LOCATE , 37
COLOR 12:
PRINT " [๚] Last Work Was Acces Denied!!!        "

IF numbers <> -1 THEN
LOCATE 17, 39
COLOR 10, 5
PRINT CHR$(4)
LOCATE 19, 39: COLOR , 6
PRINT CHR$(4)
LOCATE 23, 5
COLOR , 6: PRINT CHR$(4)
END IF
COLOR 12
LOCATE 18, 39
IF numbers = -1 THEN
LOCATE 18, 39
COLOR 12, 5
PRINT CHR$(4)
LOCATE 20, 39: COLOR , 6
PRINT CHR$(4)
LOCATE 24, 5
COLOR , 6: PRINT CHR$(4)
END IF
'CLS
DIM ttimer AS LONG
ttimer = INT(TIMER)
IF folder$ <> "" THEN CHDIR folder$
IF numbers <> -1 THEN
DIM numx AS LONG, errx AS LONG
'DIM otime AS LONG, ntime AS LONG
otime = TIMER
ntime = otime
END IF
IF OPT$(5) = CHR$(4) THEN
COLOR 0, 0: CLS
ELSE
 COLOR 14, 1
 LOCATE 19, 20: PRINT TIME$
END IF
FOR oh1 = 0 TO 255
IF INSTR(nofile2$, CHR$(oh1)) = 0 OR (lll = 2 AND INSTR(nofile3$, CHR$(oh1)) = 0) THEN
FOR oh2 = 0 TO 255
IF INSTR(nofile2$, CHR$(oh2)) = 0 OR (lll = 2 AND INSTR(nofile3$, CHR$(oh2)) = 0) THEN
FOR oh3 = 0 TO 255
IF INSTR(nofile2$, CHR$(oh3)) = 0 OR (lll = 2 AND INSTR(nofile3$, CHR$(oh3)) = 0) THEN
FOR oh4 = 0 TO 255
IF INSTR(nofile2$, CHR$(oh4)) = 0 OR (lll = 2 AND INSTR(nofile3$, CHR$(oh4)) = 0) THEN
FOR oh5 = 0 TO 255
IF INSTR(nofile2$, CHR$(oh5)) = 0 OR (lll = 2 AND INSTR(nofile3$, CHR$(oh5)) = 0) THEN
FOR oh6 = 0 TO 255
IF INSTR(nofile2$, CHR$(oh6)) = 0 OR (lll = 2 AND INSTR(nofile3$, CHR$(oh6)) = 0) THEN
FOR oh7 = 0 TO 255
IF INSTR(nofile2$, CHR$(oh7)) = 0 OR (lll = 2 AND INSTR(nofile3$, CHR$(oh7)) = 0) THEN
FOR oh8 = 0 TO 255
IF INSTR(nofile2$, CHR$(oh8)) = 0 OR (lll = 2 AND INSTR(nofile3$, CHR$(oh8)) = 0) THEN
FOR oh9 = 0 TO 255
IF INSTR(nofile2$, CHR$(oh9)) = 0 OR (lll = 2 AND INSTR(nofile3$, CHR$(oh9)) = 0) THEN
FOR oh10 = 0 TO 255
IF INSTR(nofile2$, CHR$(oh10)) = 0 OR (lll = 2 AND INSTR(nofile3$, CHR$(oh10)) = 0) THEN
FOR oh11 = 0 TO 255
IF INSTR(nofile2$, CHR$(oh11)) = 0 OR (lll = 2 AND INSTR(nofile3$, CHR$(oh11)) = 0) THEN
ON ERROR GOTO errh
name$ = CHR$(oh1) + CHR$(oh2) + CHR$(oh3) + CHR$(oh4) + CHR$(oh5) + CHR$(oh6) + CHR$(oh7) + CHR$(oh8) + "." + CHR$(oh9) + CHR$(oh10) + CHR$(oh11)
KC = 1

IF ll = 1 THEN
IF lll = 1 THEN
OPEN name$ FOR OUTPUT AS #1
IF size > 0 THEN
FOR sgp = 1 TO size \ 20000
PRINT #1, STRING$(20000, CHR$(13))
NEXT
END IF
CLOSE #1
END IF
IF lll = 2 THEN MKDIR name$
END IF
IF ll = 2 THEN
IF lll = 1 THEN KILL name$
IF lll = 2 THEN RMDIR name$
END IF
IF lll = 2 THEN
IF method = 1 THEN CHDIR name$
END IF
COLOR 10, 6
LOCATE 23, 39: PRINT CHR$(4)
COLOR 12
LOCATE 24, 39: PRINT "๚"

KCX:
KC = 0
IF OPT$(5) <> CHR$(4) THEN
COLOR 14, 1
 LOCATE 18, 20: PRINT TIME$

 LOCATE 20, 20: PRINT fv2$(INT(TIMER - ttimer))
 COLOR , 1
 LOCATE 22, 20
 PRINT name$
 IF numbers <> -1 THEN
  numx = numx + 1
'  ntime = TIMER
'  xxxgoofy = (ABS((ntime - otime) * (numbers - numx)))
'  LOCATE 21, 20
'  PRINT fv2$(xxxgoofy)
  otime = ntime
  LOCATE 17, 54
  COLOR 10, 5
  PRINT fv$(numx)
  LOCATE 19, 54
  COLOR , 6
  PRINT fixval$(INT((100 * (numx / numbers)))) + "% "
IF numx >= numbers THEN GOTO endene

 END IF
ELSE
numx = numx + 1
IF INT(TIMER * 2) MOD 2 = 0 THEN
LOCATE 1, 1: COLOR 15: PRINT numx \ 1000; "/"; numbers \ 1000
END IF
IF numx >= numbers THEN GOTO endene
END IF
END IF
NEXT
END IF
NEXT
END IF
NEXT
END IF
NEXT
END IF
NEXT
END IF
NEXT
END IF
NEXT
END IF
NEXT
END IF
NEXT
END IF
NEXT
END IF
NEXT oh1
endene:
ON ERROR RESUME NEXT
COLOR , 1
'CLS
END
hik:
COLOR 12
textcadr 20, 9, 60, 11, 14, 4
COLOR 15, 4
ctr 10, " Invalid Folder! Please Try Again!!!  "
BEEP
BEEP

FOR tempest = 1 TO 10
SOUND 0, 2
NEXT
getkeys
RESUME th4
errh:
'PRINT ">>>>"; name$: END
IF number <> -1 THEN errx = errx + 1
IF OPT$(5) = "๚" THEN
COLOR 10, 6
LOCATE 23, 39: PRINT "๚"
COLOR 12
LOCATE 24, 39: PRINT CHR$(4)
IF numbers <> -1 THEN LOCATE 23, 20: PRINT fv$(errx)
END IF
IF OPT$(4) = CHR$(4) THEN numx = numbers
IF KC = 1 THEN RESUME KCX ELSE RESUME NEXT

SUB ctr (x, t$)
LOCATE x, ((80 - LEN(t$)) \ 2)
PRINT t$;
END SUB

SUB ctr2 (x, t$)
LOCATE x, ((80 - LEN(t$)) \ 2) + 1
PRINT t$;
END SUB

FUNCTION directorymethoder (D)
COLOR , 1: CLS
COLOR 1, 7
LOCATE 25, 1: PRINT SPACE$(80);
COLOR 0
LOCATE 25, 1: PRINT "Up/Down arrows="; : COLOR 1: PRINT "Up/Down Cursure  "; : COLOR 0: PRINT "Enter="; : COLOR 1: PRINT "Accept  "; : COLOR 0: PRINT "Esc="; : COLOR 1: PRINT "Cancel"; : COLOR 0: PRINT "    Alt+B="; : COLOR 1: PRINT "Back"; : COLOR  _
0: PRINT "   F1="; : COLOR 1: PRINT "Help";
COLOR 10, 1
'SHELL "clock"
 COLOR 10
 ctr 8, "Choose Directory Method..."
 COLOR 14
 ctr 9, "ษอออออออออออออออออออออออออออป"
ctr 10, "บ  Directory in Directory   บ"
ctr 11, "บ Directory after Directory บ"
ctr 12, "ศอออออออออออออออออออออออออออผ"
 COLOR 10, 1
ctr 10, "  Directory in Directory   "
ctr 11, " Directory after Directory "
COLOR 12
j2 = -10
lin = 1
COLOR 14, 4
ctr 10, "  Directory in Directory   "
DO
FOR I = 128 TO 152
j = 128 + 152 - I - 1
COLOR 12, 1
j2 = j2 + 1
IF j2 > 152 - 128 THEN j2 = 0
j3 = (152 - 128) - j2
'LOCATE 7, 38: PRINT CHR$(j + 26)
'LOCATE 7, 37: PRINT CHR$(j3 + 128 + 25)
COLOR 15, 2
IF j2 >= 0 THEN ctr 7, ">" + CHR$(j3 + 128 + 25) + CHR$(j + 26) + "<" ELSE ctr 7, "> " + CHR$(j + 26) + "<"
COLOR 12, 1
LOCATE 8, 31 - 5: PRINT CHR$(I)
SOUND 0, .8
SOUND 0, .5
I$ = INKEY$
IF I$ <> "" THEN
IF I$ = CHR$(0) + CHR$(48) THEN directorymethoder = -1: GOTO endsub
 COLOR 10, 1
IF I$ = CHR$(0) + CHR$(72) THEN lin = lin - 1
IF I$ = CHR$(0) + CHR$(80) THEN lin = lin + 1
IF lin < 1 THEN lin = 2
IF lin > 2 THEN lin = 1
ctr 10, "  Directory in Directory   "
ctr 11, " Directory after Directory "
COLOR 14, 4
IF lin = 1 THEN ctr 10, "  Directory in Directory   "
IF lin = 2 THEN ctr 11, " Directory after Directory "
IF I$ = CHR$(13) THEN EXIT DO
IF I$ = CHR$(27) THEN IF exitor = 1 THEN COLOR 7, 0: CLS : END
IF I$ = CHR$(0) + CHR$(59) THEN
IF D = 1 THEN help (8)
IF D = 2 THEN help (9)
 COLOR 10
 ctr 8, "Choose Directory Method..."
 COLOR 14, 1
 ctr 9, "ษอออออออออออออออออออออออออออป"
ctr 10, "บ  Directory in Directory   บ"
ctr 11, "บ Directory after Directory บ"
ctr 12, "ศอออออออออออออออออออออออออออผ"
 COLOR 10, 1
ctr 10, "  Directory in Directory   "
ctr 11, " Directory after Directory "
COLOR 14, 4
IF lin = 1 THEN ctr 10, "  Directory in Directory   "
IF lin = 2 THEN ctr 11, " Directory after Directory "
COLOR 0, 7
LOCATE 25, 1: PRINT SPACE$(80);
LOCATE 25, 1: PRINT "Up/Down arrows="; : COLOR 1: PRINT "Up/Down Cursure  "; : COLOR 0: PRINT "Enter="; : COLOR 1: PRINT "Accept  "; : COLOR 0: PRINT "Esc="; : COLOR 1: PRINT "Cancel"; : COLOR 0: PRINT "    Alt+B="; : COLOR 1: PRINT "Back"; : COLOR  _
0: PRINT "   F1="; : COLOR 1: PRINT "Help";
COLOR 10, 1
END IF
getkeys
END IF
NEXT
'IF i$ <> "" THEN EXIT DO
LOOP
directorymethoder = lin
COLOR 10, 1: CLS
endsub:
END FUNCTION

SUB drawer
COLOR 10, 1
ctr2 4, "Hello All!"
COLOR 11
ctr2 5, "This Program Makes or Deletes many Files or Directorys on your Hard disk"
ctr2 6, "if you Want test you HardDisk speed (or...!) in this NEW version you can"
COLOR 14
ctr2 7, "Select Methods : Delete or Make , Select : File or Directory , and then "
ctr2 8, "if 'Make File' Selected file size menu Comes or if you Select 'Make/Del "
ctr2 9, "Directory' Directory Methoder menu appears , after them you can choose  "
ctr2 10, "folder or files or directorys to work , also number of Files/Directorys"
ctr2 11, "Can be Select. a new better thing of this version is ON-LINE HELP with "
ctr2 12, "tool you CAN get Help every times you wanted it .*** And FINALY you can"
ctr2 13, "you can choose : Lock when started / Halt after Done / Beep After Copy "
ctr2 14, "/ End Work on Error / Turn off screen during the work ... befor strat  "
ctr2 15, "Maximume number of Files/Dir Can be 38,877,154,474,709,500,800,000,000!!"
LOCATE 15, 41
COLOR 15, 6: PRINT "38,877,154,474,709,500,800,000,000": COLOR , 1
COLOR 10: ctr2 16, "Maker needs : "
COLOR 11
ctr2 17, "File   : Clock.Com ; if this file not found program interface may be Wrong"
ctr2 18, "Ram    : 4Mb or uppper , biger ram = More objects                         "
ctr2 19, "Hard   : More hard space = More files to make                             "
ctr2 20, "Monitor: Not less than Vga                                                "
ctr2 21, "Not More!!!                                                               "
COLOR 10, 3
ctr2 22, "Maker is All ways FREE!!!"
COLOR 9, 1
LOCATE 23, 4: PRINT "Amin Safinezhad."
END SUB

FUNCTION exitor
LOCATE 1, 1
COLOR 1, 7: PRINT SPACE$(80)
LOCATE 1, 1: PRINT " Sure to Exit ?";
COLOR 1, 7
PRINT " Yes "; : COLOR , 7: PRINT "  ";
COLOR 1, 2: PRINT " No! "
j2 = -9
ls = -1
ko = 1
kop = 1
h = .4
kp = h
DO
FOR I = 128 TO 152
kop = kop + kp
ko = INT(kop)
IF ko >= 45 THEN kp = -h
IF ko <= 0 THEN kp = h
j = 128 + 152 - I - 1
a1$ = INKEY$
'IF a1$ <> "" THEN
IF a1$ = CHR$(0) + CHR$(75) OR a1$ = CHR$(0) + CHR$(77) OR a1$ = CHR$(9) THEN ls = -ls
 IF ls = 1 THEN LOCATE 1, 16: COLOR 1, 2: PRINT " Yes ": LOCATE 1, 23: COLOR 1, 7: PRINT " No! "
IF ls = -1 THEN LOCATE 1, 16: COLOR 1, 7: PRINT " Yes ": LOCATE 1, 23: COLOR 1, 2: PRINT " No! "
'IF a1$ <> "" THEN getkeys
'END IF
IF a1$ = CHR$(13) THEN GOTO helen
IF a1$ = CHR$(27) THEN ls = -1: GOTO helen
COLOR 12, 1
j2 = j2 + 1
IF j2 > 152 - 128 THEN j2 = 0
j3 = (152 - 128) - j2
'LOCATE 7, 38: PRINT CHR$(j + 26)
'LOCATE 7, 37: PRINT CHR$(j3 + 128 + 25)
SOUND 0, .8
LOCATE 1, 30 + ko
COLOR , 7: PRINT " ";
COLOR 15, 2
IF j2 >= 0 THEN PRINT ">" + CHR$(j3 + 128 + 25) + CHR$(j + 26) + "<";  ELSE PRINT "> " + CHR$(j + 26) + "<";
COLOR , 7: PRINT " "
'COLOR 12, 1
'LOCATE 2, 24: PRINT CHR$(i)
COLOR 4, 7
'LOCATE 2, 2, 0: PRINT SPACE$(78)
LOCATE 1, 1
PRINT CHR$(I);
NEXT
LOCATE , 30

LOOP
helen:
exitor = ls
LOCATE 1, 1
COLOR 10, 1: PRINT SPACE$(80)
IF ls = 1 THEN SCREEN 12: SCREEN 0
END FUNCTION

FUNCTION filesize
COLOR 10, 1: CLS
COLOR 1, 7
LOCATE 25, 1: PRINT SPACE$(80);
COLOR 0
LOCATE 25, 1: PRINT "Up/Down arrows="; : COLOR 1: PRINT "Up/Down Cursure  "; : COLOR 0: PRINT "Enter="; : COLOR 1: PRINT "Accept  "; : COLOR 0: PRINT "Esc="; : COLOR 1: PRINT "Cancel"; : COLOR 0: PRINT "    Alt+B="; : COLOR 1: PRINT "Back"; : COLOR  _
0: PRINT "   F1="; : COLOR 1: PRINT "Help";
COLOR 10, 1
'SHELL "clock"
 COLOR 10
 ctr 6, "Make file with size..."
 COLOR 14
 ctr 7, "ษออออออออออออออออป"
 ctr 8, "บ Zero Byte File บ"
 ctr 9, "บ     050 KB     บ"
ctr 10, "บ     100 KB     บ"
ctr 11, "บ     200 KB     บ"
ctr 12, "บ     500 KB     บ"
ctr 13, "บ     001 MB     บ"
ctr 14, "บ     1.5 MB     บ"
ctr 15, "บ     002 MB     บ"
ctr 16, "ศออออออออออออออออผ"
 COLOR 10, 1
 ctr 8, " Zero Byte File "
 ctr 9, "     050 KB     "
ctr 10, "     100 KB     "
ctr 11, "     200 KB     "
ctr 12, "     500 KB     "
ctr 13, "     001 MB     "
ctr 14, "     1.5 MB     "
ctr 15, "     002 MB     "
COLOR 12
j2 = -10
lin = 1
COLOR 14, 4
 ctr 8, " Zero Byte File "
DO
FOR I = 128 TO 152
j = 128 + 152 - I - 1
COLOR 12, 1
j2 = j2 + 1
IF j2 > 152 - 128 THEN j2 = 0
j3 = (152 - 128) - j2
'LOCATE 7, 38: PRINT CHR$(j + 26)
'LOCATE 7, 37: PRINT CHR$(j3 + 128 + 25)
COLOR 15, 2
IF j2 >= 0 THEN ctr 5, ">" + CHR$(j3 + 128 + 25) + CHR$(j + 26) + "<" ELSE ctr 5, "> " + CHR$(j + 26) + "<"
COLOR 12, 1
LOCATE 6, 28: PRINT CHR$(I)
SOUND 0, .8
SOUND 0, .5
I$ = INKEY$
IF I$ <> "" THEN
IF I$ = CHR$(0) + CHR$(48) THEN filesize = -1: GOTO endsub2
 COLOR 10, 1
IF I$ = CHR$(0) + CHR$(72) THEN lin = lin - 1
IF I$ = CHR$(0) + CHR$(80) THEN lin = lin + 1
IF lin < 1 THEN lin = 8
IF lin > 8 THEN lin = 1
 ctr 8, " Zero Byte File "
 ctr 9, "     050 KB     "
ctr 10, "     100 KB     "
ctr 11, "     200 KB     "
ctr 12, "     500 KB     "
ctr 13, "     001 MB     "
ctr 14, "     1.5 MB     "
ctr 15, "     002 MB     "
COLOR 14, 4
 IF lin = 1 THEN ctr 8, " Zero Byte File "
 IF lin = 2 THEN ctr 9, "     050 KB     "
IF lin = 3 THEN ctr 10, "     100 KB     "
IF lin = 4 THEN ctr 11, "     200 KB     "
IF lin = 5 THEN ctr 12, "     500 KB     "
IF lin = 6 THEN ctr 13, "     001 MB     "
IF lin = 7 THEN ctr 14, "     1.5 MB     "
IF lin = 8 THEN ctr 15, "     002 MB     "
IF I$ = CHR$(13) THEN EXIT DO
IF I$ = CHR$(27) THEN IF exitor = 1 THEN COLOR 7, 0: CLS : END
IF I$ = CHR$(0) + CHR$(59) THEN
 help (3)
 COLOR 10
 ctr 6, "Make file with size..."
 COLOR 14, 1
 ctr 7, "ษออออออออออออออออป"
 ctr 8, "บ Zero Byte File บ"
 ctr 9, "บ     050 KB     บ"
ctr 10, "บ     100 KB     บ"
ctr 11, "บ     200 KB     บ"
ctr 12, "บ     500 KB     บ"
ctr 13, "บ     001 MB     บ"
ctr 14, "บ     1.5 MB     บ"
ctr 15, "บ     002 MB     บ"
ctr 16, "ศออออออออออออออออผ"
 COLOR 10, 1
 ctr 8, " Zero Byte File "
 ctr 9, "     050 KB     "
ctr 10, "     100 KB     "
ctr 11, "     200 KB     "
ctr 12, "     500 KB     "
ctr 13, "     001 MB     "
ctr 14, "     1.5 MB     "
ctr 15, "     002 MB     "
COLOR 14, 4
 IF lin = 1 THEN ctr 8, " Zero Byte File "
 IF lin = 2 THEN ctr 9, "     050 KB     "
IF lin = 3 THEN ctr 10, "     100 KB     "
IF lin = 4 THEN ctr 11, "     200 KB     "
IF lin = 5 THEN ctr 12, "     500 KB     "
IF lin = 6 THEN ctr 13, "     001 MB     "
IF lin = 7 THEN ctr 14, "     1.5 MB     "
IF lin = 8 THEN ctr 15, "     002 MB     "
COLOR 0, 7
LOCATE 25, 1: PRINT SPACE$(80);
LOCATE 25, 1: PRINT "Up/Down arrows="; : COLOR 1: PRINT "Up/Down Cursure  "; : COLOR 0: PRINT "Enter="; : COLOR 1: PRINT "Accept  "; : COLOR 0: PRINT "Esc="; : COLOR 1: PRINT "Cancel"; : COLOR 0: PRINT "    Alt+B="; : COLOR 1: PRINT "Back"; : COLOR  _
0: PRINT "   F1="; : COLOR 1: PRINT "Help";
COLOR 10, 1
END IF
getkeys
END IF
NEXT
'IF i$ <> "" THEN EXIT DO
LOOP
IF lin = 1 THEN filesize = 0
IF lin = 2 THEN filesize = 50000
IF lin = 3 THEN filesize = 100000
IF lin = 4 THEN filesize = 200000
IF lin = 5 THEN filesize = 500000
IF lin = 6 THEN filesize = 1000000
IF lin = 7 THEN filesize = 1500000
IF lin = 8 THEN filesize = 2000000
endsub2:
END FUNCTION

FUNCTION fixval$ (s)
fixval$ = LTRIM$(RTRIM$(STR$(s)))
END FUNCTION

FUNCTION fv$ (x AS LONG)
fv$ = LTRIM$(RTRIM$(STR$(x)))
END FUNCTION

FUNCTION fv2$ (x)
h = x \ 3600
m = x \ 60
s = x MOD 60
h$ = fixval$(h)
m$ = fixval$(m)
s$ = fixval$(s)
IF LEN(h$) < 2 THEN h$ = "0" + h$
IF LEN(m$) < 2 THEN m$ = "0" + m$
IF LEN(s$) < 2 THEN s$ = "0" + s$
fv2$ = h$ + ":" + m$ + ":" + s$
END FUNCTION

SUB getkeys

'FOR a = 1 TO 3
'SOUND 0, .1
'NEXT
DO WHILE INKEY$ <> "": LOOP
END SUB

SUB help (x)
COLOR 0, 7
LOCATE 25, 1: PRINT SPACE$(80);
LOCATE 25, 1: PRINT "Any key="; : COLOR 1: PRINT "Exit Help";
COLOR 10, 1
ctr 5, "    "
 ctr 6, "ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออป  "
 ctr 7, "บ Maker Ver 2.1 Allrights reserved Copyright (C) 2002/3 วฤฟ"
 ctr 8, "บ  By Amin Safinezhad (ASP) - Read this help and use:   บ ณ"
 ctr 9, "วฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤถ ณ"
ctr 10, "บ                                                       บ ณ"
ctr 11, "บ                                                       บ ณ"
ctr 12, "บ                                                       บ ณ "
ctr 13, "บ                                                       บ ณ "
ctr 14, "บ                                                       บ ณ "
IF x > -1 THEN
ctr 15, "ศัออออออออออออออออออออออออออออออออออออออออออออออออออออออผ ณ"
ctr 16, " ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู"
ELSE
ctr 15, "บ                                                       บ ณ "
ctr 16, "บ                                                       บ ณ "
ctr 17, "บ                                                       บ ณ "
ctr 18, "ศัออออออออออออออออออออออออออออออออออออออออออออออออออออออผ ณ"
ctr 19, " ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู"

END IF
COLOR 15, 4
LOCATE 10, 11: PRINT SPACE$(55)
COLOR 9, 0
LOCATE 11, 11: PRINT SPACE$(55)
LOCATE 12, 11: PRINT SPACE$(55)
LOCATE 13, 11: PRINT SPACE$(55)
LOCATE 14, 11: PRINT SPACE$(55)
IF x = -1 THEN
LOCATE 15, 11: PRINT SPACE$(55)
LOCATE 16, 11: PRINT SPACE$(55)
LOCATE 17, 11: PRINT SPACE$(55)
END IF
COLOR 15, 4
IF x = 0 THEN
ctr 10, "Method Menu Help!"
COLOR 14, 0
LOCATE 11, 11
PRINT " This file makes or deletes many directories or files!": LOCATE , 11
PRINT " You can choose Methods  : 1: Make   Files/Directories": LOCATE , 11
PRINT "                           2: Delete Files/Directories": LOCATE , 11
COLOR 12: PRINT "              Use it but not for...!!!"
END IF
IF x > 0 AND x < 3 THEN
IF x = 1 THEN ctr 10, "Object Menu Help! (Make what)"
IF x = 2 THEN ctr 10, "Object Menu Help! (Delete what)"
COLOR 14, 0
LOCATE 11, 11
PRINT " If you select 'Directory' this program ";
IF x = 1 THEN PRINT "Makes" ELSE PRINT "Deletes"
LOCATE , 11
PRINT " many of files on disk ,else if 'file' selected ";
IF x = 1 THEN PRINT "Makes" ELSE PRINT "Deletes"
LOCATE , 11
PRINT " many of files on disk ";
IF x = 1 THEN PRINT "and then you can choose files'": LOCATE , 11: PRINT " space,";
PRINT "also you can choose folder of";
IF x = 2 THEN PRINT : LOCATE , 11
PRINT " files/directorys"

END IF

IF x = 3 THEN
ctr 10, "File Size Menu Help!"
COLOR 14, 0
LOCATE 11, 11
PRINT " You can select file size to make files on disk "; : COLOR 6: PRINT "( and ": LOCATE , 11
PRINT " next menu is folder menu to choose folder of files ) ": LOCATE , 11: COLOR 14
PRINT " if you select 'zero byte file' in this menu ; program": LOCATE , 11
PRINT " will makes empty files on disk."
END IF
IF x >= 4 AND x <= 7 THEN
ctr 10, "Folder Menu Help!"
COLOR 14, 0
LOCATE 11, 11
PRINT " In this menu you can enter folder of ";
IF x = 4 THEN PRINT "Files to Make.": LOCATE , 11
IF x = 5 THEN PRINT "Files to Delete.": LOCATE , 11
IF x = 6 THEN PRINT "Directories to ": LOCATE , 11: PRINT " Make.";
IF x = 7 THEN PRINT "Directories to ": LOCATE , 11: PRINT " Delete.";
PRINT "If you enter no directory Maker will ";
IF x MOD 2 = 0 THEN PRINT "makes";
IF x MOD 2 = 1 THEN PRINT "Deletes";
IF x < 6 THEN PRINT " Files ";
IF x = 4 THEN PRINT "to": LOCATE , 11: COLOR 14
IF x = 5 THEN PRINT "from": LOCATE , 11: COLOR 14
IF x > 5 THEN PRINT : LOCATE , 11: PRINT " Directories ";
IF x = 6 THEN PRINT "to";
IF x = 7 THEN PRINT "from";
PRINT " Root Directory.": LOCATE , 11
PRINT " will makes empty files on disk."
END IF
IF x = 8 OR x = 9 THEN
IF x = 8 THEN k$ = "Maker": kk$ = "Make": kkk$ = "(Last Made Directory)": k2$ = "Dir."
IF x = 9 THEN k$ = "Deletor": kk$ = "Delete": kkk$ = "": k2$ = "Directory"
c$ = "Directory " + k$ + " Methode Menu Help!"
ctr 10, c$
COLOR 14, 0
LOCATE 11, 11
PRINT " In this Menu you can select Directory "; k$; " Method": LOCATE , 11
PRINT " If you Select Directory in Directory , System will ": LOCATE , 11
PRINT " "; kk$; "s "; k2$; "s in Other Directory "; kkk$: LOCATE , 11
PRINT " Else ; Directorys will "; kk$; " Directorys Normaly"
END IF
IF x = 10 OR x = 11 THEN
IF x = 11 THEN c$ = "Directory"
IF x = 10 THEN c$ = "File"
ctr 10, "Choose Number of " + c$ + "s to Work!"
COLOR 14, 0
LOCATE 11, 11
PRINT " If you Select PlusPlusPlus ; System will detect a big": LOCATE , 11
PRINT " Number ๗ 212^11 = "; : COLOR 9: PRINT "38,877,154,474,709,500,800,000,000"; : COLOR 14: PRINT "!!": LOCATE , 11
PRINT " and then Works , Maximume Number you can select is : ": LOCATE , 11
PRINT " 2,147,483,600 and Minimume is 1"
END IF
IF x = -1 THEN
ctr 10, "Other Options Menu!"
COLOR 14, 0
LOCATE 11, 11
PRINT " In this Menu You can select these options :": LOCATE , 11
PRINT " Beep After Done  : Beeps after Work Ended": LOCATE , 11
PRINT " Lock When Strated: Lock Computer When work Started": LOCATE , 11
PRINT " then any body can't Exit Maker without Lock Password": LOCATE , 11
PRINT " Halt after Done  : Halt System after Work was done": LOCATE , 11
PRINT " End Work on Error: Exit Working if any File/Directory": LOCATE , 11
PRINT " Couldn't Make/Delete                                "
END IF


s$ = INPUT$(1)
COLOR , 1
CLS
END SUB

FUNCTION howmany$ (D)
DIM sizes$(53)
'DIM sizez(53)  AS LONG
sizen$ = ""
sizen$ = sizen$ + "1/5/10/20/50/100/150/200/250/300/370/400/470/520/580/680/800/900/1,000/1,500/2,000/2,700/3,000/3,700/4,500/"
sizen$ = sizen$ + "5,500/6,000/7,000/8,000/10,000/15,000/20,000/30,000/50,000/70,000/100,000/200,000/"
sizen$ = sizen$ + "400,000/600,000/1,000,000/2,000,000/5,000,000/8,000,000/10,000,000/50,000,000/80,000,000/100,000,000/500,000,000/"
sizen$ = sizen$ + "1,000,000,000/2,000,000,000/2,147,483,600/PlusPlusPlus!"
'071  , 079 :Home /End
'+16 numbers
'Max : 2,000,000,000#
x = 0
FOR g = 1 TO LEN(sizen$)
x = x + 1
o = INSTR(sizen$, "/")
IF o = 0 THEN o = LEN(sizen$) + 1
sizes$(x) = LEFT$(sizen$, o - 1)
sizen$ = MID$(sizen$, o + 1)
k$ = ""
'FOR io = 1 TO LEN(sizes$(x))
'IF MID$(sizes$(x), io, 1) <> "," THEN k$ = k$ + MID$(sizes$(x), io, 1)
'NEXT
'sizez(x) = VAL(k$)
'PRINT sizez(x); " Û ";

IF LEN(sizen$) < 1 THEN EXIT FOR
IF o = 0 THEN EXIT FOR
NEXT
'END
COLOR , 1: CLS
COLOR 1, 7
LOCATE 24, 1: PRINT SPACE$(80);
LOCATE 25, 1: PRINT SPACE$(80);
COLOR 0
LOCATE 24, 1: PRINT "Left/Rigth="; : COLOR 1: PRINT "Left/Rigth Cursure  "; : COLOR 0: PRINT "PgUp/Down="; : COLOR 1: PRINT "๑10 number Change  "; : COLOR 0: PRINT "Home/End="; : COLOR 1: PRINT "First/Last ": COLOR 0: PRINT "Enter="; : COLOR 1: _
                                                              PRINT "Accept"; : COLOR 0: PRINT "  Esc="; : COLOR 1: PRINT "Cancel  "; : COLOR 0: PRINT "F1="; : COLOR 1: PRINT "Help";
COLOR 10, 1
'SHELL "clock"
 COLOR 10
 ctr 10, "How Many..."
 COLOR 14, 1
ctr 15, sizes$(30)
COLOR 15, 1
LOCATE 11, 12
PRINT "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออป": LOCATE , 12
PRINT "บ>                                                    <วฤฟ": LOCATE , 12
PRINT "ศัอออออออออออออออออออออออออออออออออออออออออออออออออออออผ ณ": LOCATE , 12
PRINT " ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู": LOCATE , 12
LOCATE 12, 3: COLOR 6: ctr 12, STRING$(52, "ฒ")
COLOR 12
j2 = -10
l1 = 30
LOCATE 12, 14 + 29: COLOR 14: PRINT CHR$(8)
COLOR 14, 4
DO
FOR I = 128 TO 152
j = 128 + 152 - I - 1
COLOR 12, 1
j2 = j2 + 1
IF j2 > 152 - 128 THEN j2 = 0
j3 = (152 - 128) - j2
'LOCATE 7, 38: PRINT CHR$(j + 26)
'LOCATE 7, 37: PRINT CHR$(j3 + 128 + 25)
COLOR 15, 2
IF j2 >= 0 THEN ctr 9, ">" + CHR$(j3 + 128 + 25) + CHR$(j + 26) + "<" ELSE ctr 9, "> " + CHR$(j + 26) + "<"
COLOR 12, 1
LOCATE 10, 31 + 2: PRINT CHR$(I)
SOUND 0, .8
SOUND 0, .5
I$ = INKEY$
IF I$ <> "" THEN
IF I$ = CHR$(0) + CHR$(48) THEN how = -2: GOTO endsub1
 COLOR 10, 1
IF I$ = CHR$(0) + CHR$(71) THEN l1 = 1
IF I$ = CHR$(0) + CHR$(79) THEN l1 = 52
IF I$ = CHR$(0) + CHR$(73) THEN l1 = l1 + 10
IF I$ = CHR$(0) + CHR$(81) THEN l1 = l1 - 10

'073 , 081 :Pg Up/Down
IF I$ = CHR$(0) + CHR$(75) THEN l1 = l1 - 1: I$ = ""
IF I$ = CHR$(0) + CHR$(77) THEN l1 = l1 + 1: I$ = ""
LOCATE 12, 14: COLOR 6: PRINT STRING$(52, "ฒ")
IF l1 < 1 THEN l1 = 1
IF l1 > 52 THEN l1 = 52
ll = l1 - 1
IF ll < 1 THEN ll = 0
COLOR 14: LOCATE 12, 13 + l1: PRINT CHR$(8)
COLOR 14, 4
IF I$ = CHR$(13) THEN EXIT DO
IF I$ = CHR$(27) THEN IF exitor = 1 THEN COLOR 7, 0: CLS : END
IF I$ = CHR$(0) + CHR$(59) THEN
COLOR 10, 1
LOCATE 24, 1: PRINT SPACE$(80);
IF D = 1 THEN help (10)
IF D = 2 THEN help (11)
COLOR 1, 7
LOCATE 24, 1: PRINT SPACE$(80);
LOCATE 25, 1: PRINT SPACE$(80);
COLOR 0
LOCATE 24, 1: PRINT "Left/Rigth="; : COLOR 1: PRINT "Left/Rigth Cursure  "; : COLOR 0: PRINT "PgUp/Down="; : COLOR 1: PRINT "๑10 number Change  "; : COLOR 0: PRINT "Home/End="; : COLOR 1: PRINT "First/Last ": COLOR 0: PRINT "Enter="; : COLOR 1: _
                                                              PRINT "Accept"; : COLOR 0: PRINT "  Esc="; : COLOR 1: PRINT "Cancel  "; : COLOR 0: PRINT "F1="; : COLOR 1: PRINT "Help";
COLOR 15, 1
LOCATE 11, 12
PRINT "ษออออออออออออออออออออออออออออออออออออออออออออออออออออออป": LOCATE , 12
PRINT "บ>                                                    <วฤฟ": LOCATE , 12
PRINT "ศัอออออออออออออออออออออออออออออออออออออออออออออออออออออผ ณ": LOCATE , 12
PRINT " ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู": LOCATE , 12
LOCATE 12, 3: COLOR 6: ctr 12, STRING$(52, "ฒ")
COLOR 14: LOCATE 12, 13 + l1: PRINT CHR$(8)
 COLOR 10
 ctr 10, "How Many..."
END IF
COLOR 5, 1
LOCATE 12, 39
COLOR 14, 1
ctr 15, SPACE$(70)
ctr 15, sizes$(l1) '+ " : " + fixval$(l1)
getkeys
END IF
NEXT
'IF i$ <> "" THEN EXIT DO
LOOP
IF l1 < 52 THEN howmany$ = sizes$(l1) ELSE howmany$ = "38,877,154,474,709,500,800,000,000"
COLOR 10, 1: CLS
endsub1:
IF how = -2 THEN howmany$ = "xxx"
END FUNCTION

SUB logo
COLOR 10, 1: CLS
j2 = -9
 w$ = "                              Maker Ver.2.1 By Amin Safinezhad Copy right(C) 2002-2003 - ASP soft "
COLOR 10, 2
LOCATE 25, 1: PRINT SPACE$(80);
COLOR , 1
VIEW PRINT 1 TO 25
RANDOMIZE TIMER
DIM F AS LONG
xx = 20
F = INT(TIMER * xx)
xxx1 = 3'xxx1 + nx1
xxx2 = 10'xxx2 + nx2
yyy1 = 3'yyy1 + ny1
yyy2 = 10'yyy2 + ny2
x2 = 1
y2 = 1
hop = 0
DO
FOR I = 128 TO 152
w2$ = "                              Now Press any key to Countinue Program ...... Time : " + TIME$ + "..... "
IF F <> INT(TIMER * xx) AND hop = 0 THEN
F = INT(TIMER * xx)
textcadr xxx1, yyy1, xxx2, yyy2, 1, 1
nx1 = INT(RND * 2)
ny1 = INT(RND * 2)
nx2 = INT(RND * 3)
ny2 = INT(RND * 3)
xxx1 = xxx1 + (x2 * nx1)
xxx2 = xxx2 + nx2
yyy1 = yyy1 + (y2 * ny1)
yyy2 = yyy2 + ny2
IF yyy2 > 24 THEN yyy2 = 24: y2 = -1
IF xxx2 > 80 THEN xxx2 = 80: x2 = -3
IF yyy1 < 3 THEN yyy1 = 3
IF xxx1 < 1 THEN xxx1 = 1
'cc=INT(RND * 7) + 9
cc = 14
textcadr xxx1, yyy1, xxx2, yyy2, cc, 4
SOUND 0, 1
IF xxx1 = 1 AND xxx2 = 80 AND yyy1 = 3 AND yyy2 = 24 THEN hop = 1
ELSE
SOUND 0, 1
END IF
IF hop = 1 THEN hop = 2: drawer
j = 128 + 152 - I - 1
COLOR 12, 1
j2 = j2 + 1
IF j2 > 152 - 128 THEN j2 = 0
j3 = (152 - 128) - j2
'LOCATE 7, 38: PRINT CHR$(j + 26)
'LOCATE 7, 37: PRINT CHR$(j3 + 128 + 25)
'SOUND 0, .5
COLOR 15, 2
IF j2 >= 0 THEN ctr 1, ">" + CHR$(j3 + 128 + 25) + CHR$(j + 26) + "<" ELSE ctr 1, "> " + CHR$(j + 26) + "<"
'COLOR 12, 1
'LOCATE 2, 24: PRINT CHR$(i)
COLOR 10, 0
'LOCATE 2, 2, 0: PRINT SPACE$(78)
sf = sf + .5
IF sf < 1 THEN sf = 1
LOCATE 2, 24
COLOR 14
PRINT CHR$(I); : COLOR 10: PRINT MID$(w$, INT(sf), 30)
COLOR 10, 2
LOCATE 25, 25: PRINT MID$(w2$, INT(sf), 30);
COLOR 14, 0
LOCATE 2, 55: PRINT CHR$(128 + j3)
IF sf > LEN(w$) THEN sf = 0
IF INKEY$ <> "" THEN GOTO endergf
NEXT
LOCATE , 30
LOOP
endergf:
END SUB

FUNCTION nofile$
nofile$ = CHR$(0) + " " + CHR$(9) + CHR$(10) + "*+,/;<=>?[]|" + CHR$(34)
END FUNCTION

FUNCTION nofile2$
nofile2$ = CHR$(34) + "abcdefghijklmnopqrstuvwxyz& *+,./:;<=>?[\]| " + CHR$(34) + CHR$(0) + CHR$(9) + CHR$(10) + CHR$(13)
END FUNCTION

FUNCTION nofile3$
nofile3$ = nofile2$ + "*+,.:;<=>?[\]|…’•— กขฃฅชฎฟ"
END FUNCTION

FUNCTION tester (x$)
a = 0
IF INSTR(x$, "\.") OR INSTR(x$, ".\") <> 0 THEN a = 1
IF LEFT$(x$, 1) = "." THEN a = 1
IF INSTR(x$, "..") <> 0 THEN a = 1
IF INSTR(x$, "\:") <> 0 OR INSTR(x$, "\\") <> 0 THEN a = 1
IF INSTR(x$, ":") <> 0 THEN
IF MID$(x$, 2, 1) <> ":" THEN a = 1
IF INSTR(ualphabet$, UCASE$(LEFT$(x$, 1))) = 0 THEN a = 1
END IF
REtest:
xx = INSTR(x$, "\")
x2$ = MID$(x$, xx + 1)
'PRINT : PRINT : PRINT x2$: END
xxxx = INSTR(x2$, "\")
IF xxxx <> 0 THEN x5$ = MID$(x2$, xxxx + 1)
IF xxxx <> 0 THEN x2$ = LEFT$(x2$, xxxx - 1)
xxx = INSTR(x2$, ".")
IF xxx = 0 THEN IF LEN(x2$) > 8 THEN a = 1
IF xxx <> 0 THEN
x3$ = LEFT$(x2$, xxx - 1)
x4$ = MID$(x2$, xxx + 1)
IF LEN(x3$) > 8 OR LEN(x4$) > 3 THEN a = 1
END IF
IF xxxx <> 0 THEN x$ = x5$: GOTO REtest
tester = a
END FUNCTION

SUB textcadr (x1, y1, x2, y2, colr, cc)
COLOR colr, cc
LOCATE y1, x1: PRINT "ษ";
LOCATE y1, x2: PRINT "ป";
LOCATE y2, x1: PRINT "ศ";
LOCATE y2, x2: PRINT "ผ";
FOR g = x1 + 1 TO x2 - 1
LOCATE y1, g: PRINT "อ";
LOCATE y2, g: PRINT "อ";
NEXT
FOR g = y1 + 1 TO y2 - 1
LOCATE g, x1: PRINT "บ ";
LOCATE g, x2 - 1: PRINT " บ";
NEXT

COLOR , 0
END SUB

FUNCTION ualphabet$
ualphabet$ = "ACDEFGHIJKLMNOPQRSTUVWXYZ"
END FUNCTION

SUB writer (x$, c, cc, D)
IF cc = 1 THEN LOCATE , (80 - LEN(x$)) / 2
FOR g = 1 TO LEN(x$)
w$ = MID$(x$, g, 1)
IF D = 1 THEN
COLOR 6
IF ASC(w$) >= 65 AND ASC(w$) <= 90 THEN COLOR 10
IF ASC(w$) >= 97 AND ASC(w$) <= 122 THEN COLOR 11
IF INSTR("0123456789", w$) <> 0 THEN COLOR 15
IF INSTR("ฐฑฒ", w$) <> 0 THEN COLOR 13
IF INSTR("()", w$) <> 0 THEN COLOR 12
IF INSTR("!?", w$) <> 0 THEN COLOR 14
IF INSTR("|\@$&", w$) <> 0 THEN COLOR 2
IF INSTR(".ซฌ<>๔๕๖๛üý๑๒๓+-=#/ฎฏ", w$) <> 0 THEN COLOR 0
IF ASC(w$) >= 224 AND ASC(w$) <= 240 THEN COLOR 0
IF INSTR("{}[]_|\',~`:", w$) <> 0 THEN COLOR 3
IF ASC(w$) >= 128 AND ASC(w$) <= 165 THEN COLOR 1
IF ASC(w$) >= 179 AND ASC(w$) <= 218 OR INSTR("ฉช", w$) <> 0 THEN COLOR 5
IF ASC(w$) >= 179 AND ASC(w$) <= 218 THEN COLOR 5
IF w$ = "๘" OR w$ = "๚" THEN COLOR 14 + 16

IF ASC(w$) = 254 THEN COLOR 14 + 16
IF w$ = CHR$(3) THEN COLOR 12 + 16
IF w$ = CHR$(1) OR w$ = CHR$(2) THEN COLOR 10 + 16
END IF
PRINT w$;
IF c = 1 THEN SOUND 100, cc
NEXT
IF x = 1 THEN PLAY "MF g60"
END SUB

