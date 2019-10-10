.data
argument: .word -10000
argument2: .word -7
str1: .string "result is "
.text

main:
	addi	sp,sp.-24
	lw	a5,argument
	sw	a5,20(sp)
	lw	a5,argument2
	sw	a5,16(sp)
	li	a3,0
	li	a2,1
	li	a4,0
	li	a5,31
	sw	a3,12(sp)
	sw	a2,8(sp)
	sw	a4,4(sp)
	sw	a5,0(sp)
	j	.L2
	
.L2:
	lw	

	addi	sp,sp,-32 
	sw	s0,28(sp)
	addi	s0,sp,32
	lw a5,argument
	sw	a5,-28(s0)
	lw a5,argument2
	#li	a5,-7
	sw	a5,-32(s0)
	li a3,0
	sw	zero,-20(s0)
	sw	zero,-24(s0)
	li a2,1
	li	a4,0
	li	a5,31
	j	.L2
.L2:
	blt	a4,a5,.L3
	li a0,10
	jal ra,printResult
	
	li a0,10
	ecall
.L3:
	lw a6,-28(s0)
	lw a7,-32(s0)
	srl a7,a7,a4
	andi a7,a7,1
	beq a2,a7,.L4
	addi a4,a4,1
	j .L2
.L4:
	sll a6,a6,a4
	add a3,a3,a6
	addi a4,a4,1
	j .L2
printResult:
        mv       t0, a0
        mv       t1, a3

        la       a1, str1
        li       a0, 4
        ecall

        mv       a1, t1
        li       a0, 1
        ecall

        ret
	
