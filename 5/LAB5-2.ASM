ORG	00H
JMP	START
ORG	50H

;P0�̧C�}������¤W	  
;P1�̧C�}������¤W	 

START:
	MOV	R0,#00000001B	;��bP1(����G����)
	MOV	R1,#00000001B	;��bP0(����G���C)
	MOV	R2,#00H		;���y�Ϊ�
	MOV	R3,#0H		;��R1�������
	MOV	R4,#0H		;��R0�����স��
LOOP:
	INC	R2		;���y++
	MOV	P1,R0		
	MOV	P0,R1
	CALL 	DELAY	

	CJNE	R2,#055H,LOOP

	;�����y���F�H��
	MOV	A,R1
	RL	A	;��R1�V����
	MOV	R1,A
	INC	R3	;R1���স��++
	MOV	R2,#00H	;���y�����k�s

	CJNE	R3,#7H,LOOP
	;��R1�৹�F�H��
	MOV	A,R0
	RL	A		;��R0�V����
	MOV	R0,A
	INC	R4		;R0���স��++
	MOV	R1,#00000001B	;R1�^��쥻���Ĥ@�C
	MOV	R3,#0H		;�NR1������k�s
	MOV	R2,#00H		;���˦����k�s

	CJNE	R4,#5H,LOOP	;R0���স�ƨ�F����
	JMP	START	

DELAY:
	MOV	R6,#0AH
DELAY1:
	MOV	R7,#2FH
DELAY2:
	DJNZ	R7,DELAY2
	DJNZ	R6,DELAY1
	RET
END