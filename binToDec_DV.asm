//Student: Dante Vazquez
//Binary to decimal conversion segment
//Gets a 16-bit signed word and converts it to decimal 
//R0 through R15 are stored in an array that starts at address 1000 and extends.. 
//to address 1015. Therefore R0-R15 are never modified
//Converted number is stored in @dec  (register 16)
//Whether the converted number is positve or negative is stored in @isNegative (register 17)




@dec
M=0 //decimal=0

@R0
@R1
@R2
@R3
@R4
@R5
@R6
@R7
@R8
@R9
@R10
@R11
@R12
@R13
@R14
@R15 //this can be removed later

@isNegative
M=0 // isNegative= false

@iTracker
M=0 //Used to keep count of the the variable @iTwo

//bit = 100 Initializing start of 16 bit array
@1000
D=A
@bit
M=D

//RAM [1000 through 1015] = R0 through R15

@R0
D=M
@1000
M=D //bit[0] = R0

@R1
D=M
@1001
M=D //bit[1] = R1

@R2
D=M
@1002
M=D //bit[2] = R2

@R3
D=M
@1003
M=D //bit[3] = R3

@R4
D=M
@1004
M=D //bit[4] = R4

@R5
D=M
@1005
M=D //bit[5] = R5    //line 50

@R6
D=M
@1006
M=D //bit[6] = R6

@R7
D=M
@1007
M=D //bit[7] = R7

@R8
D=M
@1008
M=D //bit[8] = R8

@R9
D=M
@1009
M=D //bit[9] = R9

@R10
D=M
@1010
M=D //bit[10] = R10

@R11
D=M
@1011
M=D //bit[11] = R11

@R12
D=M
@1012
M=D //bit[12] = R12

@R13
D=M
@1013
M=D //bit[13] = R13

@R14
D=M
@1014
M=D //bit[14] = R14

@R15
D=M
@1015
M=D //bit[15] = R15

//if (bit[0] == 1) convert binary word to 2s compliment
@1000
D=M
@DECIMAL_CONVERSION
D;JEQ //if bit[1] equals 0, no two's compliment is needed, go to binary to decimal conversion

//Check for 1000 0000 0000 0000

//specialCaseCompare = 16
@16
D=A
@specialCaseCompare
M=D 

//i=1
@iSpecialCase
M=1                                    

@1000
D=A
@bit
M=D

//if (i == specialCaseCompare) go to end of loop
(SPECIAL_CASE_LOOP)
@iSpecialCase 
D=M 
@specialCaseCompare
D=D-M 
@NO_ONES_FOUND
D;JEQ //If all bits were checked and no ones were found, go to NO_ONES_FOUND

@bit 
D=M
@iSpecialCase 
A=D+M
D=M // D= bit[i]
@ONE_FOUND
D;JGT // bit[i]=1, continue to start of 2s compliment processing

@iSpecialCase
M=M+1 //i++

@SPECIAL_CASE_LOOP
0;JMP 

(NO_ONES_FOUND) //Special case 1000 0000 0000 0000 was found

@3
D=A 
@2004
M=D //DecArr[4] = 3

@2
D=A 
@2003
M=D //DecArr[3] = 2

@7
D=A 
@2002
M=D //DecArr[2] = 7

@6
D=A 
@2001
M=D //DecArr[1] = 6

@8
D=A 
@2000
M=D //DecArr[3] = 8

@isNegative
M= 1  //isNegative=true

@END_OF_DEC
0;JMP 

(ONE_FOUND) //Word is not 1000 0000 0000 0000, no special case 

@isNegative 
M=1 //isNegative= true (Indicates that decimal output will be negative)

//Start of 2s compliment 
//Invert Bit 1 through Bit 15

//for (int i= 1; i<16; i++)
//{
//	if (bit[i] == 1)
//	{
//		bit[i]=0;
//	}
//	else
//	{
//		bit[i]=1;
//	}
// }

//numToCompare = 16
@16
D=A
@numToCompare
M=D 

//i=1
@i  
M=1

(INVERSION_LOOP)
//if (i ==numToCompare) goto ADD_ONE
@i 
D=M
@numToCompare                           //line 150
D=D-M
@ADD_ONE
D;JEQ 

