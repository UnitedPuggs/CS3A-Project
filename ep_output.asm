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
@ep_END
0;JMP	

(ep_output_col20_-)
	@20
	D=A
	@ge_currentColumn
	M=D
	@ep_output_col20_-
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
	@ep_output_col20_+
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