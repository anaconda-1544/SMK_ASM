INCLUDE Irvine32.inc

.data
    x DWORD 10          ; 나눌 숫자 x
    y DWORD 2           ; 나누는 숫자 y

.code
main PROC
    ; x를 eax 레지스터에 로드
    mov eax, x
    ; y를 ebx 레지스터에 로드
    mov ebx, y

    ; edx 레지스터를 0으로 초기화
    xor edx, edx

    ; eax를 ebx로 나눔
    div ebx

    ; 나눗셈 결과인 몫 eax를 출력
    ; 몫을 출력하기 위해 WriteDec 함수 호출
    invoke WriteDec, eax
    invoke Crlf           ; 줄 바꿈

    ; 프로그램 종료
    invoke ExitProcess, 0

main ENDP
END main
