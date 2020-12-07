// This file uses the Hack language and fonts
// that are part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
//


// coded by Luke Thayer November 2020 for CS 3A
// function LT_getkey returns a single key pressed into LT_key 
//save return address into LT_getkey_return
//acess key press in LT_key




@LT_cursor //stores location of cursor


M=0


@0
M=0
@1
M=0
@2
M=0
@3
M=0
@4
M=0
@5
M=0
@6
M=0
@7
M=0
@8
M=0
@9
M=0
@10
M=0
@11
M=0
@12
M=0
@13
M=0
@14
M=0
@15
M=0


///////////////////////////////////////////////////////////////////////
(LT_INPUT_LOOP)

@LT_getkey_continue  //calls function LT_getkey
D=A
@LT_getkey_return
M=D
@LT_getkey
0;JMP
(LT_getkey_continue)


@LT_zero_input //stores what function to call when button is relseased
D=A
@LT_button_released
M=D
@LT_key //check if 0 is pressed
D=M
@48        //zero has a scan value of 48 
D=D-A      // subtract expected value to check if the key scanned is zero
@LT_button_release_wait //jump to wait for button to be released
D;JEQ

@LT_one_input //stores what function to call when button is relseased
D=A
@LT_button_released
M=D
@LT_key //check if 1 is pressed
D=M
@49    //one has a scan value of 49 
D=D-A      // subtract expected value to check if the key scanned is one
@LT_button_release_wait //jump to wait for button to be released
D;JEQ

@LT_clearBuf //stores what function to call when button is relseased
D=A
@LT_button_released
M=D
@26
D=A
@LT_bufClear
M=D
@LT_key //check if c is pressed
D=M
@67   //c has a scan value of 67
D=D-A      // subtract expected value to check if the key scanned is c
@LT_button_release_wait //jump to wait for button to be released
D;JEQ

@LT_delBuf //stores what function to call when button is relseased
D=A
@LT_button_released
M=D
@LT_key //check if delete is pressed
D=M
@129   //one has a scan value of 129
D=D-A      // subtract expected value to check if the key scanned is backspace
@LT_button_release_wait //jump to wait for button to be released
D;JEQ

@LT_PreProcess  //stores what function to call when button is relseased
D=A
@LT_button_released
M=D
@LT_key //check if enter is pressed
D=M
@128  //one has a scan value of 128
D=D-A      // subtract expected value to check if the key scanned is enter
@LT_button_release_wait //jump to wait for button to be released
D;JEQ

@LT_END  //stores what function to call when button is relseased
D=A
@LT_button_released
M=D
@LT_key //check if Q is pressed
D=M
@81  //one has a scan value of 81
D=D-A      // subtract expected value to check if the key scanned is Q
@LT_button_release_wait //jump to wait for button to be released
D;JEQ


@LT_INPUT_LOOP // if none case is fulfilled loop again
0;JMP
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
(LT_getkey) // retrieves the KBD data and places it in the variable LT_getkey_return
@24576
D=M
@LT_key
M=D
@LT_getkey_return
A=M
0;JMP
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
(LT_PreProcess)
@LT_cursor  //checks if buffer is full if it is jumps back to start of loop
D=M
@16
D=D-A

@LT_INPUT_LOOP // returns to Input loop if the buffer is not full
D;JNE




@18
D=A
@ge_currentColumn //sets current colunm to the cursor
M=D
@LT_PR1 // sets output return to the main input loop
D=A
@ge_output_return
M=D
@ge_output_- // calls the output 0 function
0;JMP
(LT_PR1)


@19
D=A
@ge_currentColumn //sets current colunm to the cursor
M=D
@LT_PR2 // sets output return to the main input loop
D=A
@ge_output_return
M=D
@ge_output_g  // calls the output 0 function
0;JMP
(LT_PR2)




@LT_cursor 
D=M
@16
D=D-A

@DV_process  // jumps to process the input if the buffer is full
D;JEQ


///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
(LT_clearBuf)
@LT_bufClear
D=M-1
@ge_currentColumn  //sets current loop column to a space on screen
M=D
@LT_CLEAR_CONTINUE
D=A
@ge_output_return
M=D
@ge_output_s
0;JMP

(LT_CLEAR_CONTINUE)

@LT_cursor
M=0

