.section __TEXT,__text
.global _main
.align 2
_main:
    // execve("/usr/bin/open", [ "/usr/bin/open", "/System/Applications/Calculator.app", NULL ], 0)
    // "/System/Applications/Calculator.app"
    mov  x1, #0x7061
    movk x1, #0x70, lsl #16
    str  x1, [sp, #-8]
    mov  x1, #0x7563
    movk x1, #0x616c, lsl #16
    movk x1, #0x6f74, lsl #32
    movk x1, #0x2e72, lsl #48
    str  x1, [sp, #-16]
    mov  x1, #0x6f69
    movk x1, #0x736e, lsl #16
    movk x1, #0x432f, lsl #32
    movk x1, #0x6c61, lsl #48
    str  x1, [sp, #-24]
    mov  x1, #0x7041
    movk x1, #0x6c70, lsl #16
    movk x1, #0x6369, lsl #32
    movk x1, #0x7461, lsl #48
    str  x1, [sp, #-32]
    mov  x1, #0x532f
    movk x1, #0x7379, lsl #16
    movk x1, #0x6574, lsl #32
    movk x1, #0x2f6d, lsl #48
    str  x1, [sp, #-40]
    // "/usr/bin/open"
    mov  x1, #0x6f2f
    movk x1, #0x6570, lsl #16
    movk x1, #0x6e, lsl #32
    str  x1, [sp, #-48]
    mov  x1, #0x752f
    movk x1, #0x7273, lsl #16
    movk x1, #0x622f, lsl #32
    movk x1, #0x6e69, lsl #48
    str  x1, [sp, #-56]
    // [ "/usr/bin/open", "/System/Applications/Calculator.app", NULL ]
    str  xzr, [sp, #-64]
    mov  x1, #40
    sub  x1, sp, x1
    str  x1, [sp, #-72]
    mov  x1, #56
    sub  x1, sp, x1
    str  x1, [sp, #-80]
    // Set arguments
    mov  x0, x1
    sub  x1, sp, #80
    mov  x2, xzr
    mov  x16, #59
    svc  #0x1337
