*-----------------------------------------------------------
* Program Number:
* Written by    :
* Date Created  :
* Description   :
*
*-----------------------------------------------------------
START	ORG	$1000
	* ispis teksta
	MOVE #14,D0
	LEA tekst1,A1
	TRAP #15

	*unos naziva datoteke
	MOVE #2,D0
	LEA unos1,A1
	TRAP #15

	* otvaranje datoteke
	MOVE #51,D0
	TRAP #15

	*èitanje znakova iz datoteke u memoriju
	MOVE #53,D0
	MOVE.L #80,D2
	LEA unos2,A1
	TRAP #15

	* ispis teksta
	MOVE #14,D0
	LEA unos2,A1
	TRAP #15

	* Halt Simulator
	MOVE.B	#9,D0
	TRAP	#15
	

X2      CMP D2,A3
        BGT X1
        MOVE.B (A1),D1	
        CMP #' ', D1			
        BEQ BR
	CMP #'.', D1
	BEQ BR

POV   	ADD #1,A1
      	ADD #1,A3
       	ADD #1,D4
        JMP X2

BR	CMP #0, D7
	BEQ POC	
	CMP D4, D5
	BLE  zad 
	SUB #1,D5
	MOVE A1, A5
	JMP BR
	
POC     MOVE D4, D5
	MOVE #1, D7
	JMP BR

zad1	MOVE A1, A5
	JMP NUL

zad	CMP D4, D5
	BEQ  zad1 

NUL	MOVE D6,D4	
	SUB #1,D4		
	JMP POV


X1	MOVE #14,D0
	LEA  rj,A1
	TRAP #15
	MOVE A5, A1	
	SUB D5, A1
	JMP y1	

y1	CMP D5, A4
	BGT KRAJ
	MOVE.B (A1),D1	
	MOVE #6,D0
        TRAP #15
	ADD #1,A1
	ADD #1,A4
	JMP y1

KRAJ	STOP #$2000
tekst1	DC.B 'Unesite naziv datoteke:',$D,$A,0
unos1	DS.B 80
unos2	DS.B 80
rj	DC.B $D,$A,$D,$A,'Rjesenje: ',0
	END	START
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~8~
