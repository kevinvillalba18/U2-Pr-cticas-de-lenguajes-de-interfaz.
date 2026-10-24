Materia: Lenguajes de Interfaz 
Alumno: Villalba Rodriguez Kevin Eliazar
Horario: 10-11 AM
Docente: Dr. José Luis Medina Jiménez  
Práctica 12. DESPLAZAMIENTO Y ROTACIÓN

INCLUDE Irvine32.inc

.code
main PROC
  mov eax, 0
  mov ebx, 0
  mov ecx, 0
  mov edx, 0


  ; 1 - SHL: DESPLAZAR UNA POSICION A LA IZQUIERDA
  mov al, 10000000b
  shl al, 1 ; DESPLAZA LOS BITS A LA IZQUIERDA 1 POSICIÓN 

  call DumpRegs
  call WriteBin
  call Crlf


  ; 2 - SHR: DESPLAZAR UNA POSICION A LA DERECHA
  mov al, 00001101b
  shr al, 1 ; DESPLAZA A LA DERECHA 

  call DumpRegs
  call WriteBin
  call Crlf


  ; 3 - SAR: CONSERVAR EL SIGNO
  mov al, -8
  sar al, 1 ; DESPLAZA A LA DERECHA 

  call DumpRegs
  call WriteBin
  call Crlf


  ; 4 - SAR: CON OPERACIONES NO EXACTAS
  mov al, -9
  sar al, 1 ; DESPLAZA A LA DERECHA 

  call DumpRegs
  call WriteBin
  call Crlf


  ; 5 - CONTEO: DESPLAZAR 2 BITS A LA IZQUIERDA
  mov al, 00001111b
  shl al, 2 ; DESPLAZA 2 POSICIONES A LA IZQUIERDA (EQUIVALE A MULTIPLICAR POR 4)

  call DumpRegs
  call WriteBin
  call Crlf


  ; 6 - DESPLAZAR 2 BITS A LA DERECHA UTILIZANDO CL
  mov al, 00001111b
  mov cl, 2 ; CARGA EL NÚMERO DE DESPLAZAMIENTOS EN EL REGISTRO CL
  shr al, cl ; DESPLAZA A LA DERECHA TANTAS VECES COMO INDIQUE CL

  call DumpRegs
  call WriteBin
  call Crlf


  ; 7 - ROR: ROTAR BITS A LA DERECHA
  mov al, 10000001b
  ror al, 1 ; ROTA LOS BITS A LA DERECHA 
  call DumpRegs
  call WriteBin
  call Crlf


  ; 8 - ROL: ROTAR BITS A LA IZQUIERDA
  mov al, 10000001b
  rol al, 1 ; ROTA LOS BITS A LA IZQUIERDA 

  call DumpRegs
  call WriteBin
  call Crlf


  ; 9 - RCL: ROTAR A LA IZQUIERDA CON ACARREO
  clc ; LIMPIA EL CARRY FLAG (CF = 0)
  mov al, 10000001b
  rcl al, 1 ; ROTA A LA IZQUIERDA INCLUYENDO EL CARRY FLAG COMO BIT ADICIONAL (ROTA A TRAVÉS DE 9 BITS)

  call DumpRegs
  call WriteBin
  call Crlf


  ; 10 - RCR: ROTAR A LA DERECHA CON ACARREO
  clc 
  mov al, 10000001b
  rcr al, 1 ; ROTA A LA DERECHA INCLUYENDO EL CARRY FLAG COMO BIT ADICIONAL

  call DumpRegs
  call WriteBin
  call Crlf


  exit

main ENDP

END main