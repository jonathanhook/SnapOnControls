   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.19 - 04 Sep 2013
   3                     ; Generator (Limited) V4.3.11 - 04 Sep 2013
  75                     ; 27 char sampleADC(void)
  75                     ; 28 {
  77                     	switch	.text
  78  0000               _sampleADC:
  80  0000 88            	push	a
  81       00000001      OFST:	set	1
  84                     ; 29 	char res = 0x0;
  86                     ; 31   CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
  88  0001 ae1001        	ldw	x,#4097
  89  0004 cd0000        	call	_CLK_PeripheralClockConfig
  91                     ; 32   ADC_DeInit(ADC1);
  93  0007 ae5340        	ldw	x,#21312
  94  000a cd0000        	call	_ADC_DeInit
  96                     ; 34   ADC_VrefintCmd(ENABLE);
  98  000d a601          	ld	a,#1
  99  000f cd0000        	call	_ADC_VrefintCmd
 101                     ; 35   delay_10us(3);
 103  0012 ae0003        	ldw	x,#3
 104  0015 cd0000        	call	_delay_10us
 106                     ; 37   ADC_Cmd(ADC1, ENABLE);	 
 108  0018 4b01          	push	#1
 109  001a ae5340        	ldw	x,#21312
 110  001d cd0000        	call	_ADC_Cmd
 112  0020 84            	pop	a
 113                     ; 38   ADC_Init(ADC1, ADC_ConversionMode_Single,
 113                     ; 39   ADC_Resolution_6Bit, ADC_Prescaler_1);
 115  0021 4b00          	push	#0
 116  0023 4b60          	push	#96
 117  0025 4b00          	push	#0
 118  0027 ae5340        	ldw	x,#21312
 119  002a cd0000        	call	_ADC_Init
 121  002d 5b03          	addw	sp,#3
 122                     ; 41   ADC_SamplingTimeConfig(ADC1, ADC_Group_SlowChannels, ADC_SamplingTime_9Cycles);
 124  002f 4b01          	push	#1
 125  0031 4b00          	push	#0
 126  0033 ae5340        	ldw	x,#21312
 127  0036 cd0000        	call	_ADC_SamplingTimeConfig
 129  0039 85            	popw	x
 130                     ; 42   ADC_ChannelCmd(ADC1, ADC_Channel_0, ENABLE);
 132  003a 4b01          	push	#1
 133  003c ae0301        	ldw	x,#769
 134  003f 89            	pushw	x
 135  0040 ae5340        	ldw	x,#21312
 136  0043 cd0000        	call	_ADC_ChannelCmd
 138  0046 5b03          	addw	sp,#3
 139                     ; 43   delay_10us(3);
 141  0048 ae0003        	ldw	x,#3
 142  004b cd0000        	call	_delay_10us
 144                     ; 45 	ADC_SoftwareStartConv(ADC1);
 146  004e ae5340        	ldw	x,#21312
 147  0051 cd0000        	call	_ADC_SoftwareStartConv
 150  0054               L53:
 151                     ; 46 	while( ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == 0);
 153  0054 4b01          	push	#1
 154  0056 ae5340        	ldw	x,#21312
 155  0059 cd0000        	call	_ADC_GetFlagStatus
 157  005c 5b01          	addw	sp,#1
 158  005e 4d            	tnz	a
 159  005f 27f3          	jreq	L53
 160                     ; 47 	res = (char)ADC_GetConversionValue(ADC1);
 162  0061 ae5340        	ldw	x,#21312
 163  0064 cd0000        	call	_ADC_GetConversionValue
 165  0067 9f            	ld	a,xl
 166  0068 6b01          	ld	(OFST+0,sp),a
 167                     ; 49   ADC_VrefintCmd(DISABLE);
 169  006a 4f            	clr	a
 170  006b cd0000        	call	_ADC_VrefintCmd
 172                     ; 50   ADC_DeInit(ADC1);
 174  006e ae5340        	ldw	x,#21312
 175  0071 cd0000        	call	_ADC_DeInit
 177                     ; 55   CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 179  0074 ae1000        	ldw	x,#4096
 180  0077 cd0000        	call	_CLK_PeripheralClockConfig
 182                     ; 56   ADC_ChannelCmd(ADC1, ADC_Channel_0, DISABLE);
 184  007a 4b00          	push	#0
 185  007c ae0301        	ldw	x,#769
 186  007f 89            	pushw	x
 187  0080 ae5340        	ldw	x,#21312
 188  0083 cd0000        	call	_ADC_ChannelCmd
 190  0086 5b03          	addw	sp,#3
 191                     ; 58   return res;
 193  0088 7b01          	ld	a,(OFST+0,sp)
 196  008a 5b01          	addw	sp,#1
 197  008c 81            	ret
 221                     ; 61 void initMemory(void)
 221                     ; 62 {
 222                     	switch	.text
 223  008d               _initMemory:
 227                     ; 63 	writeEEPROMByte(0x0, 0x0);
 229  008d 5f            	clrw	x
 230  008e cd01e9        	call	_writeEEPROMByte
 232                     ; 64 	writeEEPROMByte(0x1, 0x0);
 234  0091 ae0100        	ldw	x,#256
 235  0094 cd01e9        	call	_writeEEPROMByte
 237                     ; 65 	writeEEPROMByte(0x2, 0x0);
 239  0097 ae0200        	ldw	x,#512
 240  009a cd01e9        	call	_writeEEPROMByte
 242                     ; 66 	writeEEPROMByte(0x3, 0x0);
 244  009d ae0300        	ldw	x,#768
 245  00a0 cd01e9        	call	_writeEEPROMByte
 247                     ; 67 }
 250  00a3 81            	ret
 274                     ; 69 void deInitClock(void)
 274                     ; 70 {
 275                     	switch	.text
 276  00a4               _deInitClock:
 280                     ; 71 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, DISABLE);
 282  00a4 5f            	clrw	x
 283  00a5 cd0000        	call	_CLK_PeripheralClockConfig
 285                     ; 72 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, DISABLE);
 287  00a8 ae0100        	ldw	x,#256
 288  00ab cd0000        	call	_CLK_PeripheralClockConfig
 290                     ; 73 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);
 292  00ae ae0200        	ldw	x,#512
 293  00b1 cd0000        	call	_CLK_PeripheralClockConfig
 295                     ; 74 	CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, DISABLE);
 297  00b4 ae0300        	ldw	x,#768
 298  00b7 cd0000        	call	_CLK_PeripheralClockConfig
 300                     ; 75 	CLK_PeripheralClockConfig(CLK_Peripheral_SPI1, DISABLE);
 302  00ba ae0400        	ldw	x,#1024
 303  00bd cd0000        	call	_CLK_PeripheralClockConfig
 305                     ; 76 	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, DISABLE);
 307  00c0 ae0500        	ldw	x,#1280
 308  00c3 cd0000        	call	_CLK_PeripheralClockConfig
 310                     ; 77 	CLK_PeripheralClockConfig(CLK_Peripheral_BEEP, DISABLE);
 312  00c6 ae0600        	ldw	x,#1536
 313  00c9 cd0000        	call	_CLK_PeripheralClockConfig
 315                     ; 78 	CLK_PeripheralClockConfig(CLK_Peripheral_DAC, DISABLE);
 317  00cc ae0700        	ldw	x,#1792
 318  00cf cd0000        	call	_CLK_PeripheralClockConfig
 320                     ; 79 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 322  00d2 ae1000        	ldw	x,#4096
 323  00d5 cd0000        	call	_CLK_PeripheralClockConfig
 325                     ; 80 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, DISABLE);
 327  00d8 ae1100        	ldw	x,#4352
 328  00db cd0000        	call	_CLK_PeripheralClockConfig
 330                     ; 81 	CLK_PeripheralClockConfig(CLK_Peripheral_RTC, DISABLE);
 332  00de ae1200        	ldw	x,#4608
 333  00e1 cd0000        	call	_CLK_PeripheralClockConfig
 335                     ; 82 	CLK_PeripheralClockConfig(CLK_Peripheral_LCD, DISABLE);
 337  00e4 ae1300        	ldw	x,#4864
 338  00e7 cd0000        	call	_CLK_PeripheralClockConfig
 340                     ; 83 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 342  00ea ae1000        	ldw	x,#4096
 343  00ed cd0000        	call	_CLK_PeripheralClockConfig
 345                     ; 84 	CLK_PeripheralClockConfig(CLK_Peripheral_DMA1, DISABLE);
 347  00f0 ae1400        	ldw	x,#5120
 348  00f3 cd0000        	call	_CLK_PeripheralClockConfig
 350                     ; 85 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 352  00f6 ae1000        	ldw	x,#4096
 353  00f9 cd0000        	call	_CLK_PeripheralClockConfig
 355                     ; 86 	CLK_PeripheralClockConfig(CLK_Peripheral_BOOTROM, DISABLE);
 357  00fc ae1700        	ldw	x,#5888
 358  00ff cd0000        	call	_CLK_PeripheralClockConfig
 360                     ; 87 	CLK_PeripheralClockConfig(CLK_Peripheral_AES, DISABLE);
 362  0102 ae2000        	ldw	x,#8192
 363  0105 cd0000        	call	_CLK_PeripheralClockConfig
 365                     ; 88 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 367  0108 ae1000        	ldw	x,#4096
 368  010b cd0000        	call	_CLK_PeripheralClockConfig
 370                     ; 89 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM5, DISABLE);
 372  010e ae2100        	ldw	x,#8448
 373  0111 cd0000        	call	_CLK_PeripheralClockConfig
 375                     ; 90 	CLK_PeripheralClockConfig(CLK_Peripheral_SPI2, DISABLE);
 377  0114 ae2200        	ldw	x,#8704
 378  0117 cd0000        	call	_CLK_PeripheralClockConfig
 380                     ; 91 	CLK_PeripheralClockConfig(CLK_Peripheral_USART2, DISABLE);
 382  011a ae2300        	ldw	x,#8960
 383  011d cd0000        	call	_CLK_PeripheralClockConfig
 385                     ; 92 	CLK_PeripheralClockConfig(CLK_Peripheral_USART3, DISABLE);
 387  0120 ae2400        	ldw	x,#9216
 388  0123 cd0000        	call	_CLK_PeripheralClockConfig
 390                     ; 93 	CLK_PeripheralClockConfig(CLK_Peripheral_CSSLSE, DISABLE);
 392  0126 ae2500        	ldw	x,#9472
 393  0129 cd0000        	call	_CLK_PeripheralClockConfig
 395                     ; 94 }
 398  012c 81            	ret
 422                     ; 96 void deInitGPIO (void)
 422                     ; 97 {
 423                     	switch	.text
 424  012d               _deInitGPIO:
 428                     ; 98 	GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
 430  012d 4b40          	push	#64
 431  012f 4bff          	push	#255
 432  0131 ae5000        	ldw	x,#20480
 433  0134 cd0000        	call	_GPIO_Init
 435  0137 85            	popw	x
 436                     ; 99 	GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
 438  0138 4b40          	push	#64
 439  013a 4bff          	push	#255
 440  013c ae5005        	ldw	x,#20485
 441  013f cd0000        	call	_GPIO_Init
 443  0142 85            	popw	x
 444                     ; 100 	GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
 446  0143 4b40          	push	#64
 447  0145 4bff          	push	#255
 448  0147 ae500a        	ldw	x,#20490
 449  014a cd0000        	call	_GPIO_Init
 451  014d 85            	popw	x
 452                     ; 101 	GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
 454  014e 4b40          	push	#64
 455  0150 4bff          	push	#255
 456  0152 ae500f        	ldw	x,#20495
 457  0155 cd0000        	call	_GPIO_Init
 459  0158 85            	popw	x
 460                     ; 102 	GPIO_Init(GPIOE, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
 462  0159 4b40          	push	#64
 463  015b 4bff          	push	#255
 464  015d ae5014        	ldw	x,#20500
 465  0160 cd0000        	call	_GPIO_Init
 467  0163 85            	popw	x
 468                     ; 103 	GPIO_Init(GPIOF, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
 470  0164 4b40          	push	#64
 471  0166 4bff          	push	#255
 472  0168 ae5019        	ldw	x,#20505
 473  016b cd0000        	call	_GPIO_Init
 475  016e 85            	popw	x
 476                     ; 105 	GPIO_Init(GPIOE, GPIO_Pin_6, GPIO_Mode_Out_PP_Low_Slow);
 478  016f 4bc0          	push	#192
 479  0171 4b40          	push	#64
 480  0173 ae5014        	ldw	x,#20500
 481  0176 cd0000        	call	_GPIO_Init
 483  0179 85            	popw	x
 484                     ; 106 }
 487  017a 81            	ret
 512                     ; 108 char initAnalogControls(void)
 512                     ; 109 {
 513                     	switch	.text
 514  017b               _initAnalogControls:
 518                     ; 110 	values[1] = 0x0;
 520  017b 3f01          	clr	_values+1
 521                     ; 112 	GPIO_Init(GPIOA, GPIO_Pin_6, GPIO_Mode_In_FL_No_IT);
 523  017d 4b00          	push	#0
 524  017f 4b40          	push	#64
 525  0181 ae5000        	ldw	x,#20480
 526  0184 cd0000        	call	_GPIO_Init
 528  0187 85            	popw	x
 529                     ; 113 } 
 532  0188 81            	ret
 558                     ; 115 char initDigitalControls(void)
 558                     ; 116 {
 559                     	switch	.text
 560  0189               _initDigitalControls:
 564                     ; 117 	values[0] = 0x0;
 566  0189 3f00          	clr	_values
 567                     ; 119 	GPIO_Init(GPIOC, GPIO_Pin_3, GPIO_Mode_In_FL_No_IT);
 569  018b 4b00          	push	#0
 570  018d 4b08          	push	#8
 571  018f ae500a        	ldw	x,#20490
 572  0192 cd0000        	call	_GPIO_Init
 574  0195 85            	popw	x
 575                     ; 120 } 
 578  0196 81            	ret
 625                     ; 122 void readControlData(void)
 625                     ; 123 {
 626                     	switch	.text
 627  0197               _readControlData:
 629  0197 89            	pushw	x
 630       00000002      OFST:	set	2
 633                     ; 124 	char a0 = 0x0;
 635                     ; 125 	char v0 = 0x0;
 637  0198 0f02          	clr	(OFST+0,sp)
 638                     ; 127 	a0 = sampleADC();
 640  019a cd0000        	call	_sampleADC
 642  019d 6b01          	ld	(OFST-1,sp),a
 643                     ; 129 	v0 |= GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_3) != 0x0 ? 0x0 : 0x1;
 645  019f 4b08          	push	#8
 646  01a1 ae500a        	ldw	x,#20490
 647  01a4 cd0000        	call	_GPIO_ReadInputDataBit
 649  01a7 5b01          	addw	sp,#1
 650  01a9 4d            	tnz	a
 651  01aa 2703          	jreq	L22
 652  01ac 4f            	clr	a
 653  01ad 2002          	jra	L42
 654  01af               L22:
 655  01af a601          	ld	a,#1
 656  01b1               L42:
 657  01b1 1a02          	or	a,(OFST+0,sp)
 658  01b3 6b02          	ld	(OFST+0,sp),a
 659                     ; 130 	v0 |= (GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_2) != 0x0 ? 0x0 : 0x1) << 0x1;
 661  01b5 4b04          	push	#4
 662  01b7 ae500a        	ldw	x,#20490
 663  01ba cd0000        	call	_GPIO_ReadInputDataBit
 665  01bd 5b01          	addw	sp,#1
 666  01bf 4d            	tnz	a
 667  01c0 2703          	jreq	L62
 668  01c2 4f            	clr	a
 669  01c3 2002          	jra	L03
 670  01c5               L62:
 671  01c5 a602          	ld	a,#2
 672  01c7               L03:
 673  01c7 1a02          	or	a,(OFST+0,sp)
 674  01c9 6b02          	ld	(OFST+0,sp),a
 675                     ; 131 	v0 |= (a0 << 0x2); 
 677  01cb 7b01          	ld	a,(OFST-1,sp)
 678  01cd 48            	sll	a
 679  01ce 48            	sll	a
 680  01cf 1a02          	or	a,(OFST+0,sp)
 681  01d1 6b02          	ld	(OFST+0,sp),a
 682                     ; 133 	if(v0 != values[0])
 684  01d3 7b02          	ld	a,(OFST+0,sp)
 685  01d5 b100          	cp	a,_values
 686  01d7 2706          	jreq	L331
 687                     ; 135 		values[0] = v0;
 689  01d9 7b02          	ld	a,(OFST+0,sp)
 690  01db b700          	ld	_values,a
 691                     ; 137 		writeControlData();
 693  01dd ad02          	call	_writeControlData
 695  01df               L331:
 696                     ; 139 }                                  
 699  01df 85            	popw	x
 700  01e0 81            	ret
 725                     ; 141 void writeControlData(void)
 725                     ; 142 {
 726                     	switch	.text
 727  01e1               _writeControlData:
 731                     ; 143 	writeEEPROMByte(0x0, values[0]);
 733  01e1 b600          	ld	a,_values
 734  01e3 97            	ld	xl,a
 735  01e4 4f            	clr	a
 736  01e5 95            	ld	xh,a
 737  01e6 ad01          	call	_writeEEPROMByte
 739                     ; 148 }                         
 742  01e8 81            	ret
 789                     ; 150 void writeEEPROMByte(const char address, char data)
 789                     ; 151 {
 790                     	switch	.text
 791  01e9               _writeEEPROMByte:
 793  01e9 89            	pushw	x
 794       00000000      OFST:	set	0
 797                     ; 152 	M24LR04E_Init();
 799  01ea cd0000        	call	_M24LR04E_Init
 801                     ; 153 	M24LR04E_WriteOneByte(M24LR16_EEPROM_ADDRESS_USER, address, data);
 803  01ed 7b02          	ld	a,(OFST+2,sp)
 804  01ef 88            	push	a
 805  01f0 7b02          	ld	a,(OFST+2,sp)
 806  01f2 5f            	clrw	x
 807  01f3 97            	ld	xl,a
 808  01f4 89            	pushw	x
 809  01f5 a6a6          	ld	a,#166
 810  01f7 cd0000        	call	_M24LR04E_WriteOneByte
 812  01fa 5b03          	addw	sp,#3
 813                     ; 154 	M24LR04E_DeInit();
 815  01fc cd0000        	call	_M24LR04E_DeInit
 817                     ; 156 	delay_10us(100);
 819  01ff ae0064        	ldw	x,#100
 820  0202 cd0000        	call	_delay_10us
 822                     ; 157 }
 825  0205 85            	popw	x
 826  0206 81            	ret
 860                     ; 159 void main(void)
 860                     ; 160 {
 861                     	switch	.text
 862  0207               _main:
 866                     ; 161 	deInitClock();
 868  0207 cd00a4        	call	_deInitClock
 870                     ; 162 	deInitGPIO();
 872  020a cd012d        	call	_deInitGPIO
 874                     ; 164 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
 876  020d a601          	ld	a,#1
 877  020f cd0000        	call	_CLK_SYSCLKSourceConfig
 879                     ; 165 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_16);        
 881  0212 a604          	ld	a,#4
 882  0214 cd0000        	call	_CLK_SYSCLKDivConfig
 884                     ; 167 	initDigitalControls();
 886  0217 cd0189        	call	_initDigitalControls
 888                     ; 168 	initAnalogControls();
 890  021a cd017b        	call	_initAnalogControls
 892                     ; 170 	GPIO_Init(GPIOF, GPIO_Pin_0, GPIO_Mode_In_FL_IT);
 894  021d 4b20          	push	#32
 895  021f 4b01          	push	#1
 896  0221 ae5019        	ldw	x,#20505
 897  0224 cd0000        	call	_GPIO_Init
 899  0227 85            	popw	x
 900                     ; 171 	EXTI_SetPinSensitivity(EXTI_Pin_0, EXTI_Trigger_Rising);
 902  0228 ae0001        	ldw	x,#1
 903  022b cd0000        	call	_EXTI_SetPinSensitivity
 905                     ; 173 	enableInterrupts();
 908  022e 9a            rim
 910                     ; 174 	initMemory();
 913  022f cd008d        	call	_initMemory
 915  0232               L771:
 916                     ; 178 		halt();
 919  0232 8e            halt
 923  0233 20fd          	jra	L771
 975                     	xdef	_main
 976                     	switch	.ubsct
 977  0000               _values:
 978  0000 0000          	ds.b	2
 979                     	xdef	_values
 980                     	xdef	_writeEEPROMByte
 981                     	xdef	_writeControlData
 982                     	xdef	_readControlData
 983                     	xdef	_initDigitalControls
 984                     	xdef	_initAnalogControls
 985                     	xdef	_deInitGPIO
 986                     	xdef	_deInitClock
 987                     	xdef	_initMemory
 988                     	xdef	_sampleADC
 989                     	xref	_M24LR04E_WriteOneByte
 990                     	xref	_M24LR04E_Init
 991                     	xref	_M24LR04E_DeInit
 992                     	xref	_GPIO_ReadInputDataBit
 993                     	xref	_GPIO_Init
 994                     	xref	_EXTI_SetPinSensitivity
 995                     	xref	_CLK_PeripheralClockConfig
 996                     	xref	_CLK_SYSCLKDivConfig
 997                     	xref	_CLK_SYSCLKSourceConfig
 998                     	xref	_delay_10us
 999                     	xref	_ADC_GetFlagStatus
1000                     	xref	_ADC_GetConversionValue
1001                     	xref	_ADC_SamplingTimeConfig
1002                     	xref	_ADC_SoftwareStartConv
1003                     	xref	_ADC_VrefintCmd
1004                     	xref	_ADC_Cmd
1005                     	xref	_ADC_ChannelCmd
1006                     	xref	_ADC_Init
1007                     	xref	_ADC_DeInit
1027                     	end