@LT_bufClear      //checks if the cursor is at 0, if not loops again
D=M
@LT_INPUT_LOOP
D;JEQ
@LT_bufClear  //decrements cursor position
D=M
M=M-1
@LT_clearBuf
0;JMP


///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
(LT_delBuf)

@LT_cursor
D=M-1
@ge_currentColumn  //sets current column to a space on screen
M=D
@LT_DEL_CONTINUE
D=A
@ge_output_return
M=D
@ge_output_s
0;JMP

(LT_DEL_CONTINUE)



@LT_cursor //if the cursor is at 0 leave the function
D=M
@LT_INPUT_LOOP
D;JEQ

@LT_cursor  //decrements cursor position
D=M
M=M-1
@LT_INPUT_LOOP
0;JMP


///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
(LT_zero_input) //prints a zero to screen at the current cursor's location
@LT_cursor  //checks if buffer is full if it is jumps back to start of loop
D=M
@16
D=D-A
@LT_INPUT_LOOP
D;JEQ
@LT_cursor //set value at cursor to 0
A=M
M=0
@LT_cursor
D=M
M=M+1
@ge_currentColumn //sets current colunm to the cursor
M=D
@LT_INPUT_LOOP // sets output return to the main input loop
D=A
@ge_output_return
M=D
@ge_output_0 // calls the output 0 function
0;JMP
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
(LT_one_input) //prints a one to screen at the current cursor's location
@LT_cursor //checks if buffer is full if it is jumps back to start of loop
D=M
@16
D=D-A
@LT_INPUT_LOOP
D;JEQ
@LT_cursor //set value at cursor to 0
A=M
M=1
@LT_cursor
D=M
M=M+1
@ge_currentColumn //sets current colunm to the cursor
M=D
@LT_INPUT_LOOP // sets output return to the main input loop
D=A
@ge_output_return
M=D
@ge_output_1 // calls the output 1 function
0;JMP
///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
(LT_button_release_wait)
@LT_getkey_release  //calls function LT_getkey
D=A
@LT_getkey_return
M=D
@LT_getkey
0;JMP
(LT_getkey_release)

@LT_key
D=M
@LT_button_released
A=M
D;JEQ

@LT_button_release_wait
0;JMP
///////////////////////////////////////////////////////////////////////




//Student: Dante Vazquez
//Binary to decimal conversion segment
//Gets a 16-bit signed word and converts it to decimal 
//R0 through R15 are stored in an array that starts at address 1000 and extends.. 
//to address 1015. Therefore R0-R15 are never modified
//Converted number is stored in @dec  (register 16)
//Whether the converted number is positve or negative is stored in @isNegative (register 17)




(DV_process)
@dec
M=0 //decimal=0


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
@EP_OUTPUT
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

	
	



(EP_OUTPUT)
	@21
	D=A
	@ge_currentColumn
	M=D
	@ep_output_col21
	D=A
	@ge_output_return
	M=D
	@ep_determineZero_col21
	0;JMP
(ep_output_col21)

	@22
	D=A
	@ge_currentColumn
	M=D
	@ep_output_col22
	D=A
	@ge_output_return
	M=D
	@ep_determineZero_col22
	0;JMP
(ep_output_col22)

	@23
	D=A
	@ge_currentColumn
	M=D
	@ep_output_col23
	D=A
	@ge_output_return
	M=D
	@ep_determineZero_col23
	0;JMP
(ep_output_col23)

	@24
	D=A
	@ge_currentColumn
	M=D
	@ep_output_col24
	D=A
	@ge_output_return
	M=D
	@ep_determineZero_col24
	0;JMP
(ep_output_col24)

	@25
	D=A
	@ge_currentColumn
	M=D
	@ep_output_col25
	D=A
	@ge_output_return
	M=D
	@ep_determineZero_col25
	0;JMP
(ep_output_col25)
	@isNegative
	D=M
	@ep_output_col20_+
	D;JEQ
	@ep_output_col20_-
	D;JGT
(ep_output_col20)

(ep_END)
@LT_INPUT_LOOP
0;JMP	

(ep_output_col20_-)
	@20
	D=A
	@ge_currentColumn
	M=D
	@ep_END
	D=A
	@ge_output_return
	M=D
	@ge_output_-
	0;JMP
