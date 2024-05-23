DECLARE FUNCTION pass1$ ()
pass$ = UCASE$("aa" + CHR$(255) + "-" + CHR$(159) + CHR$(229) + "aa")

FUNCTION pass1$
a$ = ""
a$ = a$ + "t"
a$ = a$ + "ano"
a$ = "en" + a$ + "na"
a$ = "sc" + a$
a$ = "e" + a$ + "mou"
a$ = a$ + "s"
a$ = "d" + a$
pass1$ = a$
END FUNCTION

