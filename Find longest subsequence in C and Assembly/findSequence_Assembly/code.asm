# Assumptions:
#	* Input array length could be maximum 10
# 	* Values of elements of array coud be at most 2^8 = 255, because each array element is stored in a byte
.data
inputFileName:	.asciiz "input.txt"
buffByte:		.space 1	# 1 byte buffer to read file
line:			.space 100 	# line buffer to store line
lineLen:		.byte 0 	 
newline: 		.asciiz "\n"
space: 			.asciiz " "
arr1:			.byte 3, 10, 7, 9, 4, 11
arrLen1:		.byte 6
msgLongest1:	.asciiz "Longest sequence of arr1: "
arr2:			.byte 1, 3, 4, 5
arrLen2:		.byte 4
msgLongest2:	.asciiz "Longest sequence of arr2: "
arr3:			.byte 5, 53, 42, 88, 100
arrLen3:		.byte 5
msgLongest3:	.asciiz "Longest sequence of arr3: "
arr4:			.byte 32, 1, 11, 5, 2, 4, 6
arrLen4:		.byte 7
msgLongest4:	.asciiz "Longest sequence of arr4: "
arr5:			.byte 4, 6, 7, 9 , 10
arrLen5:		.byte 5
msgLongest5:	.asciiz "Longest sequence of arr5: "
arr6:			.byte 1, 3, 4, 5, 9, 8, 14, 12
arrLen6:		.byte 8
msgLongest6:	.asciiz "Longest sequence of arr6: "
currSeq:		.space 10	# keeps current sub sequence of array
currSeqLen:		.byte 0
longestSeq:		.space 10	# store longest sub sequence of array
longestSeqLen: 	.byte 0	

msgErrReadInp:	.asciiz "Input file could not be read\n"	
readDemoStart: 	.asciiz "File read demo starts\n"
readDemoEnd:	.asciiz "File read demo ends\n"


.text
main:
## file read demo starts
la $a0 readDemoStart
li $v0 4 
syscall 

jal readInputFile 

la $a0 readDemoEnd
li $v0 4 
syscall 
## file read demo ends

######### array 1
li $a0 0 	# array index
li $a1 0 	# curr seq index 
la $a2 arr1 
lb $a3 arrLen1
jal longestSubseq # find all sequences of given array and store longest one

#print "longest sequence: " message
la $a0 msgLongest1
li $v0 4 
syscall 
		
#print longest sequence array
la $a0 longestSeq	 	
lb $a1 longestSeqLen
jal printArray
sb $zero longestSeqLen 

######### array 2
li $a0 0 	# array index
li $a1 0 	# curr seq index 
la $a2 arr2
lb $a3 arrLen2
jal longestSubseq # find all sequences of given array and store longest one

#print "longest sequence: " message
la $a0 msgLongest2
li $v0 4 
syscall 
		
#print longest sequence array
la $a0 longestSeq	 	
lb $a1 longestSeqLen
jal printArray
sb $zero longestSeqLen 


######### array 3
li $a0 0 	# array index
li $a1 0 	# curr seq index 
la $a2 arr3
lb $a3 arrLen3
jal longestSubseq # find all sequences of given array and store longest one

#print "longest sequence: " message
la $a0 msgLongest3
li $v0 4 
syscall 
		
#print longest sequence array
la $a0 longestSeq	 	
lb $a1 longestSeqLen
jal printArray
sb $zero longestSeqLen 


######### array 4
li $a0 0 	# array index
li $a1 0 	# curr seq index 
la $a2 arr4
lb $a3 arrLen4
jal longestSubseq # find all sequences of given array and store longest one

#print "longest sequence: " message
la $a0 msgLongest4
li $v0 4 
syscall 
		
#print longest sequence array
la $a0 longestSeq	 	
lb $a1 longestSeqLen
jal printArray
sb $zero longestSeqLen 


