   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.19 - 04 Sep 2013
   3                     ; Generator (Limited) V4.3.11 - 04 Sep 2013
  46                     ; 40 INTERRUPT_HANDLER(NonHandledInterrupt,0)
  46                     ; 41 {
  47                     	switch	.text
  48  0000               f_NonHandledInterrupt:
  52  0000               L12:
  53                     ; 45   while (1);
  55  0000 20fe          	jra	L12
  77                     ; 55 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  77                     ; 56 {
  78                     	switch	.text
  79  0002               f_TRAP_IRQHandler:
  83  0002               L53:
  84                     ; 60   while (1);
  86  0002 20fe          	jra	L53
 108                     ; 70 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
 108                     ; 71 {
 109                     	switch	.text
 110  0004               f_FLASH_IRQHandler:
 114  0004               L15:
 115                     ; 75   while (1);
 117  0004 20fe          	jra	L15
 140                     ; 85 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler,2)
 140                     ; 86 {
 141                     	switch	.text
 142  0006               f_DMA1_CHANNEL0_1_IRQHandler:
 146  0006               L56:
 147                     ; 90   while (1);
 149  0006 20fe          	jra	L56
 172                     ; 100 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler,3)
 172                     ; 101 {
 173                     	switch	.text
 174  0008               f_DMA1_CHANNEL2_3_IRQHandler:
 178  0008               L101:
 179                     ; 105   while (1);
 181  0008 20fe          	jra	L101
 203                     ; 116 INTERRUPT_HANDLER(RTC_IRQHandler,4)
 203                     ; 117 {
 204                     	switch	.text
 205  000a               f_RTC_IRQHandler:
 209  000a               L511:
 210                     ; 121   while (1);
 212  000a 20fe          	jra	L511
 235                     ; 131 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler,5)
 235                     ; 132 {
 236                     	switch	.text
 237  000c               f_EXTIE_F_PVD_IRQHandler:
 241  000c               L131:
 242                     ; 136   while (1);
 244  000c 20fe          	jra	L131
 266                     ; 146 INTERRUPT_HANDLER(EXTIB_IRQHandler,6)
 266                     ; 147 {
 267                     	switch	.text
 268  000e               f_EXTIB_IRQHandler:
 272  000e               L541:
 273                     ; 151   while (1);
 275  000e 20fe          	jra	L541
 297                     ; 162 INTERRUPT_HANDLER(EXTID_IRQHandler,7)
 297                     ; 163 {
 298                     	switch	.text
 299  0010               f_EXTID_IRQHandler:
 303  0010               L161:
 304                     ; 167   while (1);
 306  0010 20fe          	jra	L161
 330                     ; 179 INTERRUPT_HANDLER(EXTI0_IRQHandler,8)
 330                     ; 180 {
 331                     	switch	.text
 332  0012               f_EXTI0_IRQHandler:
 334  0012 8a            	push	cc
 335  0013 84            	pop	a
 336  0014 a4bf          	and	a,#191
 337  0016 88            	push	a
 338  0017 86            	pop	cc
 339  0018 3b0002        	push	c_x+2
 340  001b be00          	ldw	x,c_x
 341  001d 89            	pushw	x
 342  001e 3b0002        	push	c_y+2
 343  0021 be00          	ldw	x,c_y
 344  0023 89            	pushw	x
 347                     ; 181 	readControlData();
 349  0024 cd0000        	call	_readControlData
 351                     ; 182 	EXTI_ClearITPendingBit(EXTI_IT_Pin0);
 353  0027 ae0001        	ldw	x,#1
 354  002a cd0000        	call	_EXTI_ClearITPendingBit
 356                     ; 183 }
 359  002d 85            	popw	x
 360  002e bf00          	ldw	c_y,x
 361  0030 320002        	pop	c_y+2
 362  0033 85            	popw	x
 363  0034 bf00          	ldw	c_x,x
 364  0036 320002        	pop	c_x+2
 365  0039 80            	iret
 387                     ; 192 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
 387                     ; 193 {
 388                     	switch	.text
 389  003a               f_EXTI1_IRQHandler:
 393  003a               L502:
 394                     ; 197    while (1);
 396  003a 20fe          	jra	L502
 418                     ; 210 INTERRUPT_HANDLER(EXTI2_IRQHandler,10)
 418                     ; 211 {
 419                     	switch	.text
 420  003c               f_EXTI2_IRQHandler:
 424  003c               L122:
 425                     ; 215   while (1);
 427  003c 20fe          	jra	L122
 449                     ; 226 INTERRUPT_HANDLER(EXTI3_IRQHandler,11)
 449                     ; 227 {
 450                     	switch	.text
 451  003e               f_EXTI3_IRQHandler:
 455  003e               L532:
 456                     ; 231   while (1);
 458  003e 20fe          	jra	L532
 480                     ; 242 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 480                     ; 243 {
 481                     	switch	.text
 482  0040               f_EXTI4_IRQHandler:
 486  0040               L152:
 487                     ; 247   while (1);
 489  0040 20fe          	jra	L152
 511                     ; 258 INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 511                     ; 259 {
 512                     	switch	.text
 513  0042               f_EXTI5_IRQHandler:
 517  0042               L562:
 518                     ; 263   while (1);
 520  0042 20fe          	jra	L562
 542                     ; 274 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 542                     ; 275 {// disableInterrupts();
 543                     	switch	.text
 544  0044               f_EXTI6_IRQHandler:
 548                     ; 282 }
 551  0044 80            	iret
 573                     ; 296 INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 573                     ; 297 {
 574                     	switch	.text
 575  0045               f_EXTI7_IRQHandler:
 579                     ; 325 }
 582  0045 80            	iret
 604                     ; 333 INTERRUPT_HANDLER(LCD_IRQHandler,16)
 604                     ; 334 {
 605                     	switch	.text
 606  0046               f_LCD_IRQHandler:
 610  0046               L123:
 611                     ; 338   while (1);
 613  0046 20fe          	jra	L123
 636                     ; 348 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 636                     ; 349 {
 637                     	switch	.text
 638  0048               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 642  0048               L533:
 643                     ; 353   while (1);
 645  0048 20fe          	jra	L533
 668                     ; 364 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 668                     ; 365 {
 669                     	switch	.text
 670  004a               f_ADC1_COMP_IRQHandler:
 674  004a               L153:
 675                     ; 369   while (1);
 677  004a 20fe          	jra	L153
 700                     ; 380 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_IRQHandler,19)
 700                     ; 381 {
 701                     	switch	.text
 702  004c               f_TIM2_UPD_OVF_TRG_BRK_IRQHandler:
 706  004c               L563:
 707                     ; 385   while (1);
 709  004c 20fe          	jra	L563
 732                     ; 396 INTERRUPT_HANDLER(TIM2_CAP_IRQHandler,20)
 732                     ; 397 {
 733                     	switch	.text
 734  004e               f_TIM2_CAP_IRQHandler:
 738  004e               L104:
 739                     ; 401   while (1);
 741  004e 20fe          	jra	L104
 764                     ; 413 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_IRQHandler,21)
 764                     ; 414 {
 765                     	switch	.text
 766  0050               f_TIM3_UPD_OVF_TRG_BRK_IRQHandler:
 770  0050               L514:
 771                     ; 418   while (1);
 773  0050 20fe          	jra	L514
 796                     ; 428 INTERRUPT_HANDLER(TIM3_CAP_IRQHandler,22)
 796                     ; 429 {
 797                     	switch	.text
 798  0052               f_TIM3_CAP_IRQHandler:
 802  0052               L134:
 803                     ; 433   while (1);
 805  0052 20fe          	jra	L134
 828                     ; 443 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
 828                     ; 444 {
 829                     	switch	.text
 830  0054               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 834  0054               L544:
 835                     ; 448   while (1);
 837  0054 20fe          	jra	L544
 860                     ; 458 INTERRUPT_HANDLER(TIM1_CAP_IRQHandler,24)
 860                     ; 459 {
 861                     	switch	.text
 862  0056               f_TIM1_CAP_IRQHandler:
 866  0056               L164:
 867                     ; 463   while (1);
 869  0056 20fe          	jra	L164
 892                     ; 474 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
 892                     ; 475 {
 893                     	switch	.text
 894  0058               f_TIM4_UPD_OVF_TRG_IRQHandler:
 898  0058               L574:
 899                     ; 480 	while (1);
 901  0058 20fe          	jra	L574
 923                     ; 490 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
 923                     ; 491 {
 924                     	switch	.text
 925  005a               f_SPI1_IRQHandler:
 929  005a               L115:
 930                     ; 495   while (1);
 932  005a 20fe          	jra	L115
 955                     ; 506 INTERRUPT_HANDLER(USART1_TX_IRQHandler,27)
 955                     ; 507 {
 956                     	switch	.text
 957  005c               f_USART1_TX_IRQHandler:
 961  005c               L525:
 962                     ; 511   while (1);
 964  005c 20fe          	jra	L525
 987                     ; 522 INTERRUPT_HANDLER(USART1_RX_IRQHandler,28)
 987                     ; 523 {
 988                     	switch	.text
 989  005e               f_USART1_RX_IRQHandler:
 993  005e               L145:
 994                     ; 527   while (1);
 996  005e 20fe          	jra	L145
1018                     ; 538 INTERRUPT_HANDLER(I2C1_IRQHandler,29)
1018                     ; 539 {
1019                     	switch	.text
1020  0060               f_I2C1_IRQHandler:
1024  0060               L555:
1025                     ; 543   while (1);
1027  0060 20fe          	jra	L555
1039                     	xref	_readControlData
1040                     	xdef	f_I2C1_IRQHandler
1041                     	xdef	f_USART1_RX_IRQHandler
1042                     	xdef	f_USART1_TX_IRQHandler
1043                     	xdef	f_SPI1_IRQHandler
1044                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1045                     	xdef	f_TIM1_CAP_IRQHandler
1046                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1047                     	xdef	f_TIM3_CAP_IRQHandler
1048                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_IRQHandler
1049                     	xdef	f_TIM2_CAP_IRQHandler
1050                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_IRQHandler
1051                     	xdef	f_ADC1_COMP_IRQHandler
1052                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1053                     	xdef	f_LCD_IRQHandler
1054                     	xdef	f_EXTI7_IRQHandler
1055                     	xdef	f_EXTI6_IRQHandler
1056                     	xdef	f_EXTI5_IRQHandler
1057                     	xdef	f_EXTI4_IRQHandler
1058                     	xdef	f_EXTI3_IRQHandler
1059                     	xdef	f_EXTI2_IRQHandler
1060                     	xdef	f_EXTI1_IRQHandler
1061                     	xdef	f_EXTI0_IRQHandler
1062                     	xdef	f_EXTID_IRQHandler
1063                     	xdef	f_EXTIB_IRQHandler
1064                     	xdef	f_EXTIE_F_PVD_IRQHandler
1065                     	xdef	f_RTC_IRQHandler
1066                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1067                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1068                     	xdef	f_FLASH_IRQHandler
1069                     	xdef	f_TRAP_IRQHandler
1070                     	xdef	f_NonHandledInterrupt
1071                     	xref	_EXTI_ClearITPendingBit
1072                     	xref.b	c_x
1073                     	xref.b	c_y
1092                     	end
