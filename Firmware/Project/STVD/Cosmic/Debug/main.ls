   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.19 - 04 Sep 2013
   3                     ; Generator (Limited) V4.3.11 - 04 Sep 2013
  54                     ; 26 void deInitClock(void)
  54                     ; 27 {
  56                     	switch	.text
  57  0000               _deInitClock:
  61                     ; 28 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, DISABLE);
  63  0000 5f            	clrw	x
  64  0001 cd0000        	call	_CLK_PeripheralClockConfig
  66                     ; 29 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, DISABLE);
  68  0004 ae0100        	ldw	x,#256
  69  0007 cd0000        	call	_CLK_PeripheralClockConfig
  71                     ; 30 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);
  73  000a ae0200        	ldw	x,#512
  74  000d cd0000        	call	_CLK_PeripheralClockConfig
  76                     ; 31 	CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, DISABLE);
  78  0010 ae0300        	ldw	x,#768
  79  0013 cd0000        	call	_CLK_PeripheralClockConfig
  81                     ; 32 	CLK_PeripheralClockConfig(CLK_Peripheral_SPI1, DISABLE);
  83  0016 ae0400        	ldw	x,#1024
  84  0019 cd0000        	call	_CLK_PeripheralClockConfig
  86                     ; 33 	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, DISABLE);
  88  001c ae0500        	ldw	x,#1280
  89  001f cd0000        	call	_CLK_PeripheralClockConfig
  91                     ; 34 	CLK_PeripheralClockConfig(CLK_Peripheral_BEEP, DISABLE);
  93  0022 ae0600        	ldw	x,#1536
  94  0025 cd0000        	call	_CLK_PeripheralClockConfig
  96                     ; 35 	CLK_PeripheralClockConfig(CLK_Peripheral_DAC, DISABLE);
  98  0028 ae0700        	ldw	x,#1792
  99  002b cd0000        	call	_CLK_PeripheralClockConfig
 101                     ; 36 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 103  002e ae1000        	ldw	x,#4096
 104  0031 cd0000        	call	_CLK_PeripheralClockConfig
 106                     ; 37 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, DISABLE);
 108  0034 ae1100        	ldw	x,#4352
 109  0037 cd0000        	call	_CLK_PeripheralClockConfig
 111                     ; 38 	CLK_PeripheralClockConfig(CLK_Peripheral_RTC, DISABLE);
 113  003a ae1200        	ldw	x,#4608
 114  003d cd0000        	call	_CLK_PeripheralClockConfig
 116                     ; 39 	CLK_PeripheralClockConfig(CLK_Peripheral_LCD, DISABLE);
 118  0040 ae1300        	ldw	x,#4864
 119  0043 cd0000        	call	_CLK_PeripheralClockConfig
 121                     ; 40 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 123  0046 ae1000        	ldw	x,#4096
 124  0049 cd0000        	call	_CLK_PeripheralClockConfig
 126                     ; 41 	CLK_PeripheralClockConfig(CLK_Peripheral_DMA1, DISABLE);
 128  004c ae1400        	ldw	x,#5120
 129  004f cd0000        	call	_CLK_PeripheralClockConfig
 131                     ; 42 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 133  0052 ae1000        	ldw	x,#4096
 134  0055 cd0000        	call	_CLK_PeripheralClockConfig
 136                     ; 43 	CLK_PeripheralClockConfig(CLK_Peripheral_BOOTROM, DISABLE);
 138  0058 ae1700        	ldw	x,#5888
 139  005b cd0000        	call	_CLK_PeripheralClockConfig
 141                     ; 44 	CLK_PeripheralClockConfig(CLK_Peripheral_AES, DISABLE);
 143  005e ae2000        	ldw	x,#8192
 144  0061 cd0000        	call	_CLK_PeripheralClockConfig
 146                     ; 45 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 148  0064 ae1000        	ldw	x,#4096
 149  0067 cd0000        	call	_CLK_PeripheralClockConfig
 151                     ; 46 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM5, DISABLE);
 153  006a ae2100        	ldw	x,#8448
 154  006d cd0000        	call	_CLK_PeripheralClockConfig
 156                     ; 47 	CLK_PeripheralClockConfig(CLK_Peripheral_SPI2, DISABLE);
 158  0070 ae2200        	ldw	x,#8704
 159  0073 cd0000        	call	_CLK_PeripheralClockConfig
 161                     ; 48 	CLK_PeripheralClockConfig(CLK_Peripheral_USART2, DISABLE);
 163  0076 ae2300        	ldw	x,#8960
 164  0079 cd0000        	call	_CLK_PeripheralClockConfig
 166                     ; 49 	CLK_PeripheralClockConfig(CLK_Peripheral_USART3, DISABLE);
 168  007c ae2400        	ldw	x,#9216
 169  007f cd0000        	call	_CLK_PeripheralClockConfig
 171                     ; 50 	CLK_PeripheralClockConfig(CLK_Peripheral_CSSLSE, DISABLE);
 173  0082 ae2500        	ldw	x,#9472
 174  0085 cd0000        	call	_CLK_PeripheralClockConfig
 176                     ; 51 }
 179  0088 81            	ret
 203                     ; 53 void deInitGPIO (void)
 203                     ; 54 {
 204                     	switch	.text
 205  0089               _deInitGPIO:
 209                     ; 55 	GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
 211  0089 4b40          	push	#64
 212  008b 4bff          	push	#255
 213  008d ae5000        	ldw	x,#20480
 214  0090 cd0000        	call	_GPIO_Init
 216  0093 85            	popw	x
 217                     ; 56 	GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
 219  0094 4b40          	push	#64
 220  0096 4bff          	push	#255
 221  0098 ae5005        	ldw	x,#20485
 222  009b cd0000        	call	_GPIO_Init
 224  009e 85            	popw	x
 225                     ; 57 	GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
 227  009f 4b40          	push	#64
 228  00a1 4bff          	push	#255
 229  00a3 ae500a        	ldw	x,#20490
 230  00a6 cd0000        	call	_GPIO_Init
 232  00a9 85            	popw	x
 233                     ; 58 	GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
 235  00aa 4b40          	push	#64
 236  00ac 4bff          	push	#255
 237  00ae ae500f        	ldw	x,#20495
 238  00b1 cd0000        	call	_GPIO_Init
 240  00b4 85            	popw	x
 241                     ; 59 	GPIO_Init(GPIOE, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
 243  00b5 4b40          	push	#64
 244  00b7 4bff          	push	#255
 245  00b9 ae5014        	ldw	x,#20500
 246  00bc cd0000        	call	_GPIO_Init
 248  00bf 85            	popw	x
 249                     ; 60 	GPIO_Init(GPIOF, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
 251  00c0 4b40          	push	#64
 252  00c2 4bff          	push	#255
 253  00c4 ae5019        	ldw	x,#20505
 254  00c7 cd0000        	call	_GPIO_Init
 256  00ca 85            	popw	x
 257                     ; 62 	GPIO_Init(GPIOE, GPIO_Pin_6, GPIO_Mode_Out_PP_Low_Slow);
 259  00cb 4bc0          	push	#192
 260  00cd 4b40          	push	#64
 261  00cf ae5014        	ldw	x,#20500
 262  00d2 cd0000        	call	_GPIO_Init
 264  00d5 85            	popw	x
 265                     ; 63 }
 268  00d6 81            	ret
 292                     ; 65 char initAnalogControls(void)
 292                     ; 66 {
 293                     	switch	.text
 294  00d7               _initAnalogControls:
 298                     ; 67 	analog = 0x0;
 300  00d7 3f00          	clr	_analog
 301                     ; 68 } 
 304  00d9 81            	ret
 330                     ; 70 char initDigitalControls(void)
 330                     ; 71 {
 331                     	switch	.text
 332  00da               _initDigitalControls:
 336                     ; 72 	digital = 0x0;
 338  00da 3f01          	clr	_digital
 339                     ; 74 	GPIO_Init(GPIOC, GPIO_Pin_3, GPIO_Mode_In_FL_No_IT);
 341  00dc 4b00          	push	#0
 342  00de 4b08          	push	#8
 343  00e0 ae500a        	ldw	x,#20490
 344  00e3 cd0000        	call	_GPIO_Init
 346  00e6 85            	popw	x
 347                     ; 75 } 
 350  00e7 81            	ret
 387                     ; 77 void readControlData(void)
 387                     ; 78 {
 388                     	switch	.text
 389  00e8               _readControlData:
 391  00e8 88            	push	a
 392       00000001      OFST:	set	1
 395                     ; 79 	char d0 = GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_3) == 0x0 ? 0x1 : 0x0;
 397  00e9 4b08          	push	#8
 398  00eb ae500a        	ldw	x,#20490
 399  00ee cd0000        	call	_GPIO_ReadInputDataBit
 401  00f1 5b01          	addw	sp,#1
 402  00f3 4d            	tnz	a
 403  00f4 2604          	jrne	L61
 404  00f6 a601          	ld	a,#1
 405  00f8 2001          	jra	L02
 406  00fa               L61:
 407  00fa 4f            	clr	a
 408  00fb               L02:
 409  00fb 6b01          	ld	(OFST+0,sp),a
 410                     ; 81 	if(d0 != digital)
 412  00fd 7b01          	ld	a,(OFST+0,sp)
 413  00ff b101          	cp	a,_digital
 414  0101 2706          	jreq	L37
 415                     ; 83 		digital = d0;
 417  0103 7b01          	ld	a,(OFST+0,sp)
 418  0105 b701          	ld	_digital,a
 419                     ; 84 		writeControlData();
 421  0107 ad02          	call	_writeControlData
 423  0109               L37:
 424                     ; 86 }                                  
 427  0109 84            	pop	a
 428  010a 81            	ret
 453                     ; 88 void writeControlData(void)
 453                     ; 89 {
 454                     	switch	.text
 455  010b               _writeControlData:
 459                     ; 90 	writeEEPROMByte(0x0, digital);
 461  010b b601          	ld	a,_digital
 462  010d 97            	ld	xl,a
 463  010e 4f            	clr	a
 464  010f 95            	ld	xh,a
 465  0110 ad01          	call	_writeEEPROMByte
 467                     ; 100 }                         
 470  0112 81            	ret
 516                     ; 102 void writeEEPROMByte(const char address, char data)
 516                     ; 103 {
 517                     	switch	.text
 518  0113               _writeEEPROMByte:
 520  0113 89            	pushw	x
 521       00000000      OFST:	set	0
 524                     ; 104 	M24LR04E_Init();
 526  0114 cd0000        	call	_M24LR04E_Init
 528                     ; 105 	M24LR04E_WriteOneByte(M24LR16_EEPROM_ADDRESS_USER, address, data);
 530  0117 7b02          	ld	a,(OFST+2,sp)
 531  0119 88            	push	a
 532  011a 7b02          	ld	a,(OFST+2,sp)
 533  011c 5f            	clrw	x
 534  011d 97            	ld	xl,a
 535  011e 89            	pushw	x
 536  011f a6a6          	ld	a,#166
 537  0121 cd0000        	call	_M24LR04E_WriteOneByte
 539  0124 5b03          	addw	sp,#3
 540                     ; 106 	M24LR04E_DeInit();
 542  0126 cd0000        	call	_M24LR04E_DeInit
 544                     ; 109 }
 547  0129 85            	popw	x
 548  012a 81            	ret
 581                     ; 111 void main(void)
 581                     ; 112 {
 582                     	switch	.text
 583  012b               _main:
 587                     ; 113 	deInitClock();
 589  012b cd0000        	call	_deInitClock
 591                     ; 114 	deInitGPIO();
 593  012e cd0089        	call	_deInitGPIO
 595                     ; 116 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
 597  0131 a601          	ld	a,#1
 598  0133 cd0000        	call	_CLK_SYSCLKSourceConfig
 600                     ; 117 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_16);        
 602  0136 a604          	ld	a,#4
 603  0138 cd0000        	call	_CLK_SYSCLKDivConfig
 605                     ; 119 	initDigitalControls();
 607  013b ad9d          	call	_initDigitalControls
 609                     ; 120 	initAnalogControls();
 611  013d ad98          	call	_initAnalogControls
 613                     ; 122 	GPIO_Init(GPIOF, GPIO_Pin_0, GPIO_Mode_In_FL_IT);
 615  013f 4b20          	push	#32
 616  0141 4b01          	push	#1
 617  0143 ae5019        	ldw	x,#20505
 618  0146 cd0000        	call	_GPIO_Init
 620  0149 85            	popw	x
 621                     ; 123 	EXTI_SetPinSensitivity(EXTI_Pin_0, EXTI_Trigger_Rising);
 623  014a ae0001        	ldw	x,#1
 624  014d cd0000        	call	_EXTI_SetPinSensitivity
 626                     ; 125 	enableInterrupts();
 629  0150 9a            rim
 631  0151               L731:
 632                     ; 129 		halt();
 635  0151 8e            halt
 639  0152 20fd          	jra	L731
 709                     	xdef	_main
 710                     	switch	.ubsct
 711  0000               _analog:
 712  0000 00            	ds.b	1
 713                     	xdef	_analog
 714  0001               _digital:
 715  0001 00            	ds.b	1
 716                     	xdef	_digital
 717                     	xdef	_writeEEPROMByte
 718                     	xdef	_writeControlData
 719                     	xdef	_readControlData
 720                     	xdef	_initDigitalControls
 721                     	xdef	_initAnalogControls
 722                     	xdef	_deInitGPIO
 723                     	xdef	_deInitClock
 724  0002               _NDEFmessage:
 725  0002 000000000000  	ds.b	64
 726                     	xdef	_NDEFmessage
 727                     	xref	_M24LR04E_WriteOneByte
 728                     	xref	_M24LR04E_Init
 729                     	xref	_M24LR04E_DeInit
 730                     	xref	_GPIO_ReadInputDataBit
 731                     	xref	_GPIO_Init
 732                     	xref	_EXTI_SetPinSensitivity
 733                     	xref	_CLK_PeripheralClockConfig
 734                     	xref	_CLK_SYSCLKDivConfig
 735                     	xref	_CLK_SYSCLKSourceConfig
 755                     	end