@bit 
D=M
@i 
A=D+M
D=M // D= bit[i]
@TURN_TO_ONE
D;JEQ //If bit[i] = 0 goto TURN_TO_ONE

@bit
D=M
@i
A=D+M
M=0 //bit[i]=0
@ELSE_SKIP_ONE
0;JMP //Skip the following else statement 

(TURN_TO_ONE)
@bit
D=M
@i
A=D+M 
M=1 //bit[i]=1

(ELSE_SKIP_ONE)
@i                              // line 173
M=M+1 // i++

@INVERSION_LOOP
0;JMP //Go back to the start of the loop

//Add +1 to the Inverted 15 bit word.
(ADD_ONE)

//for (int i=15; i> -1 ; i--)
//{
//	if(r[i]==1)
//  {
//      r[i]=0;
//  }
//  else
//  {
//     r[i]=1;
//     break;
//  }
//  iTracker=i;
//}       
//if(iTracker == -1)
//{
// 	r[1]=1;
//}

//numToCompareTwo= -1
@numToCompareTwo    
M= -1

//i=15
@15
D=A 
@iTwo 
M=D 

(ADD_ONE_LOOP)
//if (i == numToCompareTwo) goto CHECK_I
@iTwo
D=M
@numToCompareTwo
D=D+M
@CHECK_I
D;JEQ

@bit 
D=M
@iTwo 
A=D+M
D=M // D= bit[i]
@INVERT_T0_ONE
D;JEQ //If bit[i]=0 goto INVERT_T0_ONE 

@bit
D=M
@iTwo
A=D+M
M=0 //bit[i]=0
@ELSE_SKIP_TWO
0;JMP //Skip the following else statement 

(INVERT_T0_ONE)
@bit
D=M
@iTwo
A=D+M 
M=1 //bit[i]=1

@BREAK_DV
0;JMP

(ELSE_SKIP_TWO)
@iTwo 
D=M 
@iTracker 
M=D //iTracker= i  This is an additional varibale  used to store the value of i 
@iTwo 
M=M-1 //i-- 

@ADD_ONE_LOOP
0;JMP //Go back to the start of the loop

(BREAK_DV)

@iTracker
D=M
@DECIMAL_CONVERSION
D;JGE //If iTracker == -1, bit[1]= 1

@1001
M=1 //bit[1] = 1

(DECIMAL_CONVERSION)
//Checks each Bit. If Bit contains a 1, the Base and Power of its position is added to decimal.
//Example 0000 0000 0000 0011 is binary. Therefore 2^1 and 2^0 are added to dec since there is
//a 1 in each of those slots.

@1001
D=M 
@SKIP_POWER_14
D;JLE //If bit[1] != 1, dont add 16384 to dec 

@16384
D=A 
@dec 
M=M+D 

(SKIP_POWER_14)

@1002
D=M 
@SKIP_POWER_13
D;JLE //If bit[2] != 1, dont add 8192 to dec 

@8192
D=A 
@dec 
M=M+D 

(SKIP_POWER_13)

@1003
D=M 
@SKIP_POWER_12
D;JLE //If bit[3] != 1, dont add 4096 to dec 

@4096
D=A 
@dec 
M=M+D 

(SKIP_POWER_12)

@1004
D=M 
@SKIP_POWER_11
D;JLE //If bit[4] != 1, dont add 2048 to dec 

@2048
D=A 
@dec 
M=M+D 

(SKIP_POWER_11)

@1005
D=M 
@SKIP_POWER_10
D;JLE //If bit[5] != 1, dont add 1024 to dec 

@1024
D=A 
@dec 
M=M+D 

(SKIP_POWER_10)

@1006
D=M 
@SKIP_POWER_9
D;JLE //If bit[6] != 1, dont add 512 to dec 

@512
D=A 
@dec 
M=M+D 

(SKIP_POWER_9)

@1007
D=M 
@SKIP_POWER_8
D;JLE //If bit[7] != 1, dont add 256 to dec 

@256
D=A 
@dec 
M=M+D 

(SKIP_POWER_8)

@1008
D=M 
@SKIP_POWER_7
D;JLE //If bit[8] != 1, dont add 128 to dec 

@128
D=A 
@dec 
M=M+D 

(SKIP_POWER_7)

