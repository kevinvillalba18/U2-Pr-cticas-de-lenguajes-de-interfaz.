Materia: Lenguajes de Interfaz 
Alumno: Villalba Rodriguez Kevin Eliazar
Horario: 10-11 AM
Docente: Dr. José Luis Medina Jiménez  
Práctica 6.1. CONTROL DE OCUPACIÓN DE UN ESTACIONAMIENTO

INCLUDE Irvine32.inc

.data
msgMenu BYTE "1. Entrada de carro", 0
msgSalida BYTE "2. Salida de carro", 0
msgOcupacion BYTE "Carros estacionados: ", 0
msgEntrada BYTE "Un carro ha entrado", 0
msgSalio BYTE "Un carro ha salido", 0
msgVacio BYTE "El estacionamiento esta vacio", 0
msgLleno BYTE "ESTACIONAMIENTO LLENO", 0
msgOpcion BYTE "Seleccione una opcion: ", 0
msgError BYTE "Opcion no valida", 0

carros DWORD 0 ; CONTADOR DE VEHÍCULOS ACTUALMENTE ESTACIONADOS

.code
main PROC

ciclo:
    ; Mostrar ocupacion actual
    mov edx, OFFSET msgOcupacion
    call WriteString
    mov eax, carros
    call WriteDec
    call Crlf

    ; Verificar capacidad maxima
    cmp carros, 20 ; COMPARA LA CANTIDAD DE CARROS CONTRA EL LÍMITE MÁXIMO (20)
    je lleno ; SALTO CONDICIONAL: SI LLEGA A 20 , SALTA A "lleno" Y TERMINA

    ; Mostrar menu
    mov edx, OFFSET msgMenu
    call WriteString
    call Crlf

    mov edx, OFFSET msgSalida
    call WriteString
    call Crlf

    mov edx, OFFSET msgOpcion
    call WriteString
    call ReadInt ; LEE LA OPCIÓN DEL MENÚ SELECCIONADA POR EL USUARIO (1 O 2)

    cmp eax, 1 ; COMPARA SI LA OPCIÓN INGRESADA ES 1
    je entrada ; SALTO CONDICIONAL: SI ES 1, SALTA A LA ETIQUETA "entrada"

    cmp eax, 2 ; COMPARA SI LA OPCIÓN INGRESADA ES 2
    je salida ; SALTO CONDICIONAL: SI ES 2, SALTA A LA ETIQUETA "salida"

    mov edx, OFFSET msgError
    call WriteString
    call Crlf
    jmp ciclo ; SALTO INCONDICIONAL: REGRESA AL INICIO SI LA OPCIÓN NO ES VÁLIDA

entrada:
    inc carros ; INCREMENTA EN +1 EL CONTADOR DE CARROS ESTACIONADOS

    mov edx, OFFSET msgEntrada
    call WriteString
    call Crlf
    jmp ciclo

salida:
    cmp carros, 0 ; VERIFICA SI HAY CARROS PARA RETIRAR (SI CARROS = 0)
    je vacio ; SALTO CONDICIONAL: SI ESTÁ VACÍO, SALTA A "vacio" SIN DECREMENTAR

    dec carros ; DECREMENTA EN -1 EL CONTADOR DE CARROS ESTACIONADOS

    mov edx, OFFSET msgSalio
    call WriteString
    call Crlf
    jmp ciclo

vacio:
    mov edx, OFFSET msgVacio
    call WriteString
    call Crlf
    jmp ciclo

lleno:
    mov edx, OFFSET msgLleno
    call WriteString
    call Crlf

    exit

main ENDP
END main