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
 581                     ; 302 INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 581                     ; 303 {
 582                     	switch	.text
 583  0048               f_EXTI7_IRQHandler:
 585  0048 8a            	push	cc
 586  0049 84            	pop	a
 587  004a a4bf          	and	a,#191
 588  004c 88            	push	a
 589  004d 86            	pop	cc
 590  004e 3b0002        	push	c_x+2
 591  0051 be00          	ldw	x,c_x
 592  0053 89            	pushw	x
 593  0054 3b0002        	push	c_y+2
 594  0057 be00          	ldw	x,c_y
 595  0059 89            	pushw	x
 598                     ; 306   if ((GPIOC->IDR & USER_GPIO_PIN) == 0x0) 
 600  005a c6500b        	ld	a,20491
 601  005d a580          	bcp	a,#128
 602  005f 261f          	jrne	L123
 603                     ; 310 		switch (state_machine)
 605  0061 b600          	ld	a,_state_machine
 607                     ; 323 			break;
 608  0063 4d            	tnz	a
 609  0064 2716          	jreq	L503
 610  0066 4a            	dec	a
 611  0067 2709          	jreq	L103
 612  0069 4a            	dec	a
 613  006a 270c          	jreq	L303
 614  006c               L703:
 615                     ; 321 			default : 
 615                     ; 322 				state_machine = STATE_VREF;
 617  006c 35010000      	mov	_state_machine,#1
 618                     ; 323 			break;
 620  0070 200e          	jra	L123
 621  0072               L103:
 622                     ; 312 			case STATE_VREF: 
 622                     ; 313 				state_machine = STATE_TEMPMEAS;
 624  0072 35020000      	mov	_state_machine,#2
 625                     ; 314 			break;
 627  0076 2008          	jra	L123
 628  0078               L303:
 629                     ; 315 			case STATE_TEMPMEAS: 
 629                     ; 316 				state_machine = STATE_CHECKNDEFMESSAGE;
 631  0078 3f00          	clr	_state_machine
 632                     ; 317 			break;
 634  007a 2004          	jra	L123
 635  007c               L503:
 636                     ; 318 			case STATE_CHECKNDEFMESSAGE: 
 636                     ; 319 				state_machine = STATE_VREF;
 638  007c 35010000      	mov	_state_machine,#1
 639                     ; 320 			break;
 641  0080               L523:
 642  0080               L123:
 643                     ; 327   EEMenuState = state_machine;
 645  0080 b600          	ld	a,_state_machine
 646  0082 ae0000        	ldw	x,#_EEMenuState
 647  0085 cd0000        	call	c_eewrc
 649                     ; 328   EXTI_ClearITPendingBit(EXTI_IT_Pin7);
 651  0088 ae0080        	ldw	x,#128
 652  008b cd0000        	call	_EXTI_ClearITPendingBit
 654                     ; 331 }
 657  008e 85            	popw	x
 658  008f bf00          	ldw	c_y,x
 659  0091 320002        	pop	c_y+2
 660  0094 85            	popw	x
 661  0095 bf00          	ldw	c_x,x
 662  0097 320002        	pop	c_x+2
 663  009a 80            	iret
 685                     ; 339 INTERRUPT_HANDLER(LCD_IRQHandler,16)
 685                     ; 340 {
 686                     	switch	.text
 687  009b               f_LCD_IRQHandler:
 691  009b               L733:
 692                     ; 344   while (1);
 694  009b 20fe          	jra	L733
 717                     ; 354 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 717                     ; 355 {
 718                     	switch	.text
 719  009d               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 723  009d               L353:
 724                     ; 359   while (1);
 726  009d 20fe          	jra	L353
 749                     ; 370 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 749                     ; 371 {
 750                     	switch	.text
 751  009f               f_ADC1_COMP_IRQHandler:
 755  009f               L763:
 756                     ; 375   while (1);
 758  009f 20fe          	jra	L763
 781                     ; 386 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_IRQHandler,19)
 781                     ; 387 {
 782                     	switch	.text
 783  00a1               f_TIM2_UPD_OVF_TRG_BRK_IRQHandler:
 787  00a1               L304:
 788                     ; 391   while (1);
 790  00a1 20fe          	jra	L304
 813                     ; 402 INTERRUPT_HANDLER(TIM2_CAP_IRQHandler,20)
 813                     ; 403 {
 814                     	switch	.text
 815  00a3               f_TIM2_CAP_IRQHandler:
 819  00a3               L714:
 820                     ; 407   while (1);
 822  00a3 20fe          	jra	L714
 845                     ; 419 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_IRQHandler,21)
 845                     ; 420 {
 846                     	switch	.text
 847  00a5               f_TIM3_UPD_OVF_TRG_BRK_IRQHandler:
 851  00a5               L334:
 852                     ; 424   while (1);
 854  00a5 20fe          	jra	L334
 877                     ; 434 INTERRUPT_HANDLER(TIM3_CAP_IRQHandler,22)
 877                     ; 435 {
 878                     	switch	.text
 879  00a7               f_TIM3_CAP_IRQHandler:
 883  00a7               L744:
 884                     ; 439   while (1);
 886  00a7 20fe          	jra	L744
 909                     ; 449 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
 909                     ; 450 {
 910                     	switch	.text
 911  00a9               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 915  00a9               L364:
 916                     ; 454   while (1);
 918  00a9 20fe          	jra	L364
 941                     ; 464 INTERRUPT_HANDLER(TIM1_CAP_IRQHandler,24)
 941                     ; 465 {
 942                     	switch	.text
 943  00ab               f_TIM1_CAP_IRQHandler:
 947  00ab               L774:
 948                     ; 469   while (1);
 950  00ab 20fe          	jra	L774
 973                     ; 480 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
 973                     ; 481 {
 974                     	switch	.text
 975  00ad               f_TIM4_UPD_OVF_TRG_IRQHandler:
 979  00ad               L315:
 980                     ; 486 	while (1);
 982  00ad 20fe          	jra	L315
1004                     ; 496 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
1004                     ; 497 {
1005                     	switch	.text
1006  00af               f_SPI1_IRQHandler:
1010  00af               L725:
1011                     ; 501   while (1);
1013  00af 20fe          	jra	L725
1036                     ; 512 INTERRUPT_HANDLER(USART1_TX_IRQHandler,27)
1036                     ; 513 {
1037                     	switch	.text
1038  00b1               f_USART1_TX_IRQHandler:
1042  00b1               L345:
1043                     ; 517   while (1);
1045  00b1 20fe          	jra	L345
1068                     ; 528 INTERRUPT_HANDLER(USART1_RX_IRQHandler,28)
1068                     ; 529 {
1069                     	switch	.text
1070  00b3               f_USART1_RX_IRQHandler:
1074  00b3               L755:
1075                     ; 533   while (1);
1077  00b3 20fe          	jra	L755
1099                     ; 544 INTERRUPT_HANDLER(I2C1_IRQHandler,29)
1099                     ; 545 {
1100                     	switch	.text
1101  00b5               f_I2C1_IRQHandler:
1105  00b5               L375:
1106                     ; 549   while (1);
1108  00b5 20fe          	jra	L375
1120                     	xref	_writeControlData
1121                     	xref	_readControlData
1122                     	xref	_EEMenuState
1123                     	xref.b	_state_machine
1124                     	xdef	f_I2C1_IRQHandler
1125                     	xdef	f_USART1_RX_IRQHandler
1126                     	xdef	f_USART1_TX_IRQHandler
1127                     	xdef	f_SPI1_IRQHandler
1128                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1129                     	xdef	f_TIM1_CAP_IRQHandler
1130                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1131                     	xdef	f_TIM3_CAP_IRQHandler
1132                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_IRQHandler
1133                     	xdef	f_TIM2_CAP_IRQHandler
1134                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_IRQHandler
1135                     	xdef	f_ADC1_COMP_IRQHandler
1136                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1137                     	xdef	f_LCD_IRQHandler
1138                     	xdef	f_EXTI7_IRQHandler
1139                     	xdef	f_EXTI6_IRQHandler
1140                     	xdef	f_EXTI5_IRQHandler
1141                     	xdef	f_EXTI4_IRQHandler
1142                     	xdef	f_EXTI3_IRQHandler
1143                     	xdef	f_EXTI2_IRQHandler
1144                     	xdef	f_EXTI1_IRQHandler
1145                     	xdef	f_EXTI0_IRQHandler
1146                     	xdef	f_EXTID_IRQHandler
1147                     	xdef	f_EXTIB_IRQHandler
1148                     	xdef	f_EXTIE_F_PVD_IRQHandler
1149                     	xdef	f_RTC_IRQHandler
1150                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1151                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1152                     	xdef	f_FLASH_IRQHandler
1153                     	xdef	f_TRAP_IRQHandler
1154                     	xdef	f_NonHandledInterrupt
1155                     	xref	_EXTI_ClearITPendingBit
1156                     	xref.b	c_x
1157                     	xref.b	c_y
1176                     	xref	c_eewrc
1177                     	end
