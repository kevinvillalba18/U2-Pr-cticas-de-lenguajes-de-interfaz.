Materia: Lenguajes de Interfaz 
Alumno: Villalba Rodriguez Kevin Eliazar
Horario: 10-11 AM
Docente: Dr. José Luis Medina Jiménez  
Práctica 8. OPERACIONES ARITMÉTICAS

INCLUDE Irvine32.inc

.code
main PROC
; 1. ADD Y SUB : OPERACIONES DE SUMA Y RESTA

mov eax, 50
mov ebx, 20

add eax , ebx ; SUMA EBX A EAX
sub eax, 15  ; RESTA 15 A EAX 

nop

;2. CF ACARREO EN UNA SUMA SIN SIGNO

mov eax, 0
mov al, 255

add al, 1 ; DESBORDAMIENTO SIN SIGNO EN 8 BITS REBASA EL LÍMITE Y ACTIVA CARRY FLAG CF = 1)

call dumpRegs 
nop

; 3. DESBORDAMIENTO EN SUMA CON SIGNO

mov eax , 0
mov al, 127

add al, 1 ; DESBORDAMIENTO CON SIGNO EN 8 BITS EXCEDE EL RANGO MÁXIMO CON SIGNO Y ACTIVA OVERFLOW FLAG OF = 1)

nop


;4. PRODUCTO DE VALORES DENTRO DE 32 BITS SIN SIGNO

mov eax, 25
mov ebx, 3 

mul ebx ; MULTIPLICA EAX * EBX SIN SIGNO  Y ALMACENA EL RESULTADO EN EAX

nop


; 5. IMUL: PRODUCTO DE VALORES CON SIGNO DENTRO DE 32 BITS

mov eax, -5

imul eax, eax, 3 

; 6. MUL: PRODUCTOS DE VALORES QUE EXCEDEN 32 BITS

mov eax, 65537
mov ebx, 65537

mul ebx ; MULTIPLICA EAX * EBX 
nop

; DIV DIVISIÓN DE NÚMERO SIN SIGNO 

mov eax, 125 
mov edx, 0 ; LIMPIA EDX
mov ebx, 12 

div ebx ; DIVIDE EDX:EAX ENTRE EBX RESULTADO EN EAX (10) Y RESIDUO EN EDX (5)

nop

;IDIV : DIVISIÓN CON NÚMEROS NEGATIVOS 

mov eax, -125
cdq ; 

mov ebx, 12 

idiv ebx 

nop
exit
main ENDP 

END main