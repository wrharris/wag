	.file	"test/test1/test1.woven"
	.text
	.globl	main
	.align	16, 0x90
	.type	main,@function
main:                                   # @main
# BB#0:                                 # %entry
	movl	$5, -12(%rsp)
	cmpl	$0, -16(%rsp)
	jle	.LBB0_2
# BB#1:                                 # %bb
	movl	$6, -12(%rsp)
.LBB0_2:                                # %bb1
	movl	-12(%rsp), %eax
	movl	%eax, -8(%rsp)
	movl	%eax, -4(%rsp)
	movl	-4(%rsp), %eax
	ret
.Ltmp0:
	.size	main, .Ltmp0-main


	.section	.note.GNU-stack,"",@progbits
