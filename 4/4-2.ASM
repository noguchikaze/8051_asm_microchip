;.SYMBOLS ON
ORG	0000H
JMP	START	;阿跳到start以後不就不會回來了?!!!
ORG	50H

START:
	MOV	R0,#70H	;01110000B	X X X N
	MOV	R1,#0B6H	;10110000B	X X N X
	MOV	R5,#00H

MAIN1:
	INC		R5
	CJNE	R5,#0FFH,MAIN2	;if R5!=5 JMP MAIN2
	MOV		R5,#00H		;掃描五次後 R5=0
	CJNE	R0,#70H,OZ	
	MOV		R0,#79H
	CJNE	R1,#0B0H,TENZ
	JMP		START
TENZ:	;R1!=0
	DEC		R1
	JMP		MAIN2
OZ:		;R0!=0
	DEC		R0

MAIN2:
	MOV		P1,R0	;顯示個位數
	CALL	DELAY

SHOW1:
	MOV		P1,R1	;顯示十位數
	CALL	DELAY
	JMP		MAIN1


DELAY:
	MOV	R6,#0FFH
DELAY1:
	MOV	R7,#0FH
DELAY2:

	DJNZ	R7,DELAY2
	DJNZ	R6,DELAY1
RET

END