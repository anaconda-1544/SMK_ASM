TITLE Project5-1
INCLUDE Irvine32.inc

.data
    aName BYTE "MY NAME",0
    nameSize = ($ - aName) - 1                    ;name size = 9

.code
main PROC

    mov ecx, nameSize                            ; ECX == 13564948 h
    mov esi, 0
        
L1:
    movzx eax, aName[esi]
    push eax
    inc esi
    loop L1                                     ; ECX == 76h

    mov ecx, nameSize
    mov esi, 0

L2:
    pop eax
    mov aName[esi], al
    inc esi
    loop L2

    ; Add exit routine
    call DumpRegs   ; For debugging purposes
    call WaitMsg     ; For debugging purposes
    exit            ; Terminate the program

main ENDP
END main
