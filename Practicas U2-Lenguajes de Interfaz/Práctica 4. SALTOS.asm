Materia: Lenguajes de Interfaz 
Alumno: Villalba Rodriguez Kevin Eliazar
Horario: 10-11 AM
Docente: Dr. José Luis Medina Jiménez  
Práctica 4. SALTOS

INCLUDE Irvine32.inc

.data
msgIguales BYTE "Los valores son iguales", 0	   ; DECLARACIÓN DE LA CADENA PARA VALORES IGUALES
msgDiferentes BYTE "Los valores son diferentes", 0 ; DECLARACIÓN DE LA CADENA PARA VALORES DISTINTOS

.code
main PROC
  mov eax, 10 ; CARGA EL PRIMER VALOR A COMPARAR EN EAX
  mov ebx, 10 ; CARGA EL SEGUNDO VALOR A COMPARAR EN EBX

  cmp eax, ebx ; COMPARA EAX Y EBX (RESTA INTERNAMENTE Y MODIFICA LAS BANDERAS)

  je iguales ; SALTO CONDICIONAL: SI SON IGUALES (ZF = 1), SALTA A LA ETIQUETA "iguales"

  mov edx, OFFSET msgDiferentes ; SI NO SON IGUALES, CARGA EL MENSAJE DE DIFERENTES
  call WriteString

  jmp fin ; SALTO INCONDICIONAL A LA ETIQUETA "fin" PARA EVITAR EJECUTAR EL BLOQUE "iguales"

  iguales: 
  mov edx, OFFSET msgIguales ; CARGA EL MENSAJE DE VALORES IGUALES EN EDX
  call WriteString

fin:
call crlf
exit 
  main ENDP 

END main