@1009
D=M 
@SKIP_POWER_6
D;JLE //If bit[9] != 1, dont add 64 to dec 

@64
D=A 
@dec 
M=M+D 

(SKIP_POWER_6)

@1010
D=M 
@SKIP_POWER_5
D;JLE //If bit[10] != 1, dont add 32 to dec 

@32
D=A 
@dec 
M=M+D 

(SKIP_POWER_5)

@1011
D=M 
@SKIP_POWER_4
D;JLE //If bit[11] != 1, dont add 16 to dec 

@16
D=A 
@dec 
M=M+D 

(SKIP_POWER_4)

@1012
D=M 
@SKIP_POWER_3
D;JLE //If bit[12] != 1, dont add 8 to dec 

@8
D=A 
@dec 
M=M+D 

(SKIP_POWER_3)

@1013
D=M 
@SKIP_POWER_2
D;JLE //If bit[13] != 1, dont add 4 to dec 

@4
D=A 
@dec 
M=M+D 

(SKIP_POWER_2)

@1014
D=M 
@SKIP_POWER_1
D;JLE //If bit[14] != 1, dont add 2 to dec 

@2
D=A 
@dec 
M=M+D 

(SKIP_POWER_1)

@1015
D=M 
@SKIP_POWER_0
D;JLE //If bit[15] != 1, dont add 1 to dec 

@dec 
M=M+1

(SKIP_POWER_0)

//CONVERSION IS DONE
//Decimal conversion is saved in @dec (register 16)
//Whether the number is negative is saved in @isNegative. 1=true (-) 0=false (+) (register 17)


//Store dec in 5 individual registers.

//decArr = 2000
@2000
D=A 
@decArr
M=D 

//Register 50-54 are initialized to -1 to indicate if any registers did not store a digit
@2000
M= -1

@2001
M= -1

@2002
M= -1

@2003
M= -1

@2004
M= -1

@iThree
M=0 //i=0

@dec 
D=M 
@dv_dividend
M=D //dv_dividend=dec 

@dv_remainder
M=0 //dv_remainder=0

(DEC_TO_ARR_LOOP)
@dv_dividend
D=M 
@END_OF_DEC
D;JEQ 

@10
D=A
@dv_divisor
M=D //divisor=10

@DIV_FUNCTION 
0;JMP //Calling Div function (Divide Divedend/10)

(DIV_RETURN) 
//Returns dv_quotient which is then stored to dv_dividend
//Also returns dv_remainder which is stored in decArr[i]

//decArr[i]= dv_remainder
@iThree 
D=M 
@decArr
D=D+M 
@decimalPtr
M=D 
@dv_remainder
D=M 
@decimalPtr 
A=M 
M=D  //line 340

@iThree
M=M+1 //i++

@dv_quotient
D=M 
@dv_dividend
M=D //dv_dividend = dv_quotient

@DEC_TO_ARR_LOOP
0;JMP //Go back to beggining of loop

(END_OF_DEC)
@END_OF_DEC
0;JMP

//Decimal conversion stored in register 50-55

//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
//FUNCTION
//div.asm
//=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
(DIV_FUNCTION)

//Dante Vazquez
//CS3A
//Project 5
//Div.asm

@dv_dividend //Divedend r0
@dv_divisor //Divisor    r1
@dv_quotient //Quotient    r2
M=0
@dv_remainder //Remainder   r3
M=0

@dv_dividend
D=M
@dividend
M=D 

@dv_divisor 
D=M
@divisor
M=D 

@dv_quotient
D=M
@quotient
M=D 

@dv_remainder
D=M
@remainder
M=D 

//Special cases (0/x, x/0, 0/0 where x != 0)

@divisor 
D=M
@UNDEFINED
D;JEQ //If Divisor is 0, goto undefined, else check for 0/x

@dividend
D=M
@ZERO_DIV_X
D;JEQ //If R0= 0, goto ZERO_DIV_X

@DIVIDE
0;JMP //Both numbers != 0, proceed to divide, no special case 

(UNDEFINED)
@dividend
D=M
@ZERO_DIV_ZERO
D;JEQ

@X_DIV_ZERO
0;JMP 


(DIVIDE)

@dividend
D=M
@NEG
D;JLT //if dividend is negative go to NEG, else check to see if divisor is + || -

