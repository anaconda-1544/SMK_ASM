INCLUDE Irvine32.inc

.data
    x DWORD 10          ; ���� ���� x
    y DWORD 2           ; ������ ���� y

.code
main PROC
    ; x�� eax �������Ϳ� �ε�
    mov eax, x
    ; y�� ebx �������Ϳ� �ε�
    mov ebx, y

    ; edx �������͸� 0���� �ʱ�ȭ
    xor edx, edx

    ; eax�� ebx�� ����
    div ebx

    ; ������ ����� �� eax�� ���
    ; ���� ����ϱ� ���� WriteDec �Լ� ȣ��
    invoke WriteDec, eax
    invoke Crlf           ; �� �ٲ�

    ; ���α׷� ����
    invoke ExitProcess, 0

main ENDP
END main
