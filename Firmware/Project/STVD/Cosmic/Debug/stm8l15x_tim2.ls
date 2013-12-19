   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.19 - 04 Sep 2013
   3                     ; Generator (Limited) V4.3.11 - 04 Sep 2013
  45                     ; 51 void TIM2_DeInit(void)
  45                     ; 52 {
  47                     	switch	.text
  48  0000               _TIM2_DeInit:
  52                     ; 53   TIM2->CR1 = TIM_CR1_RESET_VALUE;
  54  0000 725f5250      	clr	21072
  55                     ; 54   TIM2->CR2 = TIM_CR2_RESET_VALUE;
  57  0004 725f5251      	clr	21073
  58                     ; 55   TIM2->SMCR = TIM_SMCR_RESET_VALUE;
  60  0008 725f5252      	clr	21074
  61                     ; 56   TIM2->ETR = TIM_ETR_RESET_VALUE;
  63  000c 725f5253      	clr	21075
  64                     ; 57   TIM2->IER = TIM_IER_RESET_VALUE;
  66  0010 725f5255      	clr	21077
  67                     ; 58   TIM2->SR2 = TIM_SR2_RESET_VALUE;
  69  0014 725f5257      	clr	21079
  70                     ; 61   TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
  72  0018 725f525b      	clr	21083
  73                     ; 63   TIM2->CCMR1 = 0x01;/*TIM2_ICxSource_TIxFPx */
  75  001c 35015259      	mov	21081,#1
  76                     ; 64   TIM2->CCMR2 = 0x01;/*TIM2_ICxSource_TIxFPx */
  78  0020 3501525a      	mov	21082,#1
  79                     ; 67   TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
  81  0024 725f525b      	clr	21083
  82                     ; 68   TIM2->CCMR1 = TIM_CCMR1_RESET_VALUE;
  84  0028 725f5259      	clr	21081
  85                     ; 69   TIM2->CCMR2 = TIM_CCMR2_RESET_VALUE;
  87  002c 725f525a      	clr	21082
  88                     ; 71   TIM2->CNTRH = TIM_CNTRH_RESET_VALUE;
  90  0030 725f525c      	clr	21084
  91                     ; 72   TIM2->CNTRL = TIM_CNTRL_RESET_VALUE;
  93  0034 725f525d      	clr	21085
  94                     ; 74   TIM2->PSCR = TIM_PSCR_RESET_VALUE;
  96  0038 725f525e      	clr	21086
  97                     ; 76   TIM2->ARRH = TIM_ARRH_RESET_VALUE;
  99  003c 35ff525f      	mov	21087,#255
 100                     ; 77   TIM2->ARRL = TIM_ARRL_RESET_VALUE;
 102  0040 35ff5260      	mov	21088,#255
 103                     ; 79   TIM2->CCR1H = TIM_CCR1H_RESET_VALUE;
 105  0044 725f5261      	clr	21089
 106                     ; 80   TIM2->CCR1L = TIM_CCR1L_RESET_VALUE;
 108  0048 725f5262      	clr	21090
 109                     ; 81   TIM2->CCR2H = TIM_CCR2H_RESET_VALUE;
 111  004c 725f5263      	clr	21091
 112                     ; 82   TIM2->CCR2L = TIM_CCR2L_RESET_VALUE;
 114  0050 725f5264      	clr	21092
 115                     ; 85   TIM2->OISR = TIM_OISR_RESET_VALUE;
 117  0054 725f5266      	clr	21094
 118                     ; 86   TIM2->EGR = 0x01;/* TIM_EGR_UG */
 120  0058 35015258      	mov	21080,#1
 121                     ; 87   TIM2->BKR = TIM_BKR_RESET_VALUE;
 123  005c 725f5265      	clr	21093
 124                     ; 88   TIM2->SR1 = TIM_SR1_RESET_VALUE;
 126  0060 725f5256      	clr	21078
 127                     ; 89 }
 130  0064 81            	ret
 292                     ; 99 void TIM2_TimeBaseInit(TIM2_Prescaler_TypeDef TIM2_Prescaler,
 292                     ; 100                        TIM2_CounterMode_TypeDef TIM2_CounterMode,
 292                     ; 101                        uint16_t TIM2_Period)
 292                     ; 102 {
 293                     	switch	.text
 294  0065               _TIM2_TimeBaseInit:
 296  0065 89            	pushw	x
 297       00000000      OFST:	set	0
 300                     ; 104   assert_param(IS_TIM2_PRESCALER(TIM2_Prescaler));
 302                     ; 105   assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
 304                     ; 110   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8) ;
 306  0066 7b05          	ld	a,(OFST+5,sp)
 307  0068 c7525f        	ld	21087,a
 308                     ; 111   TIM2->ARRL = (uint8_t)(TIM2_Period);
 310  006b 7b06          	ld	a,(OFST+6,sp)
 311  006d c75260        	ld	21088,a
 312                     ; 114   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 314  0070 9e            	ld	a,xh
 315  0071 c7525e        	ld	21086,a
 316                     ; 117   TIM2->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 318  0074 c65250        	ld	a,21072
 319  0077 a48f          	and	a,#143
 320  0079 c75250        	ld	21072,a
 321                     ; 118   TIM2->CR1 |= (uint8_t)(TIM2_CounterMode);
 323  007c 9f            	ld	a,xl
 324  007d ca5250        	or	a,21072
 325  0080 c75250        	ld	21072,a
 326                     ; 121   TIM2->EGR = TIM2_EventSource_Update;
 328  0083 35015258      	mov	21080,#1
 329                     ; 122 }
 332  0087 85            	popw	x
 333  0088 81            	ret
 531                     ; 133 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 531                     ; 134                   TIM2_OutputState_TypeDef TIM2_OutputState,
 531                     ; 135                   uint16_t TIM2_Pulse,
 531                     ; 136                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
 531                     ; 137                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
 531                     ; 138 {
 532                     	switch	.text
 533  0089               _TIM2_OC1Init:
 535  0089 89            	pushw	x
 536  008a 88            	push	a
 537       00000001      OFST:	set	1
 540                     ; 139   uint8_t tmpccmr1 = 0;
 542                     ; 142   assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
 544                     ; 143   assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
 546                     ; 144   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
 548                     ; 145   assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
 550                     ; 147   tmpccmr1 = TIM2->CCMR1;
 552  008b c65259        	ld	a,21081
 553  008e 6b01          	ld	(OFST+0,sp),a
 554                     ; 150   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 556  0090 7211525b      	bres	21083,#0
 557                     ; 152   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
 559  0094 7b01          	ld	a,(OFST+0,sp)
 560  0096 a48f          	and	a,#143
 561  0098 6b01          	ld	(OFST+0,sp),a
 562                     ; 155   tmpccmr1 |= (uint8_t)TIM2_OCMode;
 564  009a 9e            	ld	a,xh
 565  009b 1a01          	or	a,(OFST+0,sp)
 566  009d 6b01          	ld	(OFST+0,sp),a
 567                     ; 157   TIM2->CCMR1 = tmpccmr1;
 569  009f 7b01          	ld	a,(OFST+0,sp)
 570  00a1 c75259        	ld	21081,a
 571                     ; 160   if (TIM2_OutputState == TIM2_OutputState_Enable)
 573  00a4 9f            	ld	a,xl
 574  00a5 a101          	cp	a,#1
 575  00a7 2606          	jrne	L722
 576                     ; 162     TIM2->CCER1 |= TIM_CCER1_CC1E;
 578  00a9 7210525b      	bset	21083,#0
 580  00ad 2004          	jra	L132
 581  00af               L722:
 582                     ; 166     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 584  00af 7211525b      	bres	21083,#0
 585  00b3               L132:
 586                     ; 170   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
 588  00b3 7b08          	ld	a,(OFST+7,sp)
 589  00b5 a101          	cp	a,#1
 590  00b7 2606          	jrne	L332
 591                     ; 172     TIM2->CCER1 |= TIM_CCER1_CC1P;
 593  00b9 7212525b      	bset	21083,#1
 595  00bd 2004          	jra	L532
 596  00bf               L332:
 597                     ; 176     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
 599  00bf 7213525b      	bres	21083,#1
 600  00c3               L532:
 601                     ; 180   if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
 603  00c3 7b09          	ld	a,(OFST+8,sp)
 604  00c5 a101          	cp	a,#1
 605  00c7 2606          	jrne	L732
 606                     ; 182     TIM2->OISR |= TIM_OISR_OIS1;
 608  00c9 72105266      	bset	21094,#0
 610  00cd 2004          	jra	L142
 611  00cf               L732:
 612                     ; 186     TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS1);
 614  00cf 72115266      	bres	21094,#0
 615  00d3               L142:
 616                     ; 190   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 618  00d3 7b06          	ld	a,(OFST+5,sp)
 619  00d5 c75261        	ld	21089,a
 620                     ; 191   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 622  00d8 7b07          	ld	a,(OFST+6,sp)
 623  00da c75262        	ld	21090,a
 624                     ; 192 }
 627  00dd 5b03          	addw	sp,#3
 628  00df 81            	ret
 711                     ; 203 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 711                     ; 204                   TIM2_OutputState_TypeDef TIM2_OutputState,
 711                     ; 205                   uint16_t TIM2_Pulse,
 711                     ; 206                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
 711                     ; 207                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
 711                     ; 208 {
 712                     	switch	.text
 713  00e0               _TIM2_OC2Init:
 715  00e0 89            	pushw	x
 716  00e1 88            	push	a
 717       00000001      OFST:	set	1
 720                     ; 209   uint8_t tmpccmr2 = 0;
 722                     ; 212   assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
 724                     ; 213   assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
 726                     ; 214   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
 728                     ; 215   assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
 730                     ; 217   tmpccmr2 = TIM2->CCMR2;
 732  00e2 c6525a        	ld	a,21082
 733  00e5 6b01          	ld	(OFST+0,sp),a
 734                     ; 220   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 736  00e7 7219525b      	bres	21083,#4
 737                     ; 223   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
 739  00eb 7b01          	ld	a,(OFST+0,sp)
 740  00ed a48f          	and	a,#143
 741  00ef 6b01          	ld	(OFST+0,sp),a
 742                     ; 226   tmpccmr2 |= (uint8_t)TIM2_OCMode;
 744  00f1 9e            	ld	a,xh
 745  00f2 1a01          	or	a,(OFST+0,sp)
 746  00f4 6b01          	ld	(OFST+0,sp),a
 747                     ; 228   TIM2->CCMR2 = tmpccmr2;
 749  00f6 7b01          	ld	a,(OFST+0,sp)
 750  00f8 c7525a        	ld	21082,a
 751                     ; 231   if (TIM2_OutputState == TIM2_OutputState_Enable)
 753  00fb 9f            	ld	a,xl
 754  00fc a101          	cp	a,#1
 755  00fe 2606          	jrne	L503
 756                     ; 233     TIM2->CCER1 |= TIM_CCER1_CC2E;
 758  0100 7218525b      	bset	21083,#4
 760  0104 2004          	jra	L703
 761  0106               L503:
 762                     ; 237     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 764  0106 7219525b      	bres	21083,#4
 765  010a               L703:
 766                     ; 241   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
 768  010a 7b08          	ld	a,(OFST+7,sp)
 769  010c a101          	cp	a,#1
 770  010e 2606          	jrne	L113
 771                     ; 243     TIM2->CCER1 |= TIM_CCER1_CC2P;
 773  0110 721a525b      	bset	21083,#5
 775  0114 2004          	jra	L313
 776  0116               L113:
 777                     ; 247     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
 779  0116 721b525b      	bres	21083,#5
 780  011a               L313:
 781                     ; 252   if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
 783  011a 7b09          	ld	a,(OFST+8,sp)
 784  011c a101          	cp	a,#1
 785  011e 2606          	jrne	L513
 786                     ; 254     TIM2->OISR |= TIM_OISR_OIS2;
 788  0120 72145266      	bset	21094,#2
 790  0124 2004          	jra	L713
 791  0126               L513:
 792                     ; 258     TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS2);
 794  0126 72155266      	bres	21094,#2
 795  012a               L713:
 796                     ; 262   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 798  012a 7b06          	ld	a,(OFST+5,sp)
 799  012c c75263        	ld	21091,a
 800                     ; 263   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 802  012f 7b07          	ld	a,(OFST+6,sp)
 803  0131 c75264        	ld	21092,a
 804                     ; 264 }
 807  0134 5b03          	addw	sp,#3
 808  0136 81            	ret
