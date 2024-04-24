INCLUDE Irvine32.inc
.data
val1 DWORD 10000h
val2 DWORD 20000h
val3 DWORD 30000h
dinalVal DWORD ?
.code
main PROC
	mov eax, val1			;start witn 10000h
	add eax, val2			;add 40000h
	sub eax, val3			;sub