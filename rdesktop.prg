  ��(147)  LNGTH�5 ' �53280,11 4 �53281,0 @ �646,14 k � PRINT "////////////////////////////" � � PRINT "       RICH DESKTOP         " � � PRINT "////////////////////////////" � DELIMITER$�">  " �	 PROGRAM$(0,0)�"FILE BROWSER" 	
 PROGRAM$(1,0)�"TERMINAL" .	 PROGRAM$(2,0)�"PAINT" G	 PROGRAM$(3,0)�"WORD" _	 PROGRAM$(4,0)�"CMD" y	 PROGRAM$(5,0)�"BASIC" �	 PROGRAM$(0,1)�"8,1" �	 PROGRAM$(1,1)�"8" �	 PROGRAM$(2,1)�"8,1" �	 PROGRAM$(3,1)�":*,8" �	 PROGRAM$(4,1)�"" 
 PROGRAM$(5,1)�"" 
 � X COORD 
 CD(0,0)�3 -
 CD(1,0)�13 <
 CD(2,0)�23 J
 CD(3,0)�3 Y
 CD(4,0)�13 h
 CD(5,0)�23 v
 � Y COORD �
 CD(0,1)�20 �
 CD(1,1)�20 �
 CD(2,1)�20 �
  CD(3,1)�10 �
! CD(4,1)�10 �
" CD(5,1)�10 �
& I�0 �
' �1000 �
( �2000 �
) �3500 * � RENDER LOOP 7+ CURRENT$�PROGRAM$(I,0):� CURRENT SELECTION A, �3000 I1 �42 O�� g�� DRAW PRETTY LINES t��55296,0 ����(147) ��B�960:S�1024:C�55296 ���X�1�38 �T�S�X ��T,67 ��T�B,67 �A�C�X ��A,4 ��A�B,5 ��X �#L�2014:R�39 $�X�1�23 %H�X�40 !&T�S�H:V�C�H +'�T,89 7(�T�R,84 @)�V,4 K*�V�R,5 R+�X XL� ��� RENDER LIST AND RENDER CURRENT SELECTION ��� PRINT CHR$(147) ���X�0�LNGTH ��� T$ = "   " ��� IF CURRENT$ = PROGRAM$(X,0) THEN T$ = DELIMITER$ �� PRINT T$ + PROGRAM$(X, 0) :��1024�CD(X,0)�40�(24�CD(X,1)),127 _��55296�CD(X,0)�40�(24�CD(X,1)),7 f��X ��� UPDATE CURSOR POSITION ��� GOSUB 3500 ��� ��� WAIT FOR KEYBOARD INPUT AND UPDATE NAVIGATION ���KEY$:�KEY$�""��3001 ���3400 ��KEY$�" "��4000 ��KEY$�""�I�I�1 -��KEY$�"�"�I�I�1 >��I�LNGTH�I�0 O��I�0�I�LNGTH Y��3500 _�� H� CLEAR OLD CURSOR POSITION �I�(1024�CD(I,0)�40�(24�CD(I,1)))�1,32 ��� ��� SET NEW CURSOR POSITION ���(1024�CD(I,0)�40�(24�CD(I,1)))�1,81 ��(55296�CD(I,0)�40�(24�CD(I,1)))�1,8 $� 5�� LAUNCH APP T��"LAUNCHING APP "�CURRENT$ z�� DYNAMIC KEYBOARD LOADER EXAMPLE ��� CHR$(34) IS FOR QUOTE MARKS. PRINTS AT PROPER PLACE ���"�LOAD";�(34);PROGRAM$(I,0);�(34);",";PROGRAM$(I,1) ��:�:�:�:�"RUN" %��"":�198,2:�631,13:�632,13:� b�� 198=NUMBER OF CHARACTERS IN KEYBOARD BUFFER. 13=RETURN h�   