TITLE Project5-1
INCLUDE Irvine32.inc

.data
	aName BYTE "MY NAME",0
	nameSize = ($ - aName) - 1

.code
main PROC

	mov ecx, nameSize
	mov esi, 0
		
L1:
	movzx eax, aName[esi]
	push eax
	inc esi
	loop L1

	mov ecx, nameSize
	mov esi, 0

L2:
	pop eax
	mov aName[esi], al
	inc esi
	loop L2

exit
main ENDP
END main