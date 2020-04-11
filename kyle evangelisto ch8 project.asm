.ORIG x3000 ; begin at x3000
; input two numbers
IN ;input an integer character (ascii) {TRAP 23}
AND R3, R3, #0 ;Clear R3
LD R3, HEXN30 ;put -47 in R3
ADD R0, R0, R3 ;Add 0 + -47 in R0
ADD R1, R0, x0 ;move the first integer to register 1
IN ;input another integer {TRAP 23}
ADD R0, R0, R3 ;convert it to an integer

; add the numbers
ADD R2, R0, R1 ;add the two integers

; print the results
LEA R0, MESG ;load the address of the message string
PUTS ;"PUTS" outputs a string {TRAP 22}
ADD R0, R2, x0 ;move the sum to R0, to be output
LD R3, HEX30 ;add 30 to integer to get integer character
ADD R0, R0, R3

LD R5, m57          ; 9 = 57 negative
ADD R1, R0, R5      ; if answer 9 <= 0

BRnz DONE	;Logic branch
ADD R2, R0, 0
LD R0, p49	;Load 49 in and out the 1 before the value
OUT	;output
ADD R0,R2,-10	;add output with r2 and -10
DONE 

OUT ;display the sum {TRAP 21}

; stop
HALT ;{TRAP 25}

; data
MESG .STRINGZ "The sum of those two numbers is: "
HEXN30 .FILL xFFD0 ; -30 HEX
HEX30 .FILL x0030 ; 30 HEX
p49 .fill 49    ; the ASCII code for '1'
m57 .fill -57   ; -(the ASCII code for '9')
.END