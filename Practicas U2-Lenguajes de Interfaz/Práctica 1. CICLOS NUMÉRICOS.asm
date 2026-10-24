Materia: Lenguajes de Interfaz 
Alumno: Villalba Rodriguez Kevin Eliazar
Horario: 10-11 AM
Docente: Dr. José Luis Medina Jiménez  
Práctica 1. CICLOS NUMÉRICOS

INCLUDE Irvine32.inc 

.data
mensaje BYTE "Hola, mundo: ", 0 ; DECLARACIÓN DE LA CADENA DE TEXTO FINALIZADA EN NULO (0)

.code
main PROC
 mov ecx, 5 ; CARGA EL CONTADOR ECX CON 5 (NÚMERO DE REPETICIONES DEL CICLO)

 ciclo:
  mov edx, OFFSET mensaje ; CARGA LA DIRECCIÓN DE MEMORIA DEL MENSAJE EN EDX
   call writeString ; DESPLIEGA EN CONSOLA LA CADENA APUNTADA POR EDX
   call crlf ; REALIZA UN SALTO DE LÍNEA EN CONSOLA 
   loop ciclo ; DECREMENTA ECX EN 1 Y SALTA A "ciclo" SI ECX ES MAYOR A 0 

   exit 
main ENDP 

END main