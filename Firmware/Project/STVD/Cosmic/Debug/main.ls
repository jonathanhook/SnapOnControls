   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.19 - 04 Sep 2013
   3                     ; Generator (Limited) V4.3.11 - 04 Sep 2013
  54                     ; 50 void deInitClock(void)
  54                     ; 51 {
  56                     	switch	.text
  57  0000               _deInitClock:
  61                     ; 52 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, DISABLE);
  63  0000 5f            	clrw	x
  64  0001 cd0000        	call	_CLK_PeripheralClockConfig
  66                     ; 53 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, DISABLE);
  68  0004 ae0100        	ldw	x,#256
  69  0007 cd0000        	call	_CLK_PeripheralClockConfig
  71                     ; 54 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);
  73  000a ae0200        	ldw	x,#512
  74  000d cd0000        	call	_CLK_PeripheralClockConfig
  76                     ; 55 	CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, DISABLE);
  78  0010 ae0300        	ldw	x,#768
  79  0013 cd0000        	call	_CLK_PeripheralClockConfig
  81                     ; 56 	CLK_PeripheralClockConfig(CLK_Peripheral_SPI1, DISABLE);
  83  0016 ae0400        	ldw	x,#1024
  84  0019 cd0000        	call	_CLK_PeripheralClockConfig
  86                     ; 57 	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, DISABLE);
  88  001c ae0500        	ldw	x,#1280
  89  001f cd0000        	call	_CLK_PeripheralClockConfig
  91                     ; 58 	CLK_PeripheralClockConfig(CLK_Peripheral_BEEP, DISABLE);
  93  0022 ae0600        	ldw	x,#1536
  94  0025 cd0000        	call	_CLK_PeripheralClockConfig
  96                     ; 59 	CLK_PeripheralClockConfig(CLK_Peripheral_DAC, DISABLE);
  98  0028 ae0700        	ldw	x,#1792
  99  002b cd0000        	call	_CLK_PeripheralClockConfig
 101                     ; 60 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 103  002e ae1000        	ldw	x,#4096
 104  0031 cd0000        	call	_CLK_PeripheralClockConfig
 106                     ; 61 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, DISABLE);
 108  0034 ae1100        	ldw	x,#4352
 109  0037 cd0000        	call	_CLK_PeripheralClockConfig
 111                     ; 62 	CLK_PeripheralClockConfig(CLK_Peripheral_RTC, DISABLE);
 113  003a ae1200        	ldw	x,#4608
 114  003d cd0000        	call	_CLK_PeripheralClockConfig
 116                     ; 63 	CLK_PeripheralClockConfig(CLK_Peripheral_LCD, DISABLE);
 118  0040 ae1300        	ldw	x,#4864
 119  0043 cd0000        	call	_CLK_PeripheralClockConfig
 121                     ; 64 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 123  0046 ae1000        	ldw	x,#4096
 124  0049 cd0000        	call	_CLK_PeripheralClockConfig
 126                     ; 65 	CLK_PeripheralClockConfig(CLK_Peripheral_DMA1, DISABLE);
 128  004c ae1400        	ldw	x,#5120
 129  004f cd0000        	call	_CLK_PeripheralClockConfig
 131                     ; 66 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 133  0052 ae1000        	ldw	x,#4096
 134  0055 cd0000        	call	_CLK_PeripheralClockConfig
 136                     ; 67 	CLK_PeripheralClockConfig(CLK_Peripheral_BOOTROM, DISABLE);
 138  0058 ae1700        	ldw	x,#5888
 139  005b cd0000        	call	_CLK_PeripheralClockConfig
 141                     ; 68 	CLK_PeripheralClockConfig(CLK_Peripheral_AES, DISABLE);
 143  005e ae2000        	ldw	x,#8192
 144  0061 cd0000        	call	_CLK_PeripheralClockConfig
 146                     ; 69 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 148  0064 ae1000        	ldw	x,#4096
 149  0067 cd0000        	call	_CLK_PeripheralClockConfig
 151                     ; 70 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM5, DISABLE);
 153  006a ae2100        	ldw	x,#8448
 154  006d cd0000        	call	_CLK_PeripheralClockConfig
 156                     ; 71 	CLK_PeripheralClockConfig(CLK_Peripheral_SPI2, DISABLE);
 158  0070 ae2200        	ldw	x,#8704
 159  0073 cd0000        	call	_CLK_PeripheralClockConfig
 161                     ; 72 	CLK_PeripheralClockConfig(CLK_Peripheral_USART2, DISABLE);
 163  0076 ae2300        	ldw	x,#8960
 164  0079 cd0000        	call	_CLK_PeripheralClockConfig
 166                     ; 73 	CLK_PeripheralClockConfig(CLK_Peripheral_USART3, DISABLE);
 168  007c ae2400        	ldw	x,#9216
 169  007f cd0000        	call	_CLK_PeripheralClockConfig
 171                     ; 74 	CLK_PeripheralClockConfig(CLK_Peripheral_CSSLSE, DISABLE);
 173  0082 ae2500        	ldw	x,#9472
 174  0085 cd0000        	call	_CLK_PeripheralClockConfig
 176                     ; 75 }
 179  0088 81            	ret
 203                     ; 77 void deInitGPIO (void)
 203                     ; 78 {
 204                     	switch	.text
 205  0089               _deInitGPIO:
 209                     ; 79 	GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
 211  0089 4b40          	push	#64
 212  008b 4bff          	push	#255
 213  008d ae5000        	ldw	x,#20480
 214  0090 cd0000        	call	_GPIO_Init
 216  0093 85            	popw	x
 217                     ; 80 	GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
 219  0094 4b40          	push	#64
 220  0096 4bff          	push	#255
 221  0098 ae5005        	ldw	x,#20485
 222  009b cd0000        	call	_GPIO_Init
 224  009e 85            	popw	x
 225                     ; 81 	GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
 227  009f 4b40          	push	#64
 228  00a1 4bff          	push	#255
 229  00a3 ae500a        	ldw	x,#20490
 230  00a6 cd0000        	call	_GPIO_Init
 232  00a9 85            	popw	x
 233                     ; 82 	GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
 235  00aa 4b40          	push	#64
 236  00ac 4bff          	push	#255
 237  00ae ae500f        	ldw	x,#20495
 238  00b1 cd0000        	call	_GPIO_Init
 240  00b4 85            	popw	x
 241                     ; 83 	GPIO_Init(GPIOE, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
 243  00b5 4b40          	push	#64
 244  00b7 4bff          	push	#255
 245  00b9 ae5014        	ldw	x,#20500
 246  00bc cd0000        	call	_GPIO_Init
 248  00bf 85            	popw	x
 249                     ; 84 	GPIO_Init(GPIOF, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
 251  00c0 4b40          	push	#64
 252  00c2 4bff          	push	#255
 253  00c4 ae5019        	ldw	x,#20505
 254  00c7 cd0000        	call	_GPIO_Init
 256  00ca 85            	popw	x
 257                     ; 86 	GPIO_Init(GPIOE, GPIO_Pin_6, GPIO_Mode_Out_PP_Low_Slow);
 259  00cb 4bc0          	push	#192
 260  00cd 4b40          	push	#64
 261  00cf ae5014        	ldw	x,#20500
 262  00d2 cd0000        	call	_GPIO_Init
 264  00d5 85            	popw	x
 265                     ; 87 }
 268  00d6 81            	ret
 321                     ; 89 char initCharArray(char *array, char length)
 321                     ; 90 {
 322                     	switch	.text
 323  00d7               _initCharArray:
 325  00d7 89            	pushw	x
 326  00d8 88            	push	a
 327       00000001      OFST:	set	1
 330                     ; 93 	for(i = 0; i < length; i++)
 332  00d9 0f01          	clr	(OFST+0,sp)
 334  00db 200e          	jra	L76
 335  00dd               L36:
 336                     ; 95 		array[i] = 0x0;
 338  00dd 7b02          	ld	a,(OFST+1,sp)
 339  00df 97            	ld	xl,a
 340  00e0 7b03          	ld	a,(OFST+2,sp)
 341  00e2 1b01          	add	a,(OFST+0,sp)
 342  00e4 2401          	jrnc	L21
 343  00e6 5c            	incw	x
 344  00e7               L21:
 345  00e7 02            	rlwa	x,a
 346  00e8 7f            	clr	(x)
 347                     ; 93 	for(i = 0; i < length; i++)
 349  00e9 0c01          	inc	(OFST+0,sp)
 350  00eb               L76:
 353  00eb 7b01          	ld	a,(OFST+0,sp)
 354  00ed 1106          	cp	a,(OFST+5,sp)
 355  00ef 25ec          	jrult	L36
 356                     ; 97 }
 359  00f1 5b03          	addw	sp,#3
 360  00f3 81            	ret
 385                     ; 99 char initAnalogControls(void)
 385                     ; 100 {
 386                     	switch	.text
 387  00f4               _initAnalogControls:
 391                     ; 101 	initCharArray(analog, NUM_ANALOG_VALUES);
 393  00f4 4b01          	push	#1
 394  00f6 ae0000        	ldw	x,#_analog
 395  00f9 addc          	call	_initCharArray
 397  00fb 84            	pop	a
 398                     ; 102 } 
 401  00fc 81            	ret
 428                     ; 104 char initDigitalControls(void)
 428                     ; 105 {
 429                     	switch	.text
 430  00fd               _initDigitalControls:
 434                     ; 106   initCharArray(digital, NUM_DIGITAL_VALUES);
 436  00fd 4b01          	push	#1
 437  00ff ae0001        	ldw	x,#_digital
 438  0102 add3          	call	_initCharArray
 440  0104 84            	pop	a
 441                     ; 108 	GPIO_Init(GPIOC, GPIO_Pin_3, GPIO_Mode_In_FL_No_IT);
 443  0105 4b00          	push	#0
 444  0107 4b08          	push	#8
 445  0109 ae500a        	ldw	x,#20490
 446  010c cd0000        	call	_GPIO_Init
 448  010f 85            	popw	x
 449                     ; 109 } 
 452  0110 81            	ret
 496                     ; 111 char initNDEFMessage(void)
 496                     ; 112 {
 497                     	switch	.text
 498  0111               _initNDEFMessage:
 500  0111 89            	pushw	x
 501       00000002      OFST:	set	2
 504                     ; 114 	char length = NUM_DIGITAL_VALUES + NUM_ANALOG_VALUES;
 506  0112 a602          	ld	a,#2
 507  0114 6b01          	ld	(OFST-1,sp),a
 508                     ; 116 	writeEEPROMByte(NDEF_CC0, 0xE1);
 510  0116 ae00e1        	ldw	x,#225
 511  0119 cd01ef        	call	_writeEEPROMByte
 513                     ; 117 	writeEEPROMByte(NDEF_CC1, 0x40);
 515  011c ae0140        	ldw	x,#320
 516  011f cd01ef        	call	_writeEEPROMByte
 518                     ; 118 	writeEEPROMByte(NDEF_CC2, 0xFF);
 520  0122 ae02ff        	ldw	x,#767
 521  0125 cd01ef        	call	_writeEEPROMByte
 523                     ; 119 	writeEEPROMByte(NDEF_CC3, 0x00);
 525  0128 ae0300        	ldw	x,#768
 526  012b cd01ef        	call	_writeEEPROMByte
 528                     ; 120 	writeEEPROMByte(NDEF_TLV, 0x03);
 530  012e ae0403        	ldw	x,#1027
 531  0131 cd01ef        	call	_writeEEPROMByte
 533                     ; 121 	writeEEPROMByte(NDEF_LEN, length + HEADER_EXTRA_LEN);
 535  0134 7b01          	ld	a,(OFST-1,sp)
 536  0136 ab04          	add	a,#4
 537  0138 97            	ld	xl,a
 538  0139 a605          	ld	a,#5
 539  013b 95            	ld	xh,a
 540  013c cd01ef        	call	_writeEEPROMByte
 542                     ; 122 	writeEEPROMByte(NDEF_VRH, 0xD1);
 544  013f ae06d1        	ldw	x,#1745
 545  0142 cd01ef        	call	_writeEEPROMByte
 547                     ; 123 	writeEEPROMByte(NDEF_VTL, 0x01);
 549  0145 ae0701        	ldw	x,#1793
 550  0148 cd01ef        	call	_writeEEPROMByte
 552                     ; 124 	writeEEPROMByte(NDEF_VPL, length + PAYLOAD_EXTRA_LEN);
 554  014b 7b01          	ld	a,(OFST-1,sp)
 555  014d ab07          	add	a,#7
 556  014f 97            	ld	xl,a
 557  0150 a608          	ld	a,#8
 558  0152 95            	ld	xh,a
 559  0153 cd01ef        	call	_writeEEPROMByte
 561                     ; 125 	writeEEPROMByte(NDEF_VTT, 0x54);
 563  0156 ae0954        	ldw	x,#2388
 564  0159 cd01ef        	call	_writeEEPROMByte
 566                     ; 126 	writeEEPROMByte(NDEF_VSB, 0x02);
 568  015c ae0a02        	ldw	x,#2562
 569  015f cd01ef        	call	_writeEEPROMByte
 571                     ; 127 	writeEEPROMByte(NDEF_VL1, LAN_CODE[0]);
 573  0162 ae0b65        	ldw	x,#2917
 574  0165 cd01ef        	call	_writeEEPROMByte
 576                     ; 128 	writeEEPROMByte(NDEF_VL2, LAN_CODE[1]);
 578  0168 ae0c6e        	ldw	x,#3182
 579  016b cd01ef        	call	_writeEEPROMByte
 581                     ; 129 	writeEEPROMByte(NDEF_PAD, 0x0);
 583  016e ae0d00        	ldw	x,#3328
 584  0171 ad7c          	call	_writeEEPROMByte
 586                     ; 130 	writeEEPROMByte(NDEF_PAD + 1, 0x0);
 588  0173 ae0e00        	ldw	x,#3584
 589  0176 ad77          	call	_writeEEPROMByte
 591                     ; 131 	writeEEPROMByte(NDEF_PAD + 2, 0x0);
 593  0178 ae0f00        	ldw	x,#3840
 594  017b ad72          	call	_writeEEPROMByte
 596                     ; 132 	writeEEPROMByte(NDEF_DAS + length, 0xFE);
 598  017d ae00fe        	ldw	x,#254
 599  0180 7b01          	ld	a,(OFST-1,sp)
 600  0182 ab10          	add	a,#16
 601  0184 95            	ld	xh,a
 602  0185 ad68          	call	_writeEEPROMByte
 604                     ; 134 	for(i = 0; i < length; i++)
 606  0187 0f02          	clr	(OFST+0,sp)
 608  0189 200a          	jra	L141
 609  018b               L531:
 610                     ; 136 		writeEEPROMByte(NDEF_DAS + i, 0x0);
 612  018b 5f            	clrw	x
 613  018c 7b02          	ld	a,(OFST+0,sp)
 614  018e ab10          	add	a,#16
 615  0190 95            	ld	xh,a
 616  0191 ad5c          	call	_writeEEPROMByte
 618                     ; 134 	for(i = 0; i < length; i++)
 620  0193 0c02          	inc	(OFST+0,sp)
 621  0195               L141:
 624  0195 7b02          	ld	a,(OFST+0,sp)
 625  0197 1101          	cp	a,(OFST-1,sp)
 626  0199 25f0          	jrult	L531
 627                     ; 138 }
 630  019b 85            	popw	x
 631  019c 81            	ret
 668                     ; 141 void readControlData(void)
 668                     ; 142 {
 669                     	switch	.text
 670  019d               _readControlData:
 672  019d 88            	push	a
 673       00000001      OFST:	set	1
 676                     ; 143 	char d0 = GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_3) == 0x0 ? 0x1 : 0x0;
 678  019e 4b08          	push	#8
 679  01a0 ae500a        	ldw	x,#20490
 680  01a3 cd0000        	call	_GPIO_ReadInputDataBit
 682  01a6 5b01          	addw	sp,#1
 683  01a8 4d            	tnz	a
 684  01a9 2604          	jrne	L42
 685  01ab a601          	ld	a,#1
 686  01ad 2001          	jra	L62
 687  01af               L42:
 688  01af 4f            	clr	a
 689  01b0               L62:
 690  01b0 6b01          	ld	(OFST+0,sp),a
 691                     ; 145 	if(d0 != digital[0])
 693  01b2 7b01          	ld	a,(OFST+0,sp)
 694  01b4 b101          	cp	a,_digital
 695  01b6 2706          	jreq	L361
 696                     ; 147 		digital[0] = d0;
 698  01b8 7b01          	ld	a,(OFST+0,sp)
 699  01ba b701          	ld	_digital,a
 700                     ; 149 		writeControlData();
 702  01bc ad02          	call	_writeControlData
 704  01be               L361:
 705                     ; 151 }                                  
 708  01be 84            	pop	a
 709  01bf 81            	ret
 737                     ; 153 void writeControlData(void)
 737                     ; 154 {
 738                     	switch	.text
 739  01c0               _writeControlData:
 743                     ; 155 	M24LR04E_Init();
 745  01c0 cd0000        	call	_M24LR04E_Init
 747                     ; 156 	M24LR04E_WriteBuffer(M24LR16_EEPROM_ADDRESS_USER, NDEF_DAS, NUM_DIGITAL_VALUES, digital);
 749  01c3 ae0001        	ldw	x,#_digital
 750  01c6 89            	pushw	x
 751  01c7 4b01          	push	#1
 752  01c9 ae0010        	ldw	x,#16
 753  01cc 89            	pushw	x
 754  01cd a6a6          	ld	a,#166
 755  01cf cd0000        	call	_M24LR04E_WriteBuffer
 757  01d2 5b05          	addw	sp,#5
 758                     ; 157 	M24LR04E_DeInit();
 760  01d4 cd0000        	call	_M24LR04E_DeInit
 762                     ; 159 	M24LR04E_Init();
 764  01d7 cd0000        	call	_M24LR04E_Init
 766                     ; 160 	M24LR04E_WriteBuffer(M24LR16_EEPROM_ADDRESS_USER, NDEF_DAS + NUM_DIGITAL_VALUES, NUM_ANALOG_VALUES, analog);
 768  01da ae0000        	ldw	x,#_analog
 769  01dd 89            	pushw	x
 770  01de 4b01          	push	#1
 771  01e0 ae0011        	ldw	x,#17
 772  01e3 89            	pushw	x
 773  01e4 a6a6          	ld	a,#166
 774  01e6 cd0000        	call	_M24LR04E_WriteBuffer
 776  01e9 5b05          	addw	sp,#5
 777                     ; 161 	M24LR04E_DeInit();
 779  01eb cd0000        	call	_M24LR04E_DeInit
 781                     ; 163 }                         
 784  01ee 81            	ret
 831                     ; 165 void writeEEPROMByte(const char address, char data)
 831                     ; 166 {
 832                     	switch	.text
 833  01ef               _writeEEPROMByte:
 835  01ef 89            	pushw	x
 836       00000000      OFST:	set	0
 839                     ; 167 	M24LR04E_Init();
 841  01f0 cd0000        	call	_M24LR04E_Init
 843                     ; 168 	M24LR04E_WriteOneByte(M24LR16_EEPROM_ADDRESS_USER, address, data);
 845  01f3 7b02          	ld	a,(OFST+2,sp)
 846  01f5 88            	push	a
 847  01f6 7b02          	ld	a,(OFST+2,sp)
 848  01f8 5f            	clrw	x
 849  01f9 97            	ld	xl,a
 850  01fa 89            	pushw	x
 851  01fb a6a6          	ld	a,#166
 852  01fd cd0000        	call	_M24LR04E_WriteOneByte
 854  0200 5b03          	addw	sp,#3
 855                     ; 169 	M24LR04E_DeInit();
 857  0202 cd0000        	call	_M24LR04E_DeInit
 859                     ; 171 	delay_10us(100);
 861  0205 ae0064        	ldw	x,#100
 862  0208 cd0000        	call	_delay_10us
 864                     ; 172 }
 867  020b 85            	popw	x
 868  020c 81            	ret
 902                     ; 174 void main(void)
 902                     ; 175 {
 903                     	switch	.text
 904  020d               _main:
 908                     ; 176 	deInitClock();
 910  020d cd0000        	call	_deInitClock
 912                     ; 177 	deInitGPIO();
 914  0210 cd0089        	call	_deInitGPIO
 916                     ; 179 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
 918  0213 a601          	ld	a,#1
 919  0215 cd0000        	call	_CLK_SYSCLKSourceConfig
 921                     ; 180 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_16);        
 923  0218 a604          	ld	a,#4
 924  021a cd0000        	call	_CLK_SYSCLKDivConfig
 926                     ; 182 	initDigitalControls();
 928  021d cd00fd        	call	_initDigitalControls
 930                     ; 183 	initAnalogControls();
 932  0220 cd00f4        	call	_initAnalogControls
 934                     ; 184 	initNDEFMessage();
 936  0223 cd0111        	call	_initNDEFMessage
 938                     ; 186 	GPIO_Init(GPIOF, GPIO_Pin_0, GPIO_Mode_In_FL_IT);
 940  0226 4b20          	push	#32
 941  0228 4b01          	push	#1
 942  022a ae5019        	ldw	x,#20505
 943  022d cd0000        	call	_GPIO_Init
 945  0230 85            	popw	x
 946                     ; 187 	EXTI_SetPinSensitivity(EXTI_Pin_0, EXTI_Trigger_Rising);
 948  0231 ae0001        	ldw	x,#1
 949  0234 cd0000        	call	_EXTI_SetPinSensitivity
 951                     ; 189 	enableInterrupts();
 954  0237 9a            rim
 956  0238               L722:
 957                     ; 193 		halt();
 960  0238 8e            halt
 964  0239 20fd          	jra	L722
1036                     	xdef	_main
1037                     	switch	.ubsct
1038  0000               _analog:
1039  0000 00            	ds.b	1
1040                     	xdef	_analog
1041  0001               _digital:
1042  0001 00            	ds.b	1
1043                     	xdef	_digital
1044                     	xdef	_writeEEPROMByte
1045                     	xdef	_writeControlData
1046                     	xdef	_readControlData
1047                     	xdef	_initNDEFMessage
1048                     	xdef	_initDigitalControls
1049                     	xdef	_initAnalogControls
1050                     	xdef	_initCharArray
1051                     	xdef	_deInitGPIO
1052                     	xdef	_deInitClock
1053  0002               _NDEFmessage:
1054  0002 000000000000  	ds.b	64
1055                     	xdef	_NDEFmessage
1056                     	xref	_M24LR04E_WriteBuffer
1057                     	xref	_M24LR04E_WriteOneByte
1058                     	xref	_M24LR04E_Init
1059                     	xref	_M24LR04E_DeInit
1060                     	xref	_GPIO_ReadInputDataBit
1061                     	xref	_GPIO_Init
1062                     	xref	_EXTI_SetPinSensitivity
1063                     	xref	_CLK_PeripheralClockConfig
1064                     	xref	_CLK_SYSCLKDivConfig
1065                     	xref	_CLK_SYSCLKSourceConfig
1066                     	xref	_delay_10us
1086                     	end
