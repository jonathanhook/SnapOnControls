   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.19 - 04 Sep 2013
   3                     ; Generator (Limited) V4.3.11 - 04 Sep 2013
  54                     ; 26 void initMemory(void)
  54                     ; 27 {
  56                     	switch	.text
  57  0000               _initMemory:
  61                     ; 28 	writeEEPROMByte(0x0, 0x0);
  63  0000 5f            	clrw	x
  64  0001 cd0144        	call	_writeEEPROMByte
  66                     ; 29 	writeEEPROMByte(0x1, 0x0);
  68  0004 ae0100        	ldw	x,#256
  69  0007 cd0144        	call	_writeEEPROMByte
  71                     ; 30 	writeEEPROMByte(0x2, 0x0);
  73  000a ae0200        	ldw	x,#512
  74  000d cd0144        	call	_writeEEPROMByte
  76                     ; 31 	writeEEPROMByte(0x3, 0x0);
  78  0010 ae0300        	ldw	x,#768
  79  0013 cd0144        	call	_writeEEPROMByte
  81                     ; 32 }
  84  0016 81            	ret
 108                     ; 34 void deInitClock(void)
 108                     ; 35 {
 109                     	switch	.text
 110  0017               _deInitClock:
 114                     ; 36 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, DISABLE);
 116  0017 5f            	clrw	x
 117  0018 cd0000        	call	_CLK_PeripheralClockConfig
 119                     ; 37 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, DISABLE);
 121  001b ae0100        	ldw	x,#256
 122  001e cd0000        	call	_CLK_PeripheralClockConfig
 124                     ; 38 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);
 126  0021 ae0200        	ldw	x,#512
 127  0024 cd0000        	call	_CLK_PeripheralClockConfig
 129                     ; 39 	CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, DISABLE);
 131  0027 ae0300        	ldw	x,#768
 132  002a cd0000        	call	_CLK_PeripheralClockConfig
 134                     ; 40 	CLK_PeripheralClockConfig(CLK_Peripheral_SPI1, DISABLE);
 136  002d ae0400        	ldw	x,#1024
 137  0030 cd0000        	call	_CLK_PeripheralClockConfig
 139                     ; 41 	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, DISABLE);
 141  0033 ae0500        	ldw	x,#1280
 142  0036 cd0000        	call	_CLK_PeripheralClockConfig
 144                     ; 42 	CLK_PeripheralClockConfig(CLK_Peripheral_BEEP, DISABLE);
 146  0039 ae0600        	ldw	x,#1536
 147  003c cd0000        	call	_CLK_PeripheralClockConfig
 149                     ; 43 	CLK_PeripheralClockConfig(CLK_Peripheral_DAC, DISABLE);
 151  003f ae0700        	ldw	x,#1792
 152  0042 cd0000        	call	_CLK_PeripheralClockConfig
 154                     ; 44 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 156  0045 ae1000        	ldw	x,#4096
 157  0048 cd0000        	call	_CLK_PeripheralClockConfig
 159                     ; 45 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, DISABLE);
 161  004b ae1100        	ldw	x,#4352
 162  004e cd0000        	call	_CLK_PeripheralClockConfig
 164                     ; 46 	CLK_PeripheralClockConfig(CLK_Peripheral_RTC, DISABLE);
 166  0051 ae1200        	ldw	x,#4608
 167  0054 cd0000        	call	_CLK_PeripheralClockConfig
 169                     ; 47 	CLK_PeripheralClockConfig(CLK_Peripheral_LCD, DISABLE);
 171  0057 ae1300        	ldw	x,#4864
 172  005a cd0000        	call	_CLK_PeripheralClockConfig
 174                     ; 48 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 176  005d ae1000        	ldw	x,#4096
 177  0060 cd0000        	call	_CLK_PeripheralClockConfig
 179                     ; 49 	CLK_PeripheralClockConfig(CLK_Peripheral_DMA1, DISABLE);
 181  0063 ae1400        	ldw	x,#5120
 182  0066 cd0000        	call	_CLK_PeripheralClockConfig
 184                     ; 50 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 186  0069 ae1000        	ldw	x,#4096
 187  006c cd0000        	call	_CLK_PeripheralClockConfig
 189                     ; 51 	CLK_PeripheralClockConfig(CLK_Peripheral_BOOTROM, DISABLE);
 191  006f ae1700        	ldw	x,#5888
 192  0072 cd0000        	call	_CLK_PeripheralClockConfig
 194                     ; 52 	CLK_PeripheralClockConfig(CLK_Peripheral_AES, DISABLE);
 196  0075 ae2000        	ldw	x,#8192
 197  0078 cd0000        	call	_CLK_PeripheralClockConfig
 199                     ; 53 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 201  007b ae1000        	ldw	x,#4096
 202  007e cd0000        	call	_CLK_PeripheralClockConfig
 204                     ; 54 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM5, DISABLE);
 206  0081 ae2100        	ldw	x,#8448
 207  0084 cd0000        	call	_CLK_PeripheralClockConfig
 209                     ; 55 	CLK_PeripheralClockConfig(CLK_Peripheral_SPI2, DISABLE);
 211  0087 ae2200        	ldw	x,#8704
 212  008a cd0000        	call	_CLK_PeripheralClockConfig
 214                     ; 56 	CLK_PeripheralClockConfig(CLK_Peripheral_USART2, DISABLE);
 216  008d ae2300        	ldw	x,#8960
 217  0090 cd0000        	call	_CLK_PeripheralClockConfig
 219                     ; 57 	CLK_PeripheralClockConfig(CLK_Peripheral_USART3, DISABLE);
 221  0093 ae2400        	ldw	x,#9216
 222  0096 cd0000        	call	_CLK_PeripheralClockConfig
 224                     ; 58 	CLK_PeripheralClockConfig(CLK_Peripheral_CSSLSE, DISABLE);
 226  0099 ae2500        	ldw	x,#9472
 227  009c cd0000        	call	_CLK_PeripheralClockConfig
 229                     ; 59 }
 232  009f 81            	ret
 256                     ; 61 void deInitGPIO (void)
 256                     ; 62 {
 257                     	switch	.text
 258  00a0               _deInitGPIO:
 262                     ; 63 	GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
 264  00a0 4b40          	push	#64
 265  00a2 4bff          	push	#255
 266  00a4 ae5000        	ldw	x,#20480
 267  00a7 cd0000        	call	_GPIO_Init
 269  00aa 85            	popw	x
 270                     ; 64 	GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
 272  00ab 4b40          	push	#64
 273  00ad 4bff          	push	#255
 274  00af ae5005        	ldw	x,#20485
 275  00b2 cd0000        	call	_GPIO_Init
 277  00b5 85            	popw	x
 278                     ; 65 	GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
 280  00b6 4b40          	push	#64
 281  00b8 4bff          	push	#255
 282  00ba ae500a        	ldw	x,#20490
 283  00bd cd0000        	call	_GPIO_Init
 285  00c0 85            	popw	x
 286                     ; 66 	GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
 288  00c1 4b40          	push	#64
 289  00c3 4bff          	push	#255
 290  00c5 ae500f        	ldw	x,#20495
 291  00c8 cd0000        	call	_GPIO_Init
 293  00cb 85            	popw	x
 294                     ; 67 	GPIO_Init(GPIOE, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
 296  00cc 4b40          	push	#64
 297  00ce 4bff          	push	#255
 298  00d0 ae5014        	ldw	x,#20500
 299  00d3 cd0000        	call	_GPIO_Init
 301  00d6 85            	popw	x
 302                     ; 68 	GPIO_Init(GPIOF, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
 304  00d7 4b40          	push	#64
 305  00d9 4bff          	push	#255
 306  00db ae5019        	ldw	x,#20505
 307  00de cd0000        	call	_GPIO_Init
 309  00e1 85            	popw	x
 310                     ; 70 	GPIO_Init(GPIOE, GPIO_Pin_6, GPIO_Mode_Out_PP_Low_Slow);
 312  00e2 4bc0          	push	#192
 313  00e4 4b40          	push	#64
 314  00e6 ae5014        	ldw	x,#20500
 315  00e9 cd0000        	call	_GPIO_Init
 317  00ec 85            	popw	x
 318                     ; 71 }
 321  00ed 81            	ret
 345                     ; 73 char initAnalogControls(void)
 345                     ; 74 {
 346                     	switch	.text
 347  00ee               _initAnalogControls:
 351                     ; 75 	values[1] = 0x0;
 353  00ee 3f01          	clr	_values+1
 354                     ; 76 } 
 357  00f0 81            	ret
 383                     ; 78 char initDigitalControls(void)
 383                     ; 79 {
 384                     	switch	.text
 385  00f1               _initDigitalControls:
 389                     ; 80 	values[0] = 0x0;
 391  00f1 3f00          	clr	_values
 392                     ; 82 	GPIO_Init(GPIOC, GPIO_Pin_3, GPIO_Mode_In_FL_No_IT);
 394  00f3 4b00          	push	#0
 395  00f5 4b08          	push	#8
 396  00f7 ae500a        	ldw	x,#20490
 397  00fa cd0000        	call	_GPIO_Init
 399  00fd 85            	popw	x
 400                     ; 83 } 
 403  00fe 81            	ret
 440                     ; 85 void readControlData(void)
 440                     ; 86 {
 441                     	switch	.text
 442  00ff               _readControlData:
 444  00ff 88            	push	a
 445       00000001      OFST:	set	1
 448                     ; 87 	char v0 = 0x0;
 450  0100 0f01          	clr	(OFST+0,sp)
 451                     ; 90 	v0 |= GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_3) != 0x0 ? 0x0 : 0x1;
 453  0102 4b08          	push	#8
 454  0104 ae500a        	ldw	x,#20490
 455  0107 cd0000        	call	_GPIO_ReadInputDataBit
 457  010a 5b01          	addw	sp,#1
 458  010c 4d            	tnz	a
 459  010d 2703          	jreq	L02
 460  010f 4f            	clr	a
 461  0110 2002          	jra	L22
 462  0112               L02:
 463  0112 a601          	ld	a,#1
 464  0114               L22:
 465  0114 1a01          	or	a,(OFST+0,sp)
 466  0116 6b01          	ld	(OFST+0,sp),a
 467                     ; 91 	v0 |= (GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_2) != 0x0 ? 0x0 : 0x1) << 0x1;
 469  0118 4b04          	push	#4
 470  011a ae500a        	ldw	x,#20490
 471  011d cd0000        	call	_GPIO_ReadInputDataBit
 473  0120 5b01          	addw	sp,#1
 474  0122 4d            	tnz	a
 475  0123 2703          	jreq	L42
 476  0125 4f            	clr	a
 477  0126 2002          	jra	L62
 478  0128               L42:
 479  0128 a602          	ld	a,#2
 480  012a               L62:
 481  012a 1a01          	or	a,(OFST+0,sp)
 482  012c 6b01          	ld	(OFST+0,sp),a
 483                     ; 94 	if(v0 != values[0])// || a != values[1])
 485  012e 7b01          	ld	a,(OFST+0,sp)
 486  0130 b100          	cp	a,_values
 487  0132 2706          	jreq	L301
 488                     ; 96 		values[0] = v0;
 490  0134 7b01          	ld	a,(OFST+0,sp)
 491  0136 b700          	ld	_values,a
 492                     ; 99 		writeControlData();
 494  0138 ad02          	call	_writeControlData
 496  013a               L301:
 497                     ; 101 }                                  
 500  013a 84            	pop	a
 501  013b 81            	ret
 526                     ; 103 void writeControlData(void)
 526                     ; 104 {
 527                     	switch	.text
 528  013c               _writeControlData:
 532                     ; 105 	writeEEPROMByte(0x0, values[0]);
 534  013c b600          	ld	a,_values
 535  013e 97            	ld	xl,a
 536  013f 4f            	clr	a
 537  0140 95            	ld	xh,a
 538  0141 ad01          	call	_writeEEPROMByte
 540                     ; 110 }                         
 543  0143 81            	ret
 590                     ; 112 void writeEEPROMByte(const char address, char data)
 590                     ; 113 {
 591                     	switch	.text
 592  0144               _writeEEPROMByte:
 594  0144 89            	pushw	x
 595       00000000      OFST:	set	0
 598                     ; 114 	M24LR04E_Init();
 600  0145 cd0000        	call	_M24LR04E_Init
 602                     ; 115 	M24LR04E_WriteOneByte(M24LR16_EEPROM_ADDRESS_USER, address, data);
 604  0148 7b02          	ld	a,(OFST+2,sp)
 605  014a 88            	push	a
 606  014b 7b02          	ld	a,(OFST+2,sp)
 607  014d 5f            	clrw	x
 608  014e 97            	ld	xl,a
 609  014f 89            	pushw	x
 610  0150 a6a6          	ld	a,#166
 611  0152 cd0000        	call	_M24LR04E_WriteOneByte
 613  0155 5b03          	addw	sp,#3
 614                     ; 116 	M24LR04E_DeInit();
 616  0157 cd0000        	call	_M24LR04E_DeInit
 618                     ; 118 	delay_10us(100);
 620  015a ae0064        	ldw	x,#100
 621  015d cd0000        	call	_delay_10us
 623                     ; 119 }
 626  0160 85            	popw	x
 627  0161 81            	ret
 661                     ; 121 void main(void)
 661                     ; 122 {
 662                     	switch	.text
 663  0162               _main:
 667                     ; 123 	deInitClock();
 669  0162 cd0017        	call	_deInitClock
 671                     ; 124 	deInitGPIO();
 673  0165 cd00a0        	call	_deInitGPIO
 675                     ; 126 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
 677  0168 a601          	ld	a,#1
 678  016a cd0000        	call	_CLK_SYSCLKSourceConfig
 680                     ; 127 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_16);        
 682  016d a604          	ld	a,#4
 683  016f cd0000        	call	_CLK_SYSCLKDivConfig
 685                     ; 129 	initDigitalControls();
 687  0172 cd00f1        	call	_initDigitalControls
 689                     ; 130 	initAnalogControls();
 691  0175 cd00ee        	call	_initAnalogControls
 693                     ; 132 	GPIO_Init(GPIOF, GPIO_Pin_0, GPIO_Mode_In_FL_IT);
 695  0178 4b20          	push	#32
 696  017a 4b01          	push	#1
 697  017c ae5019        	ldw	x,#20505
 698  017f cd0000        	call	_GPIO_Init
 700  0182 85            	popw	x
 701                     ; 133 	EXTI_SetPinSensitivity(EXTI_Pin_0, EXTI_Trigger_Rising);
 703  0183 ae0001        	ldw	x,#1
 704  0186 cd0000        	call	_EXTI_SetPinSensitivity
 706                     ; 135 	enableInterrupts();
 709  0189 9a            rim
 711                     ; 136 	initMemory();
 714  018a cd0000        	call	_initMemory
 716  018d               L741:
 717                     ; 140 		halt();
 720  018d 8e            halt
 724  018e 20fd          	jra	L741
 776                     	xdef	_main
 777                     	switch	.ubsct
 778  0000               _values:
 779  0000 0000          	ds.b	2
 780                     	xdef	_values
 781                     	xdef	_writeEEPROMByte
 782                     	xdef	_writeControlData
 783                     	xdef	_readControlData
 784                     	xdef	_initDigitalControls
 785                     	xdef	_initAnalogControls
 786                     	xdef	_deInitGPIO
 787                     	xdef	_deInitClock
 788                     	xdef	_initMemory
 789                     	xref	_M24LR04E_WriteOneByte
 790                     	xref	_M24LR04E_Init
 791                     	xref	_M24LR04E_DeInit
 792                     	xref	_GPIO_ReadInputDataBit
 793                     	xref	_GPIO_Init
 794                     	xref	_EXTI_SetPinSensitivity
 795                     	xref	_CLK_PeripheralClockConfig
 796                     	xref	_CLK_SYSCLKDivConfig
 797                     	xref	_CLK_SYSCLKSourceConfig
 798                     	xref	_delay_10us
 818                     	end
