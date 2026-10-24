Materia: Lenguajes de Interfaz 
Alumno: Villalba Rodriguez Kevin Eliazar
Horario: 10-11 AM
Docente: Dr. José Luis Medina Jiménez  
Práctica 6. DECREMENTO E INCREMENTO

INCLUDE Irvine32.inc

.data
    msgPIN BYTE "Ingrese eL PIN: ", 0
    msgIntentos BYTE "Intentos restantes: ", 0
    msgError BYTE "PIN incorrecto", 0
    msgAcceso BYTE "ACCESO PERMITIDO", 0
    msgBloqueado BYTE "ACCESO BLOQUEADO", 0

    pinCorrecto = 1234 ; CONSTANTEPARA EL PIN CORRECTO

.code
main PROC
   mov ebx, 3 ; INICIALIZA EL CONTADOR DE INTENTOS PERMITIDOS EN EBX

 intentar:
  mov edx, OFFSET msgPIN 
   call WriteString
   call ReadInt ; LEE EL PIN INGRESADO POR EL USUARIO Y LO GUARDA EN EAX

   cmp eax, pinCorrecto ; COMPARA EL PIN INGRESADO CONTRA EL PIN CORRECTO
   je acceso ; SALTO CONDICIONAL: SI SON IGUALES , SALTA A LA ETIQUETA "acceso"
   
   mov edx, OFFSET msgError
   call WriteString
   call crlf

   dec ebx ; DECREMENTA EN 1 EL CONTADOR DE INTENTOS (EBX)

   jz bloqueado ; SALTO CONDICIONAL: SI EBX LLEGA A CERO, SALTA A "bloqueado"

   mov edx, OFFSET msgIntentos
   call WriteString

   mov eax, ebx ; MOVER EL NÚMERO DE INTENTOS RESTANTES A EAX PARA MOSTRARLO
   call WriteDec
   call crlf

   jmp intentar ; SALTO INCONDICIONAL: REGRESA A "intentar" PARA OTRO INTENTO


acceso:
mov edx, OFFSET msgAcceso
call WriteString 
call crlf
jmp fin ; SALTO INCONDICIONAL A "fin" PARA TERMINAR


bloqueado:
mov edx, OFFSET msgBloqueado
call WriteString
call crlf 
jmp fin

fin:
exit

main ENDP 

END main