######### array 5
li $a0 0 	# array index
li $a1 0 	# curr seq index 
la $a2 arr5
lb $a3 arrLen5
jal longestSubseq # find all sequences of given array and store longest one

#print "longest sequence: " message
la $a0 msgLongest5
li $v0 4 
syscall 
		
#print longest sequence array
la $a0 longestSeq	 	
lb $a1 longestSeqLen
jal printArray
sb $zero longestSeqLen 


######### array 6
li $a0 0 	# array index
li $a1 0 	# curr seq index 
la $a2 arr6
lb $a3 arrLen6
jal longestSubseq # find all sequences of given array and store longest one

#print "longest sequence: " message
la $a0 msgLongest6
li $v0 4 
syscall 
		
#print longest sequence array
la $a0 longestSeq	 	
lb $a1 longestSeqLen
jal printArray
sb $zero longestSeqLen 

terminate:
	li $v0, 10
	syscall

# this procedure just reads input file which name is given in inputFileName
readInputFile:
	# save register values into stack 
	addi $sp $sp -28
	sw $s0 ($sp)
	sw $s1 4($sp)
	sw $s2 8($sp)
	sw $ra 12($sp)
	sw $s3 16($sp)
	sw $s4 20($sp)
	sw $s5 24($sp)
	
	# open file 
	li $v0, 13	# file open syscall code
	la $a0, inputFileName # file name to open 
	li $a1, 0 # open to read 
	li $a2, 0 # mode, syscall 13 ignores mode parameter
	syscall 
	
	move $s0, $v0 # save fd
	li $s3 0 # curr index of line
	bge $v0 $zero readFile
	
	# print error message and finish procedure
	li $v0 4
	la $a0 msgErrReadInp
	syscall
	j exitReadFile
	
	li $v0, 4
	la $a0, newline
	syscall
	
	# read file
	readFile:
		li $v0, 14
		move $a0, $s0
		la $a1, buffByte
		li $a2, 1
		syscall 
		
		move $s4 $v0 # get number of charecters read 
		beq $s4 $zero lineDone
		
		lb $s1 buffByte
		li $s2 10 # new line ascii code
		beq $s1 $s2 lineDone
		
		sb $s1 line($s3)
		addi $s3 $s3 1
		
		j contToLoop
		
		lineDone:
			sb $s3 lineLen
			sb $zero line($s3)
			
			la $a0 line
			move $a1 $s3
			li $v0 4
			syscall 

			la $a0 newline
			li $v0 4
			syscall 
			
			li $s3 0
		
		contToLoop:
		
		bne $s4 $zero readFile # there are still bytes to read 
	

	exitReadFile:
		# load register values from stack 
		lw $s0 ($sp)
		lw $s1 4($sp)
		lw $s2 8($sp)
		lw $ra 12($sp)
		lw $s3 16($sp)
		lw $s4 20($sp)
		lw $s5 24($sp)
		addi $sp $sp 28

	jr $ra