@divisor 
D=M
@POS_NEG
D;JLT //If divisor is negative goto P0S_NEG, else continue

//POS_POS 

//run algortithm 1
@quotient
M=0 //quotient=0

@dividend
D=M 
@remainder 
M=D //remainder=dividend

(LOOP_ONE)
@remainder
D=M
@divisor
D=D-M
@remainder
M=D //remainder = remainder - divisor 
@quotient
M=M+1 //quotient++

@LOOP_ONE
D;JGT// If remainder is > 0 go back to LOOP_ONE

@remainder 
D=M 
@NEXT_ONE
D;JGE //if remainder < 0 continue, else go to next


@divisor
D=D+M 
@remainder
M=D //remainder = remainder + divisor 
@quotient
M=M-1 //quotient--

(NEXT_ONE) //end algortithm 1

@quotient
D=M 
@dv_quotient 
M=D //R2 = quotient

@remainder 
D=M 
@dv_remainder
M=D //R3= remainder 

@END_OF_DIV_FUNC
0;JMP
//break


(POS_NEG)
@divisor 
D=M 
D=D-1 
D=!D 
M=D //negate divisor 

//run algortithm 1
@quotient
M=0 //quotient=0

@dividend
D=M 
@remainder 
M=D //remainder=dividend

(LOOP_TWO)
@remainder
D=M
@divisor
D=D-M
@remainder
M=D //remainder = remainder - divisor 
@quotient
M=M+1 //quotient++

@LOOP_TWO
D;JGT// If remainder is > 0 go back to LOOP_TWO

@remainder 
D=M 
@NEXT_TWO
D;JGE //if remainder < 0 continue, else go to next


@divisor
D=D+M 
@remainder
M=D //remainder = remainder + divisor 
@quotient
M=M-1 //quotient--

(NEXT_TWO) //end algortithm 1

@quotient
D=M 
D=D-1 
D=!D 
M=D  //negate quotient
@dv_quotient
M=D //R2= quotient

@remainder 
D=M 
@dv_remainder
M=D //R3= remainder 

@END_OF_DIV_FUNC 
0;JMP 
//break 

(NEG)
@divisor
D=M 
@NEG_NEG
D;JLT //Go to NEG_NEG if divisor is negative, else continue. 

//NEG_POS

//run algortithm 2
@quotient 	
M=0 //quotient=0

@dividend
D=M
@remainder
M=D //remainder=dividend

(LOOP_THREE)
@remainder
D=M
@divisor
D=D+M
@remainder
M=D //remainder = remainder + divisor 
@quotient
M=M+1 //quotient++

@LOOP_THREE
D;JLT

//end algortithm 2

@quotient
D=M
D=D-1 
D=!D 
M=D //negate quotient
@dv_quotient 
M=D //R2 = quotient 

@remainder 
D=M 
@dv_remainder
M=D //R3= remainder 

@END_OF_DIV_FUNC
0;JMP 
//break 

(NEG_NEG)
@divisor
D=M
D=D-1 
D=!D
M=D //negate divisor 

//run algortithm 2
@quotient 	
M=0 //quotient=0

@dividend
D=M
@remainder
M=D //remainder=dividend

(LOOP_FOUR)
@remainder
D=M
@divisor
D=D+M
@remainder
M=D //remainder = remainder + divisor 
@quotient
M=M+1 //quotient++

@LOOP_FOUR
D;JLT

//end algortithm 2

@quotient
D=M 
@dv_quotient 
M=D //R2 = quotient

@remainder 
D=M 
@dv_remainder
M=D //R3 = remainder 

@END_OF_DIV_FUNC
0;JMP 
//break 


(ZERO_DIV_X) //takes care of 0/x
@dv_quotient
M=0
@dv_remainder
M=0
@END_OF_DIV_FUNC
0;JMP 

(ZERO_DIV_ZERO) //take care of 0/0
@dv_quotient 
M=0
@dv_remainder
M=-1
D=M
D=M-1
M=D 
@END_OF_DIV_FUNC
0;JMP

(X_DIV_ZERO) //takes care of x/0
@dv_quotient 
M=0
@dv_remainder
M=-1
@END_OF_DIV_FUNC
0;JMP 

(END_OF_DIV_FUNC)

@DIV_RETURN
0;JMP

	
	

