10  ' Automatic Proofreader version 3.0 (Lines 205,206 added/190 deleted/470,490 changed from V2.0)'
100 DIM L$(500), LNUM(500): COLOR 0, 7, 7: KEY OFF: CLS : MAX = 0: LNUM(0) = 65536!
110 ON ERROR GOTO 120: KEY 15, CHR$(4) + CHR$(70): ON KEY(15) GOSUB 640: KEY(15) ON: GOTO 130
120 RESUME 130
130 DEF SEG = &H40: W = PEEK(&H4A)
140 ON ERROR GOTO 650: PRINT : PRINT "Proofreader Ready."
150 LINE INPUT L$: Y = CSRLIN - INT(LEN(L$) / W) - 1: LOCATE Y, 1
160 DEF SEG = 0: POKE 1050, 30: POKE 1052, 34: POKE 1054, 0: POKE 1055, 79: POKE 1056, 13: POKE 1057, 28: LINE INPUT L$: DEF SEG : IF L$ = "" THEN 150
170 IF LEFT$(L$, 1) = " " THEN L$ = MID$(L$, 2): GOTO 170
180 IF VAL(LEFT$(L$, 1)) = 0 AND MID$(L$, 2, 1) = " " THEN L$ = MID$(L$, 3): GOTO 180
190 IF LEFT$(L$, 1) = "'" THEN L$ = "REM" + MID$(L$, 2): GOTO 190
205 BL=INSTR(L$,"'"):IF BL=0 THEN BL$=L$:GOTO 206 ELSE BL$=LEFT$(L$,BL-1)
206 LNUM=VAL(BL$):TEXT$=MID$(L$,BL+1):IF LNUM=0 THEN 150
210 IF TEXT$="" THEN GOSUB 540:IF LNUM=LNUM(P) THEN GOSUB 560:GOTO 150 ELSE 150
220 CKSUM=0:FOR I=1 TO LEN(TEXT$):CKSUM=CKSUM+ASC(MID$(TEXT$,I,1)):NEXT:IF CKSUM<>LNUM THEN GOSUB 560:GOTO 150
230 GOSUB 540:IF LNUM(LNUM)=0 THEN GOSUB 560:GOTO 150
240 GOSUB 580:GOTO 150 'inset the line'
260 TEXT$ = "":FOR I=1 TO LEN(L$):A=ASC(MID$(L$,I)):TEXT$=TEXT$+CHR$(A+32*(A>96)*(A<123)):NEXT
270 DELIMETER = INSTR(TEXT$, ":"): IF DELIMETER = 0 THEN GOSUB 560: GOTO 150
280 IF COMMAND$ = "RUN" THEN GOSUB 540: GOTO 150
290 OPEN "scrn:" FOR OUTPUT AS #1
300 IF ARG$="" THEN FIRST=0:P=MAX-1:GOTO 340
310 DELIMETER=INSTR(ARG$,":"):IF DELIMETER=0 THEN GOSUB 560:GOTO 150
320 FIRST=VAL(LEFT$(ARG$,DELIMETER-1)):P=VAL(MID$(ARG$,DELIMETER+1))
640 CLOSE #1: CKFLAG = 0: PRINT "Stopped.": RETURN 150
650 PRINT "Error #"; ERR: RESUME 150

