0 PRINT CHR$(147)
1 LNGTH = 5

2 POKE 53280,11
3 POKE 53281,0
4 POKE 646, 14

5 REM PRINT "////////////////////////////"
6 REM PRINT "       RICH DESKTOP         "
7 REM PRINT "////////////////////////////" 

8 DELIMITER$=">  "

9 PROGRAM$(0,0)="FILE BROWSER"
10 PROGRAM$(1,0)="TERMINAL"
11 PROGRAM$(2,0)="PAINT"
12 PROGRAM$(3,0)="WORD"
13 PROGRAM$(4,0)="CMD"
14 PROGRAM$(5,0)="BASIC"

15 PROGRAM$(0,1) = "8,1"
16 PROGRAM$(1,1) = "8"
17 PROGRAM$(2,1) = "8,1"
18 PROGRAM$(3,1) = ":*,8"
19 PROGRAM$(4,1) = ""
20 PROGRAM$(5,1) = ""

21 REM X COORD
22 CD(0,0) = 3
23 CD(1,0) = 13
24 CD(2,0) = 23
25 CD(3,0) = 3
26 CD(4,0) = 13
27 CD(5,0) = 23

28 REM Y COORD
29 CD(0,1) = 20
30 CD(1,1) = 20
31 CD(2,1) = 20
32 CD(3,1) = 10
33 CD(4,1) = 10
34 CD(5,1) = 10

38 I = 0

39 GOSUB 1000
40 GOSUB 2000
41 GOSUB 3500
42 REM RENDER LOOP
43 CURRENT$ = PROGRAM$(I,0): REM CURRENT SELECTION
44 GOSUB 3000
49 GOTO 42

500 END

1000 REM DRAW PRETTY LINES
1001 POKE 55296,0
1010 PRINT CHR$(147)

1019 B = 960: S = 1024: C = 55296

1020 FOR X = 1 TO 38
1029 T = S + X
1030 POKE T,67
1031 POKE T + B,67
1042 A = C + X
1043 POKE A, 4
1044 POKE A + B,5
1050 NEXT X

1059 L = 2014: R = 39
1060 FOR X = 1 TO 23
1061 H = X * 40
1062 T = S + H: V = C + H
1063 POKE T, 89
1064 POKE T + R, 84
1065 POKE V, 4
1066 POKE V + R, 5
1067 NEXT X
1100 RETURN

2000 REM RENDER LIST AND RENDER CURRENT SELECTION
2001 REM PRINT CHR$(147)
2002 FOR X = 0 TO LNGTH
2003 REM T$ = "   "
2004 REM IF CURRENT$ = PROGRAM$(X,0) THEN T$ = DELIMITER$
2005 REM PRINT T$ + PROGRAM$(X, 0)
2006 POKE 1024 + CD(X, 0) + 40 * ( 24 - CD(X, 1)), 127
2007 POKE 55296 + CD(X, 0) + 40 * ( 24 - CD(X, 1)), 7
2010 NEXT X
2011 REM UPDATE CURSOR POSITION
2012 REM GOSUB 3500
2020 RETURN


3000 REM WAIT FOR KEYBOARD INPUT AND UPDATE NAVIGATION
3001 GET KEY$: IF KEY$ = "" THEN GOTO 3001
3002 GOSUB 3400
3003 IF KEY$ = " " THEN GOSUB 4000
3004 IF KEY$ = "" THEN I = I + 1
3005 IF KEY$ = "" THEN I = I - 1
3015 IF I > LNGTH THEN I = 0
3016 IF I < 0 THEN I = LNGTH
3017 GOSUB 3500
3020 RETURN

3400 REM CLEAR OLD CURSOR POSITION
3401 POKE (1024 + CD(I, 0) + 40 * ( 24 - CD(I, 1))) - 1, 32
3499 RETURN

3500 REM SET NEW CURSOR POSITION
3501 POKE (1024 + CD(I, 0) + 40 * ( 24 - CD(I, 1))) - 1, 81
3502 POKE (55296 + CD(I, 0) + 40 * ( 24 - CD(I, 1))) - 1, 8
3600 RETURN

4000 REM LAUNCH APP
4001 PRINT "LAUNCHING APP " + CURRENT$
4010 REM DYNAMIC KEYBOARD LOADER EXAMPLE 
4015 REM CHR$(34) IS FOR QUOTE MARKS. PRINTS AT PROPER PLACE 
4020 PRINT "LOAD";CHR$(34);PROGRAM$(I,0);CHR$(34);",";PROGRAM$(I,1) 
4025 PRINT:PRINT:PRINT:PRINT:PRINT"RUN" 
4030 PRINT"":POKE198,2:POKE631,13:POKE632,13:END 
4035 REM 198=NUMBER OF CHARACTERS IN KEYBOARD BUFFER. 13=RETURN 
4100 RETURN
