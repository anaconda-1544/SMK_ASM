INCLUDE Irvine32.inc

.code
main PROC

	mov eax, 12345678h
	call DumpRegs
	exit

main ENDP
END main