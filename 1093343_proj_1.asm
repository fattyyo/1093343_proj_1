.globl main
.data
Input:		.string "Input the number: \n"
Output:		.string "The damage : \n"
endl:		.string "\n"
.text
main:
     la x10,Input
     li a7,4
     ecall
     li a7,5
     ecall
     add x16,a0,x0#x16=input number
     add x23,x0,x0
     addi x18,x0,20#x18=20
     addi x19,x0,10#x19=10
     addi x20,x0,1#x20=1
     addi x21,x0,5#x21=5
     jal x1,decide
     la x10,Output
     li a7,4
     ecall
     mv a0,x23
     li a7,1
     ecall
     beq x0,x0,end
decide:
	beq x16,x0,func1#if(x16==0)
	beq x16,x20,func2#if(x16==1)
	bgt x16,x18,func5#if(x16>20)
	bgt x16,x19,func4#if(x16>10)
	bgt x16,x20,func3#if(x16>1)
	beq x0,x0,func6
func1:
	addi x23,x23,1
	jalr x0,0(x1)	
func2:
	addi x23,x23,5
	jalr x0,0(x1)
func3:
	addi sp,sp,-8
	sw x16,0(sp)
	sw x1,4(sp)
	addi x16,x16,-1
	jal x1,decide
	lw x16,0(sp)
	addi sp,sp,4
	addi x16,x16,-2
	jal x1,decide
	lw x1,0(sp)
	addi sp,sp,4
	jalr x0,0(x1)
func4:	
	addi sp,sp,-8
	sw x16,0(sp)
	sw x1,4(sp)
	addi x16,x16,-2
	jal x1,decide
	lw x16,0(sp)
	addi sp,sp,4
	addi x16,x16,-3
	jal x1,decide
	lw x1,0(sp)
	addi sp,sp,4
	jalr x0,0(x1)
func5:
	addi sp,sp,-8
	sw x16,0(sp)
	sw x1,4(sp)
	div x16,x16,x21
	jal x1,decide
	lw x16,0(sp)
	addi sp,sp,4
	lw x1,0(sp)
	addi sp,sp,4
	add x16,x16,x16
	add x23,x23,x16
	jalr x0,0(x1)
func6:
	addi x16,x16,-1
	jalr x0,0(x1)
end:
	li a7,10
	ecall