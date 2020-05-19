.model small
.stack 100h
.data
messageWelcome db "Arkanoid",0Dh ,0Ah   
               db "Controls:",0Dh ,0Ah
               db "Left/Right arrow - move paddle",0Dh ,0Ah
               db "Esc - exit",0Dh ,0Ah
               db "Enter - start",0Dh ,0Ah, '$' 
messageWin     db "*               YOU WIN                *",0Dh ,0Ah, '$'
screenBuffer db 1000 dup(0)
playField db 396 dup(00h)
level db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
      db 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h
      db 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h 
      db 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h
      db 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h
      db 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h 
      db 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h, 30h
      db 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h
      db 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h 
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h 
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h  

     
      db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
	  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
	  db 00h, 00h, 00h, 00h, 20h, 20h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 20h, 20h, 00h, 00h, 00h, 00h	  
	  db 00h, 00h, 00h, 00h, 00h, 00h, 20h, 20h, 00h, 00h, 00h, 00h, 00h, 00h, 20h, 20h, 00h, 00h, 00h, 00h, 00h, 00h	  
	  db 00h, 00h, 00h, 00h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 00h, 00h, 00h, 00h	  
	  db 00h, 00h, 20h, 20h, 20h, 20h, 00h, 00h, 20h, 20h, 20h, 20h, 20h, 20h, 00h, 00h, 20h, 20h, 20h, 20h, 00h, 00h	  
	  db 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h	  
	  db 20h, 20h, 00h, 00h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h, 00h, 00h, 20h, 20h	  
	  db 20h, 20h, 00h, 00h, 20h, 20h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 20h, 20h, 00h, 00h, 20h, 20h	  
	  db 00h, 00h, 00h, 00h, 00h, 00h, 20h, 20h, 20h, 20h, 00h, 00h, 20h, 20h, 20h, 20h, 00h, 00h, 00h, 00h, 00h, 00h	  
	  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
	  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
	  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
	  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
	  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
	  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
	  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  
	  db 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h, 00h	  

levelCount dw 88
           dw 46

      
currentLevel dw 0     

verticalMovement dw 0
horizontalMovement dw 0
                  
ballPositionY dw 18
ballPositionX dw 11
                   
paddlePosition dw 0                   
previousTime dw 0    
score dw 0                       
winCount dw 0
.code
jmp main
  
printScore proc
    pusha
    xor cx, cx    
    mov ax, score
    xor dx, dx 
    mov si, 10
loadStack:   
    div si 			  		
    add dl, '0'
    push dx     ;itoa to score
    xor dx, dx 
    inc cx        
    cmp ax, 0
    jne loadStack   
    mov bx, 466     
printStack:
    pop dx 
    push ds
    mov ax, 0b800h
    mov ds, ax
    mov [bx], dl  ;printing score
    inc bx
    mov [bx], 07h
    inc bx
    pop ds           
    loop printStack          
    popa 
    ret   
endp    
  
initScreen proc
    pusha
    push ds   
    mov ax, 0b800h  ; moving videobuffer to ds
    mov ds, ax 
      
    xor bx, bx
    mov cx, 1000
loopScreen:     
    mov [bx], ' '
    inc bx
    mov [bx], 07h ; clearing screen
    inc bx
    loop loopScreen
    
    xor si, si
    mov ax, 40
firstLine:
    mov [si], ' '
    inc si
    mov [si], 40h
    inc si
    dec ax       ;setting top border for window
    cmp ax, 0
    je firstLineEnd
    jmp firstLine
firstLineEnd:
    mov ax, 23
columns:
    mov [si], ' '
    inc si
    mov [si], 40h   ;setting left and right borders for window
    inc si
    add si, 76
    mov [si], ' '
    inc si
    mov [si], 40h
    inc si
    dec ax
    cmp ax, 0
    je columnsEnd
    jmp columns
columnsEnd:
    mov ax, 40
secondLine:
    mov [si], ' '
    inc si
    mov [si], 40h  ;setting bottom border for window
    inc si
    dec ax
    cmp ax, 0
    je secondLineEnd
    jmp secondLine
secondLineEnd:
    mov cx, 2
glass:
    mov al, 80
    mul cl
    add ax, 4
    mov si, ax
    mov [si], ' ' ;setting game field border
    inc si
    mov [si], 70h
    add si, 45
    mov [si], ' '
    inc si
    mov [si], 70h
    inc cx
    cmp cx, 23
    je glassEnd
    jmp glass
glassEnd:
    mov cx, 2
