.model small
.stack 100h
.data
    array dw ARRAY_SIZE dup(?)
    digit db 8
          db ?
          db 8 dup(?)
    median_digit dw dup(0)
    median_digit_symbol db 7 dup('0')
    start_msg db 10, 13, "Enter digit", 10, 13, '$'
    DIGIT_SYMBOL_LIMIT equ 5
    ARRAY_SIZE equ 5
    
.code
    get_digit proc
        pusha
        cld
        out_start_msg:
            mov dx, offset start_msg
            mov ah, 0x9
            int 0x21
        get:
            mov dx, offset digit
            mov ah, 0x0a
            int 0x21
        check:
            mov di, offset digit + 2
            xor cx, cx
            mov cl, byte ptr[digit + 1]
            xor ax, ax
            jmp check_negative:
            check_negative:
                mov al, '-'
                xor bx, bx
                mov bl, byte ptr[di]
                cmp al, bl
                je negative_digit
                cmp cx, DIGIT_SYMBOL_LIMIT
                ja _exit
                jmp start_check
            negative_digit:
                inc di
                dec cx
                cmp cx, DIGIT_SYMBOL_LIMIT
                ja _exit
                jmp start_check
            start_check: 
                xor bx, bx
                mov bl, byte ptr[di] 
                mov al, '0'
                cmp al, bl
                ja _exit
                mov al, '9'
                cmp al, bl
                jb _exit
                inc di
                loop start_check        
        popa
        ret
    get_digit endp
    
    
    atoi proc
        pop bp
        pop si
        push bp
        pusha
           convert_to_int:
                mov di, offset digit + 2
                push di
                xor cx, cx
                xor dx, dx
                xor ax, ax
                xor bx, bx
                mov cl, byte ptr[digit + 1]
                jmp check_minus_exsistense
                check_minus_exsistense:
                    mov al, '-'
                    cmp al, byte ptr[di]
                    je skip_minus
                    xor ax, ax
                    jmp start_converting
                skip_minus:
                    inc di
                    dec cx
                    xor ax, ax
                start_converting:
                    mov bl, 10
                    mul bx
                    cmp ax, 0
                    jl _exit
                    mov bl, byte ptr [di]
                    sub bl, '0'
                    add ax, bx
                    inc di
                    loop start_converting
                pop di
                check_negative_digit:
                    xor bx, bx
                    mov bl, '-'
                    cmp bl, byte ptr[di]
                    je set_negative
                    jmp set_digit
                je set_negative
                jmp set_digit
                set_negative:
                    neg ax
                    jmp set_digit
                set_digit:
                    mov word ptr[si], ax
        popa
        ret
    atoi endp
    
    swap proc
        pusha
        sub di, 2
        sub si, 2
        mov ax, word ptr[di]
        mov bx, word ptr[si]
        mov word ptr[di], bx 
        mov word ptr[si], ax
        popa
        ret
    swap endp
    
    bubble_sort proc
        pusha
        
        xor cx, cx
        xor di, di
        xor si, si
        xor dx, dx
        mov di, offset array
        mov si, offset array
        add si, 2
        mov cx, ARRAY_SIZE
        dec cx
        mov dx, ARRAY_SIZE*2+2
        _outer_loop:
            _inner_loop:
                 cmpsw
                 jl swap_digits
                 jmp _continue_inner_loop
                 swap_digits:
                    call swap
                    jmp _continue_inner_loop
                 _continue_inner_loop:
                    sub di, 2
                    cmp si, dx
                    je _continue_outer_loop
                    jmp _inner_loop
            _continue_outer_loop:
                add di, 2
                mov si, di
                add si, 2
        loop _outer_loop
       
        popa
        ret
    bubble_sort endp
    
    get_median proc
        pusha
        cld
        xor cx, cx
        xor di, di
        xor bx, bx
        xor si, si
        mov si, offset array
        add si, ARRAY_SIZE-1
        mov ax, word ptr[si]
        mov word ptr[median_digit], ax
    _ret:
        popa
        ret
    get_median endp
    
    itoa proc
        pusha
         xor di, di
         xor si, si
         mov si, offset median_digit
         mov di, offset median_digit_symbol
         mov [di+6], '$'
         add di, 5
         mov ax, word ptr[si]
         cmp ax,0
         jl _set_positive
         jmp _outer_loop_
         _set_positive:
            neg ax
         _outer_loop_:
            mov bx, 10
            xor dx, dx
            div bx
            add dl, '0'
            mov [di], dl
            dec di
            cmp ax, 0
            je _end_outer_loop_
            jmp _outer_loop_
        
        _end_outer_loop_:
        _negative:
            mov ax, word ptr[si]
            cmp ax, cx
            jl _set_negative_
            jmp _set_plus_
        _set_negative_:
            mov byte ptr[di], '-'
            jmp _ret_itoa
        _set_plus_:
            mov byte ptr[di], '+'
            jmp _ret_itoa
        _ret_itoa:       
        popa
        ret
    itoa endp
        
_start:     
    mov ax, @data
    mov ds, ax
    mov es, ax
               
               
    mov di, offset median_digit_symbol
    mov [di+6], '$'           
    xor dx, dx
    xor cx, cx
    mov dx, offset array
    mov cx, ARRAY_SIZE
    initializate_array:
        call get_digit
        push dx
        call atoi
        add dx, 2
        loop initializate_array
    call bubble_sort
    call get_median
    call itoa
    jmp _exit
_exit:
    mov dl, 10;
    mov ah, 0x02;
    int 0x21
    mov dl, 13;
    mov ah, 0x02;
    int 0x21
    mov dx, offset median_digit_symbol
    mov ah, 0x9
    int 0x21
    mov ah, 0x4C
    int 0x21
    end _start