(ep_output_col20_+)
	@20
	D=A
	@ge_currentColumn
	M=D
	@ep_END
	D=A
	@ge_output_return
	M=D
	@ge_output_+
	0;JMP

(ep_determineZero_col21)
	@2004
	D=M //D = RAM[29]
	@ge_output_0
	D;JEQ
	@ge_output_s
	D;JLT
	
	@ep_determineOne_col21
	D;JGT
(ep_determineOne_col21)
	@1
	D=A
	@2004
	D=D-M
	@ge_output_1
	D;JEQ
	
	@ep_determineTwo_col21
	D;JGT
(ep_determineTwo_col21)
	@2
	D=A
	@2004
	D=D-M
	@ge_output_2
	D;JEQ
	
	@ep_determineThree_col21
	D;JGT
(ep_determineThree_col21)
	@3
	D=A
	@2004
	D=D-M
	@ge_output_3
	D;JEQ
	
	@ep_determineFour_col21
	D;JGT
(ep_determineFour_col21)
	@4
	D=A
	@2004
	D=D-M
	@ge_output_4
	D;JEQ
	
	@ep_determineFive_col21
	D;JGT
(ep_determineFive_col21)
	@5
	D=A
	@2004
	D=D-M
	@ge_output_5
	D;JEQ
	
	@ep_determineSix_col21
	D;JGT
(ep_determineSix_col21)
	@6
	D=A
	@2004
	D=D-M
	@ge_output_6
	D;JEQ
	
	@ep_determineSeven_col21
	D;JGT
(ep_determineSeven_col21)
	@7
	D=A
	@2004
	D=D-M
	@ge_output_7
	D;JEQ
	
	@ep_determineEight_col21
	D;JGT
(ep_determineEight_col21)
	@8
	D=A
	@2004
	D=D-M
	@ge_output_8
	D;JEQ
	
	@ep_determineNine_col21
	D;JGT
(ep_determineNine_col21)
	@9
	D=A
	@2004
	D=D-M
	@ge_output_9
	D;JEQ //ends here, we can't have numbers greater than 9

(ep_determineZero_col22)
	@2003
	D=M //D = RAM[29]
	@ge_output_0
	D;JEQ
	@ge_output_s
	D;JLT
	
	@ep_determineOne_col22
	D;JGT
(ep_determineOne_col22)
	@1
	D=A
	@2003
	D=D-M
	@ge_output_1
	D;JEQ
	
	@ep_determineTwo_col22
	D;JGT
(ep_determineTwo_col22)
	@2
	D=A
	@2003
	D=D-M
	@ge_output_2
	D;JEQ
	
	@ep_determineThree_col22
	D;JGT
(ep_determineThree_col22)
	@3
	D=A
	@2003
	D=D-M
	@ge_output_3
	D;JEQ
	
	@ep_determineFour_col22
	D;JGT
(ep_determineFour_col22)
	@4
	D=A
	@2003
	D=D-M
	@ge_output_4
	D;JEQ
	
	@ep_determineFive_col22
	D;JGT
(ep_determineFive_col22)
	@5
	D=A
	@2003
	D=D-M
	@ge_output_5
	D;JEQ
	
	@ep_determineSix_col22
	D;JGT
(ep_determineSix_col22)
	@6
	D=A
	@2003
	D=D-M
	@ge_output_6
	D;JEQ
	
	@ep_determineSeven_col22
	D;JGT
(ep_determineSeven_col22)
	@7
	D=A
	@2003
	D=D-M
	@ge_output_7
	D;JEQ
	
	@ep_determineEight_col22
	D;JGT
(ep_determineEight_col22)
	@8
	D=A
	@2003
	D=D-M
	@ge_output_8
	D;JEQ
	
	@ep_determineNine_col22
	D;JGT
(ep_determineNine_col22)
	@9
	D=A
	@2003
	D=D-M
	@ge_output_9
	D;JEQ //ends here, we can't have numbers greater than 9
	


(ep_determineZero_col23)
	@2002
	D=M //D = RAM[29]
	@ge_output_0
	D;JEQ
	@ge_output_s
	D;JLT
	
	@ep_determineOne_col23
	D;JGT
(ep_determineOne_col23)
	@1
	D=A
	@2002
	D=D-M
	@ge_output_1
	D;JEQ
	
	@ep_determineTwo_col23
	D;JGT
