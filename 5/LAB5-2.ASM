ORG	00H
JMP	START
ORG	50H

;P0最低腳位全部朝上	  
;P1最低腳位全部朝上	 

START:
	MOV	R0,#00000001B	;放在P1(控制亮的行)
	MOV	R1,#00000001B	;放在P0(控制亮的列)
	MOV	R2,#00H		;掃描用的
	MOV	R3,#0H		;數R1的旋轉數
	MOV	R4,#0H		;數R0的旋轉次數
LOOP:
	INC	R2		;掃描++
	MOV	P1,R0		
	MOV	P0,R1
	CALL 	DELAY	

	CJNE	R2,#055H,LOOP

	;當掃描完了以後
	MOV	A,R1
	RL	A	;把R1向左轉
	MOV	R1,A
	INC	R3	;R1旋轉次數++
	MOV	R2,#00H	;掃描次數歸零

	CJNE	R3,#7H,LOOP
	;當R1轉完了以後
	MOV	A,R0
	RL	A		;把R0向左轉
	MOV	R0,A
	INC	R4		;R0旋轉次數++
	MOV	R1,#00000001B	;R1回到原本的第一列
	MOV	R3,#0H		;將R1旋轉數歸零
	MOV	R2,#00H		;掃瞄次數歸零

	CJNE	R4,#5H,LOOP	;R0旋轉次數到達底端
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