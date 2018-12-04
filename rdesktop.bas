0 PRINT CHR$(147)

1 POKE 53280,0: REM 1 POKE 53280,11
2 POKE 53281,0
3 POKE 646, 15

4 REM PRINT "////////////////////////////"
5 REM PRINT "       RICH DESKTOP         "
6 REM PRINT "////////////////////////////" 

7 DELIMITER$=">  "
8 LNGTH = 7:SX=0:SY=100: TMOUT=0

9 PROGRAM$(0,0)="FILES"
10 PROGRAM$(1,0)="BBS"
11 PROGRAM$(2,0)="PAINT"
12 PROGRAM$(3,0)="GAME"
13 PROGRAM$(4,0)="WORD"
14 PROGRAM$(5,0)="SHEETS"
15 PROGRAM$(6,0)="MUSIC"
16 PROGRAM$(7,0)="BASIC"

18 PROGRAM$(0,1) = "8,1"
19 PROGRAM$(1,1) = "8,1"
20 PROGRAM$(2,1) = "8,1"
21 PROGRAM$(3,1) = "8,1"
22 PROGRAM$(4,1) = "8,1"
23 PROGRAM$(5,1) = "8,1"
24 PROGRAM$(6,1) = "8,1"
25 PROGRAM$(7,1) = "8,1"

26 REM X COORD
27 XY(0,0) = 3
28 XY(1,0) = 13
29 XY(2,0) = 23
30 XY(3,0) = 33
31 XY(4,0) = 3
32 XY(5,0) = 13
33 XY(6,0) = 23
34 XY(7,0) = 33

35 REM Y COORD
36 XY(0,1) = 12
37 XY(1,1) = 12
38 XY(2,1) = 12
39 XY(3,1) = 12
40 XY(4,1) = 20
41 XY(5,1) = 20
42 XY(6,1) = 20
43 XY(7,1) = 20


100 I = 0

138 PRINT CHR$(147)
139 REM GOSUB 1071 : REM PRETTY LINES
140 ROW = 12: COL = 12: GOSUB 7000: PRINT "LOADING DESKTOP..."
141 GOSUB 6000 : REM RENDER SPRITES
142 ROW = 12: COL = 12: GOSUB 7000: PRINT "                  "
143 GOSUB 2000 : REM RENDER LIST : REM DO NOT CHANGE THIS LINE NUMBER!!!!!! WILL BREAK A FEW SPOTS
150 GOSUB 3500 : REM SET CURSOR
151 ROW = 0: COL = 25: GOSUB 7000: PRINT "DAGGATOP V0.2.4"
152 ROW = 0: COL = 0: GOSUB 7000: PRINT "[F1] HELP"
153 REM ROW = 1: COL = 0: GOSUB 7000: PRINT "F3 = CONSOLE"
154 REM ROW = 2: COL = 0: GOSUB 7000: PRINT "F5 = SCREENSAVER"

162 GOSUB 1110 : REM RENDER PROMPT
173 REM BEGIN RENDER LOOP
184 CURRENT$ = PROGRAM$(I,0): REM CURRENT SELECTION
195 GOSUB 3000 : REM GET INPUT
209 GOTO 173 : REM END RENDER LOOP

500 END



1000 REM DRAW PRETTY LINES
1001 POKE 55296,0
1019 B = 960: S = 1024: C = 55296
1020 FOR X = 0 TO 39
1029 T = S + X
1042 A = C + X
1043 POKE A, 7 : REM TOP ROW COLOR
1044 POKE A + B,2 : REM BOTTOM ROW COLOR
1045 POKE T,221 : REM TOP BORDER CHARACTER
1046 POKE T + B,221 :  REM BOTTOM BORDER CHARACTER
1050 NEXT X
1059 L = 2014: R = 39


1060 FOR X = 1 TO 23

1061 H = X * 40
1062 T = S + H: V = C + H

1063 POKE V, 6 : REM LEFT BORDER COLOR
1064 POKE V + R, 6 :  REM RIGHT BORDER COLOR
1065 POKE T, 221 : REM LEFT BORDER CHARACTER
1066 POKE T +  R, 221 :  REM RIGHT BORDER CHARACTER
1067 NEXT X
1070 RETURN

1071 REM FASTER PRETTY LINES
1072  POKE 646, 2
1073 ROW = 0: COL = 0: GOSUB 7000 : PRINT "";
1074 ROW = 24: COL = 0: GOSUB 7000: PRINT "";
1075 POKE 2023, 230
1076 POKE 56295, 2
1080 FOR L=1TO 23
1081 ROW = L: COL = 0: GOSUB 7000 : PRINT "                                      ";
1082 NEXT
1090 POKE 646, 1
1091 RETURN

