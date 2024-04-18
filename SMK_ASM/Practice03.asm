TITLE Project03-1
INCLUDE Irvine32.inc

.data
stringL1	BYTE "L1", 0
stringL2	BYTE "L2", 0
stringL3	BYTE "L3", 0
stringL4	BYTE "L4", 0
stringL5	BYTE "L5", 0
stringL6	BYTE "L6", 0


.code
main PROC
	mov eax, 0A523h
	cmp eax, 0A523h
	jne L1
	je L2

	L1 :	mov edx, 0FFSET StringL1
			call WriteString
			call Crlf
	L2 :	mov edx, 0FFSET StringL2
			call WriteString
			call Crlf


	mov cx, 0FFFFh
	inc cx
	jnz L3

	L3 :	mov edx, 0FFSET StringL3
			call WriteString
			call Crlf
	L4 :	mov edx, 0FFSET StringL4
			call WriteString
			call Crlf

	mov al, +127
	cmp al, -127
	jl L5
	jg L6

	L5 :	mov edx, 0FFSET StringL6
			call WriteString
			call Crlf
	L6 :	mov edx, 0FFSET StringL6
			call WriteString
			call Crlf
	exit
main ENDP
END main