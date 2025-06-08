.section __TEXT,__text
.global _main
.align 2
_main:
    // execve("/bin/sh", 0, 0)
    mov  x1, #0x622F
    movk x1, #0x6E69, lsl #16
    movk x1, #0x732F, lsl #32
    movk x1, #0x68, lsl #48
    str  x1, [sp, #-8]
    mov  x1, #8
    sub  x0, sp, x1
    mov  x1, xzr
    mov  x2, xzr
    mov  x16, #59
    svc  #0x1337
