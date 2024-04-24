Title Testing the Link Library
; Testing the Irvine32 Library.
INCLUDE Irvine32.inc
CR = 0Dh          ; carriage return
LF = 0Ah          ; line feed


.data
str1 BYTE "Generating 20 random integers between 0 and 990:", CR, LF, 0
str2 BYTE "Enter a 32-bit signed integer: ", 0
str3 BYTE "Enter your name: ", 0
str4 BYTE "The following key was pressed: ", 0
str5 BYTE "Displaying the registers: ", CR, LF, 0
str6 BYTE "Hello, ", 0

buffer BYTE 50 dup(0)
dwordVal DWORD ?


.code
main PROC
    ; Set text color to black text on white background:
    mov eax, black + (white * 16)
    call SetTextColor
    call Clrscr       ; clear the screen
    call Randomize    ; reset random number sequence

    ; Generate 20 random integers between 0 and 990.
    ; Include a 500 millisecond delay.
    mov edx, OFFSET str1 ; display message
    call WriteString
    mov ecx, 20     ; loop counter
    mov dh, 2       ; screen row 2
    mov di, 0       ; screen column 0

L1: call Gotoxy       ; indicate top of range + 1
    mov eax, 991    ; indicate top of range + 1
    call RandomRange ; EAX = random integer
    call WriteDec    ; display in unsigned decimal
    mov eax, 500
    call Delay       ; pause for 500 milliseconds
    inc dh           ; next screen row
    add di, 2        ; move 2 columns to the right
    Loop L1
    call Crlf        ; new line
    call WaitMsg     ; "Press [Enter] ... "
    call Clrscr      ; clear screen



    ; Input a signed decimal integer and redisplay it in various formats:
    mov edx, OFFSET str2 ; "Enter a 32-bit signed integer:..."
    call WriteString
    call ReadInt         ; input the integer
    mov dwordVal, eax    ; save in a variable
    call Crlf            ; new line
    call WriteInt        ; display in signed decimal
    call Crlf
    call WriteHex        ; display in hexadecimal
    call Crlf
    call WriteBin        ; display in binary
    call Crlf


    ; Display the CPU registers:
    call Crlf
    mov edx, OFFSET str5 ; "Displaying the registers:"
    call WriteString
    call DumpRegs         ; display registers and flags

    ; Display a memory dump:
    mov esi, OFFSET dwordVal ; mov esi, OFFSET dwordVal
    mov ecx, LENGTHOF dwordVal ; number of units in dwordVal
    mov ebx, TYPE dwordVal ; size of a doubleword
    call DumpMem           ; display memory
    call Crlf
    call WaitMsg           ; "Press [Enter] ... "

    ; Ask the user to input their name:
    call Clrscr           ; clear screen
    mov edx, OFFSET str3  ; "Enter your name: "
    call WriteString
    mov edx, OFFSET buffer ; point to the buffer
    mov ecx, SIZEOF buffer - 1 ; max. number characters
    call ReadString       ; input the name
    mov edx, OFFSET str6 ; "Hello,"
    call WriteString
    mov edx, OFFSET buffer ; display the name
    call WriteString




    exit
main ENDP
END main
