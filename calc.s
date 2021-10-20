.section __TEXT,__text
.global _main
.align 2
_main:
    // execve("/System/Applications/Calculator.app/Contents/MacOS/Calculator", 0, 0)
    mov  x1, #0x616c
    movk x1, #0x6f74, lsl #16
    movk x1, #0x72, lsl #32
    str  x1, [sp, #-8]
    mov  x1, #0x534f
    movk x1, #0x432f, lsl #16
    movk x1, #0x6c61, lsl #32
    movk x1, #0x7563, lsl #48
    str  x1, [sp, #-16]
    mov  x1, #0x6e65
    movk x1, #0x7374, lsl #16
    movk x1, #0x4d2f, lsl #32
    movk x1, #0x6361, lsl #48
    str  x1, [sp, #-24]
    mov  x1, #0x7061
    movk x1, #0x2f70, lsl #16
    movk x1, #0x6f43, lsl #32
    movk x1, #0x746e, lsl #48
    str  x1, [sp, #-32]
    mov  x1, #0x7563
    movk x1, #0x616c, lsl #16
    movk x1, #0x6f74, lsl #32
    movk x1, #0x2e72, lsl #48
    str  x1, [sp, #-40]
    mov  x1, #0x6f69
    movk x1, #0x736e, lsl #16
    movk x1, #0x432f, lsl #32
    movk x1, #0x6c61, lsl #48
    str  x1, [sp, #-48]
    mov  x1, #0x7041
    movk x1, #0x6c70, lsl #16
    movk x1, #0x6369, lsl #32
    movk x1, #0x7461, lsl #48
    str  x1, [sp, #-56]
    mov  x1, #0x532f
    movk x1, #0x7379, lsl #16
    movk x1, #0x6574, lsl #32
    movk x1, #0x2f6d, lsl #48
    str  x1, [sp, #-64]
    mov	 x1, #64
    sub  x0, sp, x1
    mov  x1, xzr
    mov  x2, xzr
    mov  x16, #59
    svc  #0x1337
