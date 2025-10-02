.data

    # long last = 0;
    .globl last
    .align 8
    last: .quad 0

    # long values[5] = {50,-10,60,-20,70};
    .globl values
    .align 8
    values: .quad 50, -10, 60, -20, 70

.text


.globl sum

sum:

    pushq %rbp

    movq  %rsp, %rbp


    # int i = 0 e int j = 4
    movq $4, %ecx # j = 4

    # for (i=0; i < j; i++, j--)
    movq $0, %eax # i == 0
for:
    cmpl %ecx, %eax # compara os dois (i a.k.a. eax no final)
    jge forafor # se # i >= j vai pra fora do for

    # values[i]
    movq $values, %r8 # r8 = &values
    movslq %eax, %r9 # r9 = (long)i
    imulq $8, %r9 # r9 = r9 * sz(i)
    addq %r8, %r9

    # tmp -> rdi
    movq (%r9), %rdi # rdi = values[i]

    # values[j]
    movq $values, %r10 # r10 = &values
    movslq %ecx, %r11 # r11 = (long)i
    imulq $8, %r11 # r11 = r11 * sz(i)
    addq %r10, %r11

    # values[i] = values[j]
    movq (%r11), %rax
    movq %rax, (%r9)

    # values[j] = tmp
    movq %rdi, (%r11)

    incl %eax # i++
    decl %ecx # j--
    jmp for


forafor:

    leave

    ret