longestSubseq:
	
	move $t1 $a3
	bne $a0	$t1 cont
		# save curr return address
		addi $sp $sp -32
		sw $a2 28($sp)
		sw $a3 24($sp)	
		sw $s2 20($sp)
		sw $s1 16($sp)
		sw $s0 12($sp)
		sw $a0 8($sp)
		sw $a1 4($sp)
		sw $ra ($sp)
		
		la $a0 currSeq	 	
		lb $a1 currSeqLen
		jal printArray

		lb $t4 currSeqLen
		lb $t5 longestSeqLen
		ble $t4 $t5 dontUpdateLongest
		
		#update longest sequence 
		li $t3 0
		lb $t4 currSeqLen
		la $s0 currSeq
		la $s1 longestSeq
		loop2:
			lb $s2 ($s0)	    # load element from source arr
			sb $s2 ($s1)		# store current element to target arr
			addi $t3 $t3 1	  	# loop counter
			addi $s0 $s0 1   	# address of current element in the source array
			add $s1 $s1 1   	# address of current index in target array
			blt $t3 $t4 loop2 
		
		
		sb $t4 longestSeqLen # update longest seq len
			
		dontUpdateLongest: # longest sequence did not get updated
		
		# load back prev return address 
		lw $ra ($sp)
		lw $a1 4($sp)
		lw $a0 8($sp)
		lw $s0 12($sp)		
		lw $s1 16($sp)
		lw $s2 20($sp)
		lw $a3 24($sp)
		lw $a2 28($sp)	
		addi $sp $sp 32
		
		jr $ra
			
	cont:
		# save curr return address and func parameter
		addi $sp $sp -32
		sw $a2 28($sp)
		sw $a3 24($sp)	
		sw $s2 20($sp)
		sw $s1 16($sp)
		sw $s0 12($sp)
		sw $a0 8($sp)
		sw $a1 4($sp)
		sw $ra ($sp)
		
		addi $a0 $a0 1 # increment array index by 1
		jal longestSubseq
		
		# load back prev return address and func parameter
		lw $ra ($sp)
		lw $a1 4($sp)
		lw $a0 8($sp)
		lw $s0 12($sp)		
		lw $s1 16($sp)
		lw $s2 20($sp)
		lw $a3 24($sp)
		lw $a2 28($sp)	
		addi $sp $sp 32
		
		move $t6 $a2
		add $t6 $t6 $a0
		lb $t2 ($t6) # current array element 
		beq $a1 $zero addCurrElement
		la $t5 currSeq($a1)
		add $t5 $t5 -1
		lb $t3 ($t5) # currSeq top element
		bgt $t3 $t2 skipCurrElement # previously added number is greater than current number
			 
		addCurrElement:
			sb $t2 currSeq($a1) # put current array element into currSeq
			
			lb $t4 currSeqLen 
			addi $t4 $t4 1
			sb $t4 currSeqLen
		
			# save curr return address and func parameter
			addi $sp $sp -32
			sw $a2 28($sp)
			sw $a3 24($sp)	
			sw $s2 20($sp)
			sw $s1 16($sp)
			sw $s0 12($sp)
			sw $a0 8($sp)
			sw $a1 4($sp)
			sw $ra ($sp)
		
			addi $a0 $a0 1
			addi $a1 $a1 1 
			jal longestSubseq
			
			lb $t4 currSeqLen 
			addi $t4 $t4 -1
			sb $t4 currSeqLen

			# load back prev return address and func parameter
			lw $ra ($sp)
			lw $a1 4($sp)
			lw $a0 8($sp)
			lw $s0 12($sp)		
			lw $s1 16($sp)
			lw $s2 20($sp)
			lw $a3 24($sp)
			lw $a2 28($sp)	
			addi $sp $sp 32
		
	
		skipCurrElement:
		
		jr $ra


printArray:
	
	addi $sp $sp -20
	sw $a1 16($sp)
	sw $a0 12($sp)
	sw $s2 8($sp)
	sw $s1 4($sp)
	sw $s0 ($sp)
	
	li $s0 0 # index
	la $s1 ($a0) # address of the array
	move $s2 $a1 # len of array
	beq $a1 $zero exit
	
	loop:
		# write current elemnt of array
		lb $a0 ($s1) 
		li $v0 1 
		syscall 
		
		# put a space
		la $a0 space
		li $v0 4 
		syscall 
		
		addi $s0 $s0 1	# increment current index by one 
		addi $s1 $s1 1 # increment address of the array by one bit
		bne $s0 $s2 loop	# if there are elements to write go to loop
	
	exit:
		# put a space
		la $a0 newline
		li $v0 4 
		syscall 
	
	lw $a1 16($sp)
	lw $a0 12($sp)
	lw $s2 8($sp)
	lw $s1 4($sp)
	lw $s0 ($sp)
	addi $sp $sp 20

	jr $ra














