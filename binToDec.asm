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
M=D //bit[5] = R5

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
@numToCompare
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
@i 
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

(END)
@END
0;JMP

//CONVERSION IS DONE
//Decimal conversion is saved in @dec (register 16)
//Whether the number is negative is saved in @isNegative. 1=true (-) 0=false (+) (register 17)




//register 29-34.







	

