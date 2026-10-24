Materia: Lenguajes de Interfaz 
Alumno: Villalba Rodriguez Kevin Eliazar
Horario: 10-11 AM
Docente: Dr. José Luis Medina Jiménez  
Práctica 14. CAPTURA Y ALMACENAMIENTO DE DATOS NUMÉRICOS

INCLUDE Irvine32.inc

.data
mensaje BYTE "Ingrese la cantidad de ESP32 recibidas (1-99): ", 0
mensajeError BYTE "Error: ingrese un numero entre 1 y 99.", 0
mensajeFinal BYTE "Existencia actual: ", 0
mensajeUnidades BYTE " unidades", 0

cadena BYTE 10 DUP(0)
cadenaSalida BYTE 12 DUP(0)

cantidadRecibida DWORD 0
existenciaActual DWORD 25 ; STOCK INICIAL DEL INVENTARIO

.code
main PROC

Capturar:
    ; Capturar la cantidad como cadena
    mov edx, OFFSET mensaje
    call WriteString

    mov edx, OFFSET cadena
    mov ecx, SIZEOF cadena - 1
    call ReadString ; LEE EL TEXTO DE CONSOLA Y DEVUELVE LA LONGITUD EN EAX

    ; Validar longitud de 1 o 2 digitos
    cmp eax, 1
    jb Error ; SALTO CONDICIONAL: SI NO INGRESÓ NADA (EAX < 1), SALTA A "Error"
    cmp eax, 2
    ja Error ; SALTO CONDICIONAL: SI INGRESÓ MÁS DE 2 CARACTERES (EAX > 2), SALTA A "Error"

    mov ecx, eax ; CARGA EL NÚMERO DE CARACTERES COMO CONTADOR DEL CICLO
    mov esi, OFFSET cadena ; ESI APUNTA AL INICIO DE LA CADENA INGRESADA
    mov eax, 0 ; LIMPIA EAX PARA ACUMULAR EL RESULTADO NUMÉRICO

Convertir:
    ; Revisar que cada caracter sea un digito
    movzx ebx, BYTE PTR [esi]

    cmp bl, '0'
    jb Error ; VERIFICA QUE EL CARACTER NO SEA MENOR AL CÓDIGO ASCII DE '0'
    cmp bl, '9'
    ja Error ; VERIFICA QUE EL CARACTER NO SEA MAYOR AL CÓDIGO ASCII DE '9'

    ; Convertir ASCII a numero decimal
    sub ebx, '0' ; CONVIERTE EL CARACTER ASCII A SU VALOR ENTERO REAL (0-9)
    imul eax, eax, 10 ; MULTIPLICA EL ACUMULADOR POR 10 PARA REPOSICIONAR LAS DECENAS
    add eax, ebx ; SUMA EL NUEVO DÍGITO AL TOTAL

    inc esi ; AVANZA AL SIGUIENTE CARACTER
    loop Convertir ; DECREMENTA ECX Y REPITE EL CICLO PARA EL SIGUIENTE DÍGITO

    ; Validar rango de 1 a 99
    cmp eax, 1
    jb Error ; SALTO CONDICIONAL: SI EL NÚMERO CONVERTIDO ES MENOR A 1, SALTA A "Error"
    cmp eax, 99
    ja Error ; SALTO CONDICIONAL: SI EL NÚMERO CONVERTIDO ES MAYOR A 99, SALTA A "Error"

    ; Guardar cantidad recibida
    mov cantidadRecibida, eax

    ; Sumar a las 25 unidades iniciales
    add eax, existenciaActual ; SUMA LA CANTIDAD RECIBIDA A LA EXISTENCIA ACTUAL
    mov existenciaActual, eax

    ; Mostrar existencia actual
    mov edx, OFFSET mensajeFinal
    call WriteString

    mov eax, existenciaActual
    mov edi, OFFSET cadenaSalida
    call ConvertirDecimal ; LLAMA AL PROCEDIMIENTO QUE CONVIERTE EL TOTAL A TEXTO ASCII

    mov edx, OFFSET cadenaSalida
    call WriteString

    mov edx, OFFSET mensajeUnidades
    call WriteString
    call Crlf

    jmp Salir ; SALTO INCONDICIONAL PARA ENVIAR EL PROGRAMA A LA SALIDA

Error:
    mov edx, OFFSET mensajeError
    call WriteString
    call Crlf
    jmp Capturar ; REGRESA AL INICIO DEL BLOQUE "Capturar" PARA VOLVER A PEDIR EL DATO

Salir:
    exit

main ENDP

; Convertir numero decimal a cadena
ConvertirDecimal PROC
    push eax ; RESPALDA REGISTROS EN LA PILA
    push ebx
    push ecx
    push edx
    push edi

    mov ebx, 10
    mov ecx, 0 ; CONTADOR DE DÍGITOS GENERADOS

Dividir:
    mov edx, 0 ; LIMPIA EDX PARA REALIZAR LA DIVISIÓN DE 32 BITS
    div ebx ; DIVIDE EAX ENTRE 10 (EAX = COCIENTE, EDX = RESIDUO/DÍGITO)
    add dl, '0' ; CONVIERTE EL DÍGITO ENTERO EN SU REPRESENTACIÓN ASCII
    push edx ; GUARDA EL DÍGITO ASCII EN LA PILA PARA INVERTIR EL ORDEN DESPUÉS
    inc ecx

    cmp eax, 0
    jne Dividir ; REPITE HASTA QUE EL COCIENTE SEA CERO

Guardar:
    pop eax ; RECUPERA LOS DÍGITOS EN ORDEN CORRECTO (DEL MÁS SIGNIFICATIVO AL MENOS)
    mov [edi], al ; ESCRIBE EL CARACTER EN EL BUFFER DE SALIDA (EDI)
    inc edi
    loop Guardar ; REPITE SEGÚN EL NÚMERO DE DÍGITOS EXTRAÍDOS (ECX)

    mov BYTE PTR [edi], 0 ; GUARDA EL TERMINADOR NULO AL FINAL DE LA CADENA

    pop edi ; RESTAURA REGISTROS
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
ConvertirDecimal ENDP

END main