1110 REM DRAW COMMAND PROMPT
1118 B = 920: S = 1024: C = 55296
1119 T = B + S
1120 FOR X = 3 TO 37
1131 POKE T + X,119
1144 POKE C + B + X,1
1150 NEXT X
1151 POKE T + 3, 79
1152 POKE T + 37, 80
1153 POKE T + 40 + 4, 62
1154 POKE T + 34, 6
1155 POKE T + 35, 51
1156 POKE C + B + 40 + 4, 1
1157 POKE T + 3 + 40, 101
1158 POKE C + B + 40 + 3, 1

1161 RETURN

2000 REM RENDER LIST AND RENDER CURRENT SELECTION
2001 POKE 53280,0: POKE 53281,0
2012 FOR X = 0 TO LNGTH
2013 REM T$ = "   "
2014 REM IF CURRENT$ = PROGRAM$(X,0) THEN T$ = DELIMITER$
2015 REM PRINT T$ + PROGRAM$(X, 0)
2016 REM POKE 1024 + XY(X, 0) + 40 * XY(X, 1), 127
2017 REM POKE 55296 + XY(X, 0) + 40 * XY(X, 1), 8
2020 ROW = XY(X, 1): COL = XY(X, 0): GOSUB 7000
2021 PRINT PROGRAM$(X,0)
2030 NEXT X
2031 REM UPDATE CURSOR POSITION
2032 REM GOSUB 3500
2033 RETURN


3000 REM WAIT FOR KEYBOARD INPUT AND UPDATE NAVIGATION
3001 TMOUT = TMOUT + 1: IF TMOUT > 5000 THEN TMOUT = 0: GOSUB 9000
3002 GET KEY$: IF KEY$ = "" THEN GOTO 3001
3003 GOSUB 3400: TMOUT = 0
3004 IF KEY$ = CHR$(13) THEN GOSUB 4000 : REM LAUNCH APP
3005 IF KEY$ = CHR$(134) THEN GOSUB 5000 : REM DIR LIST
3006 IF KEY$ = "" THEN I = I + 3
3007 IF KEY$ = "" THEN I = I + 1
3008 IF KEY$ = "" THEN I = I - 3
3009 IF KEY$ = "" THEN I = I - 1
3010 IF KEY$ = "1" THEN I = 0 : GOSUB 4000
3011 IF KEY$ = "2" THEN I = 1 : GOSUB 4000
3012 IF KEY$ = "3" THEN I = 2 : GOSUB 4000
3013 IF KEY$ = "4" THEN I = 3 : GOSUB 4000
3014 IF KEY$ = "5" THEN I = 4 : GOSUB 4000
3015 IF KEY$ = "6" THEN I = 5 : GOSUB 4000
3016 IF KEY$ = CHR$(133) THEN GOSUB 8000
3017 IF KEY$ = CHR$(135) THEN GOSUB 9000

3035 IF I > LNGTH THEN I = 0
3036 IF I < 0 THEN I = LNGTH
3037 GOSUB 3500
3050 RETURN

3400 REM CLEAR OLD CURSOR POSITION
3401 POKE (1024 + XY(I, 0) + 40 * XY(I, 1)) - 1, 32
3499 RETURN

3500 REM SET NEW CURSOR POSITION
3501 POKE (1024 + XY(I, 0) + 40 * XY(I, 1)) - 1, 250 :REM 90
3502 POKE (55296 + XY(I, 0) + 40 * XY(I, 1)) - 1,13


3530  REM FOR X = 0 TO 12
3531  REM SX = SX + X
3540  REM POKE V + 0,SX : REM UPDATE X COORDINATES
3550  REM POKE V + 1,SY : REM UPDATE Y COORDINATES
3560  REM NEXT X

3600 REM POKE V + 0,XY(I, 0) * 10
3610 REM POKE V + 1,XY(I, 1) * 10

3700 RETURN

4000 REM LAUNCH APP
4001 ROW = 12: COL = 12: GOSUB 7000: PRINT "LAUNCHING APP " + CURRENT$
4002 REM POKE 53280,11
4003 REM POKE 53281,15
4004 REM POKE 646, 0
4022 POKE V + 21,0 : REM DISABLE SPRITES
4033 IF CURRENT$ = "BASIC" THEN SYS 64738
4040 REM DYNAMIC KEYBOARD LOADER EXAMPLE 
4055 REM CHR$(34) IS FOR QUOTE MARKS. PRINTS AT PROPER PLACE 
4060 PRINT "LOAD";CHR$(34);PROGRAM$(I,0);CHR$(34);",";PROGRAM$(I,1) 
4075 PRINT:PRINT:PRINT:PRINT:PRINT"RUN" 
4080 PRINT"":POKE198,2:POKE631,13:POKE632,13:END 
4095 REM 198=NUMBER OF CHARACTERS IN KEYBOARD BUFFER. 13=RETURN 
4100 RETURN

