Materia: Lenguajes de Interfaz 
Alumno: Villalba Rodriguez Kevin Eliazar
Horario: 10-11 AM
Docente: Dr. José Luis Medina Jiménez  
Práctica 4.1. MAYOR, MENOR O IGUAL CON ENTRADA DEL USUARIO

INCLUDE Irvine32.inc

.data
msgNum1 BYTE "Ingresa el primer numero: ", 0
msgNum2 BYTE "Ingresa el segundo numero: ", 0

msgMayor BYTE "El primer numero es mayor", 0
msgMenor BYTE "El primer numero es menor", 0
msgIguales BYTE "Los numeros son iguales", 0

num1 DWORD ?
num2 DWORD ?

.code
main PROC

    ; Pedir el primer numero
    mov edx, OFFSET msgNum1
    call WriteString
    call ReadInt ; LEE UN ENTERO CON SIGNO DESDE CONSOLA Y LO GUARDA EN EAX
    mov num1, eax

    ; Pedir el segundo numero
    mov edx, OFFSET msgNum2
    call WriteString
    call ReadInt
    mov num2, eax

    ; Comparar los dos numeros
    mov eax, num1
    mov ebx, num2

    cmp eax, ebx ; COMPARA EAX CONTRA EBX Y ACTUALIZA LAS BANDERAS

    jg mayor ; SALTO CONDICIONAL: SI EAX ES MAYOR A EBX , SALTA A "mayor"
    jl menor ; SALTO CONDICIONAL: SI EAX ES MENOR A EBX , SALTA A "menor"
    je iguales ; SALTO CONDICIONAL: SI SON IGUALES , SALTA A "iguales"

iguales:
    mov edx, OFFSET msgIguales
    call WriteString
    jmp fin ; SALTO INCONDICIONAL A "fin" PARA EVITAR EJECUTAR LOS OTROS BLOQUES

mayor:
    mov edx, OFFSET msgMayor
    call WriteString
    jmp fin

menor:
    mov edx, OFFSET msgMenor
    call WriteString

fin:
    call Crlf
    exit

main ENDP
END main