glassBottom:
    mov al, 2
    mul cl
    add ax, 160
    mov si, ax
    mov [si], ' '   ;setting game field bottom border
    inc si
    mov [si], 70h
    inc cx
    cmp cx, 26
    je glassBottomEnd
    jmp glassBottom
glassBottomEnd:
    mov [454], 'S' 
    mov [456], 'c'
    mov [458], 'o'
    mov [460], 'r'
    mov [462], 'e'
    mov [464], ':'   ;displaying score
    xor bh, bh
    mov dh, 25
    mov ah, 02 ; setting cursor to score
    int 10h  
    
    pop ds
    popa
    ret
endp

initPlayField proc
    pusha 
    push es
      
    mov ax, ds
    mov es, ax
    mov si, offset level
    mov di, offset playField  ; moving level data, playfield data and current level
    mov cx, currentLevel 
loop12:   
    add si, 396 ;selecting level
    loop loop12
    mov cx, 396
loop11:
    movsb  ;initializing level
    loop loop11    
    mov bx, offset levelCount
    mov cx, currentLevel
loop13:     
    add bx, 2  ; selecting needed value for wincount
    loop loop13
    mov ax, [bx] ; setting required score to finish level
    mov winCount, ax
    
    pop es 
    popa
    ret
endp

displayPlayField proc
    pusha
    push es
    
    mov ax, 0B800h  ; moving videobuffer to es
    mov es, ax
    mov cx, 19
    mov di, 247
    mov si, offset playField
loop1:
    push cx
    mov cx, 22
loop2:
    movsb
    inc di ;displaying level rows
    loop loop2
    add di, 36
    pop cx
    loop loop1
    
    pop es
    popa
    ret
endp
        

printLose proc    
    push ds
    mov ax, 0b800h ;priniting message for lose
    mov ds, ax
    mov bx, 820 
    mov [bx], 'Y'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 'o'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 'u'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], ' '
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 'l'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 'o'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 's'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 'e'
    inc bx
    mov [bx], 07h
    inc bx
    mov bx, 896   
    mov [bx], 'P'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 'r'
    inc bx
    mov [bx], 07h
    inc bx        
    mov [bx], 'e'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 's'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 's'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], ' '
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 'E'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 'n'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 't'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 'e'
    inc bx
    mov [bx], 07h
    inc bx
    mov [bx], 'r'
    inc bx
    mov [bx], 07h
    inc bx 
    mov [bx], ' '
    inc bx
    mov [bx], 07h
    inc bx
    pop ds
    ret
endp

displayPaddle proc       
    push ds
    
    mov bx, offset paddlePosition
    mov dx, [bx]
    
    mov ax, 0b800h
    mov ds, ax
    mov bx, 1767
    mov cx, 22
loop21:    
    mov [bx], 00h
    add bx, 2   ;clearing freed places
    loop loop21   
    mov bx, 1767
    add bx, dx
    add bx, dx
    mov cx, 4
loop31:    
    mov [bx], 0E0h
    add bx, 2      ;drawing paddle
    loop loop31
    
    pop ds    
    ret
endp

welcomeScreen proc 
    pusha
    push ds    
    mov ax, 0B800h
    mov ds, ax   ; moving videobuffer to ds
    xor bx, bx
    mov cx, 1000
loopScreenWelcome:     
    mov [bx], ' '
    inc bx
    mov [bx], 07h ; clearing screen
    inc bx
    loop loopScreenWelcome
    pop ds
    mov ah, 9h
    mov dx, offset messageWelcome  ;outputing welcome message
    int 21h          
    
waitEnterWelcome: 
    mov ah, 1
    int 16h   ; waiting for key entered
    jz waitEnterWelcome
    xor ah, ah
    int 16h
    cmp ah, 1Ch  ;checking if Enter
    je EnterWelcome
    cmp ah, 01h  ;checking if Esc
    jne waitEnterWelcome
    mov ah, 00
    mov al, 03  ; setting videomode to default 80x25 16-bit color
    int 10h
    mov ah, 4Ch ; closing program
    int 21h
EnterWelcome:
    popa     
    ret
endp

moveBall proc 
    push dx    
    cmp verticalMovement, 0 ; if ball moves up
    jne moveDown
    cmp ballPositionY, 0 ;if reached upper border
    jne notUpCol
    mov verticalMovement, 1 ;set to move up
notUpCol:              
    jmp horizontalCheck
