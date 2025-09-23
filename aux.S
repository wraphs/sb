.data

    # char c = -20;
    .globl c
    .align 1
    c: .byte -20

    # int i = -256;
    .globl i
    .align 4
    i: .int -256

    # int j = 512;
    .globl j
    .align 4
    j: .int 512

    # long l = 128;
    .globl l
    .align 8
    l: .quad 128

    # unsigned short us = 111;
    .globl us
    .align 2
    us: .short 111

    # unsigned int ui = 1024;
    .globl ui
    .align 4
    ui: .int 1024

    # unsigned long ul = 2048;
    .globl ul
    .align 8
    ul: .quad 2048

.text



.globl aux

aux:

    pushq %rbp

    movq  %rsp, %rbp



    # Se necessário, usar apenas os registradores (ou suas variações) abaixo:

    # %rax, %rcx, %rdx, %rdi, %rsi, %r8, %r9, %r10, %r11

    # j = 68000;
    movl $68000, j

    # l = 4096;
    movq $4096, l

    # i = j;
    movl j, %eax
    movl %eax, i

    # j = 10 + i - 5;
    movl i, %eax
    addl $10, %eax
    subl $5, %eax
    movl %eax, j

    # i = (i * 2) - (j + 5);
    movl i, %edi
    imul $2, %edi
    movl j, %esi
    addl $5, %esi
    subl %esi, %edi
    movl %edi, i

    # ui = i;
    movl i, %r8d
    movl %r8d, ui

    # j = c; (move signal byte to long(4))
    movsbl c, %edx
    movl %edx, j

    # ul = ui; (bizarrice)
    movl ui, %eax
    movq %rax, ul

    # us = ul;
    movq ul, %rax
    movw %ax, us

    # c = i + j;
    movl i, %eax
    addl j, %eax
    movb %al, c

    # int *iptr; (rax -> iptr)

    # iptr = &i;
    movq $i, %rax

    # j = j + *iptr;
    movl j, %edx
    addl (%rax), %edx
    movl %edx, j

    leave

    ret
