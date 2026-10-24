Materia: Lenguajes de Interfaz 
Alumno: Villalba Rodriguez Kevin Eliazar
Horario: 10-11 AM
Docente: Dr. José Luis Medina Jiménez  
Práctica 2- CAPTURA Y DESPLEGADO DE MENSAJE

INCLUDE Irvine32.inc

.data
mensajeEntrada BYTE "Escribe tu nombre: ", 0
mensajeLongitud BYTE "Caracteres capturados: ", 0

nombre BYTE 30 DUP(0) ; RESERVA 30 BYTES EN MEMORIA  PARA EL NOMBRE
longitud DWORD ? ; VARIABLE DE 32 BITS SIN INICIALIZAR PARA LA CANTIDAD DE CARACTERES

.code
main PROC

    ; Mostrar mensaje de entrada
    mov edx, OFFSET mensajeEntrada
    call WriteString

    ; Capturar el nombre
    mov edx, OFFSET nombre ; EDX APUNTA AL BUFFER DONDE SE GUARDARÁ EL TEXTO
    mov ecx, SIZEOF nombre ; ECX DEFINE EL LÍMITE MÁXIMO DE CARACTERES A LEER (30 BYTES)
    call ReadString ; LEE EL TEXTO DE CONSOLA Y DEVUELVE EN EAX LA CANTIDAD DE CARACTERES LEÍDOS

    ; Guardar la cantidad de caracteres
    mov longitud, eax ; GUARDA LA LONGITUD RETORNADA POR READSTRING EN LA VARIABLE LONGITUD
    call Crlf

    ; Mostrar el nombre capturado
    mov edx, OFFSET nombre
    call WriteString
    call Crlf

    ; Mostrar mensaje de longitud
    mov edx, OFFSET mensajeLongitud
    call WriteString

    ; Mostrar cantidad de caracteres
    mov eax, longitud ; CARGA EN EAX EL NÚMERO DE CARACTERES PARA PODER DESPLEGARLO
    call WriteDec ; DESPLIEGA EL VALOR NUMÉRICO DE EAX EN PANTALLA

    exit

main ENDP
END main