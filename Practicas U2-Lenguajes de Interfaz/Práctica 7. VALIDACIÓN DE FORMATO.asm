Materia: Lenguajes de Interfaz 
Alumno: Villalba Rodriguez Kevin Eliazar
Horario: 10-11 AM
Docente: Dr. José Luis Medina Jiménez  
Práctica 7. VALIDACIÓN DE FORMATO

INCLUDE Irvine32.inc

.data
cadena BYTE "TEC-123", 0
MsgValido BYTE "Formato valido", 0
msgInvalido BYTE "Formato Invalido", 0

.code
main PROC
    mov esi, OFFSET cadena ; ESI APUNTA AL INICIO DE LA CADENA EN MEMORIA
    mov ecx, 0 ; INICIALIZA EL CONTADOR DE CARACTERES EN 0
    
validarLetras:
    mov al, [esi] ; CARGA EL CARACTER ACTUAL APUNTADO POR ESI EN EL REGISTRO AL

    cmp al, "A"
    jb invalido ; SALTO CONDICIONAL: SI EL CARACTER ES MENOR A 'A' (ASCII), ES INVÁLIDO

    cmp al, "Z"
    ja invalido ; SALTO CONDICIONAL: SI EL CARACTER ES MAYOR A 'Z' (ASCII), ES INVÁLIDO

    inc esi ; AVANZA EL PUNTERO AL SIGUIENTE CARACTER
    inc ecx ; INCREMENTA EL CONTADOR DE LETRAS (+1)

    cmp ecx, 3 ; COMPRUEBA SI YA SE VALIDARON LAS 3 LETRAS
    jb validarLetras ; SALTO CONDICIONAL: SI FALTAN LETRAS, REPITE EL CICLO DE VALIDACIÓN

    ; Validar el guion
    mov al, [esi]
    cmp al, "-" ; COMPRUEBA SI EL CARACTER ACTUAL ES UN GUION (-)
    jne invalido ; SALTO CONDICIONAL: SI NO ES UN GUION, SALTA A "invalido"

    inc esi
    mov ecx, 0 ; REINICIA EL CONTADOR PARA LOS NÚMEROS

validarNumeros:
    mov al, [esi]

    cmp al, "0"
    jb invalido ; SALTO CONDICIONAL: SI ES MENOR A '0', ES INVÁLIDO

    cmp al, "9"
    ja invalido ; SALTO CONDICIONAL: SI ES MAYOR A '9', ES INVÁLIDO

    inc esi
    inc ecx

    cmp ecx, 3 ; VERIFICA QUE SEAN LOS DÍGITOS REQUERIDOS
    jb validarNumeros

    ; Verificar que termine la cadena
    cmp BYTE PTR [esi], 0 ; COMPRUEBA SI SE LLEGÓ AL CARACTER NULO (0) QUE DELIMITA LA CADENA
    jne invalido ; SALTO CONDICIONAL: SI HAY MÁS CARACTERES DESPUÉS, ES INVÁLIDO

valido:
    mov edx, OFFSET MsgValido
    call WriteString
    call Crlf
    jmp fin ; SALTO INCONDICIONAL A "fin" PARA EVITAR EJECUTAR EL BLOQUE DE INVÁLIDO

invalido:
    mov edx, OFFSET msgInvalido
    call WriteString
    call Crlf

fin:
    exit

main ENDP
END main