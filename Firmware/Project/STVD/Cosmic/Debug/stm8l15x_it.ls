   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.19 - 04 Sep 2013
   3                     ; Generator (Limited) V4.3.11 - 04 Sep 2013
  46                     ; 41 INTERRUPT_HANDLER(NonHandledInterrupt,0)
  46                     ; 42 {
  47                     	switch	.text
  48  0000               f_NonHandledInterrupt:
  52  0000               L12:
  53                     ; 46   while (1);
  55  0000 20fe          	jra	L12
  77                     ; 56 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  77                     ; 57 {
  78                     	switch	.text
  79  0002               f_TRAP_IRQHandler:
  83  0002               L53:
  84                     ; 61   while (1);
  86  0002 20fe          	jra	L53
 108                     ; 71 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
 108                     ; 72 {
 109                     	switch	.text
 110  0004               f_FLASH_IRQHandler:
 114  0004               L15:
 115                     ; 76   while (1);
 117  0004 20fe          	jra	L15
 140                     ; 86 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler,2)
 140                     ; 87 {
 141                     	switch	.text
 142  0006               f_DMA1_CHANNEL0_1_IRQHandler:
 146  0006               L56:
 147                     ; 91   while (1);
 149  0006 20fe          	jra	L56
 172                     ; 101 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler,3)
 172                     ; 102 {
 173                     	switch	.text
 174  0008               f_DMA1_CHANNEL2_3_IRQHandler:
 178  0008               L101:
 179                     ; 106   while (1);
 181  0008 20fe          	jra	L101
 203                     ; 117 INTERRUPT_HANDLER(RTC_IRQHandler,4)
 203                     ; 118 {
 204                     	switch	.text
 205  000a               f_RTC_IRQHandler:
 209  000a               L511:
 210                     ; 122   while (1);
 212  000a 20fe          	jra	L511
 235                     ; 132 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler,5)
 235                     ; 133 {
 236                     	switch	.text
 237  000c               f_EXTIE_F_PVD_IRQHandler:
 241  000c               L131:
 242                     ; 137   while (1);
 244  000c 20fe          	jra	L131
 266                     ; 147 INTERRUPT_HANDLER(EXTIB_IRQHandler,6)
 266                     ; 148 {
 267                     	switch	.text
 268  000e               f_EXTIB_IRQHandler:
 272  000e               L541:
 273                     ; 152   while (1);
 275  000e 20fe          	jra	L541
 297                     ; 163 INTERRUPT_HANDLER(EXTID_IRQHandler,7)
 297                     ; 164 {
 298                     	switch	.text
 299  0010               f_EXTID_IRQHandler:
 303  0010               L161:
 304                     ; 168   while (1);
 306  0010 20fe          	jra	L161
 331                     ; 180 INTERRUPT_HANDLER(EXTI0_IRQHandler,8)
 331                     ; 181 {
 332                     	switch	.text
 333  0012               f_EXTI0_IRQHandler:
 335  0012 8a            	push	cc
 336  0013 84            	pop	a
 337  0014 a4bf          	and	a,#191
 338  0016 88            	push	a
 339  0017 86            	pop	cc
 340  0018 3b0002        	push	c_x+2
 341  001b be00          	ldw	x,c_x
 342  001d 89            	pushw	x
 343  001e 3b0002        	push	c_y+2
 344  0021 be00          	ldw	x,c_y
 345  0023 89            	pushw	x
 348                     ; 185 	readControlData();
 350  0024 cd0000        	call	_readControlData
 352                     ; 186 	writeControlData();
 354  0027 cd0000        	call	_writeControlData
 356                     ; 188 	EXTI_ClearITPendingBit(EXTI_IT_Pin0);
 358  002a ae0001        	ldw	x,#1
 359  002d cd0000        	call	_EXTI_ClearITPendingBit
 361                     ; 189 }
 364  0030 85            	popw	x
 365  0031 bf00          	ldw	c_y,x
 366  0033 320002        	pop	c_y+2
 367  0036 85            	popw	x
 368  0037 bf00          	ldw	c_x,x
 369  0039 320002        	pop	c_x+2
 370  003c 80            	iret
 392                     ; 198 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
 392                     ; 199 {
 393                     	switch	.text
 394  003d               f_EXTI1_IRQHandler:
 398  003d               L502:
 399                     ; 203    while (1);
 401  003d 20fe          	jra	L502
 423                     ; 216 INTERRUPT_HANDLER(EXTI2_IRQHandler,10)
 423                     ; 217 {
 424                     	switch	.text
 425  003f               f_EXTI2_IRQHandler:
 429  003f               L122:
 430                     ; 221   while (1);
 432  003f 20fe          	jra	L122
 454                     ; 232 INTERRUPT_HANDLER(EXTI3_IRQHandler,11)
 454                     ; 233 {
 455                     	switch	.text
 456  0041               f_EXTI3_IRQHandler:
 460  0041               L532:
 461                     ; 237   while (1);
 463  0041 20fe          	jra	L532
 485                     ; 248 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 485                     ; 249 {
 486                     	switch	.text
 487  0043               f_EXTI4_IRQHandler:
 491  0043               L152:
 492                     ; 253   while (1);
 494  0043 20fe          	jra	L152
 516                     ; 264 INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 516                     ; 265 {
 517                     	switch	.text
 518  0045               f_EXTI5_IRQHandler:
 522  0045               L562:
 523                     ; 269   while (1);
 525  0045 20fe          	jra	L562
 547                     ; 280 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 547                     ; 281 {// disableInterrupts();
 548                     	switch	.text
 549  0047               f_EXTI6_IRQHandler:
 553                     ; 288 }
 556  0047 80            	iret
 578                     ; 302 INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 578                     ; 303 {
 579                     	switch	.text
 580  0048               f_EXTI7_IRQHandler:
 584                     ; 331 }
 587  0048 80            	iret
 609                     ; 339 INTERRUPT_HANDLER(LCD_IRQHandler,16)
 609                     ; 340 {
 610                     	switch	.text
 611  0049               f_LCD_IRQHandler:
 615  0049               L123:
 616                     ; 344   while (1);
 618  0049 20fe          	jra	L123
 641                     ; 354 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 641                     ; 355 {
 642                     	switch	.text
 643  004b               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 647  004b               L533:
 648                     ; 359   while (1);
 650  004b 20fe          	jra	L533
 673                     ; 370 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 673                     ; 371 {
 674                     	switch	.text
 675  004d               f_ADC1_COMP_IRQHandler:
 679  004d               L153:
 680                     ; 375   while (1);
 682  004d 20fe          	jra	L153
 705                     ; 386 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_IRQHandler,19)
 705                     ; 387 {
 706                     	switch	.text
 707  004f               f_TIM2_UPD_OVF_TRG_BRK_IRQHandler:
 711  004f               L563:
 712                     ; 391   while (1);
 714  004f 20fe          	jra	L563
 737                     ; 402 INTERRUPT_HANDLER(TIM2_CAP_IRQHandler,20)
 737                     ; 403 {
 738                     	switch	.text
 739  0051               f_TIM2_CAP_IRQHandler:
 743  0051               L104:
 744                     ; 407   while (1);
 746  0051 20fe          	jra	L104
 769                     ; 419 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_IRQHandler,21)
 769                     ; 420 {
 770                     	switch	.text
 771  0053               f_TIM3_UPD_OVF_TRG_BRK_IRQHandler:
 775  0053               L514:
 776                     ; 424   while (1);
 778  0053 20fe          	jra	L514
 801                     ; 434 INTERRUPT_HANDLER(TIM3_CAP_IRQHandler,22)
 801                     ; 435 {
 802                     	switch	.text
 803  0055               f_TIM3_CAP_IRQHandler:
 807  0055               L134:
 808                     ; 439   while (1);
 810  0055 20fe          	jra	L134
 833                     ; 449 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
 833                     ; 450 {
 834                     	switch	.text
 835  0057               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 839  0057               L544:
 840                     ; 454   while (1);
 842  0057 20fe          	jra	L544
 865                     ; 464 INTERRUPT_HANDLER(TIM1_CAP_IRQHandler,24)
 865                     ; 465 {
 866                     	switch	.text
 867  0059               f_TIM1_CAP_IRQHandler:
 871  0059               L164:
 872                     ; 469   while (1);
 874  0059 20fe          	jra	L164
 897                     ; 480 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
 897                     ; 481 {
 898                     	switch	.text
 899  005b               f_TIM4_UPD_OVF_TRG_IRQHandler:
 903  005b               L574:
 904                     ; 486 	while (1);
 906  005b 20fe          	jra	L574
 928                     ; 496 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
 928                     ; 497 {
 929                     	switch	.text
 930  005d               f_SPI1_IRQHandler:
 934  005d               L115:
 935                     ; 501   while (1);
 937  005d 20fe          	jra	L115
 960                     ; 512 INTERRUPT_HANDLER(USART1_TX_IRQHandler,27)
 960                     ; 513 {
 961                     	switch	.text
 962  005f               f_USART1_TX_IRQHandler:
 966  005f               L525:
 967                     ; 517   while (1);
 969  005f 20fe          	jra	L525
 992                     ; 528 INTERRUPT_HANDLER(USART1_RX_IRQHandler,28)
 992                     ; 529 {
 993                     	switch	.text
 994  0061               f_USART1_RX_IRQHandler:
 998  0061               L145:
 999                     ; 533   while (1);
1001  0061 20fe          	jra	L145
1023                     ; 544 INTERRUPT_HANDLER(I2C1_IRQHandler,29)
1023                     ; 545 {
1024                     	switch	.text
1025  0063               f_I2C1_IRQHandler:
1029  0063               L555:
1030                     ; 549   while (1);
1032  0063 20fe          	jra	L555
1044                     	xref	_writeControlData
1045                     	xref	_readControlData
1046                     	xdef	f_I2C1_IRQHandler
1047                     	xdef	f_USART1_RX_IRQHandler
1048                     	xdef	f_USART1_TX_IRQHandler
1049                     	xdef	f_SPI1_IRQHandler
1050                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1051                     	xdef	f_TIM1_CAP_IRQHandler
1052                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1053                     	xdef	f_TIM3_CAP_IRQHandler
1054                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_IRQHandler
1055                     	xdef	f_TIM2_CAP_IRQHandler
1056                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_IRQHandler
1057                     	xdef	f_ADC1_COMP_IRQHandler
1058                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1059                     	xdef	f_LCD_IRQHandler
1060                     	xdef	f_EXTI7_IRQHandler
1061                     	xdef	f_EXTI6_IRQHandler
1062                     	xdef	f_EXTI5_IRQHandler
1063                     	xdef	f_EXTI4_IRQHandler
1064                     	xdef	f_EXTI3_IRQHandler
1065                     	xdef	f_EXTI2_IRQHandler
1066                     	xdef	f_EXTI1_IRQHandler
1067                     	xdef	f_EXTI0_IRQHandler
1068                     	xdef	f_EXTID_IRQHandler
1069                     	xdef	f_EXTIB_IRQHandler
1070                     	xdef	f_EXTIE_F_PVD_IRQHandler
1071                     	xdef	f_RTC_IRQHandler
1072                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1073                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1074                     	xdef	f_FLASH_IRQHandler
1075                     	xdef	f_TRAP_IRQHandler
1076                     	xdef	f_NonHandledInterrupt
1077                     	xref	_EXTI_ClearITPendingBit
1078                     	xref.b	c_x
1079                     	xref.b	c_y
1098                     	end
