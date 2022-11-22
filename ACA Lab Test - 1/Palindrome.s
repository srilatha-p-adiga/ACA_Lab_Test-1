;1. Using ARM assembly, Check whether the hexadecimal number stored in 4000 0000h (32-bit number) is a palindrome or not. 
;Example: 01011010, FFFFFFFF, 32322323 
	
	AREA PROGRAM,CODE,READONLY
    ENTRY
MAIN
    LDR R0,=0x40000000     ; Load the address value in Register R0
    LDRB R1,[R0],#1        ; Load the values byte by byte 
    LDRB R2,[R0],#1		   ; Load the values byte by byte
    LDRB R3,[R0],#1        ; Load the values byte by byte
    LDRB R4,[R0],#1        ; Load the values byte by byte
    
	AND R6,R3,#0x0F        ; Mask the 4 bits of the Register R3 by ANDing it with 0x0F and store it in R6
    MOV R6,R6,LSL #4	   ; Left shift the contents of R6 by four bits 
    MOV R7,R6              ; Move the contents to register R7
    
    AND R8,R3,#0xF0		   ; Mask the 4 bits of the Register R3 by ANDing it with 0xF0 and store it in R8
    MOV R8,R8,LSR #4       ; Right shift the contents of R8 by four bits 
    ADD R3,R7,R8           ; R3=R7+R8
    
    AND R6,R4,#0x0F		   ; Mask the 4 bits of the Register R4 by ANDing it with 0x0F and store it in R6
    MOV R6,R6,LSL #4	   ; Left shift the contents of R6 by four bits 
    MOV R7,R6			   ; Move the contents to register R7	
    
    AND R8,R4,#0xF0		   ; Mask the 4 bits of the Register R3 by ANDing it with 0xF0 and store it in R8
    MOV R8,R8,LSR #4       ; Right shift the contents of R8 by four bits
    ADD R4,R7,R8           ; R4=R7+R8

	CMP R1,R4               ; Compare the values in Register R1 and R4
    BNE NOT_PALINDROME      ; If not equal branch to not paliindrome
    
PALINDROME
    CMP R2,R3				; Compare R2 and R3
    BEQ TRUE                ; Branch to True if they are equal

NOT_PALINDROME              
	LDR R5,=0               ; Load the Register R5=0 (false) if the number is not a palindrome
    B STOP					; Branch to Stop
    
TRUE
    LDR R5,=1               ; Load the Register R5=1 (true) if the number is a palindrome

STOP B STOP
    
    END