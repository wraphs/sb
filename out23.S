.data

.globl v1
.align 2
v1: .short 1, 2

.globl v2
.align 8
v2: .quad 1 2 3

.text



.globl aux
aux:
pushq %rbp
movq %rsp, %rbp
subq $16, %rsp

movq %rbx, (-8)%rbp

# seja i = ebx
movl $2, %ebx

# caso i <0 saia do while
for:
cmpl $0, %ebx
jl leave_for



leave_for:

movq (-8)%rbp, %rbx

leave
ret


# ###################################################### #


.globl main
main:
pushq %rbp
movq %rsp, %rbp

# seja i = ebx
movl $0, %ebx

# caso i >= 2 saia do while
while:
cmpl $2, %ebx
jge leave_while

movq %v1, %rdi
movl %ebx, %esi

# como o registrador e verde, salvamos ele na funcao que e chamada
call aux
inc %ebx

leave_while:

ret
