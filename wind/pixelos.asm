mov ax, 9ch
mov ss, ax
mov sp, 4096d
mov ax, 7c0h
mov ds, ax
mov es, ax

xor ah, ah
int 13h

xor ax, ax
mov es, ax
mov bx, 0x7E00
mov al, 1h
mov ch, 0
mov cl, 2h
mov dh, 0
mov ah, 02h
int 13h

jc error

jmp 0:0x7E00

mov si, msg3
call printl

error:
mov si, msg1
call print
hlt

printl:
lodsb
cmp al, 0
jz donel
mov ah, 0eh
int 10h
jmp printl
donel:
ret

msg1 db "An error occured!!", 0
msg2 db "Booting...", 0
msg3 db "Did not jump to kernel correctly!"

times 510-($-$$) db 0
dw 0xAA55

mov ax, 9ch
mov ss, ax
mov sp, 4096d
mov ax, 7c0h
mov ds, ax
mov es, ax
mov dh, 0

;Code---------------------------------
mov ah, 0
int 10h

mov si, msg
call print

_mainloop:
mov si, prompt
call print
mov di, cmd
call getinput

mov ah, 2h
inc dh
int 10h

mov si, cmd
call execmd

mov di, cmd
times 16 call clearcmd
jmp _mainloop

jmp $
;Lib----------------------------------
print:
lodsb
cmp al, 0
jz done
mov ah, 0eh
int 10h
jmp print
done:
ret

getinput:
mov ah, 0
int 16h
cmp al, 0Dh
je done
mov ah, 0eh
int 10h
stosb
jmp getinput

clearcmd:
xor al, al
stosb
ret

execmd:
lodsb
cmp al, 68h
je hello_char2
cmp al, 'A'
je runappA
cmp al, 'B'
je runappB
cmp al, 'C'
je runappC
mov si, ukcmd
call print
ret

runappA:
mov si, space
call print
cld
mov ah, 0h
int 10h
xor ax, ax
mov es, ax
mov bx, 0xFC00
mov al, 1h
mov ch, 0
mov cl, 3h
mov dh, 0
mov ah, 02h
int 13h

jc error2

jmp 0:0xFC00

runappB:
mov si, space
call print
cld
mov ah, 0h
int 10h
xor ax, ax
mov es, ax
mov bx, 0xFC00
mov al, 1h
mov ch, 0
mov cl, 4h
mov dh, 0
mov ah, 02h
int 13h

runappC:
mov si, space
call print
cld
mov ah, 0h
int 10h
xor ax, ax
mov es, ax
mov bx, 0xFC00
mov al, 1h
mov ch, 0
mov cl, 5h
mov dh, 0
mov ah, 02h
int 13h

jc error2

jmp 0:0xFC00

error2:
mov si, oops
call print
oops db "Error!!!", 0
jmp $

hello_char2:
lodsb
cmp al, 65h
je hello_char3
ret

hello_char3:
lodsb
cmp al, 6Ch
je hello_char4
ret

hello_char4:
lodsb
cmp al, 6Ch
je hello_char5
ret

hello_char5:
lodsb
cmp al, 6Fh
je hello
ret

hello:
mov si, hellomsg
call print
ret
;Data---------------------------------
cmd: times 16 db 0
prompt: db ">>> ", 0
msg: db "PixelOS Wind ALPHA", 0
ukcmd: db "Unknown command: ", 0
hellomsg: db "Hello, world!", 0
space: db "      ", 0
;-------------------------------------

times 400h-($-$$) db 0