5000 ROW = 0: COL = 0: GOSUB 7000
5005 POKE 19,65 
5006 REM POKE 53280,12: POKE 53281,12
5010 POKE V + 21,0 : REM DISABLE SPRITES
5020 PRINT CHR$(147)
5025 GOSUB 11000
5030 REM GOSUB 10000 : REM DIR LISTING
5035 PRINT ""
5036 PRINT ""
5037 POKE 646,1
5040 INPUT "> "; IP$
5041 PRINT ""
5042 POKE 646,15
5050 IF IP$ = "EXIT" THEN PRINT CHR$(147): POKE V + 21,255 : GOSUB 143: GOSUB 5035
5060 IF IP$ = "DIR" THEN GOSUB 10000: GOSUB 5035
5061 IF IP$ = "LS" THEN GOSUB 10000: GOSUB 5035
5070 IF IP$ = "HELP" THEN GOSUB 11000: GOSUB 5035
5080 IF LEFT$(IP$,4) = "LOAD" THEN PRINT "I DONT KNOW HOW TO LOAD YET": GOSUB 5035
5090 IF LEFT$(IP$,3) = "RUN" THEN PRINT "I DONT KNOW HOW TO RUN YET": GOSUB 5035

5095 REM ELSE

5100 OPEN 15,8,15,IP$:CLOSE 15
5110 PRINT ""
5120 GOSUB 10000
5800 GOTO 5035
5900 RETURN

6000 REM SPRITES
6010 V = 53248 : REM START OF DISPLAY CHIP

6011 POKE V + 21,255 : REM ENABLE SPRITE 2 AND 3

6012 POKE 2040,13 : REM SPRITE 2 DATA FROM BLOCK 13 : CURSOR
6013 POKE 2041,14 : REM SPRITE 2 DATA FROM BLOCK 13 : ICON FILES
6014 POKE 2042,15 : REM SPRITE 2 DATA FROM BLOCK 13 : ICON TERMINAL
6015 POKE 2043,192 : REM SPRITE 2 DATA FROM BLOCK 13 : ICON PAINT
6016 POKE 2044,193 : REM SPRITE 2 DATA FROM BLOCK 13 : ICON WORD
6017 POKE 2045,194 : REM SPRITE 2 DATA FROM BLOCK 13 : ICON SHEETS
6018 POKE 2046,195 : REM SPRITE 2 DATA FROM BLOCK 13 : ICON BASIC




6019 POKE V + 41,13 : REM SPRITE 2 COLOR 13. SPRITE 0 = REGISTER 40?
6020 POKE V + 43,7 : REM SPRITE 2 COLOR 13. SPRITE 0 = REGISTER 40?
6021 POKE V + 45,1 : REM SPRITE 2 COLOR 13. SPRITE 0 = REGISTER 40?
6023 POKE V + 40,3 : REM FILE ICON

6031 FOR N = 0 TO 62 : READ Q : POKE 832+N,Q : NEXT : REM LOADS SPRITE INTO MEM SOMEHOW
6032 FOR N = 0 TO 63 : READ Q : POKE 896+N,Q : NEXT : REM LOADS SPRITE INTO MEM SOMEHOW
6033 FOR N = 0 TO 63 : READ Q : POKE 960+N,Q : NEXT : REM LOADS SPRITE INTO MEM SOMEHOW
6034 FOR N = 0 TO 254 : READ Q : POKE 12288+N,Q : NEXT : REM LOADS SPRITE INTO MEM SOMEHOW




6045 POKE V + 23,255 : POKE V + 29,255 : REM EXPAND SPRITE

6080 POKE V + 0, 0 : REM CUSOR
6090 POKE V + 1, 0

6091 POKE V + 2, 50 : REM FILES
6092 POKE V + 3, 100

6093 POKE V + 4, 130 : REM TERMIANL
6094 POKE V + 5, 100

6095 POKE V + 6, 210 : REM PAINT
6096 POKE V + 7, 100

6097 POKE V + 8, 50 : REM WORD
6098 POKE V + 9, 160

6099 POKE V + 10, 130 : REM SHEETS
6100 POKE V + 11, 160

6101 POKE V + 12, 210 : REM BASIC
6102 POKE V + 13, 160


