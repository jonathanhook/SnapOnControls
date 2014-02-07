   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.19 - 04 Sep 2013
   3                     ; Generator (Limited) V4.3.11 - 04 Sep 2013
  54                     ; 53 void deInitClock(void)
  54                     ; 54 {
  56                     	switch	.text
  57  0000               _deInitClock:
  61                     ; 55 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, DISABLE);
  63  0000 5f            	clrw	x
  64  0001 cd0000        	call	_CLK_PeripheralClockConfig
  66                     ; 56 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, DISABLE);
  68  0004 ae0100        	ldw	x,#256
  69  0007 cd0000        	call	_CLK_PeripheralClockConfig
  71                     ; 57 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);
  73  000a ae0200        	ldw	x,#512
  74  000d cd0000        	call	_CLK_PeripheralClockConfig
  76                     ; 58 	CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, DISABLE);
  78  0010 ae0300        	ldw	x,#768
  79  0013 cd0000        	call	_CLK_PeripheralClockConfig
  81                     ; 59 	CLK_PeripheralClockConfig(CLK_Peripheral_SPI1, DISABLE);
  83  0016 ae0400        	ldw	x,#1024
  84  0019 cd0000        	call	_CLK_PeripheralClockConfig
  86                     ; 60 	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, DISABLE);
  88  001c ae0500        	ldw	x,#1280
  89  001f cd0000        	call	_CLK_PeripheralClockConfig
  91                     ; 61 	CLK_PeripheralClockConfig(CLK_Peripheral_BEEP, DISABLE);
  93  0022 ae0600        	ldw	x,#1536
  94  0025 cd0000        	call	_CLK_PeripheralClockConfig
  96                     ; 62 	CLK_PeripheralClockConfig(CLK_Peripheral_DAC, DISABLE);
  98  0028 ae0700        	ldw	x,#1792
  99  002b cd0000        	call	_CLK_PeripheralClockConfig
 101                     ; 63 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 103  002e ae1000        	ldw	x,#4096
 104  0031 cd0000        	call	_CLK_PeripheralClockConfig
 106                     ; 64 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, DISABLE);
 108  0034 ae1100        	ldw	x,#4352
 109  0037 cd0000        	call	_CLK_PeripheralClockConfig
 111                     ; 65 	CLK_PeripheralClockConfig(CLK_Peripheral_RTC, DISABLE);
 113  003a ae1200        	ldw	x,#4608
 114  003d cd0000        	call	_CLK_PeripheralClockConfig
 116                     ; 66 	CLK_PeripheralClockConfig(CLK_Peripheral_LCD, DISABLE);
 118  0040 ae1300        	ldw	x,#4864
 119  0043 cd0000        	call	_CLK_PeripheralClockConfig
 121                     ; 67 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 123  0046 ae1000        	ldw	x,#4096
 124  0049 cd0000        	call	_CLK_PeripheralClockConfig
 126                     ; 68 	CLK_PeripheralClockConfig(CLK_Peripheral_DMA1, DISABLE);
 128  004c ae1400        	ldw	x,#5120
 129  004f cd0000        	call	_CLK_PeripheralClockConfig
 131                     ; 69 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 133  0052 ae1000        	ldw	x,#4096
 134  0055 cd0000        	call	_CLK_PeripheralClockConfig
 136                     ; 70 	CLK_PeripheralClockConfig(CLK_Peripheral_BOOTROM, DISABLE);
 138  0058 ae1700        	ldw	x,#5888
 139  005b cd0000        	call	_CLK_PeripheralClockConfig
 141                     ; 71 	CLK_PeripheralClockConfig(CLK_Peripheral_AES, DISABLE);
 143  005e ae2000        	ldw	x,#8192
 144  0061 cd0000        	call	_CLK_PeripheralClockConfig
 146                     ; 72 	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
 148  0064 ae1000        	ldw	x,#4096
 149  0067 cd0000        	call	_CLK_PeripheralClockConfig
 151                     ; 73 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM5, DISABLE);
 153  006a ae2100        	ldw	x,#8448
 154  006d cd0000        	call	_CLK_PeripheralClockConfig
 156                     ; 74 	CLK_PeripheralClockConfig(CLK_Peripheral_SPI2, DISABLE);
 158  0070 ae2200        	ldw	x,#8704
 159  0073 cd0000        	call	_CLK_PeripheralClockConfig
 161                     ; 75 	CLK_PeripheralClockConfig(CLK_Peripheral_USART2, DISABLE);
 163  0076 ae2300        	ldw	x,#8960
 164  0079 cd0000        	call	_CLK_PeripheralClockConfig
 166                     ; 76 	CLK_PeripheralClockConfig(CLK_Peripheral_USART3, DISABLE);
 168  007c ae2400        	ldw	x,#9216
 169  007f cd0000        	call	_CLK_PeripheralClockConfig
 171                     ; 77 	CLK_PeripheralClockConfig(CLK_Peripheral_CSSLSE, DISABLE);
 173  0082 ae2500        	ldw	x,#9472
 174  0085 cd0000        	call	_CLK_PeripheralClockConfig
 176                     ; 78 }
 179  0088 81            	ret
 203                     ; 80 void deInitGPIO (void)
 203                     ; 81 {
 204                     	switch	.text
 205  0089               _deInitGPIO:
 209                     ; 82 	GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_In_FL_No_IT);
 211  0089 4b00          	push	#0
 212  008b 4bff          	push	#255
 213  008d ae5000        	ldw	x,#20480
 214  0090 cd0000        	call	_GPIO_Init
 216  0093 85            	popw	x
 217                     ; 83 	GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_In_FL_No_IT);
 219  0094 4b00          	push	#0
 220  0096 4bff          	push	#255
 221  0098 ae5005        	ldw	x,#20485
 222  009b cd0000        	call	_GPIO_Init
 224  009e 85            	popw	x
 225                     ; 84 	GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_In_FL_No_IT);
 227  009f 4b00          	push	#0
 228  00a1 4bff          	push	#255
 229  00a3 ae500a        	ldw	x,#20490
 230  00a6 cd0000        	call	_GPIO_Init
 232  00a9 85            	popw	x
 233                     ; 85 	GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_In_FL_No_IT);
 235  00aa 4b00          	push	#0
 236  00ac 4bff          	push	#255
 237  00ae ae500f        	ldw	x,#20495
 238  00b1 cd0000        	call	_GPIO_Init
 240  00b4 85            	popw	x
 241                     ; 86 	GPIO_Init(GPIOE, GPIO_Pin_All, GPIO_Mode_In_FL_No_IT);
 243  00b5 4b00          	push	#0
 244  00b7 4bff          	push	#255
 245  00b9 ae5014        	ldw	x,#20500
 246  00bc cd0000        	call	_GPIO_Init
 248  00bf 85            	popw	x
 249                     ; 87 	GPIO_Init(GPIOF, GPIO_Pin_All, GPIO_Mode_In_FL_No_IT);
 251  00c0 4b00          	push	#0
 252  00c2 4bff          	push	#255
 253  00c4 ae5019        	ldw	x,#20505
 254  00c7 cd0000        	call	_GPIO_Init
 256  00ca 85            	popw	x
 257                     ; 96 }
 260  00cb 81            	ret
 313                     ; 98 char initCharArray(char *array, char length)
 313                     ; 99 {
 314                     	switch	.text
 315  00cc               _initCharArray:
 317  00cc 89            	pushw	x
 318  00cd 88            	push	a
 319       00000001      OFST:	set	1
 322                     ; 102 	for(i = 0; i < length; i++)
 324  00ce 0f01          	clr	(OFST+0,sp)
 326  00d0 200e          	jra	L76
 327  00d2               L36:
 328                     ; 104 		array[i] = 0x0;
 330  00d2 7b02          	ld	a,(OFST+1,sp)
 331  00d4 97            	ld	xl,a
 332  00d5 7b03          	ld	a,(OFST+2,sp)
 333  00d7 1b01          	add	a,(OFST+0,sp)
 334  00d9 2401          	jrnc	L21
 335  00db 5c            	incw	x
 336  00dc               L21:
 337  00dc 02            	rlwa	x,a
 338  00dd 7f            	clr	(x)
 339                     ; 102 	for(i = 0; i < length; i++)
 341  00de 0c01          	inc	(OFST+0,sp)
 342  00e0               L76:
 345  00e0 7b01          	ld	a,(OFST+0,sp)
 346  00e2 1106          	cp	a,(OFST+5,sp)
 347  00e4 25ec          	jrult	L36
 348                     ; 106 }
 351  00e6 5b03          	addw	sp,#3
 352  00e8 81            	ret
 377                     ; 108 char initAnalogControls(void)
 377                     ; 109 {
 378                     	switch	.text
 379  00e9               _initAnalogControls:
 383                     ; 110 	initCharArray(analog, NUM_ANALOG_VALUES);
 385  00e9 4b01          	push	#1
 386  00eb ae0000        	ldw	x,#_analog
 387  00ee addc          	call	_initCharArray
 389  00f0 84            	pop	a
 390                     ; 111 } 
 393  00f1 81            	ret
 420                     ; 113 char initDigitalControls(void)
 420                     ; 114 {
 421                     	switch	.text
 422  00f2               _initDigitalControls:
 426                     ; 115   initCharArray(digital, NUM_DIGITAL_VALUES);
 428  00f2 4b01          	push	#1
 429  00f4 ae0001        	ldw	x,#_digital
 430  00f7 add3          	call	_initCharArray
 432  00f9 84            	pop	a
 433                     ; 117 	GPIO_Init(GPIOC, GPIO_Pin_3, GPIO_Mode_In_FL_No_IT);
 435  00fa 4b00          	push	#0
 436  00fc 4b08          	push	#8
 437  00fe ae500a        	ldw	x,#20490
 438  0101 cd0000        	call	_GPIO_Init
 440  0104 85            	popw	x
 441                     ; 118 } 
 444  0105 81            	ret
 488                     ; 120 char initNDEFMessage(void)
 488                     ; 121 {
 489                     	switch	.text
 490  0106               _initNDEFMessage:
 492  0106 89            	pushw	x
 493       00000002      OFST:	set	2
 496                     ; 123 	char length = NUM_DIGITAL_VALUES + NUM_ANALOG_VALUES;
 498  0107 a602          	ld	a,#2
 499  0109 6b01          	ld	(OFST-1,sp),a
 500                     ; 125 	writeEEPROMByte(NDEF_CC0, 0xE1);
 502  010b ae00e1        	ldw	x,#225
 503  010e cd01af        	call	_writeEEPROMByte
 505                     ; 126 	writeEEPROMByte(NDEF_CC1, 0x40);
 507  0111 ae0140        	ldw	x,#320
 508  0114 cd01af        	call	_writeEEPROMByte
 510                     ; 127 	writeEEPROMByte(NDEF_CC2, 0xFF);
 512  0117 ae02ff        	ldw	x,#767
 513  011a cd01af        	call	_writeEEPROMByte
 515                     ; 128 	writeEEPROMByte(NDEF_CC3, 0x00);
 517  011d ae0300        	ldw	x,#768
 518  0120 cd01af        	call	_writeEEPROMByte
 520                     ; 129 	writeEEPROMByte(NDEF_TLV, 0x03);
 522  0123 ae0403        	ldw	x,#1027
 523  0126 cd01af        	call	_writeEEPROMByte
 525                     ; 130 	writeEEPROMByte(NDEF_LEN, length + HEADER_EXTRA_LEN);
 527  0129 7b01          	ld	a,(OFST-1,sp)
 528  012b ab04          	add	a,#4
 529  012d 97            	ld	xl,a
 530  012e a605          	ld	a,#5
 531  0130 95            	ld	xh,a
 532  0131 ad7c          	call	_writeEEPROMByte
 534                     ; 131 	writeEEPROMByte(NDEF_VRH, 0xD1);
 536  0133 ae06d1        	ldw	x,#1745
 537  0136 ad77          	call	_writeEEPROMByte
 539                     ; 132 	writeEEPROMByte(NDEF_VTL, 0x01);
 541  0138 ae0701        	ldw	x,#1793
 542  013b ad72          	call	_writeEEPROMByte
 544                     ; 133 	writeEEPROMByte(NDEF_VPL, length + PAYLOAD_EXTRA_LEN);
 546  013d 7b01          	ld	a,(OFST-1,sp)
 547  013f ab07          	add	a,#7
 548  0141 97            	ld	xl,a
 549  0142 a608          	ld	a,#8
 550  0144 95            	ld	xh,a
 551  0145 ad68          	call	_writeEEPROMByte
 553                     ; 134 	writeEEPROMByte(NDEF_VTT, 0x54);
 555  0147 ae0954        	ldw	x,#2388
 556  014a ad63          	call	_writeEEPROMByte
 558                     ; 135 	writeEEPROMByte(NDEF_VSB, 0x02);
 560  014c ae0a02        	ldw	x,#2562
 561  014f ad5e          	call	_writeEEPROMByte
 563                     ; 136 	writeEEPROMByte(NDEF_VL1, LAN_CODE[0]);
 565  0151 ae0b65        	ldw	x,#2917
 566  0154 ad59          	call	_writeEEPROMByte
 568                     ; 137 	writeEEPROMByte(NDEF_VL2, LAN_CODE[1]);
 570  0156 ae0c6e        	ldw	x,#3182
 571  0159 ad54          	call	_writeEEPROMByte
 573                     ; 138 	writeEEPROMByte(NDEF_PAD, 0x0);
 575  015b ae0d00        	ldw	x,#3328
 576  015e ad4f          	call	_writeEEPROMByte
 578                     ; 139 	writeEEPROMByte(NDEF_PAD + 1, 0x0);
 580  0160 ae0e00        	ldw	x,#3584
 581  0163 ad4a          	call	_writeEEPROMByte
 583                     ; 140 	writeEEPROMByte(NDEF_PAD + 2, 0x0);
 585  0165 ae0f00        	ldw	x,#3840
 586  0168 ad45          	call	_writeEEPROMByte
 588                     ; 141 	writeEEPROMByte(NDEF_DAS + length, 0xFE);
 590  016a ae00fe        	ldw	x,#254
 591  016d 7b01          	ld	a,(OFST-1,sp)
 592  016f ab10          	add	a,#16
 593  0171 95            	ld	xh,a
 594  0172 ad3b          	call	_writeEEPROMByte
 596                     ; 143 	for(i = 0; i < length; i++)
 598  0174 0f02          	clr	(OFST+0,sp)
 600  0176 200a          	jra	L141
 601  0178               L531:
 602                     ; 145 		writeEEPROMByte(NDEF_DAS + i, 0x0);
 604  0178 5f            	clrw	x
 605  0179 7b02          	ld	a,(OFST+0,sp)
 606  017b ab10          	add	a,#16
 607  017d 95            	ld	xh,a
 608  017e ad2f          	call	_writeEEPROMByte
 610                     ; 143 	for(i = 0; i < length; i++)
 612  0180 0c02          	inc	(OFST+0,sp)
 613  0182               L141:
 616  0182 7b02          	ld	a,(OFST+0,sp)
 617  0184 1101          	cp	a,(OFST-1,sp)
 618  0186 25f0          	jrult	L531
 619                     ; 147 }
 622  0188 85            	popw	x
 623  0189 81            	ret
 648                     ; 150 char readControlData(void)
 648                     ; 151 {
 649                     	switch	.text
 650  018a               _readControlData:
 654                     ; 153 	digital[0] = GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_3); 
 656  018a 4b08          	push	#8
 657  018c ae500a        	ldw	x,#20490
 658  018f cd0000        	call	_GPIO_ReadInputDataBit
 660  0192 5b01          	addw	sp,#1
 661  0194 b701          	ld	_digital,a
 662                     ; 154 }                                  
 665  0196 81            	ret
 692                     ; 156 void writeControlData(void)
 692                     ; 157 {
 693                     	switch	.text
 694  0197               _writeControlData:
 698                     ; 158 	M24LR04E_Init();
 700  0197 cd0000        	call	_M24LR04E_Init
 702                     ; 159 	M24LR04E_WriteBuffer(M24LR16_EEPROM_ADDRESS_USER, NDEF_DAS, NUM_DIGITAL_VALUES, digital);
 704  019a ae0001        	ldw	x,#_digital
 705  019d 89            	pushw	x
 706  019e 4b01          	push	#1
 707  01a0 ae0010        	ldw	x,#16
 708  01a3 89            	pushw	x
 709  01a4 a6a6          	ld	a,#166
 710  01a6 cd0000        	call	_M24LR04E_WriteBuffer
 712  01a9 5b05          	addw	sp,#5
 713                     ; 160 	M24LR04E_DeInit();
 715  01ab cd0000        	call	_M24LR04E_DeInit
 717                     ; 166 }                         
 720  01ae 81            	ret
 767                     ; 168 void writeEEPROMByte(const char address, char data)
 767                     ; 169 {
 768                     	switch	.text
 769  01af               _writeEEPROMByte:
 771  01af 89            	pushw	x
 772       00000000      OFST:	set	0
 775                     ; 170 	M24LR04E_Init();
 777  01b0 cd0000        	call	_M24LR04E_Init
 779                     ; 171 	M24LR04E_WriteOneByte(M24LR16_EEPROM_ADDRESS_USER, address, data);
 781  01b3 7b02          	ld	a,(OFST+2,sp)
 782  01b5 88            	push	a
 783  01b6 7b02          	ld	a,(OFST+2,sp)
 784  01b8 5f            	clrw	x
 785  01b9 97            	ld	xl,a
 786  01ba 89            	pushw	x
 787  01bb a6a6          	ld	a,#166
 788  01bd cd0000        	call	_M24LR04E_WriteOneByte
 790  01c0 5b03          	addw	sp,#3
 791                     ; 172 	M24LR04E_DeInit();
 793  01c2 cd0000        	call	_M24LR04E_DeInit
 795                     ; 174 	delay_10us(100);
 797  01c5 ae0064        	ldw	x,#100
 798  01c8 cd0000        	call	_delay_10us
 800                     ; 175 }
 803  01cb 85            	popw	x
 804  01cc 81            	ret
 840                     ; 177 void main(void)
 840                     ; 178 {
 841                     	switch	.text
 842  01cd               _main:
 846                     ; 179 	deInitClock();
 848  01cd cd0000        	call	_deInitClock
 850                     ; 180 	deInitGPIO();
 852  01d0 cd0089        	call	_deInitGPIO
 854                     ; 187 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
 856  01d3 4f            	clr	a
 857  01d4 cd0000        	call	_CLK_SYSCLKDivConfig
 859                     ; 188 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_LSI);
 861  01d7 a602          	ld	a,#2
 862  01d9 cd0000        	call	_CLK_SYSCLKSourceConfig
 864                     ; 189 	CLK_SYSCLKSourceSwitchCmd(ENABLE);
 866  01dc a601          	ld	a,#1
 867  01de cd0000        	call	_CLK_SYSCLKSourceSwitchCmd
 870  01e1               L122:
 871                     ; 190 	while (((CLK->SWCR)& 0x01)==0x01);
 873  01e1 c650c9        	ld	a,20681
 874  01e4 a401          	and	a,#1
 875  01e6 a101          	cp	a,#1
 876  01e8 27f7          	jreq	L122
 877                     ; 191 	CLK_HSICmd(DISABLE);	
 879  01ea 4f            	clr	a
 880  01eb cd0000        	call	_CLK_HSICmd
 882                     ; 194 	initDigitalControls();
 884  01ee cd00f2        	call	_initDigitalControls
 886                     ; 195 	initAnalogControls();
 888  01f1 cd00e9        	call	_initAnalogControls
 890                     ; 196 	initNDEFMessage();
 892  01f4 cd0106        	call	_initNDEFMessage
 894                     ; 198 	GPIO_Init(GPIOF, GPIO_Pin_0, GPIO_Mode_In_FL_IT);
 896  01f7 4b20          	push	#32
 897  01f9 4b01          	push	#1
 898  01fb ae5019        	ldw	x,#20505
 899  01fe cd0000        	call	_GPIO_Init
 901  0201 85            	popw	x
 902                     ; 199 	EXTI_SetPinSensitivity(EXTI_Pin_0, EXTI_Trigger_Rising);
 904  0202 ae0001        	ldw	x,#1
 905  0205 cd0000        	call	_EXTI_SetPinSensitivity
 907                     ; 201 	enableInterrupts();
 910  0208 9a            rim
 912  0209               L522:
 913                     ; 205 		wfi();
 916  0209 8f            wfi
 920  020a 20fd          	jra	L522
 992                     	xdef	_main
 993                     	switch	.ubsct
 994  0000               _analog:
 995  0000 00            	ds.b	1
 996                     	xdef	_analog
 997  0001               _digital:
 998  0001 00            	ds.b	1
 999                     	xdef	_digital
1000                     	xdef	_writeEEPROMByte
1001                     	xdef	_writeControlData
1002                     	xdef	_readControlData
1003                     	xdef	_initNDEFMessage
1004                     	xdef	_initDigitalControls
1005                     	xdef	_initAnalogControls
1006                     	xdef	_initCharArray
1007                     	xdef	_deInitGPIO
1008                     	xdef	_deInitClock
1009  0002               _NDEFmessage:
1010  0002 000000000000  	ds.b	64
1011                     	xdef	_NDEFmessage
1012                     	xref	_M24LR04E_WriteBuffer
1013                     	xref	_M24LR04E_WriteOneByte
1014                     	xref	_M24LR04E_Init
1015                     	xref	_M24LR04E_DeInit
1016                     	xref	_GPIO_ReadInputDataBit
1017                     	xref	_GPIO_Init
1018                     	xref	_EXTI_SetPinSensitivity
1019                     	xref	_CLK_PeripheralClockConfig
1020                     	xref	_CLK_SYSCLKSourceSwitchCmd
1021                     	xref	_CLK_SYSCLKDivConfig
1022                     	xref	_CLK_SYSCLKSourceConfig
1023                     	xref	_CLK_HSICmd
1024                     	xref	_delay_10us
1044                     	end
