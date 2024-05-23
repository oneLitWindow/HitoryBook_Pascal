DECLARE SUB ssaver ()
DECLARE FUNCTION str2$ (x!)
DECLARE SUB drawtimer ()
'=============================================================================
'Main Program:
CONST FALSE = 123, TRUE = 321
SCREENSAVER = FALSE
SCREEN 0: SCREEN 12: SLEEP 1: COLOR 14: VIEW PRINT 1 TO 30
tk$ = "ASP"
cc = 12
drawtimer
GOSUB Initializer
'PLT:
xxg = 3
PALETTE 8, 0'xxg + 256 * xxg + 256 ^ 2 * xxg
PALETTE 14, 63 + 256 * 63
PALETTE 10, 256 * 63
PALETTE 9, 256 ^ 2 * 63
PALETTE 13, 63 + 256 ^ 2 * 63
PALETTE 12, 63
GOSUB Logo
asp1 = 1
'asp2 = asp2 + asp1
'IF asp2 >= 63 THEN asp1 = -1
'IF asp2 <= 0 THEN asp1 = 1
'PALETTE 0, 256 ^ 2 * asp2
'PALETTE 8, 256 ^ 2 * asp2
DO
rtime$ = TIME$
IF tk$ = "1" THEN
IF INT(TIMER * 2) MOD 2 = 0 THEN
LINE (450, 55)-(460, 65), 8, B: PAINT (451, 56), 14, 8
LINE (450, 35)-(460, 45), 8, B: PAINT (451, 36), 14, 8
END IF
IF INT(TIMER * 2) MOD 2 = 1 THEN
LINE (450, 55)-(460, 65), 8, B: PAINT (451, 56), 9, 8
LINE (450, 35)-(460, 45), 8, B: PAINT (451, 36), 9, 8
END IF
END IF
IF MID$(TIME$, 4, 2) = "59" AND RIGHT$(rtime$, 2) = "59" THEN
LINE (320, 35)-(330, 45), 8, B: PAINT (321, 36), 9, 8
LINE (320, 55)-(330, 65), 8, B: PAINT (321, 56), 9, 8
END IF
'00:00:00
IF MID$(TIME$, 4, 2) = "00" AND RIGHT$(rtime$, 2) = "00" THEN
LINE (320, 35)-(330, 45), 8, B: PAINT (321, 36), 11, 8
LINE (320, 55)-(330, 65), 8, B: PAINT (321, 56), 11, 8
END IF
IF timeo$ <> rtime$ THEN
IF MID$(rtime$, 4, 2) = "00" AND RIGHT$(rtime$, 2) = "00" THEN
'FOR RTX = 1 TO 20
'PLAY "MB >>>C60>>D60<<E60<<< MB"
'NEXT
GOTO OBIS
END IF
IF RIGHT$(rtime$, 2) = "00" THEN
'FOR RTX = 1 TO 10
'PLAY "MB <<A60<B60>G60>> MB"
'NEXT
END IF
OBIS:
IF SCREENSAVER = TRUE THEN
IF RIGHT$(rtime$, 2) = "00" AND tk$ = "1" THEN ssaver: drawtimer
END IF
obrtime = (TIMER)
ttime$ = rtime$
GOSUB CheckTime

