Materia: Lenguajes de Interfaz 
Alumno: Villalba Rodriguez Kevin Eliazar
Horario: 10-11 AM
Docente: Dr. José Luis Medina Jiménez  
Práctica 5.1. REPETIR HASTA QUE EL USUARIO INGRESE CERO

INCLUDE Irvine32.inc

.data
msgNumero BYTE "Ingresa un numero: ", 0
msgPositivo BYTE "El numero es positivo", 0
msgNegativo BYTE "El numero es negativo", 0
msgSalir BYTE "Programa finalizado", 0

.code
main PROC

ciclo:
    ; Pedir un numero al usuario
    mov edx, OFFSET msgNumero
    call WriteString
    call ReadInt ; LEE EL NÚMERO INGRESADO Y LO ALMACENA EN EAX

    cmp eax, 0 ; COMPARA EL NÚMERO INGRESADO CONTRA CERO

    je fin ; SALTO CONDICIONAL: SI EAX ES 0 , SALTA A "fin" PARA TERMINAR
    jg positivo ; SALTO CONDICIONAL: SI EAX ES MAYOR A 0 , SALTA A "positivo"
    jl negativo ; SALTO CONDICIONAL: SI EAX ES MENOR A 0 , SALTA A "negativo"

positivo:
    mov edx, OFFSET msgPositivo
    call WriteString
    call Crlf
    jmp ciclo ; SALTO INCONDICIONAL: REGRESA AL INICIO DEL CICLO PARA PEDIR OTRO NÚMERO

negativo:
    mov edx, OFFSET msgNegativo
    call WriteString
    call Crlf
    jmp ciclo 

fin:
    mov edx, OFFSET msgSalir
    call WriteString
    call Crlf

    exit

main ENDP
END main