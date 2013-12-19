   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.19 - 04 Sep 2013
   3                     ; Generator (Limited) V4.3.11 - 04 Sep 2013
  54                     ; 54 void deInitClock(void)
  54                     ; 55 {
  56                     	switch	.text
  57  0000               _deInitClock:
  61                     ; 56 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, DISABLE);
  63  0000 5f            	clrw	x
  64  0001 cd0000        	call	_CLK_PeripheralClockConfig
  66                     ; 57 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, DISABLE);
  68  0004 ae0100        	ldw	x,#256
  69  0007 cd0000        	call	_CLK_PeripheralClockConfig
  71                     ; 58 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);
  73  000a ae0200        	ldw	x,#512
  74  000d cd0000        	call	_CLK_PeripheralClockConfig
  76                     ; 59 	CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, DISABLE);
  78  0010 ae0300        	ldw	x,#768
  79  0013 cd0000        	call	_CLK_PeripheralClockConfig
  81                     ; 60 	CLK_PeripheralClockConfig(CLK_Peripheral_SPI1, DISABLE);
  83  0016 ae0400        	ldw	x,#1024
  84  0019 cd0000        	call	_CLK_PeripheralClockConfig
  86                     ; 61 	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, DISABLE);
  88  001c ae0500        	ldw	x,#1280
  89  001f cd0000        	call	_CLK_PeripheralClockConfig
  91                     ; 62 	CLK_PeripheralClockConfig(CLK_Peripheral_BEEP, DISABLE);
  93  0022 ae0600        	ldw	x,#1536
  94  0025 cd0000        	call	_CLK_PeripheralClockConfig
  96                     ; 63 	CLK_PeripheralClockConfig(CLK_Peripheral_DAC, DISABLE);
  98  0028 ae0700        	ldw	x,#1792
  99  002b cd0000        	call	_CLK_PeripheralClockConfig
 101                     ; 64 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 103  002e ae1000        	ldw	x,#4096
 104  0031 cd0000        	call	_CLK_PeripheralClockConfig
 106                     ; 65 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, DISABLE);
 108  0034 ae1100        	ldw	x,#4352
 109  0037 cd0000        	call	_CLK_PeripheralClockConfig
 111                     ; 66 	CLK_PeripheralClockConfig(CLK_Peripheral_RTC, DISABLE);
 113  003a ae1200        	ldw	x,#4608
 114  003d cd0000        	call	_CLK_PeripheralClockConfig
 116                     ; 67 	CLK_PeripheralClockConfig(CLK_Peripheral_LCD, DISABLE);
 118  0040 ae1300        	ldw	x,#4864
 119  0043 cd0000        	call	_CLK_PeripheralClockConfig
 121                     ; 68 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 123  0046 ae1000        	ldw	x,#4096
 124  0049 cd0000        	call	_CLK_PeripheralClockConfig
 126                     ; 69 	CLK_PeripheralClockConfig(CLK_Peripheral_DMA1, DISABLE);
 128  004c ae1400        	ldw	x,#5120
 129  004f cd0000        	call	_CLK_PeripheralClockConfig
 131                     ; 70 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 133  0052 ae1000        	ldw	x,#4096
 134  0055 cd0000        	call	_CLK_PeripheralClockConfig
 136                     ; 71 	CLK_PeripheralClockConfig(CLK_Peripheral_BOOTROM, DISABLE);
 138  0058 ae1700        	ldw	x,#5888
 139  005b cd0000        	call	_CLK_PeripheralClockConfig
 141                     ; 72 	CLK_PeripheralClockConfig(CLK_Peripheral_AES, DISABLE);
 143  005e ae2000        	ldw	x,#8192
 144  0061 cd0000        	call	_CLK_PeripheralClockConfig
 146                     ; 73 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 148  0064 ae1000        	ldw	x,#4096
 149  0067 cd0000        	call	_CLK_PeripheralClockConfig
 151                     ; 74 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM5, DISABLE);
 153  006a ae2100        	ldw	x,#8448
 154  006d cd0000        	call	_CLK_PeripheralClockConfig
 156                     ; 75 	CLK_PeripheralClockConfig(CLK_Peripheral_SPI2, DISABLE);
 158  0070 ae2200        	ldw	x,#8704
 159  0073 cd0000        	call	_CLK_PeripheralClockConfig
 161                     ; 76 	CLK_PeripheralClockConfig(CLK_Peripheral_USART2, DISABLE);
 163  0076 ae2300        	ldw	x,#8960
 164  0079 cd0000        	call	_CLK_PeripheralClockConfig
 166                     ; 77 	CLK_PeripheralClockConfig(CLK_Peripheral_USART3, DISABLE);
 168  007c ae2400        	ldw	x,#9216
 169  007f cd0000        	call	_CLK_PeripheralClockConfig
 171                     ; 78 	CLK_PeripheralClockConfig(CLK_Peripheral_CSSLSE, DISABLE);
 173  0082 ae2500        	ldw	x,#9472
 174  0085 cd0000        	call	_CLK_PeripheralClockConfig
 176                     ; 79 }
 179  0088 81            	ret
 203                     ; 81 void deInitGPIO (void)
 203                     ; 82 {
 204                     	switch	.text
 205  0089               _deInitGPIO:
 209                     ; 83 	GPIO_Init( GPIOA, GPIO_Pin_All, GPIO_Mode_Out_OD_Low_Fast);
 211  0089 4ba0          	push	#160
 212  008b 4bff          	push	#255
 213  008d ae5000        	ldw	x,#20480
 214  0090 cd0000        	call	_GPIO_Init
 216  0093 85            	popw	x
 217                     ; 84 	GPIO_Init( GPIOB, GPIO_Pin_All, GPIO_Mode_Out_OD_Low_Fast);
 219  0094 4ba0          	push	#160
 220  0096 4bff          	push	#255
 221  0098 ae5005        	ldw	x,#20485
 222  009b cd0000        	call	_GPIO_Init
 224  009e 85            	popw	x
 225                     ; 86 	GPIO_Init( GPIOC, GPIO_Pin_2 | GPIO_Pin_3 | GPIO_Pin_4 | GPIO_Pin_5 |\
 225                     ; 87 GPIO_Pin_5 | GPIO_Pin_6 |GPIO_Pin_7, GPIO_Mode_Out_OD_Low_Fast);
 227  009f 4ba0          	push	#160
 228  00a1 4bfc          	push	#252
 229  00a3 ae500a        	ldw	x,#20490
 230  00a6 cd0000        	call	_GPIO_Init
 232  00a9 85            	popw	x
 233                     ; 88 	GPIO_Init( GPIOD, GPIO_Pin_All, GPIO_Mode_Out_OD_Low_Fast);
 235  00aa 4ba0          	push	#160
 236  00ac 4bff          	push	#255
 237  00ae ae500f        	ldw	x,#20495
 238  00b1 cd0000        	call	_GPIO_Init
 240  00b4 85            	popw	x
 241                     ; 89 	GPIO_Init( GPIOE, GPIO_Pin_All, GPIO_Mode_Out_OD_Low_Fast);
 243  00b5 4ba0          	push	#160
 244  00b7 4bff          	push	#255
 245  00b9 ae5014        	ldw	x,#20500
 246  00bc cd0000        	call	_GPIO_Init
 248  00bf 85            	popw	x
 249                     ; 91 	GPIOA->ODR = 0xFF;
 251  00c0 35ff5000      	mov	20480,#255
 252                     ; 92 	GPIOB->ODR = 0xFF;
 254  00c4 35ff5005      	mov	20485,#255
 255                     ; 93 	GPIOC->ODR = 0xFF;
 257  00c8 35ff500a      	mov	20490,#255
 258                     ; 94 	GPIOD->ODR = 0xFF;
 260  00cc 35ff500f      	mov	20495,#255
 261                     ; 95 	GPIOE->ODR = 0xFF;
 263  00d0 35ff5014      	mov	20500,#255
 264                     ; 96 }
 267  00d4 81            	ret
 320                     ; 98 char initCharArray(char *array, char length)
 320                     ; 99 {
 321                     	switch	.text
 322  00d5               _initCharArray:
 324  00d5 89            	pushw	x
 325  00d6 88            	push	a
 326       00000001      OFST:	set	1
 329                     ; 102 	for(i = 0; i < length; i++)
 331  00d7 0f01          	clr	(OFST+0,sp)
 333  00d9 200e          	jra	L76
 334  00db               L36:
 335                     ; 104 		array[i] = 0x0;
 337  00db 7b02          	ld	a,(OFST+1,sp)
 338  00dd 97            	ld	xl,a
 339  00de 7b03          	ld	a,(OFST+2,sp)
 340  00e0 1b01          	add	a,(OFST+0,sp)
 341  00e2 2401          	jrnc	L21
 342  00e4 5c            	incw	x
 343  00e5               L21:
 344  00e5 02            	rlwa	x,a
 345  00e6 7f            	clr	(x)
 346                     ; 102 	for(i = 0; i < length; i++)
 348  00e7 0c01          	inc	(OFST+0,sp)
 349  00e9               L76:
 352  00e9 7b01          	ld	a,(OFST+0,sp)
 353  00eb 1106          	cp	a,(OFST+5,sp)
 354  00ed 25ec          	jrult	L36
 355                     ; 106 }
 358  00ef 5b03          	addw	sp,#3
 359  00f1 81            	ret
 384                     ; 108 char initAnalogControls(void)
 384                     ; 109 {
 385                     	switch	.text
 386  00f2               _initAnalogControls:
 390                     ; 110 	initCharArray(analog, NUM_ANALOG_VALUES);
 392  00f2 4b04          	push	#4
 393  00f4 ae0000        	ldw	x,#_analog
 394  00f7 addc          	call	_initCharArray
 396  00f9 84            	pop	a
 397                     ; 111 } 
 400  00fa 81            	ret
 427                     ; 113 char initDigitalControls(void)
 427                     ; 114 {
 428                     	switch	.text
 429  00fb               _initDigitalControls:
 433                     ; 115   initCharArray(digital, NUM_DIGITAL_VALUES);
 435  00fb 4b04          	push	#4
 436  00fd ae0004        	ldw	x,#_digital
 437  0100 add3          	call	_initCharArray
 439  0102 84            	pop	a
 440                     ; 117   GPIO_Init(GPIOC, GPIO_Pin_7, GPIO_Mode_In_FL_No_IT);
 442  0103 4b00          	push	#0
 443  0105 4b80          	push	#128
 444  0107 ae500a        	ldw	x,#20490
 445  010a cd0000        	call	_GPIO_Init
 447  010d 85            	popw	x
 448                     ; 118 } 
 451  010e 81            	ret
 495                     ; 120 char initNDEFMessage(void)
 495                     ; 121 {
 496                     	switch	.text
 497  010f               _initNDEFMessage:
 499  010f 89            	pushw	x
 500       00000002      OFST:	set	2
 503                     ; 123 	char length = NUM_DIGITAL_VALUES + NUM_ANALOG_VALUES;
 505  0110 a608          	ld	a,#8
 506  0112 6b01          	ld	(OFST-1,sp),a
 507                     ; 125 	writeEEPROMByte(NDEF_CC0, 0xE1);
 509  0114 ae00e1        	ldw	x,#225
 510  0117 cd01ed        	call	_writeEEPROMByte
 512                     ; 126 	writeEEPROMByte(NDEF_CC1, 0x40);
 514  011a ae0140        	ldw	x,#320
 515  011d cd01ed        	call	_writeEEPROMByte
 517                     ; 127 	writeEEPROMByte(NDEF_CC2, 0xFF);
 519  0120 ae02ff        	ldw	x,#767
 520  0123 cd01ed        	call	_writeEEPROMByte
 522                     ; 128 	writeEEPROMByte(NDEF_CC3, 0x00);
 524  0126 ae0300        	ldw	x,#768
 525  0129 cd01ed        	call	_writeEEPROMByte
 527                     ; 129 	writeEEPROMByte(NDEF_TLV, 0x03);
 529  012c ae0403        	ldw	x,#1027
 530  012f cd01ed        	call	_writeEEPROMByte
 532                     ; 130 	writeEEPROMByte(NDEF_LEN, length + HEADER_EXTRA_LEN);
 534  0132 7b01          	ld	a,(OFST-1,sp)
 535  0134 ab04          	add	a,#4
 536  0136 97            	ld	xl,a
 537  0137 a605          	ld	a,#5
 538  0139 95            	ld	xh,a
 539  013a cd01ed        	call	_writeEEPROMByte
 541                     ; 131 	writeEEPROMByte(NDEF_VRH, 0xD1);
 543  013d ae06d1        	ldw	x,#1745
 544  0140 cd01ed        	call	_writeEEPROMByte
 546                     ; 132 	writeEEPROMByte(NDEF_VTL, 0x01);
 548  0143 ae0701        	ldw	x,#1793
 549  0146 cd01ed        	call	_writeEEPROMByte
 551                     ; 133 	writeEEPROMByte(NDEF_VPL, length + PAYLOAD_EXTRA_LEN);
 553  0149 7b01          	ld	a,(OFST-1,sp)
 554  014b ab07          	add	a,#7
 555  014d 97            	ld	xl,a
 556  014e a608          	ld	a,#8
 557  0150 95            	ld	xh,a
 558  0151 cd01ed        	call	_writeEEPROMByte
 560                     ; 134 	writeEEPROMByte(NDEF_VTT, 0x54);
 562  0154 ae0954        	ldw	x,#2388
 563  0157 cd01ed        	call	_writeEEPROMByte
 565                     ; 135 	writeEEPROMByte(NDEF_VSB, 0x02);
 567  015a ae0a02        	ldw	x,#2562
 568  015d cd01ed        	call	_writeEEPROMByte
 570                     ; 136 	writeEEPROMByte(NDEF_VL1, LAN_CODE[0]);
 572  0160 ae0b65        	ldw	x,#2917
 573  0163 cd01ed        	call	_writeEEPROMByte
 575                     ; 137 	writeEEPROMByte(NDEF_VL2, LAN_CODE[1]);
 577  0166 ae0c6e        	ldw	x,#3182
 578  0169 cd01ed        	call	_writeEEPROMByte
 580                     ; 138 	writeEEPROMByte(NDEF_PAD, 0x0);
 582  016c ae0d00        	ldw	x,#3328
 583  016f ad7c          	call	_writeEEPROMByte
 585                     ; 139 	writeEEPROMByte(NDEF_PAD + 1, 0x0);
 587  0171 ae0e00        	ldw	x,#3584
 588  0174 ad77          	call	_writeEEPROMByte
 590                     ; 140 	writeEEPROMByte(NDEF_PAD + 2, 0x0);
 592  0176 ae0f00        	ldw	x,#3840
 593  0179 ad72          	call	_writeEEPROMByte
 595                     ; 141 	writeEEPROMByte(NDEF_DAS + length, 0xFE);
 597  017b ae00fe        	ldw	x,#254
 598  017e 7b01          	ld	a,(OFST-1,sp)
 599  0180 ab10          	add	a,#16
 600  0182 95            	ld	xh,a
 601  0183 ad68          	call	_writeEEPROMByte
 603                     ; 143 	for(i = 0; i < length; i++)
 605  0185 0f02          	clr	(OFST+0,sp)
 607  0187 200a          	jra	L141
 608  0189               L531:
 609                     ; 145 		writeEEPROMByte(NDEF_DAS + i, 0x0);
 611  0189 5f            	clrw	x
 612  018a 7b02          	ld	a,(OFST+0,sp)
 613  018c ab10          	add	a,#16
 614  018e 95            	ld	xh,a
 615  018f ad5c          	call	_writeEEPROMByte
 617                     ; 143 	for(i = 0; i < length; i++)
 619  0191 0c02          	inc	(OFST+0,sp)
 620  0193               L141:
 623  0193 7b02          	ld	a,(OFST+0,sp)
 624  0195 1101          	cp	a,(OFST-1,sp)
 625  0197 25f0          	jrult	L531
 626                     ; 147 }
 629  0199 85            	popw	x
 630  019a 81            	ret
 655                     ; 149 char readControlData(void)
 655                     ; 150 {
 656                     	switch	.text
 657  019b               _readControlData:
 661                     ; 151 	digital[0] = GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_7);
 663  019b 4b80          	push	#128
 664  019d ae500a        	ldw	x,#20490
 665  01a0 cd0000        	call	_GPIO_ReadInputDataBit
 667  01a3 5b01          	addw	sp,#1
 668  01a5 b704          	ld	_digital,a
 669                     ; 152 }                                  
 672  01a7 81            	ret
 701                     ; 154 void writeControlData(void)
 701                     ; 155 {
 702                     	switch	.text
 703  01a8               _writeControlData:
 707                     ; 156 	GPIO_WriteBit(LED_GPIO_PORT, LED_GPIO_PIN, 0x1);
 709  01a8 4b01          	push	#1
 710  01aa 4b40          	push	#64
 711  01ac ae5014        	ldw	x,#20500
 712  01af cd0000        	call	_GPIO_WriteBit
 714  01b2 85            	popw	x
 715                     ; 158 	M24LR04E_Init();
 717  01b3 cd0000        	call	_M24LR04E_Init
 719                     ; 159 	M24LR04E_WriteBuffer(M24LR16_EEPROM_ADDRESS_USER, NDEF_DAS, NUM_DIGITAL_VALUES, digital);
 721  01b6 ae0004        	ldw	x,#_digital
 722  01b9 89            	pushw	x
 723  01ba 4b04          	push	#4
 724  01bc ae0010        	ldw	x,#16
 725  01bf 89            	pushw	x
 726  01c0 a6a6          	ld	a,#166
 727  01c2 cd0000        	call	_M24LR04E_WriteBuffer
 729  01c5 5b05          	addw	sp,#5
 730                     ; 160 	M24LR04E_DeInit();
 732  01c7 cd0000        	call	_M24LR04E_DeInit
 734                     ; 162 	M24LR04E_Init();
 736  01ca cd0000        	call	_M24LR04E_Init
 738                     ; 163 	M24LR04E_WriteBuffer(M24LR16_EEPROM_ADDRESS_USER, NDEF_DAS + NUM_DIGITAL_VALUES, NUM_ANALOG_VALUES, analog);
 740  01cd ae0000        	ldw	x,#_analog
 741  01d0 89            	pushw	x
 742  01d1 4b04          	push	#4
 743  01d3 ae0014        	ldw	x,#20
 744  01d6 89            	pushw	x
 745  01d7 a6a6          	ld	a,#166
 746  01d9 cd0000        	call	_M24LR04E_WriteBuffer
 748  01dc 5b05          	addw	sp,#5
 749                     ; 164 	M24LR04E_DeInit();
 751  01de cd0000        	call	_M24LR04E_DeInit
 753                     ; 166 	GPIO_WriteBit(LED_GPIO_PORT, LED_GPIO_PIN, 0x0);
 755  01e1 4b00          	push	#0
 756  01e3 4b40          	push	#64
 757  01e5 ae5014        	ldw	x,#20500
 758  01e8 cd0000        	call	_GPIO_WriteBit
 760  01eb 85            	popw	x
 761                     ; 167 }                         
 764  01ec 81            	ret
 811                     ; 169 void writeEEPROMByte(const char address, char data)
 811                     ; 170 {
 812                     	switch	.text
 813  01ed               _writeEEPROMByte:
 815  01ed 89            	pushw	x
 816       00000000      OFST:	set	0
 819                     ; 171 	M24LR04E_Init();
 821  01ee cd0000        	call	_M24LR04E_Init
 823                     ; 172 	M24LR04E_WriteOneByte(M24LR16_EEPROM_ADDRESS_USER, address, data);
 825  01f1 7b02          	ld	a,(OFST+2,sp)
 826  01f3 88            	push	a
 827  01f4 7b02          	ld	a,(OFST+2,sp)
 828  01f6 5f            	clrw	x
 829  01f7 97            	ld	xl,a
 830  01f8 89            	pushw	x
 831  01f9 a6a6          	ld	a,#166
 832  01fb cd0000        	call	_M24LR04E_WriteOneByte
 834  01fe 5b03          	addw	sp,#3
 835                     ; 173 	M24LR04E_DeInit();
 837  0200 cd0000        	call	_M24LR04E_DeInit
 839                     ; 175 	delay_10us(100);
 841  0203 ae0064        	ldw	x,#100
 842  0206 cd0000        	call	_delay_10us
 844                     ; 176 }
 847  0209 85            	popw	x
 848  020a 81            	ret
 882                     ; 178 void main(void)
 882                     ; 179 { 
 883                     	switch	.text
 884  020b               _main:
 888                     ; 180 	deInitClock();
 890  020b cd0000        	call	_deInitClock
 892                     ; 181 	deInitGPIO();
 894  020e cd0089        	call	_deInitGPIO
 896                     ; 185 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
 898  0211 a601          	ld	a,#1
 899  0213 cd0000        	call	_CLK_SYSCLKSourceConfig
 901                     ; 186 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_16);        
 903  0216 a604          	ld	a,#4
 904  0218 cd0000        	call	_CLK_SYSCLKDivConfig
 906                     ; 195 	GPIO_Init(LED_GPIO_PORT, LED_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
 908  021b 4be0          	push	#224
 909  021d 4b40          	push	#64
 910  021f ae5014        	ldw	x,#20500
 911  0222 cd0000        	call	_GPIO_Init
 913  0225 85            	popw	x
 914                     ; 196 	GPIOE->ODR &= ~LED_GPIO_PIN;
 916  0226 721d5014      	bres	20500,#6
 917                     ; 198 	initDigitalControls();
 919  022a cd00fb        	call	_initDigitalControls
 921                     ; 199 	initAnalogControls();
 923  022d cd00f2        	call	_initAnalogControls
 925                     ; 200 	initNDEFMessage();
 927  0230 cd010f        	call	_initNDEFMessage
 929                     ; 202 	GPIO_Init(GPIOF, GPIO_Pin_0, GPIO_Mode_In_FL_IT);
 931  0233 4b20          	push	#32
 932  0235 4b01          	push	#1
 933  0237 ae5019        	ldw	x,#20505
 934  023a cd0000        	call	_GPIO_Init
 936  023d 85            	popw	x
 937                     ; 203 	EXTI_SetPinSensitivity(EXTI_Pin_0, EXTI_Trigger_Rising);
 939  023e ae0001        	ldw	x,#1
 940  0241 cd0000        	call	_EXTI_SetPinSensitivity
 942                     ; 205 	enableInterrupts();
 945  0244 9a            rim
 947  0245               L712:
 948                     ; 209 		wfi();
 951  0245 8f            wfi
 955  0246 20fd          	jra	L712
1045                     	xdef	_main
1046                     	switch	.ubsct
1047  0000               _analog:
1048  0000 00000000      	ds.b	4
1049                     	xdef	_analog
1050  0004               _digital:
1051  0004 00000000      	ds.b	4
1052                     	xdef	_digital
1053                     	xdef	_writeEEPROMByte
1054                     	xdef	_writeControlData
1055                     	xdef	_readControlData
1056                     	xdef	_initNDEFMessage
1057                     	xdef	_initDigitalControls
1058                     	xdef	_initAnalogControls
1059                     	xdef	_initCharArray
1060                     	xdef	_deInitGPIO
1061                     	xdef	_deInitClock
1062                     .eeprom:	section	.data
1063  0000               _EEMenuState:
1064  0000 00            	ds.b	1
1065                     	xdef	_EEMenuState
1066                     	switch	.ubsct
1067  0008               _NDEFmessage:
1068  0008 000000000000  	ds.b	64
1069                     	xdef	_NDEFmessage
1070  0048               _state_machine:
1071  0048 00            	ds.b	1
1072                     	xdef	_state_machine
1073                     	xref	_M24LR04E_WriteBuffer
1074                     	xref	_M24LR04E_WriteOneByte
1075                     	xref	_M24LR04E_Init
1076                     	xref	_M24LR04E_DeInit
1077                     	xref	_GPIO_ReadInputDataBit
1078                     	xref	_GPIO_WriteBit
1079                     	xref	_GPIO_Init
1080                     	xref	_EXTI_SetPinSensitivity
1081                     	xref	_CLK_PeripheralClockConfig
1082                     	xref	_CLK_SYSCLKDivConfig
1083                     	xref	_CLK_SYSCLKSourceConfig
1084                     	xref	_delay_10us
1104                     	end