6199 REM SELECTOR ICON
6200 DATA 255,255,255,128,0,1,128,0,1,128,0,1
6210 DATA 128,0,1,128,0,1,128,0,1,128,0,1
6220 DATA 128,0,1,128,0,1,128,0,1,128,0,1
6230 DATA 128,0,1,128,0,1,128,0,1,128,0,1,128,0,1
6240 DATA 128,0,1,128,0,1,128,0,1,255,255,255

6300 DATA 255,255,255,255,255,255,255,255,255,255,255,254,255,255,255,255,255,255,255,255
6310 DATA 255,255,231,255,255,219,255,255,219,255,255,231,255,255,255,255,255,255,255,255
6320 DATA 231,255,255,231,255,255,231,255,255,231,255,255,231,255,255,255,255,255,255,255
6330 DATA 255,255,255,1,0,255,0,3,0,192,12,114,48,16,251,8,33,255,132,33,255,196,64,127
6340 DATA 194,64,63,98,128,30,33,128,12,1,128,8,1,128,12,1,128,31,1,64,63,130,64,31,2,32
6350 DATA 14,4,32,14,4,16,6,8,12,4,48,3,30,192,0,255,0,1,0,8,0,0,20,0,1,231,0,7,195,192
6360 DATA 15,137,224,28,132,240,56,128,248,56,64,252,120,65,252,124,235,252,115,235,252
6370 DATA 97,235,248,97,235,248,115,235,240,127,235,112,62,107,32,30,107,128,15,235,128
6380 DATA 3,235,0,0,8,0,0,0,0,1,63,255,192,63,255,208,63,255,216,63,255,192,63,255,252
6390 DATA 56,0,60,63,255,252,56,64,188,63,255,252,60,96,252,63,255,252,56,30,124,63,255
6400 DATA 252,60,0,252,63,255,252,60,112,124,63,255,252,63,0,124,63,255,252,63,255,252
6410 DATA 63,255,252,1,0,0,0,121,139,230,122,235,234,122,219,234,121,187,230,127,251,254
6420 DATA 0,0,0,127,251,254,127,251,254,127,251,254,127,251,254,0,0,0,127,251,254,127,251
6430 DATA 254,127,251,254,127,251,254,0,0,0,127,251,254,127,251,254,127,251,254,0,0,0,1
6440 DATA 0,48,0,0,124,0,0,127,0,0,127,192,0,48,224,0,48,0,0,16,0,0,24,0,0,24,0,0,24,0
6450 DATA 0,12,0,0,124,0,1,254,0,3,255,0,3,255,0,3,255,0,3,255,0,1,254,0,0,252,0,0,112
6460 DATA 0,0,0,0,1

6700 RETURN

7000 POKE 780,0 : REM FUNCTION TO SET TEXT POSITION X/Y
7010 POKE 781,ROW
7020 POKE 782,COL
7030 SYS 65520
7040 RETURN

8000 ROW = 23: COL = 6: GOSUB 7000
8010 PRINT "MOVE=ARROW KEYS. RUN=RETURN"
8100 RETURN

9000 REM SCREENSAVER
9004 PRINT CHR$(147)
9005 POKE V + 21,0 : REM DISABLE SPRITES
9006 ROW = 0: COL = 0: GOSUB 7000:
9007 POKE 53280,0
9008 POKE 53281,0
9009 POKE 646, INT(RND(1)*16)
9010 PRINT CHR$(205.5+RND(1));
9020 GET KEY$: IF NOT KEY$ = "" THEN POKE 646, 1: PRINT CHR$(147) : POKE V + 21,255 : GOTO 143: 
9100 GOTO 9009
9200 RETURN

10000 REM DIR
10006 D=PEEK(186):REM LAST USED DRIVE NUMBER, YOU CAN FORCE 8 IF < 8 
10010 SYS57812"$",D:POKE43,1:POKE44,192:POKE768,174:POKE769,167:SYS47003,1 
10020 POKE782,192:SYS65493:SYS42291:LIST:POKE44,8:POKE768,139:POKE769,227 
10030 RETURN 

11000 REM HELP 
11010 PRINT "DAGGA/DOS 0.2.4"
11020 PRINT ""
11025 POKE 646,15
11030 PRINT "VALID COMMANDS: DIR LS CD LOAD RUN HELP EXIT"
11035 POKE 646,3
11040 PRINT "": PRINT "ALL OTHER COMMANDS SENT RAW TO SD2IEC": PRINT ""
11045 POKE 646,15
11050 PRINT "CD//           - ROOT DIRECTORY"
11060 PRINT "CD/MYDIR       - CHANGE TO A DIRECTORY"
11061 PRINT "CD:MYIMAGE.D64 - MOUNT DISK IMAGE"
11062 PRINT "CD:           - GO UP ONE LEVEL"
11070 POKE 646,1
11100 RETURN 





