Materia: Lenguajes de Interfaz 
Alumno: Villalba Rodriguez Kevin Eliazar
Horario: 10-11 AM
Docente: Dr. José Luis Medina Jiménez  
Práctica 15. MANIPULACIÓN DE ARCHIVOS

INCLUDE Irvine32.inc

.data
nombreArchivo BYTE "Inventario.txt", 0
texto BYTE "125", 0
archivoHandle DWORD ?

mensajeExito BYTE "Archivo guardado", 0
mensajeError BYTE "No se guardo el archivo correctamente", 0

.code
main PROC

    ; 1. CREAR EL ARCHIVO
    mov edx, OFFSET nombreArchivo ; EDX APUNTA AL NOMBRE DEL ARCHIVO A CREAR
    call CreateOutputFile ; CREA/SOBREESCRIBE EL ARCHIVO Y DEVUELVE EL MANIPULADOR (HANDLE) EN EAX

    cmp eax, INVALID_HANDLE_VALUE ; VERIFICA SI HUBO ERROR AL CREAR EL ARCHIVO
    je error ; SALTO CONDICIONAL: SI EL HANDLE ES INVALIDO, SALTA A "error"

    mov archivoHandle, eax ; GUARDA EL HANDLE DEL ARCHIVO ABIERTO EN LA VARIABLE

    ; 2. Escribir el texto ("125")
    mov eax, archivoHandle ; CARGA EL HANDLE DEL ARCHIVO EN EAX
    mov edx, OFFSET texto ; EDX APUNTA AL TEXTO A ESCRIBIR
    mov ecx, SIZEOF texto - 1 ; ECX DEFINE LA CANTIDAD DE BYTES A ESCRIBIR (EXCLUYE EL CARACTER NULO)
    call WriteToFile ; ESCRIBE EN EL ARCHIVO Y DEVUELVE EN EAX LA CANTIDAD DE BYTES ESCRITOS

    jc errorEscritura ; SALTO CONDICIONAL: SI SE ACTIVA CARRY FLAG (CF = 1), OCURRIÓ UN ERROR DE ESCRITURA

    cmp eax, SIZEOF texto - 1 ; VERIFICA SI SE ESCRIBIERON TODOS LOS BYTES SOLICITADOS
    jne errorEscritura ; SALTO CONDICIONAL: SI LOS BYTES ESCRITOS NO COINCIDEN, SALTA A "errorEscritura"

    ; 3. Cerrar archivo txt
    mov eax, archivoHandle
    call CloseFile ; CIERRA EL ARCHIVO Y LIBERA EL HANDLE (DEVUELVE UN VALOR DISTINTO DE CERO SI TUVO ÉXITO)

    test eax, eax ; EVALÚA SI LA FUNCIÓN CLOSEFILE RETORNÓ CERO (ERROR)
    jz error ; SALTO CONDICIONAL: SI RETORNÓ CERO (ZERO FLAG = 1), SALTA A "error"

    mov edx, OFFSET mensajeExito
    call WriteString
    jmp fin ; SALTO INCONDICIONAL PARA TERMINAR EL PROGRAMA EXITOSAMENTE

errorEscritura:
    mov eax, archivoHandle
    call CloseFile ; CIERRA EL ARCHIVO ANTES DE SALIR POR ERROR DE ESCRITURA

error:
    mov edx, OFFSET mensajeError
    call WriteString

fin:
    exit

main ENDP

END main