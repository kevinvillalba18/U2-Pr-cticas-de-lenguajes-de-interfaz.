Materia: Lenguajes de Interfaz 
Alumno: Villalba Rodriguez Kevin Eliazar
Horario: 10-11 AM
Docente: Dr. José Luis Medina Jiménez  
Práctica 5. CONDICIONALES

INCLUDE Irvine32.inc

.code
main PROC
mov ebx, 1; VALOR INICIAL DE LA CONDICIÓN 

ciclo:
cmp ebx, 100 ; COMPARA PARA EJECUTAR LA CONDICIÓN DE SALIDA

jg fin; SALTA A LA ETIQUETA FIN PARA TERMINAR EL PROGRAMA SIEMPRE Y CUANDO SE CUMPLA LA CONDICIÓN 

mov eax, ebx
call WriteDec ; DESPLIEGA EN CONSOLA EL VALOR ALMACENADO EN EAX 
Call crlf ; SALTO DE LÍNEA

Inc ebx ; INCREMENTO DE +1 EN EL REGISTRO EBX
Jmp ciclo ; REGRESA AL CICLO WHILE 


fin: 
Exit


main ENDP 

END main 