(ep_determineTwo_col23)
	@2
	D=A
	@2002
	D=D-M
	@ge_output_2
	D;JEQ
	
	@ep_determineThree_col23
	D;JGT
(ep_determineThree_col23)
	@3
	D=A
	@2002
	D=D-M
	@ge_output_3
	D;JEQ
	
	@ep_determineFour_col23
	D;JGT
(ep_determineFour_col23)
	@4
	D=A
	@2002
	D=D-M
	@ge_output_4
	D;JEQ
	
	@ep_determineFive_col23
	D;JGT
(ep_determineFive_col23)
	@5
	D=A
	@2002
	D=D-M
	@ge_output_5
	D;JEQ
	
	@ep_determineSix_col23
	D;JGT
(ep_determineSix_col23)
	@6
	D=A
	@2002
	D=D-M
	@ge_output_6
	D;JEQ
	
	@ep_determineSeven_col23
	D;JGT
(ep_determineSeven_col23)
	@7
	D=A
	@2002
	D=D-M
	@ge_output_7
	D;JEQ
	
	@ep_determineEight_col23
	D;JGT
(ep_determineEight_col23)
	@8
	D=A
	@2002
	D=D-M
	@ge_output_8
	D;JEQ
	
	@ep_determineNine_col23
	D;JGT
(ep_determineNine_col23)
	@9
	D=A
	@2002
	D=D-M
	@ge_output_9
	D;JEQ //ends here, we can't have numbers greater than 9
	

(ep_determineZero_col24)
	@2001
	D=M //D = RAM[29]
	@ge_output_0
	D;JEQ
	@ge_output_s
	D;JLT
	
	@ep_determineOne_col24
	D;JGT
(ep_determineOne_col24)
	@1
	D=A
	@2001
	D=D-M
	@ge_output_1
	D;JEQ
	
	@ep_determineTwo_col24
	D;JGT
(ep_determineTwo_col24)
	@2
	D=A
	@2001
	D=D-M
	@ge_output_2
	D;JEQ
	
	@ep_determineThree_col24
	D;JGT
(ep_determineThree_col24)
	@3
	D=A
	@2001
	D=D-M
	@ge_output_3
	D;JEQ
	
	@ep_determineFour_col24
	D;JGT
(ep_determineFour_col24)
	@4
	D=A
	@2001
	D=D-M
	@ge_output_4
	D;JEQ
	
	@ep_determineFive_col24
	D;JGT
(ep_determineFive_col24)
	@5
	D=A
	@2001
	D=D-M
	@ge_output_5
	D;JEQ
	
	@ep_determineSix_col24
	D;JGT
(ep_determineSix_col24)
	@6
	D=A
	@2001
	D=D-M
	@ge_output_6
	D;JEQ
	
	@ep_determineSeven_col24
	D;JGT
(ep_determineSeven_col24)
	@7
	D=A
	@2001
	D=D-M
	@ge_output_7
	D;JEQ
	
	@ep_determineEight_col24
	D;JGT
(ep_determineEight_col24)
	@8
	D=A
	@2001
	D=D-M
	@ge_output_8
	D;JEQ
	
	@ep_determineNine_col24
	D;JGT
(ep_determineNine_col24)
	@9
	D=A
	@2001
	D=D-M
	@ge_output_9
	D;JEQ //ends here, we can't have numbers greater than 9
	

(ep_determineZero_col25)
	@2000
	D=M //D = RAM[29]
	@ge_output_0
	D;JEQ
	@ge_output_s
	D;JLT
	
	@ep_determineOne_col25
	D;JGT
(ep_determineOne_col25)
	@1
	D=A
	@2000
	D=D-M
	@ge_output_1
	D;JEQ
	
	@ep_determineTwo_col25
	D;JGT
(ep_determineTwo_col25)
	@2
	D=A
	@2000
	D=D-M
	@ge_output_2
	D;JEQ
	
	@ep_determineThree_col25
	D;JGT
(ep_determineThree_col25)
	@3
	D=A
	@2000
	D=D-M
	@ge_output_3
	D;JEQ
	
	@ep_determineFour_col25
	D;JGT
(ep_determineFour_col25)
	@4
	D=A
	@2000
	D=D-M
	@ge_output_4
	D;JEQ
	
	@ep_determineFive_col25
	D;JGT
