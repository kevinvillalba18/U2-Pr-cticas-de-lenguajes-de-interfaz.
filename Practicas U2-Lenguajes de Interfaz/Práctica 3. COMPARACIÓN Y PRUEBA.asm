Materia: Lenguajes de Interfaz 
Alumno: Villalba Rodriguez Kevin Eliazar
Horario: 10-11 AM
Docente: Dr. José Luis Medina Jiménez  
Práctica 3. COMPARACIÓN Y PRUEBA

INCLUDE Irvine32.inc

.code
main PROC

; CONDICION 1: ZERO FLAG (ZF)
   mov EBX, 1
   cmp EBX, 1 ; AL RESTAR 1 - 1 EL RESULTADO ES 0 ACTIVA ZERO FLAG (ZF = 1)
   call dumpRegs

   mov EAX, 01h
   cmp EAX, EBX 
   call dumpRegs 

   mov cl, 11111111b
   cmp cl, cl
   call dumpRegs 

   ; CONDICION 2: SIGN FLAG (SF)
   mov EAX, 0
   mov EBX, 0

   mov al, -5
   mov bl, 1
   cmp al, bl ; COMPARA -5 CON 1 (AL RESTAR DA RESULTADO NEGATIVO) ACTIVA SIGN FLAG (SF = 1)
   call dumpRegs 

   ; CONDICION 3: CARRY FLAG (CF)
   mov EAX, 0
   mov EBX, 0

   mov al, 255
   add al, 1 ; DESBORDAMIENTO SIN SIGNO EN 8 BITS (255 + 1 = 256 -> REBASA EL LÍMITE DE 8 BITS) ACTIVA CARRY FLAG (CF = 1)
   call dumpRegs 

   ; CONDICION 4: OVERFLOW FLAG (OF)
   mov EAX, 0
   mov EBX, 0

   mov al, -128
   mov bl, 1
   cmp al, bl ; DESBORDAMIENTO CON SIGNO EN 8 BITS (-128 - 1 = -129 FUERA DEL RANGO CON SIGNO DE -128 A 127) ACTIVA OVERFLOW FLAG (OF = 1)
   call dumpRegs

   ; CASO 5: TEST (OPERACIÓN LÓGICA AND BIT A BIT)
   mov EAX, 0
   mov EAX, 5; 00000101b
   test EAX, 1 ; OPERACIÓN AND BIT A BIT (00000101b AND 00000001b = 1) EVALÚA SI EL ÚLTIMO BIT ESTÁ ACTIVO
   call dumpRegs 

   mov eax, 0
   mov al, 10000000b
   test al, al ; EVALÚA EL BIT DE MAYOR PESO (BIT DE SIGNO 1) ACTIVA SIGN FLAG (SF = 1)
   call dumpRegs

main ENDP 

END main