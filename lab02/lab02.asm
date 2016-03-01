# Calculate sums of positive odd and negative even values in an array
#   in MIPS assembly using MARS
# for MY?-402 - Computer Architecture
# Department of Computer Engineering, University of Ioannina
# Aris Efthymiou

        .globl main # declare the label main as global. 
        
        .text 
     
main:
        la         $a0, length       # get address of length to $a0
        lw         $a0, 0($a0)       # get the length in to $a0

        la         $a1, input        # get address of array to $a1

        addiu      $s0, $zero, 0     # sum of positive odd values starts as 0
        addiu      $s1, $zero, 0     # sum of negative even values starts as 0

        ########################################################################
        #  Write your code here
        # NOTE: Don't print out the results! Automatic testing will get the final
        #  values of $s0, $s1 and check if they are correct
        ########################################################################
        li 		$t5,0 
        add		$t6,$a1,$zero 
loop:
      
        
        beq		$a0, $zero, exit		# If array is empty go to exitLoop
     	beq		$a0, $t5, exit     

        lw		$t0, 0($t6)			# read Array
							# next

        slt     	$t1, $t0, $zero     		# positive or negative
        
        bne		$t1, $zero, negat   		# if negative go negat 		
        andi		$t3, $t0, 0x1			# if positive check odd
        beq		$t3,$zero,skip			# if even go skip
        add		$s0, $s0, $t0			# else sum $s0
        j      		skip    			# go skip

negat:  
	andi		$t3, $t0, 0x1			# check even
	bne		$t3, $zero, skip		# if odd go skip
	add		$s1, $s1, $t0			# else sum $s1 
skip:
	addi		$t6, $t6, 4
	addi		$t5, $t5, 1	
	j		loop
        
exit: 
        addiu      $v0, $zero, 10    # system service 10 is exit
        syscall                      # we are outta here.
        
        ###############################################################################
        # Data input.
        ###############################################################################
        .data
length: .word 5 # Number of values in the input array
input:  .word 3, -2, 0, 4, -1
