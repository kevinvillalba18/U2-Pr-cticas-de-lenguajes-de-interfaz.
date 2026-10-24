Materia: Lenguajes de Interfaz 
Alumno: Villalba Rodriguez Kevin Eliazar
Horario: 10-11 AM
Docente: Dr. José Luis Medina Jiménez  
Práctica 13. OBTENCIÓN DE UNA CADENA HEXADECIMALl

INCLUDE Irvine32.inc

.data
cadena BYTE "123AB4CD", 0
numero DWORD 0

.code
main PROC

    mov esi, 0 ; INDICE PARA RECORRER LA CADENA CARACTER POR CARACTER
    mov ecx, 8 ; CONTADOR DE ITERACIONES (SE PROCESARÁN 8 CARACTERES HEXADECIMALES)
    mov eax, 0 ; LIMPIA EAX PARA ACUMULAR EL RESULTADO NUMÉRICO FINAL

L1:
    shl eax, 4 ; DESPLAZA 4 BITS A LA IZQUIERDA PARA HACER ESPACIO AL SIGUIENTE DÍGITO HEXADECIMAL

    mov bl, cadena[esi] ; OBTIENE EL CARACTER ACTUAL EN CÓDIGO ASCII

    cmp bl, '9'
    jbe Digito ; SALTO CONDICIONAL: SI EL CARACTER ES UN DÍGITO ('0'-'9'), SALTA DIRECTO A Digito

    sub bl, 7 ; SI ES LETRA ('A'-'F'), RESTA 7 PARA AJUSTAR LA DISTANCIA ASCII ENTRE '9' Y 'A'

Digito:
    sub bl, '0' ; CONVIERTE EL CARACTER ASCII A SU VALOR NUMÉRICO REAL (0-15)

    movzx ebx, bl ; EXTIENDE EL VALOR CON ZEROS DESDE BL HACIA EBX
    add eax, ebx ; SUMA EL DÍGITO CONVERTIDO AL ACUMULADOR EN EAX

    inc esi ; AVANZA AL SIGUIENTE CARACTER DE LA CADENA

    loop L1 ; DECREMENTA ECX Y REPITE EL CICLO SI ECX > 0

    mov numero, eax ; GUARDA EL VALOR HEXADECIMAL FINALMENTE CONVERTIDO EN LA VARIABLE

    call DumpRegs

    mov eax, numero
    call WriteHex ; MUESTRA EL VALOR CONVERTIDO EN FORMATO HEXADECIMAL POR CONSOLA

    call Crlf

    exit

main ENDP

END main




