;2. Using ARM assembly, Check whether a decimal number stored in 4000 0000h is an Armstrong number or not. example: 371(3**3+7**3+1**1)

	AREA my_code,CODE,READONLY
    ENTRY
	
MAIN
    LDR R0,=0x40000000   ; Load the address value to the register
    LDR R1,[R0]          ; Load the contents to register R1
    MOV R3,R1            ; Keep a copy at Register R3
    LDR R10,=0           ; Clear the contents of R10
	
LOOP1
    CMP R1,#9           ; Check if the remainder is less than 9
    BLE LAST            ; If yes then compute cube of the last digit
    BL DIV              ; Branch to DIV
    MUL R8,R1,R1        ; Compute the cube
    MUL R9,R8,R1        ; Store the cube in R9 (R9=R1*R1*R1)
    ADD R10,R10,R9      ; R10=R10+R9
    MOV R1,R2           ; Move the Quotient to R1
    B LOOP1             ; Iterative Loop
    
LAST
    MUL R8,R1,R1        ; Finding Cube
    MUL R9,R8,R1        ; Store the Result in R9 (R9=R1*R1*R1)
    ADD R10,R10,R9      ; R10=R10+R9
    B ARMSTRONG         ; Branch to Armstrong to check if the number is ARMSTRONG or NOT
DIV
    MOV R2,#0           ; Make R2=0

LOOP
    CMP R1,#9           ; Check if the remainder is less than 9
    BXLE LR             ; Sub Routine is used and will branch to the next instruction if less than.
    SUB R1,R1,#10       ; Repeated Division
    ADD R2,R2,#1        ; Increment the value to get the quotient
    B LOOP              ; Iteratively perform until condition fails

ARMSTRONG
  CMP R10,R3            ; Check if the numbers are equal 
  BNE NOT_ARMSTRONG     ; If not equal branch to NOT ARMSTRONG 
  LDR R5,=1             ; Make R5=1(true) if the number is ARMSTRONG
  B STOP

NOT_ARMSTRONG
	LDR R5,=0             ; Make R5=0(false) if the number is NOT ARMSTRONG

STOP B STOP
    
	END 