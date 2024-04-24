TITLE project5-2
INCLUDE Irvine32.inc

.data
	array DWORD 10000h, 20000h, 30000h, 40000h, 50000h
	theSum DWORD ?

.code
main PROC
    mov esi, OFFSET array      ; EIP == ___h, ESI == ___h
    mov ecx, LENGTHOF array   ; EIP == ___h, ECX == ___h
    call ArraySum             ; EIP == ___h, ESP == ___h
    mov theSum, eax           ; EIP == ___h, theSum == ___h
    exit                      ; Exit the program
main ENDP

ArraySum PROC
    push esi                  ; EIP == ___h, ESP == ___h, ESI == ___h
    push ecx                  ; EIP == ___h, ESP == ___h, ECX == ___h
    mov eax, 0

L1:
    add eax, [esi]            ; EIP == ___h
    add esi, 4                ; EIP == ___h, 포인터 증가
    loop L1                   ; EIP == ___h
    pop ecx                   ; EIP == ___h, ESP == ___h, ECX == ___h
        pop esi                   ; EIP == ___h, ESP == ___h, ESI == ___h
    ret                        ; Return to the caller
ArraySum ENDP

END main