(ep_determineFive_col25)
	@5
	D=A
	@2000
	D=D-M
	@ge_output_5
	D;JEQ
	
	@ep_determineSix_col25
	D;JGT
(ep_determineSix_col25)
	@6
	D=A
	@2000
	D=D-M
	@ge_output_6
	D;JEQ
	
	@ep_determineSeven_col25
	D;JGT
(ep_determineSeven_col25)
	@7
	D=A
	@2000
	D=D-M
	@ge_output_7
	D;JEQ
	
	@ep_determineEight_col25
	D;JGT
(ep_determineEight_col25)
	@8
	D=A
	@2000
	D=D-M
	@ge_output_8
	D;JEQ
	
	@ep_determineNine_col25
	D;JGT
(ep_determineNine_col25)
	@9
	D=A
	@2000
	D=D-M
	@ge_output_9
	D;JEQ //ends here, we can't have numbers greater than 9







///////////////////////////////////////////////////////////////////////
(LT_END) //ending loop
@LT_END
0;JMP
///////////////////////////////////////////////////////////////////////
// coded by George Eaton November 2020 for CS 3A

//
// functions ge_output_X (where X is one of the characters 0,1,2,3,4,5,6,7,8,9,0,- (minus),
//                        s (space bar), or g (greater than  > )
//
// Outputs character X (see above) at a specified column, where columns run from
// 0 to 31.
//
// Call ge_output_X as follows:
//     - save return address in ge_output_return
//     - save the current column (starting with 0 for the first column) in
//       variable ge_currentColumn
//     - jump to ge_output_X to output the character X in
//       column ge_currentColumn, where X is one of the
//       the characters 0,1,2,3,4,5,6,7,8,9,0,-,s, or g




// ge_continue_output
// this helper function ge_continue_output outputs the character defined by
// frontRow1 through initialized below it in the functions ge_output_X
(ge_continue_output)
//
// ***constants***
//
// ge_rowOffset - number of words to move to the next row of pixels
@32
D=A
@ge_rowOffset
M=D
// end of constants
//

//
// ***key variables***
//

// ge_currentRow - variable holding the display memory address to be written,
//                 which starts at the fourth row of pixels (SCREEN + 3 x rowOffset) 
//                 offset by the current column and
//                 increments row by row to draw the character
//               - initialized to the beginning of the fourth row in screen memory
//                 plus the current column
@SCREEN
D=A
@ge_rowOffset
// offset to the fourth row
D=D+M
D=D+M
D=D+M
// add the current column
@ge_currentColumn
D=D+M
@ge_currentRow
M=D
//


// write the first row of pixels
// load pattern in D via A
@fontRow1
D=M
// write pattern at currentLine
@ge_currentRow
A=M
M=D
//

// update current line
@ge_rowOffset
D=M
@ge_currentRow
M=D+M
// load pattern in D via A
@fontRow2
D=M
// write pattern at currentLine
@ge_currentRow
A=M
M=D
//


// update current line
@ge_rowOffset
D=M
@ge_currentRow
M=D+M
// load pattern in D via A
@fontRow3
D=M
// write pattern at currentLine
@ge_currentRow
A=M
M=D
//


// update current line
@ge_rowOffset
D=M
@ge_currentRow
M=D+M
// load pattern in D via A
@fontRow4
D=M
// write pattern at currentLine
@ge_currentRow
A=M
M=D
//


// update current line
@ge_rowOffset
D=M
@ge_currentRow
M=D+M
// load pattern in D via A
@fontRow5
D=M
// write pattern at currentLine
@ge_currentRow
A=M
M=D
//


// update current line
@ge_rowOffset
D=M
@ge_currentRow
M=D+M
// load pattern in D via A
@fontRow6
D=M
// write pattern at currentLine
@ge_currentRow
A=M
M=D
//


// update current line
@ge_rowOffset
D=M
@ge_currentRow
M=D+M
// load pattern in D via A
@fontRow7
D=M
// write pattern at currentLine
@ge_currentRow
A=M
M=D
//


// update current line
@ge_rowOffset
D=M
@ge_currentRow
M=D+M
// load pattern in D via A
@fontRow8
D=M
// write pattern at currentLine
@ge_currentRow
A=M
M=D
//


