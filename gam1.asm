.model small
.stack
.data
mensaje db 10,13,"Ingrese una semilla (0-9): ","$"
recibido db 10,13,"Numero ingresado: ","$"
mensajec db 10,13,"Ingrese un numero de ciclos (1-9): ","$"

aleatorio db 10,13,"Numero semi aleatorio generado correctamente: ","$"

primer db 10,13,"Intente adivinar el numero generado: ","$"
fmas db 10,13,"Casi, prueba con uno mayor: ","$"
fmenos db 10,13,"Casi, prueba con uno menor: ","$"
success db 10,13,"Your son made it mama *leans back in the chair*... he's a success.","$"


seed db ?
a db 4
c db 1
modulo db 9

cont db 0
numc db ?

intento db ?


res db 0

;seed = (a * seed + c) % modulus

.code
    main proc
    mov ax, seg @data
    mov ds, ax
    
    mov ah, 09h 
    lea dx, mensaje;imprimo el mensaje
    int 21h
    
    mov ah,01h
    int 21h
    sub al,30h
    mov seed, al ;se captura el numero
    
    mov ah, 09h 
    lea dx, mensajec;imprimo el mensaje
    int 21h
    
    mov ah,01h
    int 21h
    sub al,30h
    mov numc,al
    
    ;operacion
    
    ciclo:
    
    cmp cont,al
    je impres
    
    ;seed * a
    sub al,30h
    mov al,seed
    mov bl,a
    mul bl ;al = al * bl
    
    ;seed * a + c 
    add al,c ;sumo num2 al valor contenido en al

    div modulo
    mov res,ah ;movemos el resto a res
    sub al,30
    mov al,res ;movemos el res a al para ponerlo en la seed
    
    ;seed = seed * a + c % mod
    mov seed,al
    
    inc cont
    mov al,numc ;movemos a al el numc para que cuando vuelva al principio pueda comprarar
    jmp ciclo
    
    ;imprimimos el numero generado
    impres:
    sub al,30h
    mov al,seed
    mov res,al ;muevo el contenido de al a la variable res
    
    ;desde aqui
    mov ah, 09h
    lea dx, aleatorio
    int 21h
    
    mov al,res
    AAM
    mov bx, ax
    
    mov ah,02h
    mov dl,bh
    add dl,30h
    int 21h ;primer digito, normalmente un `0`, ej: 08.
    
    mov ah,02h
    mov dl,bl
    add dl,30h
    int 21h ;segundo digito
    ;hasta aqui
    
    mov ah, 09h 
    lea dx, primer;imprimo el mensaje
    int 21h
    
    jmp ciclo2
    .exit
    
    ciclo2:
    
    mov ah,01h
    int 21h
    sub al,30h
    mov intento, al ;se captura el numero
    
    sub al,30h
    mov al,res
    
    cmp intento,al
    je fin ;si se cumple la comparacion
    jg trymenos ;si al > intento
    jl trymas ;si al < intento
    
    trymas:
    
    mov ah, 09h 
    lea dx, fmas
    int 21h
    jmp ciclo2
    .exit
    
    trymenos:
    
    mov ah, 09h 
    lea dx, fmenos
    int 21h
    jmp ciclo2
    .exit
    
    fin:
    
    mov ah, 09h 
    lea dx, success
    int 21h
    .exit
    
    .exit
    
    .exit
    endp
    end main
end

