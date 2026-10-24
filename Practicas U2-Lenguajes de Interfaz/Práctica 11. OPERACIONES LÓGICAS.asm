Materia: Lenguajes de Interfaz 
Alumno: Villalba Rodriguez Kevin Eliazar
Horario: 10-11 AM
Docente: Dr. José Luis Medina Jiménez  
Práctica 11. OPERACIONES LÓGICAS

INCLUDE Irvine32.inc

.code
main PROC
     ; 0 - Encendido de computadora
     ; 1 - Alarma
     ; 2 - Conectado
     ; Estado inicial: 00000101

     ; 1 - AND: EXTRAER EL ESTADO DE ENCENDIDO
     mov eax, 0
     mov ebx, 0
     mov al, 00000101b
     mov bl, al
     and bl, 00000111b ; APLICA UNA MÁSCARA AND PARA AISLAR Y CONSERVAR ÚNICAMENTE LOS PRIMEROS 3 BITS

     call DumpRegs
     nop


     ; 2 - OR: ENCENDER LA ALARMA
     mov al, 00000101b
     or al, 00000010b ; APLICA OR PARA FORZAR A 1 EL BIT 1 (ENCENDER ALARMA) SIN ALTERAR LOS DEMÁS BITS

     call DumpRegs
     nop


     ; 3 - XOR: CAMBIAR EL ESTADO DE CONECTADO
     mov al, 00000101b
     xor al, 00000100b ; APLICA XOR PARA INVERTIR EL BIT 2 (SI ESTÁ EN 1 PASA A 0, Y VICEVERSA)

     call DumpRegs
     nop


     ; 4 - NOT: INVERTIR ESTADOS
     mov al, 00000101b
     not al ; INVIERTE TODOS LOS BITS DEL REGISTRO (1 PASA A 0 Y 0 PASA A 1, COMPLEMENTO A 1)

     call DumpRegs
     nop


     ; 5 - TEST: EVALUAR ALARMA Y REALIZAR SALTO
     mov al, 00000101b
     test al, 00000010b ; OPERACIÓN AND LÓGICA SIN GUARDAR EL RESULTADO; EVALÚA SI EL BIT 1 ESTÁ ACTIVO

     jz alarmaApagada ; SALTO CONDICIONAL: SI EL RESULTADO FUE 0 (ZERO FLAG = 1), LA ALARMA ESTÁ APAGADA

     ; SI LA ALARMA ESTA ENCENDIDA
     mov ebx, 1
     jmp finTest ; SALTO INCONDICIONAL PARA EVITAR EL BLOQUE DE ALARMA APAGADA

alarmaApagada:
     ; SI LA ALARMA ESTA APAGADA
     mov ebx, 0

finTest:
     call DumpRegs
     nop

     exit

main ENDP

END main