moveDown:
    cmp ballPositionY, 18 ;if reached paddle height
    jne notDownCol         
    mov bx, offset paddlePosition
    mov ax, [bx]
    cmp ax, ballPositionX  ;checking if paddle under the ball
    jg paddleLose
    add ax, 3
    cmp ax, ballPositionX
    jl paddleLose
    mov verticalMovement, 0
    jmp notDownCol
paddleLose:
    mov ax, 01h ;paddle lost
    pop dx
    ret
notDownCol: 
horizontalCheck:
    cmp horizontalMovement, 0 ; if moving left
    jne moveLeft
    cmp ballPositionX, 21  ; if reached border
    jne changeBallPos
    mov horizontalMovement, 1 ;move right
    jmp changeBallPos
moveLeft:   
    cmp ballPositionX, 0  ; if reached border
    jne changeBallPos    
    mov horizontalMovement, 0 ; move left
changeBallPos: 
    cmp horizontalMovement, 1 ;if moving right
    jne moveRight
    dec ballPositionX    ;moving left
    call checkCollision
    cmp dx, 00h ; if not collision
    je verticalMove
    inc ballPositionX ;move right
    mov horizontalMovement, 0  
    jmp verticalMove
moveRight:
    inc ballPositionX  ;moving right
    call checkCollision 
    cmp dx, 00h   ; if not collision
    je verticalMove
    dec ballPositionX
    mov horizontalMovement, 1 
verticalMove:
    cmp verticalMovement, 1 ; if moving down
    jne moveUp
    inc ballPositionY 
    call checkCollision  
    cmp dx, 00h ; if not collision
    je moveEnd
    dec ballPositionY 
    mov verticalMovement, 0
    jmp moveEnd
moveUp:
    dec ballPositionY  
    call checkCollision
    cmp dx, 00h  ; if not collision
    je moveEnd
    inc ballPositionY  
    mov verticalMovement, 1
moveEnd:   
    call checkCollision  
    xor ax, ax
    pop dx
    ret
endp

displayBall proc           
    pusha
    push ds     
    mov bx, offset ballPositionY
    mov ax, [bx]
    add ax, 3
    mov cl, 80
    mul cl                      
    mov bx, offset BallPositionX    ;setting values for ball offset in videomemory
    mov cx, [bx]
    add ax, cx
    add ax, cx
    add ax, 7
    mov bx, ax
    mov ax, 0b800h
    mov ds, ax
    mov [bx], 70h
    pop ds
    popa
    ret
endp

checkCollision proc   
    push ax
    push bx
    push cx    
    xor dx, dx
    mov bx, offset ballPositionY
    mov ax, [bx]
    mov cl, 22   ;getting position by Y
    mul cl
    mov bx, offset ballPositionX
    mov cx, [bx]   ;getting position by X
    add ax, cx     
    mov bx, offset playField
    add bx, ax
    cmp [bx], 00h  ;checking for collision
    je notCollision ; if empty
    add score, 10 ;adding score
    dec winCount
    call printScore ;printing score
    mov dx, 01h ; set flag collision
    mov [bx], 00h
    and ax, 01h
    cmp ax, 00h
    je deleteInc
    dec bx
    mov [bx], 00h
    jmp notCollision
deleteInc:
    inc bx    ;deleting hit block
    mov [bx], 00h
notCollision: 
    pop cx
    pop bx
    pop ax
    ret
endp

paddleStart proc
    mov bx, offset paddlePosition
    mov ax, [bx]
    add ax, 2
    mov ballPositionX, ax ;setting ball on paddle
    mov ballPositionY, 18
    mov horizontalMovement, 0
    mov verticalMovement, 0 
    call displayPlayField
    call displayBall      ;displaying all
    call displayPaddle
paddleLoop:
    mov ah, 1
    int 16h  ; check if any key pressed
    jz noKeyPressed1
    xor ah, ah
    int 16h   ;checking which key is pressed
    cmp ah, 4Dh   ;if right arrow
    jne notRight1
    cmp paddlePosition, 18 ; if right border reached
    jge notRight1
    inc paddlePosition  ;moving paddle and ball on it
    inc ballPositionX  
    call displayPlayField
    call displayPaddle       ;displaying all
    call displayBall    
notRight1:  
    cmp ah, 4Bh ;if left arrow
    jne notLeft1
    cmp paddlePosition, 0  ;if left border reached
    je notLeft1
    dec paddlePosition  ;moving paddle and ball on it
    dec ballPositionX
    call displayPlayField
    call displayPaddle    ;displaying all
    call displayBall
notLeft1:
    cmp ah, 01h ; if Esc
    jne notEscape1
    jmp exit