1006                     ; 281 void TIM2_BKRConfig(TIM2_OSSIState_TypeDef TIM2_OSSIState,
1006                     ; 282                     TIM2_LockLevel_TypeDef TIM2_LockLevel,
1006                     ; 283                     TIM2_BreakState_TypeDef TIM2_BreakState,
1006                     ; 284                     TIM2_BreakPolarity_TypeDef TIM2_BreakPolarity,
1006                     ; 285                     TIM2_AutomaticOutput_TypeDef TIM2_AutomaticOutput)
1006                     ; 286 
1006                     ; 287 {
1007                     	switch	.text
1008  0137               _TIM2_BKRConfig:
1010  0137 89            	pushw	x
1011  0138 88            	push	a
1012       00000001      OFST:	set	1
1015                     ; 289   assert_param(IS_TIM2_OSSI_STATE(TIM2_OSSIState));
1017                     ; 290   assert_param(IS_TIM2_LOCK_LEVEL(TIM2_LockLevel));
1019                     ; 291   assert_param(IS_TIM2_BREAK_STATE(TIM2_BreakState));
1021                     ; 292   assert_param(IS_TIM2_BREAK_POLARITY(TIM2_BreakPolarity));
1023                     ; 293   assert_param(IS_TIM2_AUTOMATIC_OUTPUT_STATE(TIM2_AutomaticOutput));
1025                     ; 300   TIM2->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM2_OSSIState | (uint8_t)TIM2_LockLevel) | \
1025                     ; 301                                   (uint8_t)((uint8_t)TIM2_BreakState | TIM2_BreakPolarity)) | \
1025                     ; 302                         (uint8_t)TIM2_AutomaticOutput);
1027  0139 7b06          	ld	a,(OFST+5,sp)
1028  013b 1a07          	or	a,(OFST+6,sp)
1029  013d 6b01          	ld	(OFST+0,sp),a
1030  013f 9f            	ld	a,xl
1031  0140 1a02          	or	a,(OFST+1,sp)
1032  0142 1a01          	or	a,(OFST+0,sp)
1033  0144 1a08          	or	a,(OFST+7,sp)
1034  0146 c75265        	ld	21093,a
1035                     ; 303 }
1038  0149 5b03          	addw	sp,#3
1039  014b 81            	ret
1223                     ; 314 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
1223                     ; 315                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1223                     ; 316                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
1223                     ; 317                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1223                     ; 318                  uint8_t TIM2_ICFilter)
1223                     ; 319 {
1224                     	switch	.text
1225  014c               _TIM2_ICInit:
1227  014c 89            	pushw	x
1228       00000000      OFST:	set	0
1231                     ; 321   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
1233                     ; 323   if (TIM2_Channel == TIM2_Channel_1)
1235  014d 9e            	ld	a,xh
1236  014e 4d            	tnz	a
1237  014f 2614          	jrne	L735
1238                     ; 326     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection, TIM2_ICFilter);
1240  0151 7b07          	ld	a,(OFST+7,sp)
1241  0153 88            	push	a
1242  0154 7b06          	ld	a,(OFST+6,sp)
1243  0156 97            	ld	xl,a
1244  0157 7b03          	ld	a,(OFST+3,sp)
1245  0159 95            	ld	xh,a
1246  015a cd060f        	call	L3_TI1_Config
1248  015d 84            	pop	a
1249                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1251  015e 7b06          	ld	a,(OFST+6,sp)
1252  0160 cd04ff        	call	_TIM2_SetIC1Prescaler
1255  0163 2012          	jra	L145
1256  0165               L735:
1257                     ; 334     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection, TIM2_ICFilter);
1259  0165 7b07          	ld	a,(OFST+7,sp)
1260  0167 88            	push	a
1261  0168 7b06          	ld	a,(OFST+6,sp)
1262  016a 97            	ld	xl,a
1263  016b 7b03          	ld	a,(OFST+3,sp)
1264  016d 95            	ld	xh,a
1265  016e cd064c        	call	L5_TI2_Config
1267  0171 84            	pop	a
1268                     ; 337     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1270  0172 7b06          	ld	a,(OFST+6,sp)
1271  0174 cd0519        	call	_TIM2_SetIC2Prescaler
1273  0177               L145:
1274                     ; 339 }
1277  0177 85            	popw	x
1278  0178 81            	ret
1374                     ; 351 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1374                     ; 352                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1374                     ; 353                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1374                     ; 354                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1374                     ; 355                      uint8_t TIM2_ICFilter)
1374                     ; 356 {
1375                     	switch	.text
1376  0179               _TIM2_PWMIConfig:
1378  0179 89            	pushw	x
1379  017a 89            	pushw	x
1380       00000002      OFST:	set	2
1383                     ; 357   uint8_t icpolarity = TIM2_ICPolarity_Rising;
1385                     ; 358   uint8_t icselection = TIM2_ICSelection_DirectTI;
1387                     ; 361   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
1389                     ; 364   if (TIM2_ICPolarity == TIM2_ICPolarity_Rising)
1391  017b 9f            	ld	a,xl
1392  017c 4d            	tnz	a
1393  017d 2606          	jrne	L116
1394                     ; 366     icpolarity = TIM2_ICPolarity_Falling;
1396  017f a601          	ld	a,#1
1397  0181 6b01          	ld	(OFST-1,sp),a
1399  0183 2002          	jra	L316
1400  0185               L116:
1401                     ; 370     icpolarity = TIM2_ICPolarity_Rising;
1403  0185 0f01          	clr	(OFST-1,sp)
1404  0187               L316:
1405                     ; 374   if (TIM2_ICSelection == TIM2_ICSelection_DirectTI)
1407  0187 7b07          	ld	a,(OFST+5,sp)
1408  0189 a101          	cp	a,#1
1409  018b 2606          	jrne	L516
1410                     ; 376     icselection = TIM2_ICSelection_IndirectTI;
1412  018d a602          	ld	a,#2
1413  018f 6b02          	ld	(OFST+0,sp),a
1415  0191 2004          	jra	L716
1416  0193               L516:
1417                     ; 380     icselection = TIM2_ICSelection_DirectTI;
1419  0193 a601          	ld	a,#1
1420  0195 6b02          	ld	(OFST+0,sp),a
1421  0197               L716:
1422                     ; 383   if (TIM2_Channel == TIM2_Channel_1)
1424  0197 0d03          	tnz	(OFST+1,sp)
1425  0199 2626          	jrne	L126
1426                     ; 386     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection,
1426                     ; 387                TIM2_ICFilter);
1428  019b 7b09          	ld	a,(OFST+7,sp)
1429  019d 88            	push	a
1430  019e 7b08          	ld	a,(OFST+6,sp)
1431  01a0 97            	ld	xl,a
1432  01a1 7b05          	ld	a,(OFST+3,sp)
1433  01a3 95            	ld	xh,a
1434  01a4 cd060f        	call	L3_TI1_Config
1436  01a7 84            	pop	a
1437                     ; 390     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1439  01a8 7b08          	ld	a,(OFST+6,sp)
1440  01aa cd04ff        	call	_TIM2_SetIC1Prescaler
1442                     ; 393     TI2_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
1444  01ad 7b09          	ld	a,(OFST+7,sp)
1445  01af 88            	push	a
1446  01b0 7b03          	ld	a,(OFST+1,sp)
1447  01b2 97            	ld	xl,a
1448  01b3 7b02          	ld	a,(OFST+0,sp)
1449  01b5 95            	ld	xh,a
1450  01b6 cd064c        	call	L5_TI2_Config
1452  01b9 84            	pop	a
1453                     ; 396     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1455  01ba 7b08          	ld	a,(OFST+6,sp)
1456  01bc cd0519        	call	_TIM2_SetIC2Prescaler
1459  01bf 2024          	jra	L326
1460  01c1               L126:
1461                     ; 401     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection,
1461                     ; 402                TIM2_ICFilter);
1463  01c1 7b09          	ld	a,(OFST+7,sp)
1464  01c3 88            	push	a
1465  01c4 7b08          	ld	a,(OFST+6,sp)
1466  01c6 97            	ld	xl,a
1467  01c7 7b05          	ld	a,(OFST+3,sp)
1468  01c9 95            	ld	xh,a
1469  01ca cd064c        	call	L5_TI2_Config
1471  01cd 84            	pop	a
1472                     ; 405     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1474  01ce 7b08          	ld	a,(OFST+6,sp)
1475  01d0 cd0519        	call	_TIM2_SetIC2Prescaler
1477                     ; 408     TI1_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
1479  01d3 7b09          	ld	a,(OFST+7,sp)
1480  01d5 88            	push	a
1481  01d6 7b03          	ld	a,(OFST+1,sp)
1482  01d8 97            	ld	xl,a
1483  01d9 7b02          	ld	a,(OFST+0,sp)
1484  01db 95            	ld	xh,a
1485  01dc cd060f        	call	L3_TI1_Config
1487  01df 84            	pop	a
1488                     ; 411     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1490  01e0 7b08          	ld	a,(OFST+6,sp)
1491  01e2 cd04ff        	call	_TIM2_SetIC1Prescaler
1493  01e5               L326:
1494                     ; 413 }
1497  01e5 5b04          	addw	sp,#4
1498  01e7 81            	ret
1553                     ; 421 void TIM2_Cmd(FunctionalState NewState)
1553                     ; 422 {
1554                     	switch	.text
1555  01e8               _TIM2_Cmd:
1559                     ; 424   assert_param(IS_FUNCTIONAL_STATE(NewState));
1561                     ; 427   if (NewState != DISABLE)
1563  01e8 4d            	tnz	a
1564  01e9 2706          	jreq	L356
1565                     ; 429     TIM2->CR1 |= TIM_CR1_CEN;
1567  01eb 72105250      	bset	21072,#0
1569  01ef 2004          	jra	L556
1570  01f1               L356:
1571                     ; 433     TIM2->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1573  01f1 72115250      	bres	21072,#0
1574  01f5               L556:
1575                     ; 435 }
1578  01f5 81            	ret
1614                     ; 443 void TIM2_CtrlPWMOutputs(FunctionalState NewState)
1614                     ; 444 {
1615                     	switch	.text
1616  01f6               _TIM2_CtrlPWMOutputs:
1620                     ; 446   assert_param(IS_FUNCTIONAL_STATE(NewState));
1622                     ; 450   if (NewState != DISABLE)
1624  01f6 4d            	tnz	a
1625  01f7 2706          	jreq	L576
1626                     ; 452     TIM2->BKR |= TIM_BKR_MOE ;
1628  01f9 721e5265      	bset	21093,#7
1630  01fd 2004          	jra	L776
1631  01ff               L576:
1632                     ; 456     TIM2->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1634  01ff 721f5265      	bres	21093,#7
1635  0203               L776:
1636                     ; 458 }
1639  0203 81            	ret
1725                     ; 468 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1725                     ; 469 {
1726                     	switch	.text
1727  0204               _TIM2_ITConfig:
1729  0204 89            	pushw	x
1730       00000000      OFST:	set	0
1733                     ; 471   assert_param(IS_TIM2_IT(TIM2_IT));
1735                     ; 472   assert_param(IS_FUNCTIONAL_STATE(NewState));
1737                     ; 474   if (NewState != DISABLE)
1739  0205 9f            	ld	a,xl
1740  0206 4d            	tnz	a
1741  0207 2709          	jreq	L147
1742                     ; 477     TIM2->IER |= (uint8_t)TIM2_IT;
1744  0209 9e            	ld	a,xh
1745  020a ca5255        	or	a,21077
1746  020d c75255        	ld	21077,a
1748  0210 2009          	jra	L347
1749  0212               L147:
1750                     ; 482     TIM2->IER &= (uint8_t)(~(uint8_t)TIM2_IT);
1752  0212 7b01          	ld	a,(OFST+1,sp)
1753  0214 43            	cpl	a
1754  0215 c45255        	and	a,21077
1755  0218 c75255        	ld	21077,a
1756  021b               L347:
1757                     ; 484 }
1760  021b 85            	popw	x
1761  021c 81            	ret
1834                     ; 494 void TIM2_DMACmd( TIM2_DMASource_TypeDef TIM2_DMASource, FunctionalState NewState)
1834                     ; 495 {
1835                     	switch	.text
1836  021d               _TIM2_DMACmd:
1838  021d 89            	pushw	x
1839       00000000      OFST:	set	0
1842                     ; 497   assert_param(IS_FUNCTIONAL_STATE(NewState));
1844                     ; 498   assert_param(IS_TIM2_DMA_SOURCE(TIM2_DMASource));
1846                     ; 500   if (NewState != DISABLE)
1848  021e 9f            	ld	a,xl
1849  021f 4d            	tnz	a
1850  0220 2709          	jreq	L1001
1851                     ; 503     TIM2->DER |= (uint8_t)TIM2_DMASource;
1853  0222 9e            	ld	a,xh
1854  0223 ca5254        	or	a,21076
1855  0226 c75254        	ld	21076,a
1857  0229 2009          	jra	L3001
1858  022b               L1001:
1859                     ; 508     TIM2->DER &= (uint8_t)(~TIM2_DMASource);
1861  022b 7b01          	ld	a,(OFST+1,sp)
1862  022d 43            	cpl	a
1863  022e c45254        	and	a,21076
1864  0231 c75254        	ld	21076,a
1865  0234               L3001:
1866                     ; 510 }
1869  0234 85            	popw	x
1870  0235 81            	ret
1894                     ; 518 void TIM2_InternalClockConfig(void)
1894                     ; 519 {
1895                     	switch	.text
1896  0236               _TIM2_InternalClockConfig:
1900                     ; 521   TIM2->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
1902  0236 c65252        	ld	a,21074
1903  0239 a4f8          	and	a,#248
1904  023b c75252        	ld	21074,a
1905                     ; 522 }
1908  023e 81            	ret
2025                     ; 534 void TIM2_ETRClockMode1Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
2025                     ; 535                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
2025                     ; 536                               uint8_t ExtTRGFilter)
2025                     ; 537 {
2026                     	switch	.text
2027  023f               _TIM2_ETRClockMode1Config:
2029  023f 89            	pushw	x
2030       00000000      OFST:	set	0
2033                     ; 539   TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, ExtTRGFilter);
2035  0240 7b05          	ld	a,(OFST+5,sp)
2036  0242 88            	push	a
2037  0243 9f            	ld	a,xl
2038  0244 97            	ld	xl,a
2039  0245 7b02          	ld	a,(OFST+2,sp)
2040  0247 95            	ld	xh,a
2041  0248 ad35          	call	_TIM2_ETRConfig
2043  024a 84            	pop	a
2044                     ; 542   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
2046  024b c65252        	ld	a,21074
2047  024e a4f8          	and	a,#248
2048  0250 c75252        	ld	21074,a
2049                     ; 543   TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
2051  0253 c65252        	ld	a,21074
2052  0256 aa07          	or	a,#7
2053  0258 c75252        	ld	21074,a
2054                     ; 546   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_TS);
2056  025b c65252        	ld	a,21074
2057  025e a48f          	and	a,#143
2058  0260 c75252        	ld	21074,a
2059                     ; 547   TIM2->SMCR |= (uint8_t)((TIM2_TRGSelection_TypeDef)TIM2_TRGSelection_ETRF);
2061  0263 c65252        	ld	a,21074
2062  0266 aa70          	or	a,#112
2063  0268 c75252        	ld	21074,a
2064                     ; 548 }
2067  026b 85            	popw	x
2068  026c 81            	ret
2126                     ; 560 void TIM2_ETRClockMode2Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
2126                     ; 561                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
2126                     ; 562                               uint8_t ExtTRGFilter)
2126                     ; 563 {
2127                     	switch	.text
2128  026d               _TIM2_ETRClockMode2Config:
2130  026d 89            	pushw	x
2131       00000000      OFST:	set	0
2134                     ; 565   TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, ExtTRGFilter);
2136  026e 7b05          	ld	a,(OFST+5,sp)
2137  0270 88            	push	a
2138  0271 9f            	ld	a,xl
2139  0272 97            	ld	xl,a
2140  0273 7b02          	ld	a,(OFST+2,sp)
2141  0275 95            	ld	xh,a
2142  0276 ad07          	call	_TIM2_ETRConfig
2144  0278 84            	pop	a
2145                     ; 568   TIM2->ETR |= TIM_ETR_ECE ;
2147  0279 721c5253      	bset	21075,#6
2148                     ; 569 }
2151  027d 85            	popw	x
2152  027e 81            	ret
2208                     ; 581 void TIM2_ETRConfig(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
2208                     ; 582                     TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
2208                     ; 583                     uint8_t ExtTRGFilter)
2208                     ; 584 {
2209                     	switch	.text
2210  027f               _TIM2_ETRConfig:
2212  027f 89            	pushw	x
2213       00000000      OFST:	set	0
2216                     ; 586   assert_param(IS_TIM2_EXT_PRESCALER(TIM2_ExtTRGPrescaler));
2218                     ; 587   assert_param(IS_TIM2_EXT_POLARITY(TIM2_ExtTRGPolarity));
2220                     ; 588   assert_param(IS_TIM2_EXT_FILTER(ExtTRGFilter));
2222                     ; 590   TIM2->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM2_ExtTRGPrescaler | \
2222                     ; 591                                    (uint8_t)TIM2_ExtTRGPolarity ) | (uint8_t)ExtTRGFilter);
2224  0280 9f            	ld	a,xl
2225  0281 1a01          	or	a,(OFST+1,sp)
2226  0283 1a05          	or	a,(OFST+5,sp)
2227  0285 ca5253        	or	a,21075
2228  0288 c75253        	ld	21075,a
2229                     ; 592 }
2232  028b 85            	popw	x
2233  028c 81            	ret
2322                     ; 604 void TIM2_TIxExternalClockConfig(TIM2_TIxExternalCLK1Source_TypeDef TIM2_TIxExternalCLKSource,
2322                     ; 605                                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
2322                     ; 606                                  uint8_t ICFilter)
2322                     ; 607 {
2323                     	switch	.text
2324  028d               _TIM2_TIxExternalClockConfig:
2326  028d 89            	pushw	x
2327       00000000      OFST:	set	0
2330                     ; 609   assert_param(IS_TIM2_TIXCLK_SOURCE(TIM2_TIxExternalCLKSource));
2332                     ; 610   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
2334                     ; 611   assert_param(IS_TIM2_IC_FILTER(ICFilter));
2336                     ; 614   if (TIM2_TIxExternalCLKSource == TIM2_TIxExternalCLK1Source_TI2)
2338  028e 9e            	ld	a,xh
2339  028f a160          	cp	a,#96
2340  0291 260f          	jrne	L3021
2341                     ; 616     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, ICFilter);
2343  0293 7b05          	ld	a,(OFST+5,sp)
2344  0295 88            	push	a
2345  0296 ae0001        	ldw	x,#1
2346  0299 7b03          	ld	a,(OFST+3,sp)
2347  029b 95            	ld	xh,a
2348  029c cd064c        	call	L5_TI2_Config
2350  029f 84            	pop	a
2352  02a0 200d          	jra	L5021
2353  02a2               L3021:
2354                     ; 620     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, ICFilter);
2356  02a2 7b05          	ld	a,(OFST+5,sp)
2357  02a4 88            	push	a
2358  02a5 ae0001        	ldw	x,#1
2359  02a8 7b03          	ld	a,(OFST+3,sp)
2360  02aa 95            	ld	xh,a
2361  02ab cd060f        	call	L3_TI1_Config
2363  02ae 84            	pop	a
2364  02af               L5021:
2365                     ; 624   TIM2_SelectInputTrigger((TIM2_TRGSelection_TypeDef)TIM2_TIxExternalCLKSource);
2367  02af 7b01          	ld	a,(OFST+1,sp)
2368  02b1 ad0a          	call	_TIM2_SelectInputTrigger
2370                     ; 627   TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
2372  02b3 c65252        	ld	a,21074
2373  02b6 aa07          	or	a,#7
2374  02b8 c75252        	ld	21074,a
2375                     ; 628 }
2378  02bb 85            	popw	x
2379  02bc 81            	ret
2495                     ; 636 void TIM2_SelectInputTrigger(TIM2_TRGSelection_TypeDef TIM2_InputTriggerSource)
2495                     ; 637 {
2496                     	switch	.text
2497  02bd               _TIM2_SelectInputTrigger:
2499  02bd 88            	push	a
2500  02be 88            	push	a
2501       00000001      OFST:	set	1
2504                     ; 638   uint8_t tmpsmcr = 0;
2506                     ; 641   assert_param(IS_TIM2_TRIGGER_SELECTION(TIM2_InputTriggerSource));
2508                     ; 643   tmpsmcr = TIM2->SMCR;
2510  02bf c65252        	ld	a,21074
2511  02c2 6b01          	ld	(OFST+0,sp),a
2512                     ; 646   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
2514  02c4 7b01          	ld	a,(OFST+0,sp)
2515  02c6 a48f          	and	a,#143
2516  02c8 6b01          	ld	(OFST+0,sp),a
2517                     ; 647   tmpsmcr |= (uint8_t)TIM2_InputTriggerSource;
2519  02ca 7b01          	ld	a,(OFST+0,sp)
2520  02cc 1a02          	or	a,(OFST+1,sp)
2521  02ce 6b01          	ld	(OFST+0,sp),a
2522                     ; 649   TIM2->SMCR = (uint8_t)tmpsmcr;
2524  02d0 7b01          	ld	a,(OFST+0,sp)
2525  02d2 c75252        	ld	21074,a
2526                     ; 650 }
2529  02d5 85            	popw	x
2530  02d6 81            	ret
2566                     ; 659 void TIM2_UpdateDisableConfig(FunctionalState NewState)
2566                     ; 660 {
2567                     	switch	.text
2568  02d7               _TIM2_UpdateDisableConfig:
2572                     ; 662   assert_param(IS_FUNCTIONAL_STATE(NewState));
2574                     ; 665   if (NewState != DISABLE)
2576  02d7 4d            	tnz	a
2577  02d8 2706          	jreq	L3721
2578                     ; 667     TIM2->CR1 |= TIM_CR1_UDIS;
2580  02da 72125250      	bset	21072,#1
2582  02de 2004          	jra	L5721
2583  02e0               L3721:
2584                     ; 671     TIM2->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
2586  02e0 72135250      	bres	21072,#1
2587  02e4               L5721:
2588                     ; 673 }
2591  02e4 81            	ret
2649                     ; 681 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
2649                     ; 682 {
2650                     	switch	.text
2651  02e5               _TIM2_UpdateRequestConfig:
2655                     ; 684   assert_param(IS_TIM2_UPDATE_SOURCE(TIM2_UpdateSource));
2657                     ; 687   if (TIM2_UpdateSource == TIM2_UpdateSource_Regular)
2659  02e5 a101          	cp	a,#1
2660  02e7 2606          	jrne	L5231
2661                     ; 689     TIM2->CR1 |= TIM_CR1_URS ;
2663  02e9 72145250      	bset	21072,#2
2665  02ed 2004          	jra	L7231
2666  02ef               L5231:
2667                     ; 693     TIM2->CR1 &= (uint8_t)(~TIM_CR1_URS);
2669  02ef 72155250      	bres	21072,#2
2670  02f3               L7231:
2671                     ; 695 }
2674  02f3 81            	ret
2710                     ; 703 void TIM2_SelectHallSensor(FunctionalState NewState)
2710                     ; 704 {
2711                     	switch	.text
2712  02f4               _TIM2_SelectHallSensor:
2716                     ; 706   assert_param(IS_FUNCTIONAL_STATE(NewState));
2718                     ; 709   if (NewState != DISABLE)
2720  02f4 4d            	tnz	a
2721  02f5 2706          	jreq	L7431
2722                     ; 711     TIM2->CR2 |= TIM_CR2_TI1S;
2724  02f7 721e5251      	bset	21073,#7
2726  02fb 2004          	jra	L1531
2727  02fd               L7431:
2728                     ; 715     TIM2->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
2730  02fd 721f5251      	bres	21073,#7
2731  0301               L1531:
2732                     ; 717 }
2735  0301 81            	ret
2792                     ; 725 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
2792                     ; 726 {
2793                     	switch	.text
2794  0302               _TIM2_SelectOnePulseMode:
2798                     ; 728   assert_param(IS_TIM2_OPM_MODE(TIM2_OPMode));
2800                     ; 731   if (TIM2_OPMode == TIM2_OPMode_Single)
2802  0302 a101          	cp	a,#1
2803  0304 2606          	jrne	L1041
2804                     ; 733     TIM2->CR1 |= TIM_CR1_OPM ;
2806  0306 72165250      	bset	21072,#3
2808  030a 2004          	jra	L3041
2809  030c               L1041:
2810                     ; 737     TIM2->CR1 &= (uint8_t)(~TIM_CR1_OPM);
2812  030c 72175250      	bres	21072,#3
2813  0310               L3041:
2814                     ; 739 }
2817  0310 81            	ret
2916                     ; 747 void TIM2_SelectOutputTrigger(TIM2_TRGOSource_TypeDef TIM2_TRGOSource)
2916                     ; 748 {
2917                     	switch	.text
2918  0311               _TIM2_SelectOutputTrigger:
2920  0311 88            	push	a
2921  0312 88            	push	a
2922       00000001      OFST:	set	1
2925                     ; 749   uint8_t tmpcr2 = 0;
2927                     ; 752   assert_param(IS_TIM2_TRGO_SOURCE(TIM2_TRGOSource));
2929                     ; 754   tmpcr2 = TIM2->CR2;
2931  0313 c65251        	ld	a,21073
2932  0316 6b01          	ld	(OFST+0,sp),a
2933                     ; 757   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
2935  0318 7b01          	ld	a,(OFST+0,sp)
2936  031a a48f          	and	a,#143
2937  031c 6b01          	ld	(OFST+0,sp),a
2938                     ; 760   tmpcr2 |=  (uint8_t)TIM2_TRGOSource;
2940  031e 7b01          	ld	a,(OFST+0,sp)
2941  0320 1a02          	or	a,(OFST+1,sp)
2942  0322 6b01          	ld	(OFST+0,sp),a
2943                     ; 762   TIM2->CR2 = tmpcr2;
2945  0324 7b01          	ld	a,(OFST+0,sp)
2946  0326 c75251        	ld	21073,a
2947                     ; 763 }
2950  0329 85            	popw	x
2951  032a 81            	ret
3034                     ; 771 void TIM2_SelectSlaveMode(TIM2_SlaveMode_TypeDef TIM2_SlaveMode)
3034                     ; 772 {
3035                     	switch	.text
3036  032b               _TIM2_SelectSlaveMode:
3038  032b 88            	push	a
3039  032c 88            	push	a
3040       00000001      OFST:	set	1
3043                     ; 773   uint8_t tmpsmcr = 0;
3045                     ; 776   assert_param(IS_TIM2_SLAVE_MODE(TIM2_SlaveMode));
3047                     ; 778   tmpsmcr = TIM2->SMCR;
3049  032d c65252        	ld	a,21074
3050  0330 6b01          	ld	(OFST+0,sp),a
3051                     ; 781   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
3053  0332 7b01          	ld	a,(OFST+0,sp)
3054  0334 a4f8          	and	a,#248
3055  0336 6b01          	ld	(OFST+0,sp),a
3056                     ; 784   tmpsmcr |= (uint8_t)TIM2_SlaveMode;
3058  0338 7b01          	ld	a,(OFST+0,sp)
3059  033a 1a02          	or	a,(OFST+1,sp)
3060  033c 6b01          	ld	(OFST+0,sp),a
3061                     ; 786   TIM2->SMCR = tmpsmcr;
3063  033e 7b01          	ld	a,(OFST+0,sp)
3064  0340 c75252        	ld	21074,a
3065                     ; 787 }
3068  0343 85            	popw	x
3069  0344 81            	ret
3105                     ; 795 void TIM2_SelectMasterSlaveMode(FunctionalState NewState)
3105                     ; 796 {
3106                     	switch	.text
3107  0345               _TIM2_SelectMasterSlaveMode:
3111                     ; 798   assert_param(IS_FUNCTIONAL_STATE(NewState));
3113                     ; 801   if (NewState != DISABLE)
3115  0345 4d            	tnz	a
3116  0346 2706          	jreq	L3251
3117                     ; 803     TIM2->SMCR |= TIM_SMCR_MSM;
3119  0348 721e5252      	bset	21074,#7
3121  034c 2004          	jra	L5251
3122  034e               L3251:
3123                     ; 807     TIM2->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
3125  034e 721f5252      	bres	21074,#7
3126  0352               L5251:
3127                     ; 809 }
3130  0352 81            	ret
3243                     ; 821 void TIM2_EncoderInterfaceConfig(TIM2_EncoderMode_TypeDef TIM2_EncoderMode,
3243                     ; 822                                  TIM2_ICPolarity_TypeDef TIM2_IC1Polarity,
3243                     ; 823                                  TIM2_ICPolarity_TypeDef TIM2_IC2Polarity)
3243                     ; 824 {
3244                     	switch	.text
3245  0353               _TIM2_EncoderInterfaceConfig:
3247  0353 89            	pushw	x
3248  0354 5203          	subw	sp,#3
3249       00000003      OFST:	set	3
3252                     ; 825   uint8_t tmpsmcr = 0;
3254                     ; 826   uint8_t tmpccmr1 = 0;
3256                     ; 827   uint8_t tmpccmr2 = 0;
3258                     ; 830   assert_param(IS_TIM2_ENCODER_MODE(TIM2_EncoderMode));
3260                     ; 831   assert_param(IS_TIM2_IC_POLARITY(TIM2_IC1Polarity));
3262                     ; 832   assert_param(IS_TIM2_IC_POLARITY(TIM2_IC2Polarity));
3264                     ; 834   tmpsmcr = TIM2->SMCR;
3266  0356 c65252        	ld	a,21074
3267  0359 6b01          	ld	(OFST-2,sp),a
3268                     ; 835   tmpccmr1 = TIM2->CCMR1;
3270  035b c65259        	ld	a,21081
3271  035e 6b02          	ld	(OFST-1,sp),a
3272                     ; 836   tmpccmr2 = TIM2->CCMR2;
3274  0360 c6525a        	ld	a,21082
3275  0363 6b03          	ld	(OFST+0,sp),a
3276                     ; 839   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
3278  0365 7b01          	ld	a,(OFST-2,sp)
3279  0367 a4f0          	and	a,#240
3280  0369 6b01          	ld	(OFST-2,sp),a
3281                     ; 840   tmpsmcr |= (uint8_t)TIM2_EncoderMode;
3283  036b 9e            	ld	a,xh
3284  036c 1a01          	or	a,(OFST-2,sp)
3285  036e 6b01          	ld	(OFST-2,sp),a
3286                     ; 843   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
3288  0370 7b02          	ld	a,(OFST-1,sp)
3289  0372 a4fc          	and	a,#252
3290  0374 6b02          	ld	(OFST-1,sp),a
3291                     ; 844   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
3293  0376 7b03          	ld	a,(OFST+0,sp)
3294  0378 a4fc          	and	a,#252
3295  037a 6b03          	ld	(OFST+0,sp),a
3296                     ; 845   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
3298  037c 7b02          	ld	a,(OFST-1,sp)
3299  037e aa01          	or	a,#1
3300  0380 6b02          	ld	(OFST-1,sp),a
3301                     ; 846   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
3303  0382 7b03          	ld	a,(OFST+0,sp)
3304  0384 aa01          	or	a,#1
3305  0386 6b03          	ld	(OFST+0,sp),a
3306                     ; 849   if (TIM2_IC1Polarity == TIM2_ICPolarity_Falling)
3308  0388 9f            	ld	a,xl
3309  0389 a101          	cp	a,#1
3310  038b 2606          	jrne	L3061
3311                     ; 851     TIM2->CCER1 |= TIM_CCER1_CC1P ;
3313  038d 7212525b      	bset	21083,#1
3315  0391 2004          	jra	L5061
3316  0393               L3061:
3317                     ; 855     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
3319  0393 7213525b      	bres	21083,#1
3320  0397               L5061:
3321                     ; 858   if (TIM2_IC2Polarity == TIM2_ICPolarity_Falling)
3323  0397 7b08          	ld	a,(OFST+5,sp)
3324  0399 a101          	cp	a,#1
3325  039b 2606          	jrne	L7061
3326                     ; 860     TIM2->CCER1 |= TIM_CCER1_CC2P ;
3328  039d 721a525b      	bset	21083,#5
3330  03a1 2004          	jra	L1161
3331  03a3               L7061:
3332                     ; 864     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
3334  03a3 721b525b      	bres	21083,#5
3335  03a7               L1161:
3336                     ; 867   TIM2->SMCR = tmpsmcr;
3338  03a7 7b01          	ld	a,(OFST-2,sp)
3339  03a9 c75252        	ld	21074,a
3340                     ; 868   TIM2->CCMR1 = tmpccmr1;
3342  03ac 7b02          	ld	a,(OFST-1,sp)
3343  03ae c75259        	ld	21081,a
3344                     ; 869   TIM2->CCMR2 = tmpccmr2;
3346  03b1 7b03          	ld	a,(OFST+0,sp)
3347  03b3 c7525a        	ld	21082,a
3348                     ; 870 }
3351  03b6 5b05          	addw	sp,#5
3352  03b8 81            	ret
3420                     ; 880 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
3420                     ; 881                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
3420                     ; 882 {
3421                     	switch	.text
3422  03b9               _TIM2_PrescalerConfig:
3426                     ; 884   assert_param(IS_TIM2_PRESCALER(Prescaler));
3428                     ; 885   assert_param(IS_TIM2_PRESCALER_RELOAD(TIM2_PSCReloadMode));
3430                     ; 888   TIM2->PSCR = (uint8_t)(Prescaler);
3432  03b9 9e            	ld	a,xh
3433  03ba c7525e        	ld	21086,a
3434                     ; 891   if (TIM2_PSCReloadMode == TIM2_PSCReloadMode_Immediate)
3436  03bd 9f            	ld	a,xl
3437  03be a101          	cp	a,#1
3438  03c0 2606          	jrne	L5461
3439                     ; 893     TIM2->EGR |= TIM_EGR_UG ;
3441  03c2 72105258      	bset	21080,#0
3443  03c6 2004          	jra	L7461
3444  03c8               L5461:
3445                     ; 897     TIM2->EGR &= (uint8_t)(~TIM_EGR_UG) ;
3447  03c8 72115258      	bres	21080,#0
3448  03cc               L7461:
3449                     ; 899 }
3452  03cc 81            	ret
3497                     ; 907 void TIM2_CounterModeConfig(TIM2_CounterMode_TypeDef TIM2_CounterMode)
3497                     ; 908 {
3498                     	switch	.text
3499  03cd               _TIM2_CounterModeConfig:
3501  03cd 88            	push	a
3502  03ce 88            	push	a
3503       00000001      OFST:	set	1
3506                     ; 909   uint8_t tmpcr1 = 0;
3508                     ; 912   assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
3510                     ; 914   tmpcr1 = TIM2->CR1;
3512  03cf c65250        	ld	a,21072
3513  03d2 6b01          	ld	(OFST+0,sp),a
3514                     ; 917   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
3516  03d4 7b01          	ld	a,(OFST+0,sp)
3517  03d6 a48f          	and	a,#143
3518  03d8 6b01          	ld	(OFST+0,sp),a
3519                     ; 920   tmpcr1 |= (uint8_t)TIM2_CounterMode;
3521  03da 7b01          	ld	a,(OFST+0,sp)
3522  03dc 1a02          	or	a,(OFST+1,sp)
3523  03de 6b01          	ld	(OFST+0,sp),a
3524                     ; 922   TIM2->CR1 = tmpcr1;
3526  03e0 7b01          	ld	a,(OFST+0,sp)
3527  03e2 c75250        	ld	21072,a
3528                     ; 923 }
3531  03e5 85            	popw	x
3532  03e6 81            	ret
3599                     ; 931 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
3599                     ; 932 {
3600                     	switch	.text
3601  03e7               _TIM2_ForcedOC1Config:
3603  03e7 88            	push	a
3604  03e8 88            	push	a
3605       00000001      OFST:	set	1
3608                     ; 933   uint8_t tmpccmr1 = 0;
3610                     ; 936   assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
3612                     ; 938   tmpccmr1 = TIM2->CCMR1;
3614  03e9 c65259        	ld	a,21081
3615  03ec 6b01          	ld	(OFST+0,sp),a
3616                     ; 941   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
3618  03ee 7b01          	ld	a,(OFST+0,sp)
3619  03f0 a48f          	and	a,#143
3620  03f2 6b01          	ld	(OFST+0,sp),a
3621                     ; 944   tmpccmr1 |= (uint8_t)TIM2_ForcedAction;
3623  03f4 7b01          	ld	a,(OFST+0,sp)
3624  03f6 1a02          	or	a,(OFST+1,sp)
3625  03f8 6b01          	ld	(OFST+0,sp),a
3626                     ; 946   TIM2->CCMR1 = tmpccmr1;
3628  03fa 7b01          	ld	a,(OFST+0,sp)
3629  03fc c75259        	ld	21081,a
3630                     ; 947 }
3633  03ff 85            	popw	x
3634  0400 81            	ret
3679                     ; 955 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
3679                     ; 956 {
3680                     	switch	.text
3681  0401               _TIM2_ForcedOC2Config:
3683  0401 88            	push	a
3684  0402 88            	push	a
3685       00000001      OFST:	set	1
3688                     ; 957   uint8_t tmpccmr2 = 0;
3690                     ; 960   assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
3692                     ; 962   tmpccmr2 = TIM2->CCMR2;
3694  0403 c6525a        	ld	a,21082
3695  0406 6b01          	ld	(OFST+0,sp),a
3696                     ; 965   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
3698  0408 7b01          	ld	a,(OFST+0,sp)
3699  040a a48f          	and	a,#143
3700  040c 6b01          	ld	(OFST+0,sp),a
3701                     ; 968   tmpccmr2 |= (uint8_t)TIM2_ForcedAction;
3703  040e 7b01          	ld	a,(OFST+0,sp)
3704  0410 1a02          	or	a,(OFST+1,sp)
3705  0412 6b01          	ld	(OFST+0,sp),a
3706                     ; 970   TIM2->CCMR2 = tmpccmr2;
3708  0414 7b01          	ld	a,(OFST+0,sp)
3709  0416 c7525a        	ld	21082,a
3710                     ; 971 }
3713  0419 85            	popw	x
3714  041a 81            	ret
3750                     ; 979 void TIM2_ARRPreloadConfig(FunctionalState NewState)
3750                     ; 980 {
3751                     	switch	.text
3752  041b               _TIM2_ARRPreloadConfig:
3756                     ; 982   assert_param(IS_FUNCTIONAL_STATE(NewState));
3758                     ; 985   if (NewState != DISABLE)
3760  041b 4d            	tnz	a
3761  041c 2706          	jreq	L5671
3762                     ; 987     TIM2->CR1 |= TIM_CR1_ARPE;
3764  041e 721e5250      	bset	21072,#7
3766  0422 2004          	jra	L7671
3767  0424               L5671:
3768                     ; 991     TIM2->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
3770  0424 721f5250      	bres	21072,#7
3771  0428               L7671:
3772                     ; 993 }
3775  0428 81            	ret
3811                     ; 1001 void TIM2_OC1PreloadConfig(FunctionalState NewState)
3811                     ; 1002 {
3812                     	switch	.text
3813  0429               _TIM2_OC1PreloadConfig:
3817                     ; 1004   assert_param(IS_FUNCTIONAL_STATE(NewState));
3819                     ; 1007   if (NewState != DISABLE)
3821  0429 4d            	tnz	a
3822  042a 2706          	jreq	L7002
3823                     ; 1009     TIM2->CCMR1 |= TIM_CCMR_OCxPE ;
3825  042c 72165259      	bset	21081,#3
3827  0430 2004          	jra	L1102
3828  0432               L7002:
3829                     ; 1013     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3831  0432 72175259      	bres	21081,#3
3832  0436               L1102:
3833                     ; 1015 }
3836  0436 81            	ret
3872                     ; 1023 void TIM2_OC2PreloadConfig(FunctionalState NewState)
3872                     ; 1024 {
3873                     	switch	.text
3874  0437               _TIM2_OC2PreloadConfig:
3878                     ; 1026   assert_param(IS_FUNCTIONAL_STATE(NewState));
3880                     ; 1029   if (NewState != DISABLE)
3882  0437 4d            	tnz	a
3883  0438 2706          	jreq	L1302
3884                     ; 1031     TIM2->CCMR2 |= TIM_CCMR_OCxPE ;
3886  043a 7216525a      	bset	21082,#3
3888  043e 2004          	jra	L3302
3889  0440               L1302:
3890                     ; 1035     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3892  0440 7217525a      	bres	21082,#3
3893  0444               L3302:
3894                     ; 1037 }
3897  0444 81            	ret
3932                     ; 1045 void TIM2_OC1FastCmd(FunctionalState NewState)
3932                     ; 1046 {
3933                     	switch	.text
3934  0445               _TIM2_OC1FastCmd:
3938                     ; 1048   assert_param(IS_FUNCTIONAL_STATE(NewState));
3940                     ; 1051   if (NewState != DISABLE)
3942  0445 4d            	tnz	a
3943  0446 2706          	jreq	L3502
3944                     ; 1053     TIM2->CCMR1 |= TIM_CCMR_OCxFE ;
3946  0448 72145259      	bset	21081,#2
3948  044c 2004          	jra	L5502
3949  044e               L3502:
3950                     ; 1057     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3952  044e 72155259      	bres	21081,#2
3953  0452               L5502:
3954                     ; 1059 }
3957  0452 81            	ret
3992                     ; 1068 void TIM2_OC2FastCmd(FunctionalState NewState)
3992                     ; 1069 {
3993                     	switch	.text
3994  0453               _TIM2_OC2FastCmd:
3998                     ; 1071   assert_param(IS_FUNCTIONAL_STATE(NewState));
4000                     ; 1074   if (NewState != DISABLE)
4002  0453 4d            	tnz	a
4003  0454 2706          	jreq	L5702
4004                     ; 1076     TIM2->CCMR2 |= TIM_CCMR_OCxFE ;
4006  0456 7214525a      	bset	21082,#2
4008  045a 2004          	jra	L7702
4009  045c               L5702:
4010                     ; 1080     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
4012  045c 7215525a      	bres	21082,#2
4013  0460               L7702:
4014                     ; 1082 }
4017  0460 81            	ret
4098                     ; 1090 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
4098                     ; 1091 {
4099                     	switch	.text
4100  0461               _TIM2_GenerateEvent:
4104                     ; 1093   assert_param(IS_TIM2_EVENT_SOURCE((uint8_t)TIM2_EventSource));
4106                     ; 1096   TIM2->EGR |= (uint8_t)TIM2_EventSource;
4108  0461 ca5258        	or	a,21080
4109  0464 c75258        	ld	21080,a
4110                     ; 1097 }
4113  0467 81            	ret
4149                     ; 1105 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
4149                     ; 1106 {
4150                     	switch	.text
4151  0468               _TIM2_OC1PolarityConfig:
4155                     ; 1108   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
4157                     ; 1111   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
4159  0468 a101          	cp	a,#1
4160  046a 2606          	jrne	L3512
4161                     ; 1113     TIM2->CCER1 |= TIM_CCER1_CC1P ;
4163  046c 7212525b      	bset	21083,#1
4165  0470 2004          	jra	L5512
4166  0472               L3512:
4167                     ; 1117     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
4169  0472 7213525b      	bres	21083,#1
4170  0476               L5512:
4171                     ; 1119 }
4174  0476 81            	ret
4210                     ; 1127 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
4210                     ; 1128 {
4211                     	switch	.text
4212  0477               _TIM2_OC2PolarityConfig:
4216                     ; 1130   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
4218                     ; 1133   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
4220  0477 a101          	cp	a,#1
4221  0479 2606          	jrne	L5712
4222                     ; 1135     TIM2->CCER1 |= TIM_CCER1_CC2P ;
4224  047b 721a525b      	bset	21083,#5
4226  047f 2004          	jra	L7712
4227  0481               L5712:
4228                     ; 1139     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
4230  0481 721b525b      	bres	21083,#5
4231  0485               L7712:
4232                     ; 1141 }
4235  0485 81            	ret
4280                     ; 1151 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel,
4280                     ; 1152                  FunctionalState NewState)
4280                     ; 1153 {
4281                     	switch	.text
4282  0486               _TIM2_CCxCmd:
4284  0486 89            	pushw	x
4285       00000000      OFST:	set	0
4288                     ; 1155   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
4290                     ; 1156   assert_param(IS_FUNCTIONAL_STATE(NewState));
4292                     ; 1158   if (TIM2_Channel == TIM2_Channel_1)
4294  0487 9e            	ld	a,xh
4295  0488 4d            	tnz	a
4296  0489 2610          	jrne	L3222
4297                     ; 1161     if (NewState != DISABLE)
4299  048b 9f            	ld	a,xl
4300  048c 4d            	tnz	a
4301  048d 2706          	jreq	L5222
4302                     ; 1163       TIM2->CCER1 |= TIM_CCER1_CC1E ;
4304  048f 7210525b      	bset	21083,#0
4306  0493 2014          	jra	L1322
4307  0495               L5222:
4308                     ; 1167       TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
4310  0495 7211525b      	bres	21083,#0
4311  0499 200e          	jra	L1322
4312  049b               L3222:
4313                     ; 1174     if (NewState != DISABLE)
4315  049b 0d02          	tnz	(OFST+2,sp)
4316  049d 2706          	jreq	L3322
4317                     ; 1176       TIM2->CCER1 |= TIM_CCER1_CC2E;
4319  049f 7218525b      	bset	21083,#4
4321  04a3 2004          	jra	L1322
4322  04a5               L3322:
4323                     ; 1180       TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
4325  04a5 7219525b      	bres	21083,#4
4326  04a9               L1322:
4327                     ; 1183 }
4330  04a9 85            	popw	x
4331  04aa 81            	ret
4376                     ; 1195 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel,
4376                     ; 1196                      TIM2_OCMode_TypeDef TIM2_OCMode)
4376                     ; 1197 {
4377                     	switch	.text
4378  04ab               _TIM2_SelectOCxM:
4380  04ab 89            	pushw	x
4381       00000000      OFST:	set	0
4384                     ; 1199   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
4386                     ; 1200   assert_param(IS_TIM2_OCM(TIM2_OCMode));
4388                     ; 1202   if (TIM2_Channel == TIM2_Channel_1)
4390  04ac 9e            	ld	a,xh
4391  04ad 4d            	tnz	a
4392  04ae 2615          	jrne	L1622
4393                     ; 1205     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
4395  04b0 7211525b      	bres	21083,#0
4396                     ; 1208     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
4398  04b4 c65259        	ld	a,21081
4399  04b7 a48f          	and	a,#143
4400  04b9 c75259        	ld	21081,a
4401                     ; 1211     TIM2->CCMR1 |= (uint8_t)TIM2_OCMode;
4403  04bc 9f            	ld	a,xl
4404  04bd ca5259        	or	a,21081
4405  04c0 c75259        	ld	21081,a
4407  04c3 2014          	jra	L3622
4408  04c5               L1622:
4409                     ; 1216     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
4411  04c5 7219525b      	bres	21083,#4
4412                     ; 1219     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
4414  04c9 c6525a        	ld	a,21082
4415  04cc a48f          	and	a,#143
4416  04ce c7525a        	ld	21082,a
4417                     ; 1222     TIM2->CCMR2 |= (uint8_t)TIM2_OCMode;
4419  04d1 c6525a        	ld	a,21082
4420  04d4 1a02          	or	a,(OFST+2,sp)
4421  04d6 c7525a        	ld	21082,a
4422  04d9               L3622:
4423                     ; 1224 }
4426  04d9 85            	popw	x
4427  04da 81            	ret
4461                     ; 1232 void TIM2_SetCounter(uint16_t Counter)
4461                     ; 1233 {
4462                     	switch	.text
4463  04db               _TIM2_SetCounter:
4467                     ; 1236   TIM2->CNTRH = (uint8_t)(Counter >> 8);
4469  04db 9e            	ld	a,xh
4470  04dc c7525c        	ld	21084,a
4471                     ; 1237   TIM2->CNTRL = (uint8_t)(Counter);
4473  04df 9f            	ld	a,xl
4474  04e0 c7525d        	ld	21085,a
4475                     ; 1238 }
4478  04e3 81            	ret
4512                     ; 1246 void TIM2_SetAutoreload(uint16_t Autoreload)
4512                     ; 1247 {
4513                     	switch	.text
4514  04e4               _TIM2_SetAutoreload:
4518                     ; 1249   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
4520  04e4 9e            	ld	a,xh
4521  04e5 c7525f        	ld	21087,a
4522                     ; 1250   TIM2->ARRL = (uint8_t)(Autoreload);
4524  04e8 9f            	ld	a,xl
4525  04e9 c75260        	ld	21088,a
4526                     ; 1251 }
4529  04ec 81            	ret
4563                     ; 1259 void TIM2_SetCompare1(uint16_t Compare)
4563                     ; 1260 {
4564                     	switch	.text
4565  04ed               _TIM2_SetCompare1:
4569                     ; 1262   TIM2->CCR1H = (uint8_t)(Compare >> 8);
4571  04ed 9e            	ld	a,xh
4572  04ee c75261        	ld	21089,a
4573                     ; 1263   TIM2->CCR1L = (uint8_t)(Compare);
4575  04f1 9f            	ld	a,xl
4576  04f2 c75262        	ld	21090,a
4577                     ; 1264 }
4580  04f5 81            	ret
4614                     ; 1272 void TIM2_SetCompare2(uint16_t Compare)
4614                     ; 1273 {
4615                     	switch	.text
4616  04f6               _TIM2_SetCompare2:
4620                     ; 1275   TIM2->CCR2H = (uint8_t)(Compare >> 8);
4622  04f6 9e            	ld	a,xh
4623  04f7 c75263        	ld	21091,a
4624                     ; 1276   TIM2->CCR2L = (uint8_t)(Compare);
4626  04fa 9f            	ld	a,xl
4627  04fb c75264        	ld	21092,a
4628                     ; 1277 }
4631  04fe 81            	ret
4676                     ; 1285 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
4676                     ; 1286 {
4677                     	switch	.text
4678  04ff               _TIM2_SetIC1Prescaler:
4680  04ff 88            	push	a
4681  0500 88            	push	a
4682       00000001      OFST:	set	1
4685                     ; 1287   uint8_t tmpccmr1 = 0;
4687                     ; 1290   assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC1Prescaler));
4689                     ; 1292   tmpccmr1 = TIM2->CCMR1;
4691  0501 c65259        	ld	a,21081
4692  0504 6b01          	ld	(OFST+0,sp),a
4693                     ; 1295   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4695  0506 7b01          	ld	a,(OFST+0,sp)
4696  0508 a4f3          	and	a,#243
4697  050a 6b01          	ld	(OFST+0,sp),a
4698                     ; 1298   tmpccmr1 |= (uint8_t)TIM2_IC1Prescaler;
4700  050c 7b01          	ld	a,(OFST+0,sp)
4701  050e 1a02          	or	a,(OFST+1,sp)
4702  0510 6b01          	ld	(OFST+0,sp),a
4703                     ; 1300   TIM2->CCMR1 = tmpccmr1;
4705  0512 7b01          	ld	a,(OFST+0,sp)
4706  0514 c75259        	ld	21081,a
4707                     ; 1301 }
4710  0517 85            	popw	x
4711  0518 81            	ret
4756                     ; 1309 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
4756                     ; 1310 {
4757                     	switch	.text
4758  0519               _TIM2_SetIC2Prescaler:
4760  0519 88            	push	a
4761  051a 88            	push	a
4762       00000001      OFST:	set	1
4765                     ; 1311   uint8_t tmpccmr2 = 0;
4767                     ; 1314   assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC2Prescaler));
4769                     ; 1316   tmpccmr2 = TIM2->CCMR2;
4771  051b c6525a        	ld	a,21082
4772  051e 6b01          	ld	(OFST+0,sp),a
4773                     ; 1319   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4775  0520 7b01          	ld	a,(OFST+0,sp)
4776  0522 a4f3          	and	a,#243
4777  0524 6b01          	ld	(OFST+0,sp),a
4778                     ; 1322   tmpccmr2 |= (uint8_t)TIM2_IC2Prescaler;
4780  0526 7b01          	ld	a,(OFST+0,sp)
4781  0528 1a02          	or	a,(OFST+1,sp)
4782  052a 6b01          	ld	(OFST+0,sp),a
4783                     ; 1324   TIM2->CCMR2 = tmpccmr2;
4785  052c 7b01          	ld	a,(OFST+0,sp)
4786  052e c7525a        	ld	21082,a
4787                     ; 1325 }
4790  0531 85            	popw	x
4791  0532 81            	ret
4843                     ; 1332 uint16_t TIM2_GetCapture1(void)
4843                     ; 1333 {
4844                     	switch	.text
4845  0533               _TIM2_GetCapture1:
4847  0533 5204          	subw	sp,#4
4848       00000004      OFST:	set	4
4851                     ; 1334   uint16_t tmpccr1 = 0;
4853                     ; 1337   tmpccr1h = TIM2->CCR1H;
4855  0535 c65261        	ld	a,21089
4856  0538 6b02          	ld	(OFST-2,sp),a
4857                     ; 1338   tmpccr1l = TIM2->CCR1L;
4859  053a c65262        	ld	a,21090
4860  053d 6b01          	ld	(OFST-3,sp),a
4861                     ; 1340   tmpccr1 = (uint16_t)(tmpccr1l);
4863  053f 7b01          	ld	a,(OFST-3,sp)
4864  0541 5f            	clrw	x
4865  0542 97            	ld	xl,a
4866  0543 1f03          	ldw	(OFST-1,sp),x
4867                     ; 1341   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4869  0545 7b02          	ld	a,(OFST-2,sp)
4870  0547 5f            	clrw	x
4871  0548 97            	ld	xl,a
4872  0549 4f            	clr	a
4873  054a 02            	rlwa	x,a
4874  054b 01            	rrwa	x,a
4875  054c 1a04          	or	a,(OFST+0,sp)
4876  054e 01            	rrwa	x,a
4877  054f 1a03          	or	a,(OFST-1,sp)
4878  0551 01            	rrwa	x,a
4879  0552 1f03          	ldw	(OFST-1,sp),x
4880                     ; 1343   return ((uint16_t)tmpccr1);
4882  0554 1e03          	ldw	x,(OFST-1,sp)
4885  0556 5b04          	addw	sp,#4
4886  0558 81            	ret
4938                     ; 1351 uint16_t TIM2_GetCapture2(void)
4938                     ; 1352 {
4939                     	switch	.text
4940  0559               _TIM2_GetCapture2:
4942  0559 5204          	subw	sp,#4
4943       00000004      OFST:	set	4
4946                     ; 1353   uint16_t tmpccr2 = 0;
4948                     ; 1356   tmpccr2h = TIM2->CCR2H;
4950  055b c65263        	ld	a,21091
4951  055e 6b02          	ld	(OFST-2,sp),a
4952                     ; 1357   tmpccr2l = TIM2->CCR2L;
4954  0560 c65264        	ld	a,21092
4955  0563 6b01          	ld	(OFST-3,sp),a
4956                     ; 1359   tmpccr2 = (uint16_t)(tmpccr2l);
4958  0565 7b01          	ld	a,(OFST-3,sp)
4959  0567 5f            	clrw	x
4960  0568 97            	ld	xl,a
4961  0569 1f03          	ldw	(OFST-1,sp),x
4962                     ; 1360   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4964  056b 7b02          	ld	a,(OFST-2,sp)
4965  056d 5f            	clrw	x
4966  056e 97            	ld	xl,a
4967  056f 4f            	clr	a
4968  0570 02            	rlwa	x,a
4969  0571 01            	rrwa	x,a
4970  0572 1a04          	or	a,(OFST+0,sp)
4971  0574 01            	rrwa	x,a
4972  0575 1a03          	or	a,(OFST-1,sp)
4973  0577 01            	rrwa	x,a
4974  0578 1f03          	ldw	(OFST-1,sp),x
4975                     ; 1362   return ((uint16_t)tmpccr2);
4977  057a 1e03          	ldw	x,(OFST-1,sp)
4980  057c 5b04          	addw	sp,#4
4981  057e 81            	ret
5033                     ; 1370 uint16_t TIM2_GetCounter(void)
5033                     ; 1371 {
5034                     	switch	.text
5035  057f               _TIM2_GetCounter:
5037  057f 5204          	subw	sp,#4
5038       00000004      OFST:	set	4
5041                     ; 1372   uint16_t tmpcnt = 0;
5043                     ; 1375   tmpcntrh = TIM2->CNTRH;
5045  0581 c6525c        	ld	a,21084
5046  0584 6b02          	ld	(OFST-2,sp),a
5047                     ; 1376   tmpcntrl = TIM2->CNTRL;
5049  0586 c6525d        	ld	a,21085
5050  0589 6b01          	ld	(OFST-3,sp),a
5051                     ; 1378   tmpcnt = (uint16_t)(tmpcntrl);
5053  058b 7b01          	ld	a,(OFST-3,sp)
5054  058d 5f            	clrw	x
5055  058e 97            	ld	xl,a
5056  058f 1f03          	ldw	(OFST-1,sp),x
5057                     ; 1379   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
5059  0591 7b02          	ld	a,(OFST-2,sp)
5060  0593 5f            	clrw	x
5061  0594 97            	ld	xl,a
5062  0595 4f            	clr	a
5063  0596 02            	rlwa	x,a
5064  0597 01            	rrwa	x,a
5065  0598 1a04          	or	a,(OFST+0,sp)
5066  059a 01            	rrwa	x,a
5067  059b 1a03          	or	a,(OFST-1,sp)
5068  059d 01            	rrwa	x,a
5069  059e 1f03          	ldw	(OFST-1,sp),x
5070                     ; 1381   return ((uint16_t)tmpcnt);
5072  05a0 1e03          	ldw	x,(OFST-1,sp)
5075  05a2 5b04          	addw	sp,#4
5076  05a4 81            	ret
5100                     ; 1389 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
5100                     ; 1390 {
5101                     	switch	.text
5102  05a5               _TIM2_GetPrescaler:
5106                     ; 1392   return ((TIM2_Prescaler_TypeDef)TIM2->PSCR);
5108  05a5 c6525e        	ld	a,21086
5111  05a8 81            	ret
5146                     ; 1401 void TIM2_SelectCCDMA(FunctionalState NewState)
5146                     ; 1402 {
5147                     	switch	.text
5148  05a9               _TIM2_SelectCCDMA:
5152                     ; 1404   assert_param(IS_FUNCTIONAL_STATE(NewState));
5154                     ; 1406   if (NewState != DISABLE)
5156  05a9 4d            	tnz	a
5157  05aa 2706          	jreq	L1552
5158                     ; 1409     TIM2->CR2 |= TIM_CR2_CCDS;
5160  05ac 72165251      	bset	21073,#3
5162  05b0 2004          	jra	L3552
5163  05b2               L1552:
5164                     ; 1414     TIM2->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
5166  05b2 72175251      	bres	21073,#3
5167  05b6               L3552:
5168                     ; 1416 }
5171  05b6 81            	ret
5310                     ; 1425 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
5310                     ; 1426 {
5311                     	switch	.text
5312  05b7               _TIM2_GetFlagStatus:
5314  05b7 89            	pushw	x
5315  05b8 89            	pushw	x
5316       00000002      OFST:	set	2
5319                     ; 1427   FlagStatus bitstatus = RESET;
5321                     ; 1428   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
5325                     ; 1431   assert_param(IS_TIM2_GET_FLAG(TIM2_FLAG));
5327                     ; 1433   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)(TIM2_FLAG));
5329  05b9 9f            	ld	a,xl
5330  05ba c45256        	and	a,21078
5331  05bd 6b01          	ld	(OFST-1,sp),a
5332                     ; 1434   tim2_flag_h = (uint8_t)(TIM2->SR2 & (uint8_t)((uint16_t)TIM2_FLAG >> 8));
5334  05bf c65257        	ld	a,21079
5335  05c2 1403          	and	a,(OFST+1,sp)
5336  05c4 6b02          	ld	(OFST+0,sp),a
5337                     ; 1436   if ((uint8_t)(tim2_flag_l | tim2_flag_h) != 0)
5339  05c6 7b01          	ld	a,(OFST-1,sp)
5340  05c8 1a02          	or	a,(OFST+0,sp)
5341  05ca 2706          	jreq	L1462
5342                     ; 1438     bitstatus = SET;
5344  05cc a601          	ld	a,#1
5345  05ce 6b02          	ld	(OFST+0,sp),a
5347  05d0 2002          	jra	L3462
5348  05d2               L1462:
5349                     ; 1442     bitstatus = RESET;
5351  05d2 0f02          	clr	(OFST+0,sp)
5352  05d4               L3462:
5353                     ; 1444   return ((FlagStatus)bitstatus);
5355  05d4 7b02          	ld	a,(OFST+0,sp)
5358  05d6 5b04          	addw	sp,#4
5359  05d8 81            	ret
5394                     ; 1453 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
5394                     ; 1454 {
5395                     	switch	.text
5396  05d9               _TIM2_ClearFlag:
5398  05d9 89            	pushw	x
5399       00000000      OFST:	set	0
5402                     ; 1456   assert_param(IS_TIM2_CLEAR_FLAG((uint16_t)TIM2_FLAG));
5404                     ; 1458   TIM2->SR1 = (uint8_t)(~(uint8_t)(TIM2_FLAG));
5406  05da 9f            	ld	a,xl
5407  05db 43            	cpl	a
5408  05dc c75256        	ld	21078,a
5409                     ; 1459   TIM2->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM2_FLAG >> 8));
5411  05df 7b01          	ld	a,(OFST+1,sp)
5412  05e1 43            	cpl	a
5413  05e2 c75257        	ld	21079,a
5414                     ; 1460 }
5417  05e5 85            	popw	x
5418  05e6 81            	ret
5482                     ; 1469 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
5482                     ; 1470 {
5483                     	switch	.text
5484  05e7               _TIM2_GetITStatus:
5486  05e7 88            	push	a
5487  05e8 89            	pushw	x
5488       00000002      OFST:	set	2
5491                     ; 1471   ITStatus bitstatus = RESET;
5493                     ; 1473   uint8_t TIM2_itStatus = 0x0, TIM2_itEnable = 0x0;
5497                     ; 1476   assert_param(IS_TIM2_GET_IT(TIM2_IT));
5499                     ; 1478   TIM2_itStatus = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_IT);
5501  05e9 c45256        	and	a,21078
5502  05ec 6b01          	ld	(OFST-1,sp),a
5503                     ; 1480   TIM2_itEnable = (uint8_t)(TIM2->IER & (uint8_t)TIM2_IT);
5505  05ee c65255        	ld	a,21077
5506  05f1 1403          	and	a,(OFST+1,sp)
5507  05f3 6b02          	ld	(OFST+0,sp),a
5508                     ; 1482   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET))
5510  05f5 0d01          	tnz	(OFST-1,sp)
5511  05f7 270a          	jreq	L5172
5513  05f9 0d02          	tnz	(OFST+0,sp)
5514  05fb 2706          	jreq	L5172
5515                     ; 1484     bitstatus = (ITStatus)SET;
5517  05fd a601          	ld	a,#1
5518  05ff 6b02          	ld	(OFST+0,sp),a
5520  0601 2002          	jra	L7172
5521  0603               L5172:
5522                     ; 1488     bitstatus = (ITStatus)RESET;
5524  0603 0f02          	clr	(OFST+0,sp)
5525  0605               L7172:
5526                     ; 1490   return ((ITStatus)bitstatus);
5528  0605 7b02          	ld	a,(OFST+0,sp)
5531  0607 5b03          	addw	sp,#3
5532  0609 81            	ret
5568                     ; 1499 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
5568                     ; 1500 {
5569                     	switch	.text
5570  060a               _TIM2_ClearITPendingBit:
5574                     ; 1502   assert_param(IS_TIM2_IT(TIM2_IT));
5576                     ; 1505   TIM2->SR1 = (uint8_t)(~(uint8_t)TIM2_IT);
5578  060a 43            	cpl	a
5579  060b c75256        	ld	21078,a
5580                     ; 1506 }
5583  060e 81            	ret
5655                     ; 1518 static void TI1_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity, \
5655                     ; 1519                        TIM2_ICSelection_TypeDef TIM2_ICSelection, \
5655                     ; 1520                        uint8_t TIM2_ICFilter)
5655                     ; 1521 {
5656                     	switch	.text
5657  060f               L3_TI1_Config:
5659  060f 89            	pushw	x
5660  0610 89            	pushw	x
5661       00000002      OFST:	set	2
5664                     ; 1522   uint8_t tmpccmr1 = 0;
5666                     ; 1523   uint8_t tmpicpolarity = (uint8_t)TIM2_ICPolarity;
5668  0611 9e            	ld	a,xh
5669  0612 6b01          	ld	(OFST-1,sp),a
5670                     ; 1524   tmpccmr1 = TIM2->CCMR1;
5672  0614 c65259        	ld	a,21081
5673  0617 6b02          	ld	(OFST+0,sp),a
5674                     ; 1527   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
5676                     ; 1528   assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
5678                     ; 1529   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
5680                     ; 1532   TIM2->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
5682  0619 7211525b      	bres	21083,#0
5683                     ; 1535   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5685  061d 7b02          	ld	a,(OFST+0,sp)
5686  061f a40c          	and	a,#12
5687  0621 6b02          	ld	(OFST+0,sp),a
5688                     ; 1536   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
5690  0623 7b07          	ld	a,(OFST+5,sp)
5691  0625 97            	ld	xl,a
5692  0626 a610          	ld	a,#16
5693  0628 42            	mul	x,a
5694  0629 9f            	ld	a,xl
5695  062a 1a04          	or	a,(OFST+2,sp)
5696  062c 1a02          	or	a,(OFST+0,sp)
5697  062e 6b02          	ld	(OFST+0,sp),a
5698                     ; 1538   TIM2->CCMR1 = tmpccmr1;
5700  0630 7b02          	ld	a,(OFST+0,sp)
5701  0632 c75259        	ld	21081,a
5702                     ; 1541   if (tmpicpolarity == (uint8_t)(TIM2_ICPolarity_Falling))
5704  0635 7b01          	ld	a,(OFST-1,sp)
5705  0637 a101          	cp	a,#1
5706  0639 2606          	jrne	L5772
5707                     ; 1543     TIM2->CCER1 |= TIM_CCER1_CC1P;
5709  063b 7212525b      	bset	21083,#1
5711  063f 2004          	jra	L7772
5712  0641               L5772:
5713                     ; 1547     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5715  0641 7213525b      	bres	21083,#1
5716  0645               L7772:
5717                     ; 1551   TIM2->CCER1 |=  TIM_CCER1_CC1E;
5719  0645 7210525b      	bset	21083,#0
5720                     ; 1552 }
5723  0649 5b04          	addw	sp,#4
5724  064b 81            	ret
5796                     ; 1564 static void TI2_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
5796                     ; 1565                        TIM2_ICSelection_TypeDef TIM2_ICSelection,
5796                     ; 1566                        uint8_t TIM2_ICFilter)
5796                     ; 1567 {
5797                     	switch	.text
5798  064c               L5_TI2_Config:
5800  064c 89            	pushw	x
5801  064d 89            	pushw	x
5802       00000002      OFST:	set	2
5805                     ; 1568   uint8_t tmpccmr2 = 0;
5807                     ; 1569   uint8_t tmpicpolarity = (uint8_t)TIM2_ICPolarity;
5809  064e 9e            	ld	a,xh
5810  064f 6b01          	ld	(OFST-1,sp),a
5811                     ; 1572   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
5813                     ; 1573   assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
5815                     ; 1574   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
5817                     ; 1576   tmpccmr2 = TIM2->CCMR2;
5819  0651 c6525a        	ld	a,21082
5820  0654 6b02          	ld	(OFST+0,sp),a
5821                     ; 1579   TIM2->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
5823  0656 7219525b      	bres	21083,#4
5824                     ; 1582   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5826  065a 7b02          	ld	a,(OFST+0,sp)
5827  065c a40c          	and	a,#12
5828  065e 6b02          	ld	(OFST+0,sp),a
5829                     ; 1583   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
5831  0660 7b07          	ld	a,(OFST+5,sp)
5832  0662 97            	ld	xl,a
5833  0663 a610          	ld	a,#16
5834  0665 42            	mul	x,a
5835  0666 9f            	ld	a,xl
5836  0667 1a04          	or	a,(OFST+2,sp)
5837  0669 1a02          	or	a,(OFST+0,sp)
5838  066b 6b02          	ld	(OFST+0,sp),a
5839                     ; 1585   TIM2->CCMR2 = tmpccmr2;
5841  066d 7b02          	ld	a,(OFST+0,sp)
5842  066f c7525a        	ld	21082,a
5843                     ; 1588   if (tmpicpolarity == TIM2_ICPolarity_Falling)
5845  0672 7b01          	ld	a,(OFST-1,sp)
5846  0674 a101          	cp	a,#1
5847  0676 2606          	jrne	L7303
5848                     ; 1590     TIM2->CCER1 |= TIM_CCER1_CC2P ;
5850  0678 721a525b      	bset	21083,#5
5852  067c 2004          	jra	L1403
5853  067e               L7303:
5854                     ; 1594     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5856  067e 721b525b      	bres	21083,#5
5857  0682               L1403:
5858                     ; 1598   TIM2->CCER1 |=  TIM_CCER1_CC2E;
5860  0682 7218525b      	bset	21083,#4
5861                     ; 1599 }
5864  0686 5b04          	addw	sp,#4
5865  0688 81            	ret
5878                     	xdef	_TIM2_ClearITPendingBit
5879                     	xdef	_TIM2_GetITStatus
5880                     	xdef	_TIM2_ClearFlag
5881                     	xdef	_TIM2_GetFlagStatus
5882                     	xdef	_TIM2_SelectCCDMA
5883                     	xdef	_TIM2_OC2FastCmd
5884                     	xdef	_TIM2_OC1FastCmd
5885                     	xdef	_TIM2_GetPrescaler
5886                     	xdef	_TIM2_GetCounter
5887                     	xdef	_TIM2_GetCapture2
5888                     	xdef	_TIM2_GetCapture1
5889                     	xdef	_TIM2_SetIC2Prescaler
5890                     	xdef	_TIM2_SetIC1Prescaler
5891                     	xdef	_TIM2_SetCompare2
5892                     	xdef	_TIM2_SetCompare1
5893                     	xdef	_TIM2_SetAutoreload
5894                     	xdef	_TIM2_SetCounter
5895                     	xdef	_TIM2_SelectOCxM
5896                     	xdef	_TIM2_CCxCmd
5897                     	xdef	_TIM2_OC2PolarityConfig
5898                     	xdef	_TIM2_OC1PolarityConfig
5899                     	xdef	_TIM2_GenerateEvent
5900                     	xdef	_TIM2_OC2PreloadConfig
5901                     	xdef	_TIM2_OC1PreloadConfig
5902                     	xdef	_TIM2_ARRPreloadConfig
5903                     	xdef	_TIM2_ForcedOC2Config
5904                     	xdef	_TIM2_ForcedOC1Config
5905                     	xdef	_TIM2_CounterModeConfig
5906                     	xdef	_TIM2_PrescalerConfig
5907                     	xdef	_TIM2_EncoderInterfaceConfig
5908                     	xdef	_TIM2_SelectMasterSlaveMode
5909                     	xdef	_TIM2_SelectSlaveMode
5910                     	xdef	_TIM2_SelectOutputTrigger
5911                     	xdef	_TIM2_SelectOnePulseMode
5912                     	xdef	_TIM2_SelectHallSensor
5913                     	xdef	_TIM2_UpdateRequestConfig
5914                     	xdef	_TIM2_UpdateDisableConfig
5915                     	xdef	_TIM2_SelectInputTrigger
5916                     	xdef	_TIM2_TIxExternalClockConfig
5917                     	xdef	_TIM2_ETRConfig
5918                     	xdef	_TIM2_ETRClockMode2Config
5919                     	xdef	_TIM2_ETRClockMode1Config
5920                     	xdef	_TIM2_InternalClockConfig
5921                     	xdef	_TIM2_DMACmd
5922                     	xdef	_TIM2_ITConfig
5923                     	xdef	_TIM2_CtrlPWMOutputs
5924                     	xdef	_TIM2_Cmd
5925                     	xdef	_TIM2_PWMIConfig
5926                     	xdef	_TIM2_ICInit
5927                     	xdef	_TIM2_BKRConfig
5928                     	xdef	_TIM2_OC2Init
5929                     	xdef	_TIM2_OC1Init
5930                     	xdef	_TIM2_TimeBaseInit
5931                     	xdef	_TIM2_DeInit
5950                     	end
