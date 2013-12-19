   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.19 - 04 Sep 2013
   3                     ; Generator (Limited) V4.3.11 - 04 Sep 2013
  45                     ; 44 uint8_t ITC_GetCPUCC(void)
  45                     ; 45 {
  47                     	switch	.text
  48  0000               _ITC_GetCPUCC:
  52                     ; 47   _asm("push cc");
  55  0000 8a            push cc
  57                     ; 48   _asm("pop a");
  60  0001 84            pop a
  62                     ; 49   return; /* Ignore compiler warning, the returned value is in A register */
  65  0002 81            	ret
  88                     ; 72 void ITC_DeInit(void)
  88                     ; 73 {
  89                     	switch	.text
  90  0003               _ITC_DeInit:
  94                     ; 74   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  96  0003 35ff7f70      	mov	32624,#255
  97                     ; 75   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  99  0007 35ff7f71      	mov	32625,#255
 100                     ; 76   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 102  000b 35ff7f72      	mov	32626,#255
 103                     ; 77   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 105  000f 35ff7f73      	mov	32627,#255
 106                     ; 78   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 108  0013 35ff7f74      	mov	32628,#255
 109                     ; 79   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 111  0017 35ff7f75      	mov	32629,#255
 112                     ; 80   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 114  001b 35ff7f76      	mov	32630,#255
 115                     ; 81   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 117  001f 35ff7f77      	mov	32631,#255
 118                     ; 82 }
 121  0023 81            	ret
 146                     ; 89 uint8_t ITC_GetSoftIntStatus(void)
 146                     ; 90 {
 147                     	switch	.text
 148  0024               _ITC_GetSoftIntStatus:
 152                     ; 91   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 154  0024 adda          	call	_ITC_GetCPUCC
 156  0026 a428          	and	a,#40
 159  0028 81            	ret
 468                     .const:	section	.text
 469  0000               L22:
 470  0000 004d          	dc.w	L14
 471  0002 004d          	dc.w	L14
 472  0004 004d          	dc.w	L14
 473  0006 0056          	dc.w	L34
 474  0008 0056          	dc.w	L34
 475  000a 0056          	dc.w	L34
 476  000c 0056          	dc.w	L34
 477  000e 005f          	dc.w	L54
 478  0010 005f          	dc.w	L54
 479  0012 005f          	dc.w	L54
 480  0014 005f          	dc.w	L54
 481  0016 0068          	dc.w	L74
 482  0018 0068          	dc.w	L74
 483  001a 0068          	dc.w	L74
 484  001c 0068          	dc.w	L74
 485  001e 0071          	dc.w	L15
 486  0020 0071          	dc.w	L15
 487  0022 0071          	dc.w	L15
 488  0024 0071          	dc.w	L15
 489  0026 007a          	dc.w	L35
 490  0028 007a          	dc.w	L35
 491  002a 007a          	dc.w	L35
 492  002c 007a          	dc.w	L35
 493  002e 0083          	dc.w	L55
 494  0030 0083          	dc.w	L55
 495  0032 0083          	dc.w	L55
 496  0034 0083          	dc.w	L55
 497  0036 008c          	dc.w	L75
 498  0038 008c          	dc.w	L75
 499                     ; 99 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 499                     ; 100 {
 500                     	switch	.text
 501  0029               _ITC_GetSoftwarePriority:
 503  0029 88            	push	a
 504  002a 89            	pushw	x
 505       00000002      OFST:	set	2
 508                     ; 101   uint8_t Value = 0;
 510  002b 0f02          	clr	(OFST+0,sp)
 511                     ; 102   uint8_t Mask = 0;
 513                     ; 105   assert_param(IS_ITC_IRQ(IRQn));
 515                     ; 108   Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
 517  002d a403          	and	a,#3
 518  002f 48            	sll	a
 519  0030 5f            	clrw	x
 520  0031 97            	ld	xl,a
 521  0032 a603          	ld	a,#3
 522  0034 5d            	tnzw	x
 523  0035 2704          	jreq	L41
 524  0037               L61:
 525  0037 48            	sll	a
 526  0038 5a            	decw	x
 527  0039 26fc          	jrne	L61
 528  003b               L41:
 529  003b 6b01          	ld	(OFST-1,sp),a
 530                     ; 110   switch (IRQn)
 532  003d 7b03          	ld	a,(OFST+1,sp)
 534                     ; 192     default:
 534                     ; 193       break;
 535  003f 4a            	dec	a
 536  0040 a11d          	cp	a,#29
 537  0042 2407          	jruge	L02
 538  0044 5f            	clrw	x
 539  0045 97            	ld	xl,a
 540  0046 58            	sllw	x
 541  0047 de0000        	ldw	x,(L22,x)
 542  004a fc            	jp	(x)
 543  004b               L02:
 544  004b 2046          	jra	L522
 545  004d               L14:
 546                     ; 112     case FLASH_IRQn:
 546                     ; 113     case DMA1_CHANNEL0_1_IRQn:
 546                     ; 114     case DMA1_CHANNEL2_3_IRQn:
 546                     ; 115       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 548  004d c67f70        	ld	a,32624
 549  0050 1401          	and	a,(OFST-1,sp)
 550  0052 6b02          	ld	(OFST+0,sp),a
 551                     ; 116       break;
 553  0054 203d          	jra	L522
 554  0056               L34:
 555                     ; 118     case EXTIE_F_PVD_IRQn:
 555                     ; 119 #ifdef STM8L15X_MD
 555                     ; 120     case RTC_IRQn:
 555                     ; 121     case EXTIB_IRQn:
 555                     ; 122     case EXTID_IRQn:
 555                     ; 123 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 555                     ; 124     case RTC_CSSLSE_IRQn:
 555                     ; 125     case EXTIB_G_IRQn:
 555                     ; 126     case EXTID_H_IRQn:
 555                     ; 127 #endif  /* STM8L15X_MD */
 555                     ; 128       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 557  0056 c67f71        	ld	a,32625
 558  0059 1401          	and	a,(OFST-1,sp)
 559  005b 6b02          	ld	(OFST+0,sp),a
 560                     ; 129       break;
 562  005d 2034          	jra	L522
 563  005f               L54:
 564                     ; 131     case EXTI0_IRQn:
 564                     ; 132     case EXTI1_IRQn:
 564                     ; 133     case EXTI2_IRQn:
 564                     ; 134     case EXTI3_IRQn:
 564                     ; 135       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 566  005f c67f72        	ld	a,32626
 567  0062 1401          	and	a,(OFST-1,sp)
 568  0064 6b02          	ld	(OFST+0,sp),a
 569                     ; 136       break;
 571  0066 202b          	jra	L522
 572  0068               L74:
 573                     ; 138     case EXTI4_IRQn:
 573                     ; 139     case EXTI5_IRQn:
 573                     ; 140     case EXTI6_IRQn:
 573                     ; 141     case EXTI7_IRQn:
 573                     ; 142       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 575  0068 c67f73        	ld	a,32627
 576  006b 1401          	and	a,(OFST-1,sp)
 577  006d 6b02          	ld	(OFST+0,sp),a
 578                     ; 143       break;
 580  006f 2022          	jra	L522
 581  0071               L15:
 582                     ; 146     case SWITCH_CSS_BREAK_DAC_IRQn:
 582                     ; 147     case ADC1_COMP_IRQn:
 582                     ; 148 #ifdef STM8L15X_MD
 582                     ; 149     case LCD_IRQn:
 582                     ; 150     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 582                     ; 151 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 582                     ; 152     case LCD_AES_IRQn:
 582                     ; 153     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 582                     ; 154 #endif  /* STM8L15X_MD */
 582                     ; 155       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 584  0071 c67f74        	ld	a,32628
 585  0074 1401          	and	a,(OFST-1,sp)
 586  0076 6b02          	ld	(OFST+0,sp),a
 587                     ; 156       break;
 589  0078 2019          	jra	L522
 590  007a               L35:
 591                     ; 158     case TIM1_UPD_OVF_TRG_IRQn:
 591                     ; 159 #ifdef STM8L15X_MD
 591                     ; 160     case TIM2_CC_IRQn:
 591                     ; 161     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 591                     ; 162     case TIM3_CC_IRQn:
 591                     ; 163 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 591                     ; 164     case TIM2_CC_USART2_RX_IRQn:
 591                     ; 165     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 591                     ; 166     case TIM3_CC_USART3_RX_IRQn:
 591                     ; 167 #endif  /* STM8L15X_MD */
 591                     ; 168       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 593  007a c67f75        	ld	a,32629
 594  007d 1401          	and	a,(OFST-1,sp)
 595  007f 6b02          	ld	(OFST+0,sp),a
 596                     ; 169       break;
 598  0081 2010          	jra	L522
 599  0083               L55:
 600                     ; 171     case TIM1_CC_IRQn:
 600                     ; 172     case TIM4_UPD_OVF_TRG_IRQn:
 600                     ; 173     case SPI1_IRQn:
 600                     ; 174 #ifdef STM8L15X_MD
 600                     ; 175     case USART1_TX_IRQn:
 600                     ; 176 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 600                     ; 177     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 600                     ; 178 #endif  /* STM8L15X_MD */
 600                     ; 179       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 602  0083 c67f76        	ld	a,32630
 603  0086 1401          	and	a,(OFST-1,sp)
 604  0088 6b02          	ld	(OFST+0,sp),a
 605                     ; 180       break;
 607  008a 2007          	jra	L522
 608  008c               L75:
 609                     ; 183     case USART1_RX_IRQn:
 609                     ; 184     case I2C1_IRQn:
 609                     ; 185 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 609                     ; 186     case USART1_RX_TIM5_CC_IRQn:
 609                     ; 187     case I2C1_SPI2_IRQn:
 609                     ; 188 #endif  /* STM8L15X_MD */
 609                     ; 189       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 611  008c c67f77        	ld	a,32631
 612  008f 1401          	and	a,(OFST-1,sp)
 613  0091 6b02          	ld	(OFST+0,sp),a
 614                     ; 190       break;
 616  0093               L16:
 617                     ; 192     default:
 617                     ; 193       break;
 619  0093               L522:
 620                     ; 196   Value >>= (uint8_t)((IRQn % 4u) * 2u);
 622  0093 7b03          	ld	a,(OFST+1,sp)
 623  0095 a403          	and	a,#3
 624  0097 48            	sll	a
 625  0098 5f            	clrw	x
 626  0099 97            	ld	xl,a
 627  009a 7b02          	ld	a,(OFST+0,sp)
 628  009c 5d            	tnzw	x
 629  009d 2704          	jreq	L42
 630  009f               L62:
 631  009f 44            	srl	a
 632  00a0 5a            	decw	x
 633  00a1 26fc          	jrne	L62
 634  00a3               L42:
 635  00a3 6b02          	ld	(OFST+0,sp),a
 636                     ; 198   return((ITC_PriorityLevel_TypeDef)Value);
 638  00a5 7b02          	ld	a,(OFST+0,sp)
 641  00a7 5b03          	addw	sp,#3
 642  00a9 81            	ret
 706                     	switch	.const
 707  003a               L44:
 708  003a 00e2          	dc.w	L722
 709  003c 00e2          	dc.w	L722
 710  003e 00e2          	dc.w	L722
 711  0040 00f4          	dc.w	L132
 712  0042 00f4          	dc.w	L132
 713  0044 00f4          	dc.w	L132
 714  0046 00f4          	dc.w	L132
 715  0048 0106          	dc.w	L332
 716  004a 0106          	dc.w	L332
 717  004c 0106          	dc.w	L332
 718  004e 0106          	dc.w	L332
 719  0050 0118          	dc.w	L532
 720  0052 0118          	dc.w	L532
 721  0054 0118          	dc.w	L532
 722  0056 0118          	dc.w	L532
 723  0058 012a          	dc.w	L732
 724  005a 012a          	dc.w	L732
 725  005c 012a          	dc.w	L732
 726  005e 012a          	dc.w	L732
 727  0060 013c          	dc.w	L142
 728  0062 013c          	dc.w	L142
 729  0064 013c          	dc.w	L142
 730  0066 013c          	dc.w	L142
 731  0068 014e          	dc.w	L342
 732  006a 014e          	dc.w	L342
 733  006c 014e          	dc.w	L342
 734  006e 014e          	dc.w	L342
 735  0070 0160          	dc.w	L542
 736  0072 0160          	dc.w	L542
 737                     ; 215 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 737                     ; 216 {
 738                     	switch	.text
 739  00aa               _ITC_SetSoftwarePriority:
 741  00aa 89            	pushw	x
 742  00ab 89            	pushw	x
 743       00000002      OFST:	set	2
 746                     ; 217   uint8_t Mask = 0;
 748                     ; 218   uint8_t NewPriority = 0;
 750                     ; 221   assert_param(IS_ITC_IRQ(IRQn));
 752                     ; 222   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 754                     ; 225   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 756                     ; 229   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 758  00ac 9e            	ld	a,xh
 759  00ad a403          	and	a,#3
 760  00af 48            	sll	a
 761  00b0 5f            	clrw	x
 762  00b1 97            	ld	xl,a
 763  00b2 a603          	ld	a,#3
 764  00b4 5d            	tnzw	x
 765  00b5 2704          	jreq	L23
 766  00b7               L43:
 767  00b7 48            	sll	a
 768  00b8 5a            	decw	x
 769  00b9 26fc          	jrne	L43
 770  00bb               L23:
 771  00bb 43            	cpl	a
 772  00bc 6b01          	ld	(OFST-1,sp),a
 773                     ; 231   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 775  00be 7b03          	ld	a,(OFST+1,sp)
 776  00c0 a403          	and	a,#3
 777  00c2 48            	sll	a
 778  00c3 5f            	clrw	x
 779  00c4 97            	ld	xl,a
 780  00c5 7b04          	ld	a,(OFST+2,sp)
 781  00c7 5d            	tnzw	x
 782  00c8 2704          	jreq	L63
 783  00ca               L04:
 784  00ca 48            	sll	a
 785  00cb 5a            	decw	x
 786  00cc 26fc          	jrne	L04
 787  00ce               L63:
 788  00ce 6b02          	ld	(OFST+0,sp),a
 789                     ; 233   switch (IRQn)
 791  00d0 7b03          	ld	a,(OFST+1,sp)
 793                     ; 323     default:
 793                     ; 324       break;
 794  00d2 4a            	dec	a
 795  00d3 a11d          	cp	a,#29
 796  00d5 2407          	jruge	L24
 797  00d7 5f            	clrw	x
 798  00d8 97            	ld	xl,a
 799  00d9 58            	sllw	x
 800  00da de003a        	ldw	x,(L44,x)
 801  00dd fc            	jp	(x)
 802  00de               L24:
 803  00de ac700170      	jpf	L503
 804  00e2               L722:
 805                     ; 235     case FLASH_IRQn:
 805                     ; 236     case DMA1_CHANNEL0_1_IRQn:
 805                     ; 237     case DMA1_CHANNEL2_3_IRQn:
 805                     ; 238       ITC->ISPR1 &= Mask;
 807  00e2 c67f70        	ld	a,32624
 808  00e5 1401          	and	a,(OFST-1,sp)
 809  00e7 c77f70        	ld	32624,a
 810                     ; 239       ITC->ISPR1 |= NewPriority;
 812  00ea c67f70        	ld	a,32624
 813  00ed 1a02          	or	a,(OFST+0,sp)
 814  00ef c77f70        	ld	32624,a
 815                     ; 240       break;
 817  00f2 207c          	jra	L503
 818  00f4               L132:
 819                     ; 242     case EXTIE_F_PVD_IRQn:
 819                     ; 243 #ifdef STM8L15X_MD
 819                     ; 244     case RTC_IRQn:
 819                     ; 245     case EXTIB_IRQn:
 819                     ; 246     case EXTID_IRQn:
 819                     ; 247 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 819                     ; 248     case RTC_CSSLSE_IRQn:
 819                     ; 249     case EXTIB_G_IRQn:
 819                     ; 250     case EXTID_H_IRQn:
 819                     ; 251 #endif  /* STM8L15X_MD */
 819                     ; 252       ITC->ISPR2 &= Mask;
 821  00f4 c67f71        	ld	a,32625
 822  00f7 1401          	and	a,(OFST-1,sp)
 823  00f9 c77f71        	ld	32625,a
 824                     ; 253       ITC->ISPR2 |= NewPriority;
 826  00fc c67f71        	ld	a,32625
 827  00ff 1a02          	or	a,(OFST+0,sp)
 828  0101 c77f71        	ld	32625,a
 829                     ; 254       break;
 831  0104 206a          	jra	L503
 832  0106               L332:
 833                     ; 256     case EXTI0_IRQn:
 833                     ; 257     case EXTI1_IRQn:
 833                     ; 258     case EXTI2_IRQn:
 833                     ; 259     case EXTI3_IRQn:
 833                     ; 260       ITC->ISPR3 &= Mask;
 835  0106 c67f72        	ld	a,32626
 836  0109 1401          	and	a,(OFST-1,sp)
 837  010b c77f72        	ld	32626,a
 838                     ; 261       ITC->ISPR3 |= NewPriority;
 840  010e c67f72        	ld	a,32626
 841  0111 1a02          	or	a,(OFST+0,sp)
 842  0113 c77f72        	ld	32626,a
 843                     ; 262       break;
 845  0116 2058          	jra	L503
 846  0118               L532:
 847                     ; 264     case EXTI4_IRQn:
 847                     ; 265     case EXTI5_IRQn:
 847                     ; 266     case EXTI6_IRQn:
 847                     ; 267     case EXTI7_IRQn:
 847                     ; 268       ITC->ISPR4 &= Mask;
 849  0118 c67f73        	ld	a,32627
 850  011b 1401          	and	a,(OFST-1,sp)
 851  011d c77f73        	ld	32627,a
 852                     ; 269       ITC->ISPR4 |= NewPriority;
 854  0120 c67f73        	ld	a,32627
 855  0123 1a02          	or	a,(OFST+0,sp)
 856  0125 c77f73        	ld	32627,a
 857                     ; 270       break;
 859  0128 2046          	jra	L503
 860  012a               L732:
 861                     ; 272     case SWITCH_CSS_BREAK_DAC_IRQn:
 861                     ; 273     case ADC1_COMP_IRQn:
 861                     ; 274 #ifdef STM8L15X_MD
 861                     ; 275     case LCD_IRQn:
 861                     ; 276     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 861                     ; 277 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 861                     ; 278     case LCD_AES_IRQn:
 861                     ; 279     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 861                     ; 280 #endif  /* STM8L15X_MD */
 861                     ; 281       ITC->ISPR5 &= Mask;
 863  012a c67f74        	ld	a,32628
 864  012d 1401          	and	a,(OFST-1,sp)
 865  012f c77f74        	ld	32628,a
 866                     ; 282       ITC->ISPR5 |= NewPriority;
 868  0132 c67f74        	ld	a,32628
 869  0135 1a02          	or	a,(OFST+0,sp)
 870  0137 c77f74        	ld	32628,a
 871                     ; 283       break;
 873  013a 2034          	jra	L503
 874  013c               L142:
 875                     ; 285     case TIM1_UPD_OVF_TRG_IRQn:
 875                     ; 286 #ifdef STM8L15X_MD
 875                     ; 287     case TIM2_CC_IRQn:
 875                     ; 288     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 875                     ; 289     case TIM3_CC_IRQn:
 875                     ; 290 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 875                     ; 291     case TIM2_CC_USART2_RX_IRQn:
 875                     ; 292     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 875                     ; 293     case TIM3_CC_USART3_RX_IRQn:
 875                     ; 294 #endif  /* STM8L15X_MD */
 875                     ; 295       ITC->ISPR6 &= Mask;
 877  013c c67f75        	ld	a,32629
 878  013f 1401          	and	a,(OFST-1,sp)
 879  0141 c77f75        	ld	32629,a
 880                     ; 296       ITC->ISPR6 |= NewPriority;
 882  0144 c67f75        	ld	a,32629
 883  0147 1a02          	or	a,(OFST+0,sp)
 884  0149 c77f75        	ld	32629,a
 885                     ; 297       break;
 887  014c 2022          	jra	L503
 888  014e               L342:
 889                     ; 300     case TIM1_CC_IRQn:
 889                     ; 301     case TIM4_UPD_OVF_TRG_IRQn:
 889                     ; 302     case SPI1_IRQn:
 889                     ; 303 #ifdef STM8L15X_MD
 889                     ; 304     case USART1_TX_IRQn:
 889                     ; 305 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 889                     ; 306     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 889                     ; 307 #endif  /* STM8L15X_MD */
 889                     ; 308       ITC->ISPR7 &= Mask;
 891  014e c67f76        	ld	a,32630
 892  0151 1401          	and	a,(OFST-1,sp)
 893  0153 c77f76        	ld	32630,a
 894                     ; 309       ITC->ISPR7 |= NewPriority;
 896  0156 c67f76        	ld	a,32630
 897  0159 1a02          	or	a,(OFST+0,sp)
 898  015b c77f76        	ld	32630,a
 899                     ; 310       break;
 901  015e 2010          	jra	L503
 902  0160               L542:
 903                     ; 313     case USART1_RX_IRQn:
 903                     ; 314     case I2C1_IRQn:
 903                     ; 315 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP)
 903                     ; 316     case USART1_RX_TIM5_CC_IRQn:
 903                     ; 317     case I2C1_SPI2_IRQn:
 903                     ; 318 #endif  /* STM8L15X_MD */
 903                     ; 319       ITC->ISPR8 &= Mask;
 905  0160 c67f77        	ld	a,32631
 906  0163 1401          	and	a,(OFST-1,sp)
 907  0165 c77f77        	ld	32631,a
 908                     ; 320       ITC->ISPR8 |= NewPriority;
 910  0168 c67f77        	ld	a,32631
 911  016b 1a02          	or	a,(OFST+0,sp)
 912  016d c77f77        	ld	32631,a
 913                     ; 321       break;
 915  0170               L742:
 916                     ; 323     default:
 916                     ; 324       break;
 918  0170               L503:
 919                     ; 326 }
 922  0170 5b04          	addw	sp,#4
 923  0172 81            	ret
 936                     	xdef	_ITC_GetSoftwarePriority
 937                     	xdef	_ITC_SetSoftwarePriority
 938                     	xdef	_ITC_GetSoftIntStatus
 939                     	xdef	_ITC_DeInit
 940                     	xdef	_ITC_GetCPUCC
 959                     	end
