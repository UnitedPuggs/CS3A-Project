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

@LT_END // jumps to process the input if the buffer is full
D;JEQ


///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
(LT_clearBuf)
@LT_cursor
D=M
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
A=M
M=0

@LT_cursor      //checks if the cursor is at 0, if not loops again
D=M
@LT_INPUT_LOOP
D;JEQ
@LT_cursor  //decrements cursor position
D=M
M=M-1
@LT_clearBuf
0;JMP


///////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////
(LT_delBuf)

@LT_cursor
D=M
@ge_currentColumn  //sets current column to a space on screen
M=D
@LT_DEL_CONTINUE
D=A
@ge_output_return
M=D
@ge_output_s
0;JMP

(LT_DEL_CONTINUE)

@LT_cursor
A=M
M=0


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