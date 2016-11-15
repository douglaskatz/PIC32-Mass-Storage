#include <mips/regdef.h>


	##################################################################
	# Entry point of the entire application
	##################################################################
	.section .reset,"ax",@progbits
	.set noreorder
	.ent _reset
_reset:
	##################################################################
	# Initialize Stack Pointer
	#   _stack is initialized by the linker script to point to the
	#    starting location of the stack in DRM
	##################################################################
	la	sp,_stack

	##################################################################
	# Initialize Global Pointer
	#   _gp is initialized by the linker script to point to "middle"
	#   of the small variables region
	##################################################################
	la	gp,_gp
	
	##################################################################
	# Initialize Global Pointer in Shadow Set
	#   The SRSCtl's PSS field must be set to the shadow set in which
	#   to initialize the global pointer.  Since we only have a
	#   single shadow set (besides the normal), we will initialize
	#   SRSCtl<PSS> to SRSCtl<HSS>.  We then write the global pointer
	#   to the previous shadow set to ensure that on interrupt, the
	#   global pointer has been initialized.
	##################################################################
	mfc0	t1,_CP0_SRSCtl		# Read SRSCtl register
	ext	t2,t1,26,4		# to obtain HSS field
	ins	t1,t2,6,4		# Put HSS field
	mtc0	t1,_CP0_SRSCtl		# into SRSCtl<PSS>
	wrpgpr	gp,gp			# Set global pointer in PSS

	##################################################################
	# Clear uninitialized data sections
	##################################################################
	la	t0,_bss_begin
	la	t1,_bss_end
	b	_bss_check
	nop

_bss_init:	
	sw	zero,0x0(t0)
	sw	zero,0x4(t0)
	sw	zero,0x8(t0)
	sw	zero,0xc(t0)
	addu	t0,16
_bss_check:
	bltu	t0,t1,_bss_init
	nop
	
	##################################################################
	# Copy initialized data from program flash to data memory
	#   src=_data_image_begin dst=_data_begin stop=_data_end
	##################################################################
	la	t0,_data_image_begin
	la	t1,_data_begin
	la	t2,_data_end
	b	_init_check
	nop

_init_data:	
	lw	t3,(t0)
	sw	t3,(t1)
	addu	t0,4
	addu	t1,4
_init_check:
	bltu	t1,t2,_init_data
	nop

	##################################################################
	# If there are no RAM functions, skip the next two sections --
	# copying RAM functions from program flash to data memory and
	# initializing bus matrix registers.
	##################################################################
    la      t1,_ramfunc_length
	beqz	t1,_ramfunc_done
	nop

	##################################################################
	# Copy RAM functions from program flash to data memory
	#   src=_ramfunc_image_begin dst=_ramfunc_begin stop=_ramfunc_end
	##################################################################
	la	t0,_ramfunc_image_begin
	la	t1,_ramfunc_begin
	la	t2,_ramfunc_end

_init_ramfunc:	
	lw	t3,(t0)
	sw	t3,(t1)
	addu	t0,4
	addu	t1,4
_ramfunc_check:
	bltu	t1,t2,_init_ramfunc
	nop

_ramfunc_done:



	##################################################################
	# Call main
	##################################################################
	la	t0,main
	jalr	t0
	nop		

	##################################################################
	# Just in case, go into infinite loop
	##################################################################
1:
	b	1b
	nop
	
	.end _reset
	.globl _reset


