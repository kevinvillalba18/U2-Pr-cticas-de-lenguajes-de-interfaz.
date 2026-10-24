Materia: Lenguajes de Interfaz 
Alumno: Villalba Rodriguez Kevin Eliazar
Horario: 10-11 AM
Docente: Dr. José Luis Medina Jiménez  
Práctica 9. PUSH Y POP

INCLUDE Irvine32.inc

.code
main PROC
mov eax, 20

push eax 

nop

mov ebx, 0

pop ebx  

;BLOQUE 2: ORDEN LIFO

mov eax, 10		;ESP + 8
push eax

mov eax, 20		;ESP + 4
push eax

mov eax,30		;ESP
push eax 
   
   nop

   pop eax
   pop ebx
   pop ecx

;BLOQUE 3 : CONSERVAR REGISTROS

mov eax, 100
mov ebx, 200

push eax
push ebx

mov eax, 999
mov ebx, 666


pop ebx
pop eax
   exit
main ENDP 

END main 