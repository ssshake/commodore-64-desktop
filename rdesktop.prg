  ��(147)  LNGTH�5 & �53280,5 3 �53281,0 > �646,3 b �"////////////////////////////" � �"       RICH DESKTOP         " � �"////////////////////////////" �	 DELIMITER$�">  " �
 PROGRAM$(0,0)�"FILE BROWSER" � PROGRAM$(1,0)�"TERMINAL" 	 PROGRAM$(2,0)�"PAINT" 0	 PROGRAM$(3,0)�"WORD" H	 PROGRAM$(4,0)�"CMD" `	 PROGRAM$(0,1)�"8,1" v	 PROGRAM$(1,1)�"8" �	 PROGRAM$(2,1)�"8,1" �	 PROGRAM$(3,1)�":*,8" �	 PROGRAM$(4,1)�"" �	' I�0 �	( � RENDER LOOP 
) CURRENT$�PROGRAM$(I,0):� CURRENT SELECTION 
* �2000 
+ �3000 !
, �40 '
d � V
�� RENDER LIST AND RENDER CURRENT SELECTION b
���(147) q
��X�0�LNGTH ~
�T$�"   " �
��CURRENT$�PROGRAM$(X,0)�T$�DELIMITER$ �
��T$�PROGRAM$(X,0)�PROGRAM$(X,1) �
��X �
�� �� WAIT FOR KEYBOARD INPUT AND UPDATE NAVIGATION &��KEY$:�KEY$�""��3001 :��KEY$�" "��4000 N��KEY$�""�I�I�1 b��KEY$�"�"�I�I�1 s��I�LNGTH�I�0 ���I�0�I�LNGTH ��� ��� LAUNCH APP ���"LAUNCHING APP "�CURRENT$ ��� DYNAMIC KEYBOARD LOADER EXAMPLE �� CHR$(34) IS FOR QUOTE MARKS. PRINTS AT PROPER PLACE V��"�LOAD";�(34);PROGRAM$(I,0);�(34);",";PROGRAM$(I,1) i��:�:�:�:�"RUN" ���"":�198,2:�631,13:�632,13:� ��� 198=NUMBER OF CHARACTERS IN KEYBOARD BUFFER. 13=RETURN ��   