// update current line
@ge_rowOffset
D=M
@ge_currentRow
M=D+M
// load pattern in D via A
@fontRow9
D=M
// write pattern at currentLine
@ge_currentRow
A=M
M=D
//



// return from function
@ge_output_return
A=M
0;JMP



//
// individual function ge_output_X definitions which are 
// just font definitions for the helper function above
//

//ge_output_0
(ge_output_0)
//do Output.create(12,30,51,51,51,51,51,30,12); // 0

@12
D=A
@fontRow1
M=D

@30
D=A
@fontRow2
M=D

@51
D=A
@fontRow3
M=D

@51
D=A
@fontRow4
M=D

@51
D=A
@fontRow5
M=D

@51
D=A
@fontRow6
M=D

@51
D=A
@fontRow7
M=D

@30
D=A
@fontRow8
M=D

@12
D=A
@fontRow9
M=D
@ge_continue_output
0;JMP
// end ge_output_0

//ge_output_1
(ge_output_1)
//do Output.create(12,14,15,12,12,12,12,12,63); // 1

@12
D=A
@fontRow1
M=D

@14
D=A
@fontRow2
M=D

@15
D=A
@fontRow3
M=D

@12
D=A
@fontRow4
M=D

@12
D=A
@fontRow5
M=D

@12
D=A
@fontRow6
M=D

@12
D=A
@fontRow7
M=D

@12
D=A
@fontRow8
M=D

@63
D=A
@fontRow9
M=D
@ge_continue_output
0;JMP
// end ge_output_1

//ge_output_2
(ge_output_2)
//do Output.create(30,51,48,24,12,6,3,51,63);   // 2

@30
D=A
@fontRow1
M=D

@51
D=A
@fontRow2
M=D

@48
D=A
@fontRow3
M=D

@24
D=A
@fontRow4
M=D

@12
D=A
@fontRow5
M=D

@6
D=A
@fontRow6
M=D

@3
D=A
@fontRow7
M=D

@51
D=A
@fontRow8
M=D

@63
D=A
@fontRow9
M=D
@ge_continue_output
0;JMP
// end ge_output_2


//ge_output_3
(ge_output_3)
//do Output.create(30,51,48,48,28,48,48,51,30); // 3

@30
D=A
@fontRow1
M=D

@51
D=A
@fontRow2
M=D

@48
D=A
@fontRow3
M=D

@48
D=A
@fontRow4
M=D

@28
D=A
@fontRow5
M=D

@48
D=A
@fontRow6
M=D

@48
D=A
@fontRow7
M=D

@51
D=A
@fontRow8
M=D

@30
D=A
@fontRow9
M=D
@ge_continue_output
0;JMP
// end ge_output_3

//ge_output_4
(ge_output_4)
//do Output.create(16,24,28,26,25,63,24,24,60); // 4

@16
D=A
@fontRow1
M=D

@24
D=A
@fontRow2
M=D

@28
D=A
@fontRow3
M=D

@26
D=A
@fontRow4
M=D

@25
D=A
@fontRow5
M=D

@63
D=A
@fontRow6
M=D

@24
D=A
@fontRow7
M=D

@24
D=A
@fontRow8
M=D

@60
D=A
@fontRow9
M=D
@ge_continue_output
0;JMP
// end ge_output_4

//ge_output_5
(ge_output_5)
//do Output.create(63,3,3,31,48,48,48,51,30);   // 5

@63
D=A
@fontRow1
M=D

@3
D=A
@fontRow2
M=D

@3
D=A
@fontRow3
M=D

@31
D=A
@fontRow4
M=D

@48
D=A
@fontRow5
M=D

@48
D=A
@fontRow6
M=D

@48
D=A
@fontRow7
M=D

@51
D=A
@fontRow8
M=D

@30
D=A
@fontRow9
M=D
@ge_continue_output
0;JMP
// end ge_output_5

//ge_output_6
(ge_output_6)
//do Output.create(28,6,3,3,31,51,51,51,30);    // 6

@28
D=A
@fontRow1
M=D

@6
D=A
@fontRow2
M=D

@3
D=A
@fontRow3
M=D

@3
D=A
@fontRow4
M=D

@31
D=A
@fontRow5
M=D

@51
D=A
@fontRow6
M=D

@51
D=A
@fontRow7
M=D

@51
D=A
@fontRow8
M=D