oartime = (TIMER)
otrtime = oartime - obrtime
LOCATE 27, 1
IF INT(TIMER / 10) MOD 2 = 0 THEN COLOR 9 ELSE COLOR 14
PRINT "Last Call time :"; otrtime; "             "
END IF
timeo$ = rtime$
LOCATE 28, 1
IF INT(TIMER / 10) MOD 2 = 0 THEN COLOR 13 ELSE COLOR 10
PRINT "Time           : "; rtime$; "                      "
IF INT(TIMER / 10) MOD 2 = 0 THEN COLOR 9 ELSE COLOR 14
PRINT "Program By Amin Safinezhad  "
k$ = INKEY$
'COLOR (INT(TIMER * 5) MOD 7) + 9
'LOCATE 14, 12: PRINT "Please Don't Use this computer! I'll Come back soon."
IF INT(TIMER / 10) MOD 2 = 0 THEN COLOR 2 ELSE COLOR 12
IF al$ <> "" THEN LOCATE 1, 2: PRINT " Alarm at : "; al$; "     "
IF al$ = "" THEN LOCATE 1, 2: PRINT " Alarm is off          "
IF cc <> 12 AND cc <> 13 THEN
IF INT(TIMER / 10) MOD 2 = 0 THEN COLOR 14 ELSE COLOR 9
LOCATE 1, 1: PRINT "X"
LOCATE 2, 1: PRINT "F1 = Set           "
IF INT(TIMER / 10) MOD 2 = 0 THEN COLOR 12 ELSE COLOR 2
PRINT "F2 = Exit program"
ELSE
COLOR 10
LOCATE 1, 1: PRINT "û"
LOCATE 3, 1
PRINT "                 "
LOCATE 2, 1
COLOR 13: PRINT "F3 = Stop              "
our = 1
END IF
IF cc <> 12 AND cc <> 13 THEN IF k$ = CHR$(0) + CHR$(59) THEN CLS : drawtimer: GOSUB setalarm: k$ = "": cc = 10
IF al$ = rtime$ THEN yry = TIMER
IF TIMER - yry < 60 THEN
IF INT(TIMER) MOD 2 = 0 THEN cc = 13 ELSE cc = 12
IF INT(TIMER * 2) MOD 2 = 0 AND f = 1 THEN PLAY "MB >>g60c60<< MB": f = 0
IF INT(TIMER * 2) MOD 4 <> 0 THEN f = 1
END IF
IF TIMER - yry > 60 THEN
yry = 0
IF VAL(MID$(rtime$, 4, 2)) MOD 2 = 0 THEN cc = 9 ELSE cc = 10
'cc = 10
our = 0
END IF
IF our = 1 AND k$ = CHR$(0) + CHR$(61) THEN yry = yry - 60
IF our = 1 AND k$ = CHR$(0) + CHR$(60) THEN k$ = ""
LOOP WHILE k$ <> CHR$(0) + CHR$(60)
SCREEN 0
CLS : COLOR 11: PRINT "By Amin Safinezhad": SLEEP 2: END
'=============================================================================
Logo:
'Logo of Program:
mtkb:
texts$ = "HELLO"
GOSUB hello
LOCATE 26, 1: PRINT "Digital Clock Ver. 2.1 - Feb./2002 By Amin Safinezhad"
COLOR 10: PRINT "All rights Reserved - Copyright (C) By ASP soft"
IF al$ = "" THEN
COLOR 15
'                              00:00:00
LOCATE 1, 1: PRINT "Alarm is now Off   ": COLOR 13: PRINT "Press F1 to Set  "
ELSE
COLOR 15
LOCATE 1, 1: PRINT "Alarm at : "; al$: COLOR 13: PRINT "Press F1 to ReSet"
END IF
aol$ = al$
kklp = TIMER
LOCATE 28, 1: PRINT SPACE$(80)
DO
LOCATE 28, 1
tTIMER = TIMER
IF INT(tTIMER * 5) MOD 2 = 0 THEN COLOR 11: PRINT "Hit any key to Start..."
LOCATE 28, 1
IF INT(tTIMER * 5) MOD 2 = 1 THEN COLOR 4: PRINT "Hit any key to Start..."
IF ABS(INT(TIMER - kklp)) >= 60 * 1 THEN EXIT DO
'LOCATE 10, 1: PRINT ABS(INT(TIMER - kklp))
k$ = INKEY$
LOOP WHILE k$ = ""
IF k$ = CHR$(0) + CHR$(59) THEN GOSUB setalarm: GOTO mtkb
LOCATE 26, 1: FOR s = 1 TO 3: PRINT SPACE$(79): NEXT
RETURN
'=============================================================================
Initializer:
'Initializes ARRAYS and lunching xi & yi :
ON ERROR GOTO Hob
DIM w$(6), o, xi, yi(6, 7)
FOR i = 1 TO 6
FOR j = 1 TO 7
o(i, j) = 0: READ xi(i, j), yi(i, j)
NEXT
NEXT
RETURN
'=============================================================================
'IMPORTANT!!! this sub checks time , Calculates and Displays it.
CheckTime:
ON ERROR GOTO Hob
w$(1) = LEFT$(ttime$, 1)
w$(2) = MID$(ttime$, 2, 1)
w$(3) = MID$(ttime$, 4, 1)
w$(4) = MID$(ttime$, 5, 1)
w$(5) = MID$(ttime$, 7, 1)
w$(6) = RIGHT$(ttime$, 1)
IF tk$ = "" THEN
tk$ = "1"
PAINT (321, 36), 14, 8
PAINT (321, 56), 14, 8
PAINT (451, 56), 14, 8
PAINT (451, 36), 14, 8
END IF
IF tk$ = "ASP" THEN
LINE (320, 35)-(330, 45), 8, B: PAINT (321, 36), 0, 8
LINE (320, 55)-(330, 65), 8, B: PAINT (321, 56), 0, 8
LINE (450, 55)-(460, 65), 8, B: PAINT (451, 56), 0, 8
LINE (450, 35)-(460, 45), 8, B: PAINT (451, 36), 0, 8
rtr = rtr + 1
IF rtr = 2 THEN cc = 14
IF rtr = 3 THEN tk$ = "": cc = 10
o(1, 1) = 1: o(1, 2) = 1: o(1, 4) = 1: o(1, 5) = 1: o(1, 6) = 1: o(1, 7) = 1
o(3, 1) = 1: o(3, 2) = 1: o(3, 3) = 1: o(3, 4) = 1: o(3, 7) = 1
o(5, 1) = 1: o(5, 2) = 1: o(5, 4) = 1: o(5, 5) = 1: o(5, 6) = 1
GOTO 1010               ' __
END IF                  '|__|
FOR i = 1 TO 7          '|
ww$ = w$(i)
IF ww$ = "1" THEN o(i, 5) = 1: o(i, 7) = 1
IF ww$ = "2" THEN o(i, 1) = 1: o(i, 2) = 1: o(i, 3) = 1: o(i, 5) = 1: o(i, 6) = 1
IF ww$ = "3" THEN o(i, 1) = 1: o(i, 2) = 1: o(i, 3) = 1: o(i, 5) = 1: o(i, 7) = 1
IF ww$ = "4" THEN o(i, 2) = 1: o(i, 4) = 1: o(i, 5) = 1: o(i, 7) = 1
IF ww$ = "5" THEN o(i, 1) = 1: o(i, 2) = 1: o(i, 3) = 1: o(i, 4) = 1: o(i, 7) = 1
IF ww$ = "6" THEN o(i, 1) = 1: o(i, 2) = 1: o(i, 3) = 1: o(i, 4) = 1: o(i, 6) = 1: o(i, 7) = 1
IF ww$ = "7" THEN o(i, 1) = 1: o(i, 5) = 1: o(i, 7) = 1: o(i, 4) = 1
IF ww$ = "8" THEN FOR xxi = 1 TO 7: o(i, xxi) = 1: NEXT
IF ww$ = "9" THEN o(i, 1) = 1: o(i, 2) = 1: o(i, 3) = 1: o(i, 4) = 1: o(i, 5) = 1: o(i, 7) = 1
IF ww$ = "0" THEN o(i, 1) = 1: FOR xxi = 3 TO 7: o(i, xxi) = 1: NEXT
NEXT
1010
FOR i = 1 TO 6
FOR j = 1 TO 7
IF o(i, j) = -1 THEN PAINT (xi(i, j), yi(i, j)), 0, 8: o(i, j) = 0
IF o(i, j) = 1 THEN PAINT (xi(i, j), yi(i, j)), cc, 8: o(i, j) = -1
NEXT: NEXT
RETURN
'=============================================================================
'Datas! for xi & yi :
Datas:
DATA 230,15,230,50,230,85,215,30,245,30,215,70,245,70
DATA 290,15,290,50,290,85,275,30,305,30,275,70,305,70
DATA 360,15,360,50,360,85,345,30,375,30,345,70,375,70
DATA 420,15,420,50,420,85,405,30,435,30,405,70,435,70
DATA 490,15,490,50,490,85,475,30,505,30,475,70,505,70
DATA 550,15,550,50,550,85,535,30,565,30,535,70,565,70
'Return?!
'=============================================================================
Hob:
'This Sub is for Ignore Errors:
RESUME NEXT
'=============================================================================
'=============================================================================
'The end.
hello:
LINE (327, 10)-(337, 20), 0, BF
LINE (329, 10)-(339, 20), 0, BF
PSET (340, 10), 0
IF texts$ = "HELLO" THEN
o(1, 2) = 1: o(1, 4) = 1: o(1, 5) = 1: o(1, 6) = 1: o(1, 7) = 1
o(2, 1) = 1: o(2, 2) = 1: o(2, 3) = 1: o(2, 4) = 1: o(2, 6) = 1
o(3, 4) = 1: o(3, 3) = 1: o(3, 6) = 1
o(4, 4) = 1: o(4, 3) = 1: o(4, 6) = 1
o(5, 1) = 1: o(5, 6) = 1: o(5, 3) = 1: o(5, 4) = 1: o(5, 5) = 1: o(5, 7) = 1
cf = 9
END IF
IF texts$ = "ALARM" THEN
o(1, 1) = 1: o(1, 2) = 1: o(1, 4) = 1: o(1, 5) = 1: o(1, 6) = 1: o(1, 7) = 1
o(2, 4) = 1: o(2, 3) = 1: o(2, 6) = 1
o(3, 1) = 1: o(3, 2) = 1: o(3, 4) = 1: o(3, 5) = 1: o(3, 6) = 1: o(3, 7) = 1
'o(4, 1) = 1: o(4, 2) = 1: o(4, 3) = 1: o(4, 4) = 1: o(4, 6) = 1
'o(5, 1) = 1: o(5, 6) = 1: o(5, 3) = 1: o(5, 4) = 1: o(5, 5) = 1: o(5, 7) = 1
cf = 11
LINE (329, 10)-(339, 20), 11, BF
PSET (340, 10), 11
PSET (329, 10), 8
PSET (329, 20), 8
PSET (339, 20), 8
END IF
FOR i = 1 TO 6
FOR j = 1 TO 7
IF o(i, j) = -1 THEN PAINT (xi(i, j), yi(i, j)), 0, 8: o(i, j) = 0
IF o(i, j) = 1 THEN PAINT (xi(i, j), yi(i, j)), cf, 8: o(i, j) = -1
NEXT: NEXT
LINE (320, 35)-(330, 45), 8, B: PAINT (321, 36), 0, 8
LINE (320, 55)-(330, 65), 8, B: PAINT (321, 56), 0, 8
LINE (450, 55)-(460, 65), 8, B: PAINT (451, 56), 0, 8
LINE (450, 35)-(460, 45), 8, B: PAINT (451, 36), 0, 8
RETURN
setalarm:
LOCATE 26, 1
FOR g = 1 TO 3
PRINT SPACE$(80)
NEXT
texts$ = "ALARM"
GOSUB hello
LOCATE 1, 1
PRINT SPACE$(20)
PRINT SPACE$(20)
LOCATE 1, 1: COLOR 14
PRINT "ALR (Alarm) :"
SLEEP 1
ttime$ = al$
cc = 12
IF al$ = "" THEN al$ = TIME$: ttime$ = al$
GOSUB showc
lin = 1
col = 1
COLOR 15:
LOCATE 28, 1: PRINT "Use +/- and Arrows, Space to Turn off"
hh = VAL(LEFT$(al$, 2))
mm = VAL(MID$(al$, 4, 2))
ss = VAL(RIGHT$(al$, 2))
ttime$ = al$
kklo = TIMER
DO
IF k$ <> "" THEN
COLOR 14
LOCATE 1, 1
PRINT "  OK!        "
LOCATE 2, 1
PRINT "  Cancel     "
LINE (205, 5)-(315, 95), 0, B
LINE (335, 5)-(445, 95), 0, B
LINE (465, 5)-(575, 95), 0, B
END IF
IF col = 1 THEN LINE (205, 5)-(315, 95), 11, B
IF col = 2 THEN LINE (335, 5)-(445, 95), 11, B
IF col = 3 THEN LINE (465, 5)-(575, 95), 11, B
k$ = INKEY$
IF k$ = CHR$(0) + CHR$(72) THEN lin = lin - 1
IF k$ = CHR$(0) + CHR$(80) THEN lin = lin + 1
IF k$ = CHR$(0) + "K" THEN col = col - 1
IF k$ = CHR$(0) + "M" THEN col = col + 1
IF lin <= 0 THEN lin = 2
IF lin >= 3 THEN lin = 1
IF col <= 0 THEN col = 3
IF col >= 4 THEN col = 1
COLOR 11
LOCATE lin, 1: PRINT "> ";
COLOR 10
IF lin = 1 THEN PRINT "OK!"
IF lin = 2 THEN PRINT "Cancel"
IF k$ = "+" THEN
IF col = 1 THEN
hh = hh + 1
IF o = 1 THEN oh = 0: hh = 1
IF hh = 24 THEN hh = 0: oh = 1
END IF
IF col = 2 THEN
mm = mm + 1
IF mm > 59 THEN mm = 0
END IF
IF col = 3 THEN
ss = ss + 1
IF ss > 59 THEN ss = 0
END IF
END IF
IF k$ = "-" THEN
IF col = 1 THEN
hh = hh - 1
IF hh = -1 THEN hh = 23
END IF
IF col = 2 THEN
mm = mm - 1
IF mm < 0 THEN mm = 59
END IF
IF col = 3 THEN
ss = ss - 1
IF ss < 0 THEN ss = 59
END IF
END IF
hh$ = str2$(hh)
mm$ = str2$(mm)
ss$ = str2$(ss)
IF LEN(hh$) = 1 THEN hh$ = "0" + hh$
IF LEN(mm$) = 1 THEN mm$ = "0" + mm$
IF LEN(ss$) = 1 THEN ss$ = "0" + ss$
ttime$ = hh$ + ":" + mm$ + ":" + ss$
IF k$ <> "" THEN GOSUB showc
IF ABS(INT(TIMER - kklo)) >= 60 * 2 THEN al$ = aol$: EXIT DO
IF k$ = CHR$(27) THEN al$ = aol$: EXIT DO
IF k$ = CHR$(13) AND lin = 2 THEN al$ = aol$: EXIT DO
IF k$ = CHR$(13) AND lin = 1 THEN al$ = ttime$: EXIT DO
IF k$ <> "" THEN kklo = TIMER
IF k$ = " " THEN al$ = "": EXIT DO
LOOP
'F$ = INPUT$(1)
LINE (205, 5)-(315, 95), 0, B
LINE (335, 5)-(445, 95), 0, B
LINE (465, 5)-(575, 95), 0, B
RETURN
showc:
LINE (329, 10)-(339, 20), 0, BF
PSET (340, 10), 0
FOR i = 1 TO 7          '|
ON ERROR GOTO Hob
LINE (320, 35)-(330, 45), 8, B: PAINT (321, 36), 14, 8
LINE (320, 55)-(330, 65), 8, B: PAINT (321, 56), 14, 8
LINE (450, 55)-(460, 65), 8, B: PAINT (451, 56), 14, 8
LINE (450, 35)-(460, 45), 8, B: PAINT (451, 36), 14, 8
cf = 12
w$(1) = LEFT$(ttime$, 1)
w$(2) = MID$(ttime$, 2, 1)
w$(3) = MID$(ttime$, 4, 1)
w$(4) = MID$(ttime$, 5, 1)
w$(5) = MID$(ttime$, 7, 1)
w$(6) = RIGHT$(ttime$, 1)
ww$ = w$(i)
IF ww$ = "1" THEN o(i, 5) = 1: o(i, 7) = 1
IF ww$ = "2" THEN o(i, 1) = 1: o(i, 2) = 1: o(i, 3) = 1: o(i, 5) = 1: o(i, 6) = 1
IF ww$ = "3" THEN o(i, 1) = 1: o(i, 2) = 1: o(i, 3) = 1: o(i, 5) = 1: o(i, 7) = 1
IF ww$ = "4" THEN o(i, 2) = 1: o(i, 4) = 1: o(i, 5) = 1: o(i, 7) = 1
IF ww$ = "5" THEN o(i, 1) = 1: o(i, 2) = 1: o(i, 3) = 1: o(i, 4) = 1: o(i, 7) = 1
IF ww$ = "6" THEN o(i, 1) = 1: o(i, 2) = 1: o(i, 3) = 1: o(i, 4) = 1: o(i, 6) = 1: o(i, 7) = 1
IF ww$ = "7" THEN o(i, 1) = 1: o(i, 5) = 1: o(i, 7) = 1: o(i, 4) = 1
IF ww$ = "8" THEN FOR xxi = 1 TO 7: o(i, xxi) = 1: NEXT
IF ww$ = "9" THEN o(i, 1) = 1: o(i, 2) = 1: o(i, 3) = 1: o(i, 4) = 1: o(i, 5) = 1: o(i, 7) = 1
IF ww$ = "0" THEN o(i, 1) = 1: FOR xxi = 3 TO 7: o(i, xxi) = 1: NEXT
NEXT
FOR i = 1 TO 6
FOR j = 1 TO 7
IF o(i, j) = -1 THEN PAINT (xi(i, j), yi(i, j)), 0, 8: o(i, j) = 0
IF o(i, j) = 1 THEN PAINT (xi(i, j), yi(i, j)), cc, 8: o(i, j) = -1
NEXT: NEXT
RETURN

