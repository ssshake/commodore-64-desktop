  ��(147)  �53280,11 ( �53281,0 4 �646,14 _ � PRINT "////////////////////////////" � � PRINT "       RICH DESKTOP         " � � PRINT "////////////////////////////" � DELIMITER$�">  " � LNGTH�7 �	 PROGRAM$(0,0)�"FILE BROWSER" 	
 PROGRAM$(1,0)�"TERMINAL" .	 PROGRAM$(2,0)�"PAINT" G	 PROGRAM$(3,0)�"WORD" _	 PROGRAM$(4,0)�"CMD" y	 PROGRAM$(5,0)�"BASIC" �	 PROGRAM$(5,0)�"BASIC" �	 PROGRAM$(5,0)�"BASIC" �	 PROGRAM$(0,1)�"8,1" �	 PROGRAM$(1,1)�"8,1" �	 PROGRAM$(2,1)�"8,1" 
 PROGRAM$(3,1)�":*,8" #
 PROGRAM$(4,1)�"" 8
 PROGRAM$(5,1)�"" M
 PROGRAM$(5,1)�"" b
 PROGRAM$(5,1)�"" p
 � X COORD ~
 XY(0,0)�3 �
 XY(1,0)�13 �
 XY(2,0)�23 �
 XY(3,0)�33 �
 XY(4,0)�3 �
 XY(5,0)�13 �
  XY(6,0)�23 �
! XY(7,0)�33 �
" � Y COORD # XY(0,1)�20 $ XY(1,1)�20 !% XY(2,1)�20 0& XY(3,1)�20 ?' XY(4,1)�10 N( XY(5,1)�10 ]) XY(6,1)�10 l* XY(7,1)�10 td I�0 ~� �1000 �� �2000 �� �3500 �� �1110 �� � RENDER LOOP �� CURRENT$�PROGRAM$(I,0):� CURRENT SELECTION �� �3000 �� �143 ��� �� DRAW PRETTY LINES ��55296,0 '���(147) Q�� POKE 1024, 108: POKE 1024 + 39, 123 ��� POKE 1024 + 999 - 39, 124: POKE 1024 + 999, 126 ��B�960:S�1024:C�55296 ���X�1�38 �T�S�X ��T,67 ��T�B,67 �A�C�X ��A,4 ��A�B,5 ��X #L�2014:R�39 $�X�1�23 %H�X�40 (&T�S�H:V�C�H 2'�T,89 >(�T�R,84 G)�V,4 R*�V�R,5 Y+�X _L� yV� DRAW COMMAND PROMPT �^B�880:S�1024:C�55296 �_T�B�S �`�X�3�37 �k�T�X,119 �x�C�B�X,1 �~�X ��T�3,79 ���T�37,80 ���T�40�4,62 ���T�34,6 
��T�35,51 ��C�B�40�4,1 *��T�3�40,101 :��C�B�40�3,1 @�� o�� RENDER LIST AND RENDER CURRENT SELECTION ��� PRINT CHR$(147) ���X�0�LNGTH ��� T$ = "   " ��� IF CURRENT$ = PROGRAM$(X,0) THEN T$ = DELIMITER$ ��� PRINT T$ + PROGRAM$(X, 0) "��1024�XY(X,0)�40�(24�XY(X,1)),127 G��55296�XY(X,0)�40�(24�XY(X,1)),8 N��X k�� UPDATE CURSOR POSITION |�� GOSUB 3500 ��� ��� WAIT FOR KEYBOARD INPUT AND UPDATE NAVIGATION ���KEY$:�KEY$�""��3001 ���3400 ���KEY$�" "��4000 ��KEY$��(134)��5000 ��KEY$�""�I�I�1 ,��KEY$�"�"�I�I�1 =��I�LNGTH�I�0 N��I�0�I�LNGTH X��3500 ^�� ~H� CLEAR OLD CURSOR POSITION �I�(1024�XY(I,0)�40�(24�XY(I,1)))�1,32 ��� ��� SET NEW CURSOR POSITION ���(1024�XY(I,0)�40�(24�XY(I,1)))�1,90 ��(55296�XY(I,0)�40�(24�XY(I,1)))�1,13 $� 5�� LAUNCH APP T��"LAUNCHING APP "�CURRENT$ z�� DYNAMIC KEYBOARD LOADER EXAMPLE ��� CHR$(34) IS FOR QUOTE MARKS. PRINTS AT PROPER PLACE ���"�LOAD";�(34);PROGRAM$(I,0);�(34);",";PROGRAM$(I,1) ��:�:�:�:�"RUN" %��"":�198,2:�631,13:�632,13:� b�� 198=NUMBER OF CHARACTERS IN KEYBOARD BUFFER. 13=RETURN h� z��"YOU DID IT" ���   