@30
D=A
@fontRow9
M=D
@ge_continue_output
0;JMP
// end ge_output_6

//ge_output_7
(ge_output_7)
//do Output.create(63,49,48,48,24,12,12,12,12); // 7

@63
D=A
@fontRow1
M=D

@49
D=A
@fontRow2
M=D

@48
D=A
@fontRow3
M=D

@48
D=A
@fontRow4
M=D

@24
D=A
@fontRow5
M=D

@12
D=A
@fontRow6
M=D

@12
D=A
@fontRow7
M=D

@12
D=A
@fontRow8
M=D

@12
D=A
@fontRow9
M=D
@ge_continue_output
0;JMP
// end ge_output_7


//ge_output_8
(ge_output_8)
//do Output.create(30,51,51,51,30,51,51,51,30); // 8

@30
D=A
@fontRow1
M=D

@51
D=A
@fontRow2
M=D

@51
D=A
@fontRow3
M=D

@51
D=A
@fontRow4
M=D

@30
D=A
@fontRow5
M=D

@51
D=A
@fontRow6
M=D

@51
D=A
@fontRow7
M=D

@51
D=A
@fontRow8
M=D

@30
D=A
@fontRow9
M=D
@ge_continue_output
0;JMP
// end ge_output_8



//ge_output_9
(ge_output_9)
//do Output.create(30,51,51,51,62,48,48,24,14); // 9

@30
D=A
@fontRow1
M=D

@51
D=A
@fontRow2
M=D

@51
D=A
@fontRow3
M=D

@51
D=A
@fontRow4
M=D

@62
D=A
@fontRow5
M=D

@48
D=A
@fontRow6
M=D

@48
D=A
@fontRow7
M=D

@25
D=A
@fontRow8
M=D

@14
D=A
@fontRow9
M=D
@ge_continue_output
0;JMP
// end ge_output_9


//ge_output_s
(ge_output_s)
//do Output.create(0,0,0,0,0,0,0,0,0); // space

@0
D=A
@fontRow1
M=D

@0
D=A
@fontRow2
M=D

@0
D=A
@fontRow3
M=D

@0
D=A
@fontRow4
M=D

@0 // temporarily change to 255 so you can see it
D=A
@fontRow5
M=D

@0
D=A
@fontRow6
M=D

@0
D=A
@fontRow7
M=D

@0
D=A
@fontRow8
M=D

@0
D=A
@fontRow9
M=D
@ge_continue_output
0;JMP
// end ge_output_s



//ge_output_-
(ge_output_-)
//do Output.create(0,0,0,0,0,63,0,0,0);         // -

@0
D=A
@fontRow1
M=D

@0
D=A
@fontRow2
M=D

@0
D=A
@fontRow3
M=D

@0
D=A
@fontRow4
M=D

@0
D=A
@fontRow5
M=D

@63 // use 16128 to have minus to the right of the word
D=A
@fontRow6
M=D

@0
D=A
@fontRow7
M=D

@0
D=A
@fontRow8
M=D

@0
D=A
@fontRow9
M=D
@ge_continue_output
0;JMP
// end ge_output_-


//ge_output_g
(ge_output_g)
//do Output.create(0,0,3,6,12,24,12,6,3);       // >

@0
D=A
@fontRow1
M=D

@0
D=A
@fontRow2
M=D

@3
D=A
@fontRow3
M=D

@6
D=A
@fontRow4
M=D

@12
D=A
@fontRow5
M=D

@24
D=A
@fontRow6
M=D

@12
D=A
@fontRow7
M=D

@6
D=A
@fontRow8
M=D

@3
D=A
@fontRow9
M=D
@ge_continue_output
0;JMP
// end ge_output_g


//ge_output_+
(ge_output_+)
//do Output.create(0,0,0,12,12,63,12,12,0);     // +

@0
D=A
@fontRow1
M=D

@0
D=A
@fontRow2
M=D

@0
D=A
@fontRow3
M=D

@12
D=A
@fontRow4
M=D

@12
D=A
@fontRow5
M=D

@63
D=A
@fontRow6
M=D

@12
D=A
@fontRow7
M=D

@12
D=A
@fontRow8
M=D

@0
D=A
@fontRow9
M=D
@ge_continue_output
0;JMP
// end ge_output_+