notEscape1:
    cmp ah, 1ch  ;If enter
    jne notEnter1
    ret
notEnter1: 
noKeyPressed1:
    jmp paddleLoop
    ret
endp    

printWin proc   
    pusha
    push ds    
    xor bh, bh
    mov dh, 4
    xor dl, dl
    mov ah, 02
    int 10h
    mov ax, 0B800h
    mov ds, ax
    xor bx, bx
    mov cx, 1000
loopScreenWin:     
    mov [bx], ' '
    inc bx
    mov [bx], 07h
    inc bx
    loop loopScreenWin
    pop ds
    mov ah, 9h
    mov dx, offset messageWin
    int 21h          
waitEnterWin: 
    mov ah, 1
    int 16h
    jz waitEnterWin
    xor ah, ah
    int 16h
    cmp ah, 1Ch
    je EnterWin
    cmp ah, 01h
    jne waitEnterWin
    mov ah, 00
    mov al, 03
    int 10h
    mov ah, 4Ch
    int 21h
EnterWin:
    xor bh, bh
    mov dh, 25
    mov ah, 02
    int 10h
    popa      
    ret
endp

main:
    mov ax, @data
    mov ds, ax
    mov ah, 00
    mov al, 01 ; setting videomode 40x25 16-bit color
    int 10h       
    call welcomeScreen ; displaying welcome screen
    
    restart:
        mov score, 0 
        mov currentLevel, 0
        mov previousTime, 0  
        mov ballPositionY, 18 ; setting start position to ball and cleaning all game data
        mov ballPositionX, 11
        mov horizontalMovement, 0
        mov verticalMovement, 0    
        call initScreen
        call printScore 
        call initPlayField
        call checkCollision   
        call displayPlayField ;inititializing game
        call displayBall   
        call displayPaddle
        call paddleStart
        mov ah, 01h
        xor cx, cx  ; setting computer timer to 0
        xor dx, dx
        int 1ah     
    start:                     
        mov ah, 1
        int 16h   ;check if any key pressed
        jz noKeyPressed
        xor ah, ah
        int 16h    ;check which key is pressed
        cmp ah, 4Dh ;if right arrow
        jne notRight
        cmp paddlePosition, 18 ;if border has reached
        jge notRight
        inc paddlePosition ;moving paddle
        call displayPlayField
        call displayPaddle    ;displaying all
        call displayBall    
    notRight:  
        cmp ah, 4Bh  ;if left arrow
        jne notLeft
        cmp paddlePosition, 0  ;if border has reached
        je notLeft
        dec paddlePosition ;moving paddle
        call displayPlayField
        call displayPaddle   ;displaying all
        call displayBall
    notLeft:
        cmp ah, 01h  ;if Esc
        jne notEscape
        jmp exit
    notEscape: 
    noKeyPressed: 
        mov ah, 00h
        int 1ah ;getting timer value
        push dx
        mov ax, previousTime
        sub dx, ax
        mov ax, dx
        pop dx
        cmp ax, 3 ; checking if timer gets to 3
        jl notMove
        mov previousTime, dx ;saving new previous timer value
        call moveBall 
        cmp ax, 00h ;check if not lost
        je notLose
        call printLose
        jmp waitEnter
    notLose:  
        call displayPlayField
        call displayPaddle  ; update gamefield
        call displayBall
    notMove:
        cmp winCount, 0 ; if level is not completed
        jne start
        inc currentLevel 
        cmp currentLevel, 2 ; if levels are not ended
        jne notWin
        call printWin 
        jmp restart
    notWin:  
        mov previousTime, 0 
        mov ballPositionY, 18
        mov ballPositionX, 11 ; setting all values to default
        mov horizontalMovement, 0
        mov verticalMovement, 0    
        call initScreen
        call printScore 
        call initPlayField
        call checkCollision   
        call displayPlayField   ;initializing game
        call displayBall   
        call displayPaddle
        call paddleStart
        mov ah, 01h
        xor cx, cx
        xor dx, dx
        int 1ah      
        jmp start
    waitEnter:
        mov ah, 1
        int 16h
        jz waitEnter ;checking if enter to restart
        xor ah, ah
        int 16h
        cmp ah, 1Ch
        jne notEnter
        jmp restart
    notEnter:
        cmp ah, 01    ;checking if esc
        jne waitEnter  
exit:
mov ah, 00
mov al, 03 ; setting videomode to default 80x25 16-bit color
int 10h
mov ah, 4Ch
int 21h
end main