SUB drawtimer
'=============================================================================
'Draws Clock's lines :
DRAW "c0m210,10c8r40d80l40u80f10r20e10g10d25m250,50m240,55d25f10h10l20g10e10u25r20l20m210,50m220,45r20l20u25h10l1c0d90m320,240"
DIM obj8(5000)
GET (210, 10)-(250, 90), obj8
PUT (270, 10), obj8, OR
PUT (340, 10), obj8, OR
PUT (400, 10), obj8, OR
PUT (470, 10), obj8, OR
PUT (530, 10), obj8, OR
LINE (320, 35)-(330, 45), 8, B: PAINT (321, 36), 14, 8
LINE (320, 55)-(330, 65), 8, B: PAINT (321, 56), 14, 8
LINE (450, 55)-(460, 65), 8, B: PAINT (451, 56), 14, 8
LINE (450, 35)-(460, 45), 8, B: PAINT (451, 36), 14, 8
'=============================================================================
PALETTE 0, 0
END SUB

SUB ssaver
LOCATE 27, 1: FOR x = 1 TO 3: PRINT SPACE$(80): NEXT
DIM obj88(10000)
GET (210, 10)-(570, 90), obj88
FOR aa = 0 TO 63
a = 63 - aa
SOUND 0, .5
PALETTE 10, 256 * a
NEXT
CLS
PALETTE 8, 10 + 256 * 10 + 256 ^ 2 * 10
FOR c = 1 TO 8
FOR t = 0 TO 320

IF c MOD 2 = 0 THEN LINE (640 - t, 0)-(640 - t, 480), c: LINE (t, 0)-(t, 480), c
IF c MOD 2 = 1 THEN LINE (640 - t - 320, 0)-(640 - t - 320, 480), c: LINE (320 + t, 0)-(320 + t, 480), c
SOUND 0, .05
LOCATE 1, 1: COLOR c: PRINT "Time :"; TIME$
NEXT
SOUND 0, .05
NEXT
CLS
PALETTE 8, 0
PALETTE 0, 0
PALETTE 10, 0
PUT (210, 10), obj88, OR
FOR a = 0 TO 63
SOUND 0, .5
PALETTE 10, 256 * a
NEXT
DO WHILE INKEY$ <> ""
LOOP
CLS : drawtimer
END SUB

FUNCTION str2$ (x)
str2$ = LTRIM$(RTRIM$(STR$(x)))
END FUNCTION

