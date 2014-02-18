   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.19 - 04 Sep 2013
   3                     ; Generator (Limited) V4.3.11 - 04 Sep 2013
  46                     ; 85 void M24LR04E_DeInit(void)
  46                     ; 86 {
  48                     	switch	.text
  49  0000               _M24LR04E_DeInit:
  53                     ; 87   M24LR04E_LowLevel_DeInit();
  55  0000 cd0987        	call	L3_M24LR04E_LowLevel_DeInit
  57                     ; 88 }
  60  0003 81            	ret
  87                     ; 95 void M24LR04E_Init(void)
  87                     ; 96 {
  88                     	switch	.text
  89  0004               _M24LR04E_Init:
  93                     ; 98   M24LR04E_LowLevel_Init();
  95  0004 cd09b3        	call	L5_M24LR04E_LowLevel_Init
  97                     ; 101   I2C_DeInit(M24LR04E_I2C);
  99  0007 ae5210        	ldw	x,#21008
 100  000a cd0000        	call	_I2C_DeInit
 102                     ; 105 	I2C_Init(M24LR04E_I2C, M24LR04E_I2C_SPEED, 0x00, I2C_Mode_I2C,
 102                     ; 106            I2C_DutyCycle_2, I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
 104  000d 4b00          	push	#0
 105  000f 4b04          	push	#4
 106  0011 4b00          	push	#0
 107  0013 4b00          	push	#0
 108  0015 5f            	clrw	x
 109  0016 89            	pushw	x
 110  0017 ae86a0        	ldw	x,#34464
 111  001a 89            	pushw	x
 112  001b ae0001        	ldw	x,#1
 113  001e 89            	pushw	x
 114  001f ae5210        	ldw	x,#21008
 115  0022 cd0000        	call	_I2C_Init
 117  0025 5b0a          	addw	sp,#10
 118                     ; 110   I2C_Cmd(M24LR04E_I2C, ENABLE);
 120  0027 4b01          	push	#1
 121  0029 ae5210        	ldw	x,#21008
 122  002c cd0000        	call	_I2C_Cmd
 124  002f 84            	pop	a
 125                     ; 111 }
 128  0030 81            	ret
 189                     ; 118 ErrorStatus M24LR04E_GetStatus(void)
 189                     ; 119 {
 190                     	switch	.text
 191  0031               _M24LR04E_GetStatus:
 193  0031 5204          	subw	sp,#4
 194       00000004      OFST:	set	4
 197                     ; 120   uint32_t I2C_TimeOut = I2C_TIMEOUT;
 199  0033 ae00ff        	ldw	x,#255
 200  0036 1f03          	ldw	(OFST-1,sp),x
 201  0038 ae0000        	ldw	x,#0
 202  003b 1f01          	ldw	(OFST-3,sp),x
 203                     ; 123   I2C_ClearFlag(M24LR04E_I2C, I2C_FLAG_AF);
 205  003d ae0204        	ldw	x,#516
 206  0040 89            	pushw	x
 207  0041 ae5210        	ldw	x,#21008
 208  0044 cd0000        	call	_I2C_ClearFlag
 210  0047 85            	popw	x
 211                     ; 126   I2C_AcknowledgeConfig(M24LR04E_I2C, ENABLE);
 213  0048 4b01          	push	#1
 214  004a ae5210        	ldw	x,#21008
 215  004d cd0000        	call	_I2C_AcknowledgeConfig
 217  0050 84            	pop	a
 218                     ; 131   I2C_GenerateSTART(M24LR04E_I2C, ENABLE);
 220  0051 4b01          	push	#1
 221  0053 ae5210        	ldw	x,#21008
 222  0056 cd0000        	call	_I2C_GenerateSTART
 224  0059 84            	pop	a
 226  005a 2009          	jra	L56
 227  005c               L36:
 228                     ; 136     I2C_TimeOut--;
 230  005c 96            	ldw	x,sp
 231  005d 1c0001        	addw	x,#OFST-3
 232  0060 a601          	ld	a,#1
 233  0062 cd0000        	call	c_lgsbc
 235  0065               L56:
 236                     ; 134   while ((!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_MODE_SELECT)) && I2C_TimeOut)  /* EV5 */
 238  0065 ae0301        	ldw	x,#769
 239  0068 89            	pushw	x
 240  0069 ae5210        	ldw	x,#21008
 241  006c cd0000        	call	_I2C_CheckEvent
 243  006f 85            	popw	x
 244  0070 4d            	tnz	a
 245  0071 2609          	jrne	L17
 247  0073 96            	ldw	x,sp
 248  0074 1c0001        	addw	x,#OFST-3
 249  0077 cd0000        	call	c_lzmp
 251  007a 26e0          	jrne	L36
 252  007c               L17:
 253                     ; 138   if (I2C_TimeOut == 0)
 255  007c 96            	ldw	x,sp
 256  007d 1c0001        	addw	x,#OFST-3
 257  0080 cd0000        	call	c_lzmp
 259  0083 2603          	jrne	L37
 260                     ; 140     return ERROR;
 262  0085 4f            	clr	a
 264  0086 204f          	jra	L21
 265  0088               L37:
 266                     ; 142   I2C_TimeOut = I2C_TIMEOUT;
 268  0088 ae00ff        	ldw	x,#255
 269  008b 1f03          	ldw	(OFST-1,sp),x
 270  008d ae0000        	ldw	x,#0
 271  0090 1f01          	ldw	(OFST-3,sp),x
 272                     ; 145   I2C_Send7bitAddress(M24LR04E_I2C, M24LR04E_ADDR, I2C_Direction_Transmitter);
 274  0092 4b00          	push	#0
 275  0094 4b90          	push	#144
 276  0096 ae5210        	ldw	x,#21008
 277  0099 cd0000        	call	_I2C_Send7bitAddress
 279  009c 85            	popw	x
 281  009d 2009          	jra	L77
 282  009f               L57:
 283                     ; 149     I2C_TimeOut--;
 285  009f 96            	ldw	x,sp
 286  00a0 1c0001        	addw	x,#OFST-3
 287  00a3 a601          	ld	a,#1
 288  00a5 cd0000        	call	c_lgsbc
 290  00a8               L77:
 291                     ; 147   while ((!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)) && I2C_TimeOut)/* EV6 */
 293  00a8 ae0782        	ldw	x,#1922
 294  00ab 89            	pushw	x
 295  00ac ae5210        	ldw	x,#21008
 296  00af cd0000        	call	_I2C_CheckEvent
 298  00b2 85            	popw	x
 299  00b3 4d            	tnz	a
 300  00b4 2609          	jrne	L301
 302  00b6 96            	ldw	x,sp
 303  00b7 1c0001        	addw	x,#OFST-3
 304  00ba cd0000        	call	c_lzmp
 306  00bd 26e0          	jrne	L57
 307  00bf               L301:
 308                     ; 152   if ((I2C_GetFlagStatus(M24LR04E_I2C, I2C_FLAG_AF) != 0x00) || (I2C_TimeOut == 0))
 310  00bf ae0204        	ldw	x,#516
 311  00c2 89            	pushw	x
 312  00c3 ae5210        	ldw	x,#21008
 313  00c6 cd0000        	call	_I2C_GetFlagStatus
 315  00c9 85            	popw	x
 316  00ca 4d            	tnz	a
 317  00cb 2609          	jrne	L701
 319  00cd 96            	ldw	x,sp
 320  00ce 1c0001        	addw	x,#OFST-3
 321  00d1 cd0000        	call	c_lzmp
 323  00d4 2604          	jrne	L501
 324  00d6               L701:
 325                     ; 154     return ERROR;
 327  00d6 4f            	clr	a
 329  00d7               L21:
 331  00d7 5b04          	addw	sp,#4
 332  00d9 81            	ret
 333  00da               L501:
 334                     ; 158     return SUCCESS;
 336  00da a601          	ld	a,#1
 338  00dc 20f9          	jra	L21
 389                     ; 170 uint16_t M24LR04E_ReadReg(uint8_t RegName)
 389                     ; 171 {
 390                     	switch	.text
 391  00de               _M24LR04E_ReadReg:
 393  00de 88            	push	a
 394  00df 89            	pushw	x
 395       00000002      OFST:	set	2
 398                     ; 172   __IO uint16_t RegValue = 0;
 400  00e0 5f            	clrw	x
 401  00e1 1f01          	ldw	(OFST-1,sp),x
 402                     ; 175   I2C_AcknowledgeConfig(M24LR04E_I2C, ENABLE);
 404  00e3 4b01          	push	#1
 405  00e5 ae5210        	ldw	x,#21008
 406  00e8 cd0000        	call	_I2C_AcknowledgeConfig
 408  00eb 84            	pop	a
 409                     ; 179   I2C_GenerateSTART(M24LR04E_I2C, ENABLE);
 411  00ec 4b01          	push	#1
 412  00ee ae5210        	ldw	x,#21008
 413  00f1 cd0000        	call	_I2C_GenerateSTART
 415  00f4 84            	pop	a
 417  00f5               L731:
 418                     ; 182   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_MODE_SELECT))  /* EV5 */
 420  00f5 ae0301        	ldw	x,#769
 421  00f8 89            	pushw	x
 422  00f9 ae5210        	ldw	x,#21008
 423  00fc cd0000        	call	_I2C_CheckEvent
 425  00ff 85            	popw	x
 426  0100 4d            	tnz	a
 427  0101 27f2          	jreq	L731
 428                     ; 187   I2C_Send7bitAddress(M24LR04E_I2C, M24LR04E_ADDR, I2C_Direction_Transmitter);
 430  0103 4b00          	push	#0
 431  0105 4b90          	push	#144
 432  0107 ae5210        	ldw	x,#21008
 433  010a cd0000        	call	_I2C_Send7bitAddress
 435  010d 85            	popw	x
 437  010e               L541:
 438                     ; 190   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)) /* EV6 */
 440  010e ae0782        	ldw	x,#1922
 441  0111 89            	pushw	x
 442  0112 ae5210        	ldw	x,#21008
 443  0115 cd0000        	call	_I2C_CheckEvent
 445  0118 85            	popw	x
 446  0119 4d            	tnz	a
 447  011a 27f2          	jreq	L541
 448                     ; 195   I2C_SendData(M24LR04E_I2C, RegName);
 450  011c 7b03          	ld	a,(OFST+1,sp)
 451  011e 88            	push	a
 452  011f ae5210        	ldw	x,#21008
 453  0122 cd0000        	call	_I2C_SendData
 455  0125 84            	pop	a
 457  0126               L351:
 458                     ; 198   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_BYTE_TRANSMITTED)) /* EV8 */
 460  0126 ae0784        	ldw	x,#1924
 461  0129 89            	pushw	x
 462  012a ae5210        	ldw	x,#21008
 463  012d cd0000        	call	_I2C_CheckEvent
 465  0130 85            	popw	x
 466  0131 4d            	tnz	a
 467  0132 27f2          	jreq	L351
 468                     ; 204   I2C_GenerateSTART(M24LR04E_I2C, ENABLE);
 470  0134 4b01          	push	#1
 471  0136 ae5210        	ldw	x,#21008
 472  0139 cd0000        	call	_I2C_GenerateSTART
 474  013c 84            	pop	a
 476  013d               L161:
 477                     ; 207   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_MODE_SELECT))  /* EV5 */
 479  013d ae0301        	ldw	x,#769
 480  0140 89            	pushw	x
 481  0141 ae5210        	ldw	x,#21008
 482  0144 cd0000        	call	_I2C_CheckEvent
 484  0147 85            	popw	x
 485  0148 4d            	tnz	a
 486  0149 27f2          	jreq	L161
 487                     ; 212   I2C_Send7bitAddress(M24LR04E_I2C, M24LR04E_ADDR, I2C_Direction_Receiver);
 489  014b 4b01          	push	#1
 490  014d 4b90          	push	#144
 491  014f ae5210        	ldw	x,#21008
 492  0152 cd0000        	call	_I2C_Send7bitAddress
 494  0155 85            	popw	x
 496  0156               L761:
 497                     ; 215   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))  /* EV6 */
 499  0156 ae0302        	ldw	x,#770
 500  0159 89            	pushw	x
 501  015a ae5210        	ldw	x,#21008
 502  015d cd0000        	call	_I2C_CheckEvent
 504  0160 85            	popw	x
 505  0161 4d            	tnz	a
 506  0162 27f2          	jreq	L761
 508  0164               L571:
 509                     ; 220   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_BYTE_RECEIVED))  /* EV7 */
 511  0164 ae0340        	ldw	x,#832
 512  0167 89            	pushw	x
 513  0168 ae5210        	ldw	x,#21008
 514  016b cd0000        	call	_I2C_CheckEvent
 516  016e 85            	popw	x
 517  016f 4d            	tnz	a
 518  0170 27f2          	jreq	L571
 519                     ; 225   RegValue = (uint16_t)(I2C_ReceiveData(M24LR04E_I2C) << 8);
 521  0172 ae5210        	ldw	x,#21008
 522  0175 cd0000        	call	_I2C_ReceiveData
 524  0178 5f            	clrw	x
 525  0179 97            	ld	xl,a
 526  017a 4f            	clr	a
 527  017b 02            	rlwa	x,a
 528  017c 1f01          	ldw	(OFST-1,sp),x
 529                     ; 228   I2C_AcknowledgeConfig(M24LR04E_I2C, DISABLE);
 531  017e 4b00          	push	#0
 532  0180 ae5210        	ldw	x,#21008
 533  0183 cd0000        	call	_I2C_AcknowledgeConfig
 535  0186 84            	pop	a
 536                     ; 231   I2C_GenerateSTOP(M24LR04E_I2C, ENABLE);
 538  0187 4b01          	push	#1
 539  0189 ae5210        	ldw	x,#21008
 540  018c cd0000        	call	_I2C_GenerateSTOP
 542  018f 84            	pop	a
 544  0190               L302:
 545                     ; 234   while (I2C_GetFlagStatus(M24LR04E_I2C, I2C_FLAG_RXNE) == RESET)
 547  0190 ae0140        	ldw	x,#320
 548  0193 89            	pushw	x
 549  0194 ae5210        	ldw	x,#21008
 550  0197 cd0000        	call	_I2C_GetFlagStatus
 552  019a 85            	popw	x
 553  019b 4d            	tnz	a
 554  019c 27f2          	jreq	L302
 555                     ; 238   RegValue |= I2C_ReceiveData(M24LR04E_I2C);
 557  019e ae5210        	ldw	x,#21008
 558  01a1 cd0000        	call	_I2C_ReceiveData
 560  01a4 5f            	clrw	x
 561  01a5 97            	ld	xl,a
 562  01a6 01            	rrwa	x,a
 563  01a7 1a02          	or	a,(OFST+0,sp)
 564  01a9 01            	rrwa	x,a
 565  01aa 1a01          	or	a,(OFST-1,sp)
 566  01ac 01            	rrwa	x,a
 567  01ad 1f01          	ldw	(OFST-1,sp),x
 568                     ; 241   return (RegValue);
 570  01af 1e01          	ldw	x,(OFST-1,sp)
 573  01b1 5b03          	addw	sp,#3
 574  01b3 81            	ret
 622                     ; 253 void M24LR04E_WriteReg(uint8_t RegName, uint16_t RegValue)
 622                     ; 254 {
 623                     	switch	.text
 624  01b4               _M24LR04E_WriteReg:
 626  01b4 88            	push	a
 627       00000000      OFST:	set	0
 630                     ; 257   I2C_GenerateSTART(M24LR04E_I2C, ENABLE);
 632  01b5 4b01          	push	#1
 633  01b7 ae5210        	ldw	x,#21008
 634  01ba cd0000        	call	_I2C_GenerateSTART
 636  01bd 84            	pop	a
 638  01be               L332:
 639                     ; 260   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_MODE_SELECT))  /* EV5 */
 641  01be ae0301        	ldw	x,#769
 642  01c1 89            	pushw	x
 643  01c2 ae5210        	ldw	x,#21008
 644  01c5 cd0000        	call	_I2C_CheckEvent
 646  01c8 85            	popw	x
 647  01c9 4d            	tnz	a
 648  01ca 27f2          	jreq	L332
 649                     ; 265   I2C_Send7bitAddress(M24LR04E_I2C, M24LR04E_ADDR, I2C_Direction_Transmitter);
 651  01cc 4b00          	push	#0
 652  01ce 4b90          	push	#144
 653  01d0 ae5210        	ldw	x,#21008
 654  01d3 cd0000        	call	_I2C_Send7bitAddress
 656  01d6 85            	popw	x
 658  01d7               L142:
 659                     ; 268   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)) /* EV6 */
 661  01d7 ae0782        	ldw	x,#1922
 662  01da 89            	pushw	x
 663  01db ae5210        	ldw	x,#21008
 664  01de cd0000        	call	_I2C_CheckEvent
 666  01e1 85            	popw	x
 667  01e2 4d            	tnz	a
 668  01e3 27f2          	jreq	L142
 669                     ; 273   I2C_SendData(M24LR04E_I2C, RegName);
 671  01e5 7b01          	ld	a,(OFST+1,sp)
 672  01e7 88            	push	a
 673  01e8 ae5210        	ldw	x,#21008
 674  01eb cd0000        	call	_I2C_SendData
 676  01ee 84            	pop	a
 678  01ef               L742:
 679                     ; 276   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_BYTE_TRANSMITTED)) /* EV8 */
 681  01ef ae0784        	ldw	x,#1924
 682  01f2 89            	pushw	x
 683  01f3 ae5210        	ldw	x,#21008
 684  01f6 cd0000        	call	_I2C_CheckEvent
 686  01f9 85            	popw	x
 687  01fa 4d            	tnz	a
 688  01fb 27f2          	jreq	L742
 689                     ; 281   I2C_SendData(M24LR04E_I2C, (uint8_t)(RegValue >> 8));
 691  01fd 7b04          	ld	a,(OFST+4,sp)
 692  01ff 88            	push	a
 693  0200 ae5210        	ldw	x,#21008
 694  0203 cd0000        	call	_I2C_SendData
 696  0206 84            	pop	a
 698  0207               L552:
 699                     ; 284   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_BYTE_TRANSMITTED)) /* EV8 */
 701  0207 ae0784        	ldw	x,#1924
 702  020a 89            	pushw	x
 703  020b ae5210        	ldw	x,#21008
 704  020e cd0000        	call	_I2C_CheckEvent
 706  0211 85            	popw	x
 707  0212 4d            	tnz	a
 708  0213 27f2          	jreq	L552
 709                     ; 289   I2C_SendData(M24LR04E_I2C, (uint8_t)RegValue);
 711  0215 7b05          	ld	a,(OFST+5,sp)
 712  0217 88            	push	a
 713  0218 ae5210        	ldw	x,#21008
 714  021b cd0000        	call	_I2C_SendData
 716  021e 84            	pop	a
 718  021f               L362:
 719                     ; 292   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_BYTE_TRANSMITTED)) /* EV8 */
 721  021f ae0784        	ldw	x,#1924
 722  0222 89            	pushw	x
 723  0223 ae5210        	ldw	x,#21008
 724  0226 cd0000        	call	_I2C_CheckEvent
 726  0229 85            	popw	x
 727  022a 4d            	tnz	a
 728  022b 27f2          	jreq	L362
 729                     ; 297   I2C_GenerateSTOP(M24LR04E_I2C, ENABLE);
 731  022d 4b01          	push	#1
 732  022f ae5210        	ldw	x,#21008
 733  0232 cd0000        	call	_I2C_GenerateSTOP
 735  0235 84            	pop	a
 736                     ; 298 }
 739  0236 84            	pop	a
 740  0237 81            	ret
 811                     ; 312 void M24LR04E_ReadOneByte (uint8_t EE_address, uint16_t ReadAddr,uint8_t* pBuffer)
 811                     ; 313 {
 812                     	switch	.text
 813  0238               _M24LR04E_ReadOneByte:
 815  0238 88            	push	a
 816  0239 5204          	subw	sp,#4
 817       00000004      OFST:	set	4
 820                     ; 314 int32_t I2C_TimeOut = I2C_TIMEOUT;
 822  023b ae00ff        	ldw	x,#255
 823  023e 1f03          	ldw	(OFST-1,sp),x
 824  0240 ae0000        	ldw	x,#0
 825  0243 1f01          	ldw	(OFST-3,sp),x
 826                     ; 317   I2C_AcknowledgeConfig(M24LR04E_I2C, ENABLE);
 828  0245 4b01          	push	#1
 829  0247 ae5210        	ldw	x,#21008
 830  024a cd0000        	call	_I2C_AcknowledgeConfig
 832  024d 84            	pop	a
 833                     ; 321   I2C_GenerateSTART(M24LR04E_I2C, ENABLE);
 835  024e 4b01          	push	#1
 836  0250 ae5210        	ldw	x,#21008
 837  0253 cd0000        	call	_I2C_GenerateSTART
 839  0256 84            	pop	a
 841  0257               L323:
 842                     ; 324   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_MODE_SELECT) && I2C_TimeOut-->0)  // EV5 
 844  0257 ae0301        	ldw	x,#769
 845  025a 89            	pushw	x
 846  025b ae5210        	ldw	x,#21008
 847  025e cd0000        	call	_I2C_CheckEvent
 849  0261 85            	popw	x
 850  0262 4d            	tnz	a
 851  0263 2616          	jrne	L723
 853  0265 9c            	rvf
 854  0266 96            	ldw	x,sp
 855  0267 1c0001        	addw	x,#OFST-3
 856  026a cd0000        	call	c_ltor
 858  026d 96            	ldw	x,sp
 859  026e 1c0001        	addw	x,#OFST-3
 860  0271 a601          	ld	a,#1
 861  0273 cd0000        	call	c_lgsbc
 863  0276 cd0000        	call	c_lrzmp
 865  0279 2cdc          	jrsgt	L323
 866  027b               L723:
 867                     ; 330   I2C_Send7bitAddress(M24LR04E_I2C, EE_address , I2C_Direction_Transmitter);
 869  027b 4b00          	push	#0
 870  027d 7b06          	ld	a,(OFST+2,sp)
 871  027f 88            	push	a
 872  0280 ae5210        	ldw	x,#21008
 873  0283 cd0000        	call	_I2C_Send7bitAddress
 875  0286 85            	popw	x
 877  0287               L333:
 878                     ; 333   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)&& I2C_TimeOut-->0) // EV6 
 880  0287 ae0782        	ldw	x,#1922
 881  028a 89            	pushw	x
 882  028b ae5210        	ldw	x,#21008
 883  028e cd0000        	call	_I2C_CheckEvent
 885  0291 85            	popw	x
 886  0292 4d            	tnz	a
 887  0293 2616          	jrne	L733
 889  0295 9c            	rvf
 890  0296 96            	ldw	x,sp
 891  0297 1c0001        	addw	x,#OFST-3
 892  029a cd0000        	call	c_ltor
 894  029d 96            	ldw	x,sp
 895  029e 1c0001        	addw	x,#OFST-3
 896  02a1 a601          	ld	a,#1
 897  02a3 cd0000        	call	c_lgsbc
 899  02a6 cd0000        	call	c_lrzmp
 901  02a9 2cdc          	jrsgt	L333
 902  02ab               L733:
 903                     ; 338 	I2C_SendData(M24LR04E_I2C,(uint8_t)(ReadAddr >> 8)); // MSB 
 905  02ab 7b08          	ld	a,(OFST+4,sp)
 906  02ad 88            	push	a
 907  02ae ae5210        	ldw	x,#21008
 908  02b1 cd0000        	call	_I2C_SendData
 910  02b4 84            	pop	a
 912  02b5               L343:
 913                     ; 343   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_BYTE_TRANSMITTED)&& I2C_TimeOut-->0) // EV8 
 915  02b5 ae0784        	ldw	x,#1924
 916  02b8 89            	pushw	x
 917  02b9 ae5210        	ldw	x,#21008
 918  02bc cd0000        	call	_I2C_CheckEvent
 920  02bf 85            	popw	x
 921  02c0 4d            	tnz	a
 922  02c1 2616          	jrne	L743
 924  02c3 9c            	rvf
 925  02c4 96            	ldw	x,sp
 926  02c5 1c0001        	addw	x,#OFST-3
 927  02c8 cd0000        	call	c_ltor
 929  02cb 96            	ldw	x,sp
 930  02cc 1c0001        	addw	x,#OFST-3
 931  02cf a601          	ld	a,#1
 932  02d1 cd0000        	call	c_lgsbc
 934  02d4 cd0000        	call	c_lrzmp
 936  02d7 2cdc          	jrsgt	L343
 937  02d9               L743:
 938                     ; 348 	I2C_SendData(M24LR04E_I2C,(uint8_t)ReadAddr); // LSB 
 940  02d9 7b09          	ld	a,(OFST+5,sp)
 941  02db 88            	push	a
 942  02dc ae5210        	ldw	x,#21008
 943  02df cd0000        	call	_I2C_SendData
 945  02e2 84            	pop	a
 947  02e3               L353:
 948                     ; 351   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_BYTE_TRANSMITTED)&& I2C_TimeOut-->0) // EV8 
 950  02e3 ae0784        	ldw	x,#1924
 951  02e6 89            	pushw	x
 952  02e7 ae5210        	ldw	x,#21008
 953  02ea cd0000        	call	_I2C_CheckEvent
 955  02ed 85            	popw	x
 956  02ee 4d            	tnz	a
 957  02ef 2616          	jrne	L753
 959  02f1 9c            	rvf
 960  02f2 96            	ldw	x,sp
 961  02f3 1c0001        	addw	x,#OFST-3
 962  02f6 cd0000        	call	c_ltor
 964  02f9 96            	ldw	x,sp
 965  02fa 1c0001        	addw	x,#OFST-3
 966  02fd a601          	ld	a,#1
 967  02ff cd0000        	call	c_lgsbc
 969  0302 cd0000        	call	c_lrzmp
 971  0305 2cdc          	jrsgt	L353
 972  0307               L753:
 973                     ; 357   I2C_GenerateSTART(M24LR04E_I2C, ENABLE);
 975  0307 4b01          	push	#1
 976  0309 ae5210        	ldw	x,#21008
 977  030c cd0000        	call	_I2C_GenerateSTART
 979  030f 84            	pop	a
 981  0310               L363:
 982                     ; 360   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_MODE_SELECT)&& I2C_TimeOut-->0)  // EV5 
 984  0310 ae0301        	ldw	x,#769
 985  0313 89            	pushw	x
 986  0314 ae5210        	ldw	x,#21008
 987  0317 cd0000        	call	_I2C_CheckEvent
 989  031a 85            	popw	x
 990  031b 4d            	tnz	a
 991  031c 2616          	jrne	L763
 993  031e 9c            	rvf
 994  031f 96            	ldw	x,sp
 995  0320 1c0001        	addw	x,#OFST-3
 996  0323 cd0000        	call	c_ltor
 998  0326 96            	ldw	x,sp
 999  0327 1c0001        	addw	x,#OFST-3
1000  032a a601          	ld	a,#1
1001  032c cd0000        	call	c_lgsbc
1003  032f cd0000        	call	c_lrzmp
1005  0332 2cdc          	jrsgt	L363
1006  0334               L763:
1007                     ; 365   I2C_Send7bitAddress(M24LR04E_I2C, EE_address, I2C_Direction_Receiver);
1009  0334 4b01          	push	#1
1010  0336 7b06          	ld	a,(OFST+2,sp)
1011  0338 88            	push	a
1012  0339 ae5210        	ldw	x,#21008
1013  033c cd0000        	call	_I2C_Send7bitAddress
1015  033f 85            	popw	x
1017  0340               L373:
1018                     ; 368   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED)&& I2C_TimeOut-->0)  // EV6 
1020  0340 ae0302        	ldw	x,#770
1021  0343 89            	pushw	x
1022  0344 ae5210        	ldw	x,#21008
1023  0347 cd0000        	call	_I2C_CheckEvent
1025  034a 85            	popw	x
1026  034b 4d            	tnz	a
1027  034c 2616          	jrne	L304
1029  034e 9c            	rvf
1030  034f 96            	ldw	x,sp
1031  0350 1c0001        	addw	x,#OFST-3
1032  0353 cd0000        	call	c_ltor
1034  0356 96            	ldw	x,sp
1035  0357 1c0001        	addw	x,#OFST-3
1036  035a a601          	ld	a,#1
1037  035c cd0000        	call	c_lgsbc
1039  035f cd0000        	call	c_lrzmp
1041  0362 2cdc          	jrsgt	L373
1042  0364               L304:
1043                     ; 373   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_BYTE_RECEIVED)&& I2C_TimeOut-->0)  // EV7 
1045  0364 ae0340        	ldw	x,#832
1046  0367 89            	pushw	x
1047  0368 ae5210        	ldw	x,#21008
1048  036b cd0000        	call	_I2C_CheckEvent
1050  036e 85            	popw	x
1051  036f 4d            	tnz	a
1052  0370 2616          	jrne	L704
1054  0372 9c            	rvf
1055  0373 96            	ldw	x,sp
1056  0374 1c0001        	addw	x,#OFST-3
1057  0377 cd0000        	call	c_ltor
1059  037a 96            	ldw	x,sp
1060  037b 1c0001        	addw	x,#OFST-3
1061  037e a601          	ld	a,#1
1062  0380 cd0000        	call	c_lgsbc
1064  0383 cd0000        	call	c_lrzmp
1066  0386 2cdc          	jrsgt	L304
1067  0388               L704:
1068                     ; 378   *pBuffer = I2C_ReceiveData(M24LR04E_I2C);
1070  0388 ae5210        	ldw	x,#21008
1071  038b cd0000        	call	_I2C_ReceiveData
1073  038e 1e0a          	ldw	x,(OFST+6,sp)
1074  0390 f7            	ld	(x),a
1075                     ; 381   I2C_AcknowledgeConfig(M24LR04E_I2C, DISABLE);
1077  0391 4b00          	push	#0
1078  0393 ae5210        	ldw	x,#21008
1079  0396 cd0000        	call	_I2C_AcknowledgeConfig
1081  0399 84            	pop	a
1082                     ; 384   I2C_GenerateSTOP(M24LR04E_I2C, ENABLE);
1084  039a 4b01          	push	#1
1085  039c ae5210        	ldw	x,#21008
1086  039f cd0000        	call	_I2C_GenerateSTOP
1088  03a2 84            	pop	a
1090  03a3               L314:
1091                     ; 387   while (I2C_GetFlagStatus(M24LR04E_I2C, I2C_FLAG_RXNE) == RESET && I2C_TimeOut-->0)
1093  03a3 ae0140        	ldw	x,#320
1094  03a6 89            	pushw	x
1095  03a7 ae5210        	ldw	x,#21008
1096  03aa cd0000        	call	_I2C_GetFlagStatus
1098  03ad 85            	popw	x
1099  03ae 4d            	tnz	a
1100  03af 2616          	jrne	L714
1102  03b1 9c            	rvf
1103  03b2 96            	ldw	x,sp
1104  03b3 1c0001        	addw	x,#OFST-3
1105  03b6 cd0000        	call	c_ltor
1107  03b9 96            	ldw	x,sp
1108  03ba 1c0001        	addw	x,#OFST-3
1109  03bd a601          	ld	a,#1
1110  03bf cd0000        	call	c_lgsbc
1112  03c2 cd0000        	call	c_lrzmp
1114  03c5 2cdc          	jrsgt	L314
1115  03c7               L714:
1116                     ; 390 }
1119  03c7 5b05          	addw	sp,#5
1120  03c9 81            	ret
1187                     ; 398 void M24LR04E_WriteOneByte (uint8_t EE_address, uint16_t ReadAddr,uint8_t pBuffer)
1187                     ; 399 {
1188                     	switch	.text
1189  03ca               _M24LR04E_WriteOneByte:
1191  03ca 88            	push	a
1192  03cb 5204          	subw	sp,#4
1193       00000004      OFST:	set	4
1196                     ; 400 int32_t I2C_TimeOut = I2C_TIMEOUT;
1198  03cd ae00ff        	ldw	x,#255
1199  03d0 1f03          	ldw	(OFST-1,sp),x
1200  03d2 ae0000        	ldw	x,#0
1201  03d5 1f01          	ldw	(OFST-3,sp),x
1202                     ; 403   I2C_GenerateSTART(M24LR04E_I2C, ENABLE);
1204  03d7 4b01          	push	#1
1205  03d9 ae5210        	ldw	x,#21008
1206  03dc cd0000        	call	_I2C_GenerateSTART
1208  03df 84            	pop	a
1210  03e0               L554:
1211                     ; 406   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_MODE_SELECT)&& I2C_TimeOut-->0)  /* EV5 */
1213  03e0 ae0301        	ldw	x,#769
1214  03e3 89            	pushw	x
1215  03e4 ae5210        	ldw	x,#21008
1216  03e7 cd0000        	call	_I2C_CheckEvent
1218  03ea 85            	popw	x
1219  03eb 4d            	tnz	a
1220  03ec 2616          	jrne	L164
1222  03ee 9c            	rvf
1223  03ef 96            	ldw	x,sp
1224  03f0 1c0001        	addw	x,#OFST-3
1225  03f3 cd0000        	call	c_ltor
1227  03f6 96            	ldw	x,sp
1228  03f7 1c0001        	addw	x,#OFST-3
1229  03fa a601          	ld	a,#1
1230  03fc cd0000        	call	c_lgsbc
1232  03ff cd0000        	call	c_lrzmp
1234  0402 2cdc          	jrsgt	L554
1235  0404               L164:
1236                     ; 411   I2C_Send7bitAddress(M24LR04E_I2C, EE_address, I2C_Direction_Transmitter);
1238  0404 4b00          	push	#0
1239  0406 7b06          	ld	a,(OFST+2,sp)
1240  0408 88            	push	a
1241  0409 ae5210        	ldw	x,#21008
1242  040c cd0000        	call	_I2C_Send7bitAddress
1244  040f 85            	popw	x
1246  0410               L564:
1247                     ; 414   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)&& I2C_TimeOut-->0) /* EV6 */
1249  0410 ae0782        	ldw	x,#1922
1250  0413 89            	pushw	x
1251  0414 ae5210        	ldw	x,#21008
1252  0417 cd0000        	call	_I2C_CheckEvent
1254  041a 85            	popw	x
1255  041b 4d            	tnz	a
1256  041c 2616          	jrne	L174
1258  041e 9c            	rvf
1259  041f 96            	ldw	x,sp
1260  0420 1c0001        	addw	x,#OFST-3
1261  0423 cd0000        	call	c_ltor
1263  0426 96            	ldw	x,sp
1264  0427 1c0001        	addw	x,#OFST-3
1265  042a a601          	ld	a,#1
1266  042c cd0000        	call	c_lgsbc
1268  042f cd0000        	call	c_lrzmp
1270  0432 2cdc          	jrsgt	L564
1271  0434               L174:
1272                     ; 419 	I2C_SendData(M24LR04E_I2C,(uint8_t)(ReadAddr >> 8)); // MSB 
1274  0434 7b08          	ld	a,(OFST+4,sp)
1275  0436 88            	push	a
1276  0437 ae5210        	ldw	x,#21008
1277  043a cd0000        	call	_I2C_SendData
1279  043d 84            	pop	a
1281  043e               L574:
1282                     ; 422   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_BYTE_TRANSMITTED)&& I2C_TimeOut-->0) // EV8 
1284  043e ae0784        	ldw	x,#1924
1285  0441 89            	pushw	x
1286  0442 ae5210        	ldw	x,#21008
1287  0445 cd0000        	call	_I2C_CheckEvent
1289  0448 85            	popw	x
1290  0449 4d            	tnz	a
1291  044a 2616          	jrne	L105
1293  044c 9c            	rvf
1294  044d 96            	ldw	x,sp
1295  044e 1c0001        	addw	x,#OFST-3
1296  0451 cd0000        	call	c_ltor
1298  0454 96            	ldw	x,sp
1299  0455 1c0001        	addw	x,#OFST-3
1300  0458 a601          	ld	a,#1
1301  045a cd0000        	call	c_lgsbc
1303  045d cd0000        	call	c_lrzmp
1305  0460 2cdc          	jrsgt	L574
1306  0462               L105:
1307                     ; 427 	I2C_SendData(M24LR04E_I2C,(uint8_t)ReadAddr); // LSB 
1309  0462 7b09          	ld	a,(OFST+5,sp)
1310  0464 88            	push	a
1311  0465 ae5210        	ldw	x,#21008
1312  0468 cd0000        	call	_I2C_SendData
1314  046b 84            	pop	a
1316  046c               L505:
1317                     ; 429   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_BYTE_TRANSMITTED)&& I2C_TimeOut-->0) // EV8 
1319  046c ae0784        	ldw	x,#1924
1320  046f 89            	pushw	x
1321  0470 ae5210        	ldw	x,#21008
1322  0473 cd0000        	call	_I2C_CheckEvent
1324  0476 85            	popw	x
1325  0477 4d            	tnz	a
1326  0478 2616          	jrne	L115
1328  047a 9c            	rvf
1329  047b 96            	ldw	x,sp
1330  047c 1c0001        	addw	x,#OFST-3
1331  047f cd0000        	call	c_ltor
1333  0482 96            	ldw	x,sp
1334  0483 1c0001        	addw	x,#OFST-3
1335  0486 a601          	ld	a,#1
1336  0488 cd0000        	call	c_lgsbc
1338  048b cd0000        	call	c_lrzmp
1340  048e 2cdc          	jrsgt	L505
1341  0490               L115:
1342                     ; 434   I2C_SendData(M24LR04E_I2C, pBuffer);
1344  0490 7b0a          	ld	a,(OFST+6,sp)
1345  0492 88            	push	a
1346  0493 ae5210        	ldw	x,#21008
1347  0496 cd0000        	call	_I2C_SendData
1349  0499 84            	pop	a
1351  049a               L515:
1352                     ; 437   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_BYTE_TRANSMITTED)&& I2C_TimeOut-->0) /* EV8 */
1354  049a ae0784        	ldw	x,#1924
1355  049d 89            	pushw	x
1356  049e ae5210        	ldw	x,#21008
1357  04a1 cd0000        	call	_I2C_CheckEvent
1359  04a4 85            	popw	x
1360  04a5 4d            	tnz	a
1361  04a6 2616          	jrne	L125
1363  04a8 9c            	rvf
1364  04a9 96            	ldw	x,sp
1365  04aa 1c0001        	addw	x,#OFST-3
1366  04ad cd0000        	call	c_ltor
1368  04b0 96            	ldw	x,sp
1369  04b1 1c0001        	addw	x,#OFST-3
1370  04b4 a601          	ld	a,#1
1371  04b6 cd0000        	call	c_lgsbc
1373  04b9 cd0000        	call	c_lrzmp
1375  04bc 2cdc          	jrsgt	L515
1376  04be               L125:
1377                     ; 442   I2C_GenerateSTOP(M24LR04E_I2C, ENABLE);
1379  04be 4b01          	push	#1
1380  04c0 ae5210        	ldw	x,#21008
1381  04c3 cd0000        	call	_I2C_GenerateSTOP
1383  04c6 84            	pop	a
1384                     ; 443 }
1387  04c7 5b05          	addw	sp,#5
1388  04c9 81            	ret
1474                     ; 452 void M24LR04E_WriteBuffer(uint8_t EE_address, uint16_t WriteAddr, uint8_t NumByteToWrite, uint8_t* pBuffer)
1474                     ; 453 { 
1475                     	switch	.text
1476  04ca               _M24LR04E_WriteBuffer:
1478  04ca 88            	push	a
1479  04cb 5205          	subw	sp,#5
1480       00000005      OFST:	set	5
1483                     ; 455 	int32_t I2C_TimeOut = I2C_TIMEOUT;
1485  04cd ae00ff        	ldw	x,#255
1486  04d0 1f04          	ldw	(OFST-1,sp),x
1487  04d2 ae0000        	ldw	x,#0
1488  04d5 1f02          	ldw	(OFST-3,sp),x
1489                     ; 458   I2C_GenerateSTART(M24LR04E_I2C, ENABLE);
1491  04d7 4b01          	push	#1
1492  04d9 ae5210        	ldw	x,#21008
1493  04dc cd0000        	call	_I2C_GenerateSTART
1495  04df 84            	pop	a
1497  04e0               L765:
1498                     ; 461   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_MODE_SELECT)&& I2C_TimeOut-->0)  /* EV5 */
1500  04e0 ae0301        	ldw	x,#769
1501  04e3 89            	pushw	x
1502  04e4 ae5210        	ldw	x,#21008
1503  04e7 cd0000        	call	_I2C_CheckEvent
1505  04ea 85            	popw	x
1506  04eb 4d            	tnz	a
1507  04ec 2616          	jrne	L375
1509  04ee 9c            	rvf
1510  04ef 96            	ldw	x,sp
1511  04f0 1c0002        	addw	x,#OFST-3
1512  04f3 cd0000        	call	c_ltor
1514  04f6 96            	ldw	x,sp
1515  04f7 1c0002        	addw	x,#OFST-3
1516  04fa a601          	ld	a,#1
1517  04fc cd0000        	call	c_lgsbc
1519  04ff cd0000        	call	c_lrzmp
1521  0502 2cdc          	jrsgt	L765
1522  0504               L375:
1523                     ; 466   I2C_Send7bitAddress(M24LR04E_I2C, EE_address, I2C_Direction_Transmitter);
1525  0504 4b00          	push	#0
1526  0506 7b07          	ld	a,(OFST+2,sp)
1527  0508 88            	push	a
1528  0509 ae5210        	ldw	x,#21008
1529  050c cd0000        	call	_I2C_Send7bitAddress
1531  050f 85            	popw	x
1533  0510               L775:
1534                     ; 469   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)&& I2C_TimeOut-->0) /* EV6 */
1536  0510 ae0782        	ldw	x,#1922
1537  0513 89            	pushw	x
1538  0514 ae5210        	ldw	x,#21008
1539  0517 cd0000        	call	_I2C_CheckEvent
1541  051a 85            	popw	x
1542  051b 4d            	tnz	a
1543  051c 2616          	jrne	L306
1545  051e 9c            	rvf
1546  051f 96            	ldw	x,sp
1547  0520 1c0002        	addw	x,#OFST-3
1548  0523 cd0000        	call	c_ltor
1550  0526 96            	ldw	x,sp
1551  0527 1c0002        	addw	x,#OFST-3
1552  052a a601          	ld	a,#1
1553  052c cd0000        	call	c_lgsbc
1555  052f cd0000        	call	c_lrzmp
1557  0532 2cdc          	jrsgt	L775
1558  0534               L306:
1559                     ; 474 	I2C_SendData(M24LR04E_I2C,(uint8_t)(WriteAddr >> 8)); // MSB 
1561  0534 7b09          	ld	a,(OFST+4,sp)
1562  0536 88            	push	a
1563  0537 ae5210        	ldw	x,#21008
1564  053a cd0000        	call	_I2C_SendData
1566  053d 84            	pop	a
1568  053e               L706:
1569                     ; 477   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_BYTE_TRANSMITTED)&& I2C_TimeOut-->0) // EV8 
1571  053e ae0784        	ldw	x,#1924
1572  0541 89            	pushw	x
1573  0542 ae5210        	ldw	x,#21008
1574  0545 cd0000        	call	_I2C_CheckEvent
1576  0548 85            	popw	x
1577  0549 4d            	tnz	a
1578  054a 2616          	jrne	L316
1580  054c 9c            	rvf
1581  054d 96            	ldw	x,sp
1582  054e 1c0002        	addw	x,#OFST-3
1583  0551 cd0000        	call	c_ltor
1585  0554 96            	ldw	x,sp
1586  0555 1c0002        	addw	x,#OFST-3
1587  0558 a601          	ld	a,#1
1588  055a cd0000        	call	c_lgsbc
1590  055d cd0000        	call	c_lrzmp
1592  0560 2cdc          	jrsgt	L706
1593  0562               L316:
1594                     ; 482 	I2C_SendData(M24LR04E_I2C,(uint8_t)WriteAddr); // LSB 
1596  0562 7b0a          	ld	a,(OFST+5,sp)
1597  0564 88            	push	a
1598  0565 ae5210        	ldw	x,#21008
1599  0568 cd0000        	call	_I2C_SendData
1601  056b 84            	pop	a
1603  056c               L716:
1604                     ; 484   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_BYTE_TRANSMITTED)&& I2C_TimeOut-->0) // EV8 
1606  056c ae0784        	ldw	x,#1924
1607  056f 89            	pushw	x
1608  0570 ae5210        	ldw	x,#21008
1609  0573 cd0000        	call	_I2C_CheckEvent
1611  0576 85            	popw	x
1612  0577 4d            	tnz	a
1613  0578 2616          	jrne	L326
1615  057a 9c            	rvf
1616  057b 96            	ldw	x,sp
1617  057c 1c0002        	addw	x,#OFST-3
1618  057f cd0000        	call	c_ltor
1620  0582 96            	ldw	x,sp
1621  0583 1c0002        	addw	x,#OFST-3
1622  0586 a601          	ld	a,#1
1623  0588 cd0000        	call	c_lgsbc
1625  058b cd0000        	call	c_lrzmp
1627  058e 2cdc          	jrsgt	L716
1628  0590               L326:
1629                     ; 489 	for(i = 0; i < NumByteToWrite; i++)
1631  0590 0f01          	clr	(OFST-4,sp)
1633  0592 203a          	jra	L136
1634  0594               L526:
1635                     ; 491 		I2C_SendData(M24LR04E_I2C, pBuffer[i]);
1637  0594 7b0c          	ld	a,(OFST+7,sp)
1638  0596 97            	ld	xl,a
1639  0597 7b0d          	ld	a,(OFST+8,sp)
1640  0599 1b01          	add	a,(OFST-4,sp)
1641  059b 2401          	jrnc	L62
1642  059d 5c            	incw	x
1643  059e               L62:
1644  059e 02            	rlwa	x,a
1645  059f f6            	ld	a,(x)
1646  05a0 88            	push	a
1647  05a1 ae5210        	ldw	x,#21008
1648  05a4 cd0000        	call	_I2C_SendData
1650  05a7 84            	pop	a
1652  05a8               L736:
1653                     ; 494 		while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_BYTE_TRANSMITTED)&& I2C_TimeOut-->0) /* EV8 */
1655  05a8 ae0784        	ldw	x,#1924
1656  05ab 89            	pushw	x
1657  05ac ae5210        	ldw	x,#21008
1658  05af cd0000        	call	_I2C_CheckEvent
1660  05b2 85            	popw	x
1661  05b3 4d            	tnz	a
1662  05b4 2616          	jrne	L346
1664  05b6 9c            	rvf
1665  05b7 96            	ldw	x,sp
1666  05b8 1c0002        	addw	x,#OFST-3
1667  05bb cd0000        	call	c_ltor
1669  05be 96            	ldw	x,sp
1670  05bf 1c0002        	addw	x,#OFST-3
1671  05c2 a601          	ld	a,#1
1672  05c4 cd0000        	call	c_lgsbc
1674  05c7 cd0000        	call	c_lrzmp
1676  05ca 2cdc          	jrsgt	L736
1677  05cc               L346:
1678                     ; 489 	for(i = 0; i < NumByteToWrite; i++)
1680  05cc 0c01          	inc	(OFST-4,sp)
1681  05ce               L136:
1684  05ce 7b01          	ld	a,(OFST-4,sp)
1685  05d0 110b          	cp	a,(OFST+6,sp)
1686  05d2 25c0          	jrult	L526
1687                     ; 500   I2C_GenerateSTOP(M24LR04E_I2C, ENABLE);
1689  05d4 4b01          	push	#1
1690  05d6 ae5210        	ldw	x,#21008
1691  05d9 cd0000        	call	_I2C_GenerateSTOP
1693  05dc 84            	pop	a
1694                     ; 501 }
1697  05dd 5b06          	addw	sp,#6
1698  05df 81            	ret
1778                     ; 515 void M24LR04E_ReadBuffer (uint8_t EE_address, uint16_t ReadAddr, uint8_t NumByteToRead,uint8_t* pBuffer)
1778                     ; 516 {
1779                     	switch	.text
1780  05e0               _M24LR04E_ReadBuffer:
1782  05e0 88            	push	a
1783  05e1 5204          	subw	sp,#4
1784       00000004      OFST:	set	4
1787                     ; 517 int32_t I2C_TimeOut = I2C_TIMEOUT;
1789  05e3 ae00ff        	ldw	x,#255
1790  05e6 1f03          	ldw	(OFST-1,sp),x
1791  05e8 ae0000        	ldw	x,#0
1792  05eb 1f01          	ldw	(OFST-3,sp),x
1793                     ; 521   I2C_AcknowledgeConfig(M24LR04E_I2C, ENABLE);
1795  05ed 4b01          	push	#1
1796  05ef ae5210        	ldw	x,#21008
1797  05f2 cd0000        	call	_I2C_AcknowledgeConfig
1799  05f5 84            	pop	a
1800                     ; 525   I2C_GenerateSTART(M24LR04E_I2C, ENABLE);
1802  05f6 4b01          	push	#1
1803  05f8 ae5210        	ldw	x,#21008
1804  05fb cd0000        	call	_I2C_GenerateSTART
1806  05fe 84            	pop	a
1808  05ff               L507:
1809                     ; 528   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_MODE_SELECT)&& I2C_TimeOut-->0)  // EV5 
1811  05ff ae0301        	ldw	x,#769
1812  0602 89            	pushw	x
1813  0603 ae5210        	ldw	x,#21008
1814  0606 cd0000        	call	_I2C_CheckEvent
1816  0609 85            	popw	x
1817  060a 4d            	tnz	a
1818  060b 2616          	jrne	L117
1820  060d 9c            	rvf
1821  060e 96            	ldw	x,sp
1822  060f 1c0001        	addw	x,#OFST-3
1823  0612 cd0000        	call	c_ltor
1825  0615 96            	ldw	x,sp
1826  0616 1c0001        	addw	x,#OFST-3
1827  0619 a601          	ld	a,#1
1828  061b cd0000        	call	c_lgsbc
1830  061e cd0000        	call	c_lrzmp
1832  0621 2cdc          	jrsgt	L507
1833  0623               L117:
1834                     ; 533   I2C_Send7bitAddress(M24LR04E_I2C, EE_address , I2C_Direction_Transmitter);
1836  0623 4b00          	push	#0
1837  0625 7b06          	ld	a,(OFST+2,sp)
1838  0627 88            	push	a
1839  0628 ae5210        	ldw	x,#21008
1840  062b cd0000        	call	_I2C_Send7bitAddress
1842  062e 85            	popw	x
1844  062f               L517:
1845                     ; 536   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)&& I2C_TimeOut-->0) // EV6 
1847  062f ae0782        	ldw	x,#1922
1848  0632 89            	pushw	x
1849  0633 ae5210        	ldw	x,#21008
1850  0636 cd0000        	call	_I2C_CheckEvent
1852  0639 85            	popw	x
1853  063a 4d            	tnz	a
1854  063b 2616          	jrne	L127
1856  063d 9c            	rvf
1857  063e 96            	ldw	x,sp
1858  063f 1c0001        	addw	x,#OFST-3
1859  0642 cd0000        	call	c_ltor
1861  0645 96            	ldw	x,sp
1862  0646 1c0001        	addw	x,#OFST-3
1863  0649 a601          	ld	a,#1
1864  064b cd0000        	call	c_lgsbc
1866  064e cd0000        	call	c_lrzmp
1868  0651 2cdc          	jrsgt	L517
1869  0653               L127:
1870                     ; 541 	I2C_SendData(M24LR04E_I2C,(uint8_t)(ReadAddr >> 8)); // MSB 
1872  0653 7b08          	ld	a,(OFST+4,sp)
1873  0655 88            	push	a
1874  0656 ae5210        	ldw	x,#21008
1875  0659 cd0000        	call	_I2C_SendData
1877  065c 84            	pop	a
1879  065d               L527:
1880                     ; 546   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_BYTE_TRANSMITTED)&& I2C_TimeOut-->0) // EV8 
1882  065d ae0784        	ldw	x,#1924
1883  0660 89            	pushw	x
1884  0661 ae5210        	ldw	x,#21008
1885  0664 cd0000        	call	_I2C_CheckEvent
1887  0667 85            	popw	x
1888  0668 4d            	tnz	a
1889  0669 2616          	jrne	L137
1891  066b 9c            	rvf
1892  066c 96            	ldw	x,sp
1893  066d 1c0001        	addw	x,#OFST-3
1894  0670 cd0000        	call	c_ltor
1896  0673 96            	ldw	x,sp
1897  0674 1c0001        	addw	x,#OFST-3
1898  0677 a601          	ld	a,#1
1899  0679 cd0000        	call	c_lgsbc
1901  067c cd0000        	call	c_lrzmp
1903  067f 2cdc          	jrsgt	L527
1904  0681               L137:
1905                     ; 551 	I2C_SendData(M24LR04E_I2C,(uint8_t)ReadAddr); // LSB 
1907  0681 7b09          	ld	a,(OFST+5,sp)
1908  0683 88            	push	a
1909  0684 ae5210        	ldw	x,#21008
1910  0687 cd0000        	call	_I2C_SendData
1912  068a 84            	pop	a
1914  068b               L537:
1915                     ; 554   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_BYTE_TRANSMITTED)&& I2C_TimeOut-->0) // EV8 
1917  068b ae0784        	ldw	x,#1924
1918  068e 89            	pushw	x
1919  068f ae5210        	ldw	x,#21008
1920  0692 cd0000        	call	_I2C_CheckEvent
1922  0695 85            	popw	x
1923  0696 4d            	tnz	a
1924  0697 2616          	jrne	L147
1926  0699 9c            	rvf
1927  069a 96            	ldw	x,sp
1928  069b 1c0001        	addw	x,#OFST-3
1929  069e cd0000        	call	c_ltor
1931  06a1 96            	ldw	x,sp
1932  06a2 1c0001        	addw	x,#OFST-3
1933  06a5 a601          	ld	a,#1
1934  06a7 cd0000        	call	c_lgsbc
1936  06aa cd0000        	call	c_lrzmp
1938  06ad 2cdc          	jrsgt	L537
1939  06af               L147:
1940                     ; 560   I2C_GenerateSTART(M24LR04E_I2C, ENABLE);
1942  06af 4b01          	push	#1
1943  06b1 ae5210        	ldw	x,#21008
1944  06b4 cd0000        	call	_I2C_GenerateSTART
1946  06b7 84            	pop	a
1948  06b8               L547:
1949                     ; 563   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_MODE_SELECT)&& I2C_TimeOut-->0)  // EV5 
1951  06b8 ae0301        	ldw	x,#769
1952  06bb 89            	pushw	x
1953  06bc ae5210        	ldw	x,#21008
1954  06bf cd0000        	call	_I2C_CheckEvent
1956  06c2 85            	popw	x
1957  06c3 4d            	tnz	a
1958  06c4 2616          	jrne	L157
1960  06c6 9c            	rvf
1961  06c7 96            	ldw	x,sp
1962  06c8 1c0001        	addw	x,#OFST-3
1963  06cb cd0000        	call	c_ltor
1965  06ce 96            	ldw	x,sp
1966  06cf 1c0001        	addw	x,#OFST-3
1967  06d2 a601          	ld	a,#1
1968  06d4 cd0000        	call	c_lgsbc
1970  06d7 cd0000        	call	c_lrzmp
1972  06da 2cdc          	jrsgt	L547
1973  06dc               L157:
1974                     ; 568   I2C_Send7bitAddress(M24LR04E_I2C, EE_address, I2C_Direction_Receiver);
1976  06dc 4b01          	push	#1
1977  06de 7b06          	ld	a,(OFST+2,sp)
1978  06e0 88            	push	a
1979  06e1 ae5210        	ldw	x,#21008
1980  06e4 cd0000        	call	_I2C_Send7bitAddress
1982  06e7 85            	popw	x
1984  06e8               L557:
1985                     ; 571   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED)&& I2C_TimeOut-->0)  // EV6 
1987  06e8 ae0302        	ldw	x,#770
1988  06eb 89            	pushw	x
1989  06ec ae5210        	ldw	x,#21008
1990  06ef cd0000        	call	_I2C_CheckEvent
1992  06f2 85            	popw	x
1993  06f3 4d            	tnz	a
1994  06f4 266a          	jrne	L567
1996  06f6 9c            	rvf
1997  06f7 96            	ldw	x,sp
1998  06f8 1c0001        	addw	x,#OFST-3
1999  06fb cd0000        	call	c_ltor
2001  06fe 96            	ldw	x,sp
2002  06ff 1c0001        	addw	x,#OFST-3
2003  0702 a601          	ld	a,#1
2004  0704 cd0000        	call	c_lgsbc
2006  0707 cd0000        	call	c_lrzmp
2008  070a 2cdc          	jrsgt	L557
2009  070c 2052          	jra	L567
2010  070e               L377:
2011                     ; 581 		while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_BYTE_RECEIVED)&& I2C_TimeOut-->0)  
2013  070e ae0340        	ldw	x,#832
2014  0711 89            	pushw	x
2015  0712 ae5210        	ldw	x,#21008
2016  0715 cd0000        	call	_I2C_CheckEvent
2018  0718 85            	popw	x
2019  0719 4d            	tnz	a
2020  071a 2616          	jrne	L777
2022  071c 9c            	rvf
2023  071d 96            	ldw	x,sp
2024  071e 1c0001        	addw	x,#OFST-3
2025  0721 cd0000        	call	c_ltor
2027  0724 96            	ldw	x,sp
2028  0725 1c0001        	addw	x,#OFST-3
2029  0728 a601          	ld	a,#1
2030  072a cd0000        	call	c_lgsbc
2032  072d cd0000        	call	c_lrzmp
2034  0730 2cdc          	jrsgt	L377
2035  0732               L777:
2036                     ; 586 		*pBuffer = I2C_ReceiveData(M24LR04E_I2C);
2038  0732 ae5210        	ldw	x,#21008
2039  0735 cd0000        	call	_I2C_ReceiveData
2041  0738 1e0b          	ldw	x,(OFST+7,sp)
2042  073a f7            	ld	(x),a
2043                     ; 589 		if(NumByteToRead == 1)
2045  073b 7b0a          	ld	a,(OFST+6,sp)
2046  073d a101          	cp	a,#1
2047  073f 2609          	jrne	L1001
2048                     ; 592 			I2C_AcknowledgeConfig(M24LR04E_I2C, DISABLE);
2050  0741 4b00          	push	#0
2051  0743 ae5210        	ldw	x,#21008
2052  0746 cd0000        	call	_I2C_AcknowledgeConfig
2054  0749 84            	pop	a
2055  074a               L1001:
2056                     ; 597     pBuffer++; 
2058  074a 1e0b          	ldw	x,(OFST+7,sp)
2059  074c 1c0001        	addw	x,#1
2060  074f 1f0b          	ldw	(OFST+7,sp),x
2061                     ; 599     NumByteToRead--; 
2063  0751 0a0a          	dec	(OFST+6,sp)
2064                     ; 601     if(NumByteToRead == 0)
2066  0753 0d0a          	tnz	(OFST+6,sp)
2067  0755 2609          	jrne	L567
2068                     ; 604 			I2C_GenerateSTOP(M24LR04E_I2C, ENABLE);
2070  0757 4b01          	push	#1
2071  0759 ae5210        	ldw	x,#21008
2072  075c cd0000        	call	_I2C_GenerateSTOP
2074  075f 84            	pop	a
2075  0760               L567:
2076                     ; 577   while(NumByteToRead )  
2078  0760 0d0a          	tnz	(OFST+6,sp)
2079  0762 26aa          	jrne	L377
2080                     ; 610 	*pBuffer = I2C_ReceiveData(M24LR04E_I2C);
2082  0764 ae5210        	ldw	x,#21008
2083  0767 cd0000        	call	_I2C_ReceiveData
2085  076a 1e0b          	ldw	x,(OFST+7,sp)
2086  076c f7            	ld	(x),a
2088  076d               L1101:
2089                     ; 612   while (I2C_GetFlagStatus(M24LR04E_I2C, I2C_FLAG_RXNE) == RESET&& I2C_TimeOut-->0)
2091  076d ae0140        	ldw	x,#320
2092  0770 89            	pushw	x
2093  0771 ae5210        	ldw	x,#21008
2094  0774 cd0000        	call	_I2C_GetFlagStatus
2096  0777 85            	popw	x
2097  0778 4d            	tnz	a
2098  0779 2616          	jrne	L5101
2100  077b 9c            	rvf
2101  077c 96            	ldw	x,sp
2102  077d 1c0001        	addw	x,#OFST-3
2103  0780 cd0000        	call	c_ltor
2105  0783 96            	ldw	x,sp
2106  0784 1c0001        	addw	x,#OFST-3
2107  0787 a601          	ld	a,#1
2108  0789 cd0000        	call	c_lgsbc
2110  078c cd0000        	call	c_lrzmp
2112  078f 2cdc          	jrsgt	L1101
2113  0791               L5101:
2114                     ; 615 }
2117  0791 5b05          	addw	sp,#5
2118  0793 81            	ret
2160                     ; 622 uint16_t M24LR04E_ReadTemp(void)
2160                     ; 623 {
2161                     	switch	.text
2162  0794               _M24LR04E_ReadTemp:
2164  0794 89            	pushw	x
2165       00000002      OFST:	set	2
2168                     ; 624   __IO uint16_t RegValue = 0;
2170  0795 5f            	clrw	x
2171  0796 1f01          	ldw	(OFST-1,sp),x
2172                     ; 627   I2C_AcknowledgeConfig(M24LR04E_I2C, ENABLE);
2174  0798 4b01          	push	#1
2175  079a ae5210        	ldw	x,#21008
2176  079d cd0000        	call	_I2C_AcknowledgeConfig
2178  07a0 84            	pop	a
2179                     ; 631   I2C_GenerateSTART(M24LR04E_I2C, ENABLE);
2181  07a1 4b01          	push	#1
2182  07a3 ae5210        	ldw	x,#21008
2183  07a6 cd0000        	call	_I2C_GenerateSTART
2185  07a9 84            	pop	a
2187  07aa               L7301:
2188                     ; 634   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_MODE_SELECT))  /* EV5 */
2190  07aa ae0301        	ldw	x,#769
2191  07ad 89            	pushw	x
2192  07ae ae5210        	ldw	x,#21008
2193  07b1 cd0000        	call	_I2C_CheckEvent
2195  07b4 85            	popw	x
2196  07b5 4d            	tnz	a
2197  07b6 27f2          	jreq	L7301
2198                     ; 639   I2C_Send7bitAddress(M24LR04E_I2C, M24LR04E_ADDR, I2C_Direction_Transmitter);
2200  07b8 4b00          	push	#0
2201  07ba 4b90          	push	#144
2202  07bc ae5210        	ldw	x,#21008
2203  07bf cd0000        	call	_I2C_Send7bitAddress
2205  07c2 85            	popw	x
2207  07c3               L5401:
2208                     ; 642   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)) /* EV6 */
2210  07c3 ae0782        	ldw	x,#1922
2211  07c6 89            	pushw	x
2212  07c7 ae5210        	ldw	x,#21008
2213  07ca cd0000        	call	_I2C_CheckEvent
2215  07cd 85            	popw	x
2216  07ce 4d            	tnz	a
2217  07cf 27f2          	jreq	L5401
2218                     ; 647   I2C_SendData(M24LR04E_I2C, M24LR04E_REG_TEMP);
2220  07d1 4b00          	push	#0
2221  07d3 ae5210        	ldw	x,#21008
2222  07d6 cd0000        	call	_I2C_SendData
2224  07d9 84            	pop	a
2226  07da               L3501:
2227                     ; 650   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_BYTE_TRANSMITTED)) /* EV8 */
2229  07da ae0784        	ldw	x,#1924
2230  07dd 89            	pushw	x
2231  07de ae5210        	ldw	x,#21008
2232  07e1 cd0000        	call	_I2C_CheckEvent
2234  07e4 85            	popw	x
2235  07e5 4d            	tnz	a
2236  07e6 27f2          	jreq	L3501
2237                     ; 656   I2C_GenerateSTART(M24LR04E_I2C, ENABLE);
2239  07e8 4b01          	push	#1
2240  07ea ae5210        	ldw	x,#21008
2241  07ed cd0000        	call	_I2C_GenerateSTART
2243  07f0 84            	pop	a
2245  07f1               L1601:
2246                     ; 659   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_MODE_SELECT))  /* EV5 */
2248  07f1 ae0301        	ldw	x,#769
2249  07f4 89            	pushw	x
2250  07f5 ae5210        	ldw	x,#21008
2251  07f8 cd0000        	call	_I2C_CheckEvent
2253  07fb 85            	popw	x
2254  07fc 4d            	tnz	a
2255  07fd 27f2          	jreq	L1601
2256                     ; 664   I2C_Send7bitAddress(M24LR04E_I2C, M24LR04E_ADDR, I2C_Direction_Receiver);
2258  07ff 4b01          	push	#1
2259  0801 4b90          	push	#144
2260  0803 ae5210        	ldw	x,#21008
2261  0806 cd0000        	call	_I2C_Send7bitAddress
2263  0809 85            	popw	x
2265  080a               L7601:
2266                     ; 667   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))  /* EV6 */
2268  080a ae0302        	ldw	x,#770
2269  080d 89            	pushw	x
2270  080e ae5210        	ldw	x,#21008
2271  0811 cd0000        	call	_I2C_CheckEvent
2273  0814 85            	popw	x
2274  0815 4d            	tnz	a
2275  0816 27f2          	jreq	L7601
2277  0818               L5701:
2278                     ; 672   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_BYTE_RECEIVED))  /* EV7 */
2280  0818 ae0340        	ldw	x,#832
2281  081b 89            	pushw	x
2282  081c ae5210        	ldw	x,#21008
2283  081f cd0000        	call	_I2C_CheckEvent
2285  0822 85            	popw	x
2286  0823 4d            	tnz	a
2287  0824 27f2          	jreq	L5701
2288                     ; 677   RegValue = I2C_ReceiveData(M24LR04E_I2C) << 8;
2290  0826 ae5210        	ldw	x,#21008
2291  0829 cd0000        	call	_I2C_ReceiveData
2293  082c 5f            	clrw	x
2294  082d 97            	ld	xl,a
2295  082e 4f            	clr	a
2296  082f 02            	rlwa	x,a
2297  0830 1f01          	ldw	(OFST-1,sp),x
2298                     ; 680   I2C_AcknowledgeConfig(M24LR04E_I2C, DISABLE);
2300  0832 4b00          	push	#0
2301  0834 ae5210        	ldw	x,#21008
2302  0837 cd0000        	call	_I2C_AcknowledgeConfig
2304  083a 84            	pop	a
2305                     ; 683   I2C_GenerateSTOP(M24LR04E_I2C, ENABLE);
2307  083b 4b01          	push	#1
2308  083d ae5210        	ldw	x,#21008
2309  0840 cd0000        	call	_I2C_GenerateSTOP
2311  0843 84            	pop	a
2313  0844               L3011:
2314                     ; 686   while (I2C_GetFlagStatus(M24LR04E_I2C, I2C_FLAG_RXNE) == RESET)
2316  0844 ae0140        	ldw	x,#320
2317  0847 89            	pushw	x
2318  0848 ae5210        	ldw	x,#21008
2319  084b cd0000        	call	_I2C_GetFlagStatus
2321  084e 85            	popw	x
2322  084f 4d            	tnz	a
2323  0850 27f2          	jreq	L3011
2324                     ; 690   RegValue |= I2C_ReceiveData(M24LR04E_I2C);
2326  0852 ae5210        	ldw	x,#21008
2327  0855 cd0000        	call	_I2C_ReceiveData
2329  0858 5f            	clrw	x
2330  0859 97            	ld	xl,a
2331  085a 01            	rrwa	x,a
2332  085b 1a02          	or	a,(OFST+0,sp)
2333  085d 01            	rrwa	x,a
2334  085e 1a01          	or	a,(OFST-1,sp)
2335  0860 01            	rrwa	x,a
2336  0861 1f01          	ldw	(OFST-1,sp),x
2337                     ; 693   return (RegValue >> 7);
2339  0863 1e01          	ldw	x,(OFST-1,sp)
2340  0865 4f            	clr	a
2341  0866 01            	rrwa	x,a
2342  0867 48            	sll	a
2343  0868 59            	rlcw	x
2346  0869 5b02          	addw	sp,#2
2347  086b 81            	ret
2390                     ; 701 uint8_t M24LR04E_ReadConfReg(void)
2390                     ; 702 {
2391                     	switch	.text
2392  086c               _M24LR04E_ReadConfReg:
2394  086c 88            	push	a
2395       00000001      OFST:	set	1
2398                     ; 703   __IO uint8_t RegValue = 0;
2400  086d 0f01          	clr	(OFST+0,sp)
2401                     ; 706   I2C_AcknowledgeConfig(M24LR04E_I2C, ENABLE);
2403  086f 4b01          	push	#1
2404  0871 ae5210        	ldw	x,#21008
2405  0874 cd0000        	call	_I2C_AcknowledgeConfig
2407  0877 84            	pop	a
2408                     ; 709   I2C_GenerateSTART(M24LR04E_I2C, ENABLE);
2410  0878 4b01          	push	#1
2411  087a ae5210        	ldw	x,#21008
2412  087d cd0000        	call	_I2C_GenerateSTART
2414  0880 84            	pop	a
2416  0881               L7211:
2417                     ; 712   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_MODE_SELECT))  /* EV5 */
2419  0881 ae0301        	ldw	x,#769
2420  0884 89            	pushw	x
2421  0885 ae5210        	ldw	x,#21008
2422  0888 cd0000        	call	_I2C_CheckEvent
2424  088b 85            	popw	x
2425  088c 4d            	tnz	a
2426  088d 27f2          	jreq	L7211
2427                     ; 717   I2C_Send7bitAddress(M24LR04E_I2C, M24LR04E_ADDR, I2C_Direction_Transmitter);
2429  088f 4b00          	push	#0
2430  0891 4b90          	push	#144
2431  0893 ae5210        	ldw	x,#21008
2432  0896 cd0000        	call	_I2C_Send7bitAddress
2434  0899 85            	popw	x
2436  089a               L5311:
2437                     ; 720   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)) /* EV6 */
2439  089a ae0782        	ldw	x,#1922
2440  089d 89            	pushw	x
2441  089e ae5210        	ldw	x,#21008
2442  08a1 cd0000        	call	_I2C_CheckEvent
2444  08a4 85            	popw	x
2445  08a5 4d            	tnz	a
2446  08a6 27f2          	jreq	L5311
2447                     ; 725   I2C_SendData(M24LR04E_I2C, M24LR04E_REG_CONF);
2449  08a8 4b01          	push	#1
2450  08aa ae5210        	ldw	x,#21008
2451  08ad cd0000        	call	_I2C_SendData
2453  08b0 84            	pop	a
2455  08b1               L3411:
2456                     ; 728   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_BYTE_TRANSMITTED)) /* EV8 */
2458  08b1 ae0784        	ldw	x,#1924
2459  08b4 89            	pushw	x
2460  08b5 ae5210        	ldw	x,#21008
2461  08b8 cd0000        	call	_I2C_CheckEvent
2463  08bb 85            	popw	x
2464  08bc 4d            	tnz	a
2465  08bd 27f2          	jreq	L3411
2466                     ; 734   I2C_GenerateSTART(M24LR04E_I2C, ENABLE);
2468  08bf 4b01          	push	#1
2469  08c1 ae5210        	ldw	x,#21008
2470  08c4 cd0000        	call	_I2C_GenerateSTART
2472  08c7 84            	pop	a
2474  08c8               L1511:
2475                     ; 737   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_MODE_SELECT))  /* EV5 */
2477  08c8 ae0301        	ldw	x,#769
2478  08cb 89            	pushw	x
2479  08cc ae5210        	ldw	x,#21008
2480  08cf cd0000        	call	_I2C_CheckEvent
2482  08d2 85            	popw	x
2483  08d3 4d            	tnz	a
2484  08d4 27f2          	jreq	L1511
2485                     ; 742   I2C_Send7bitAddress(M24LR04E_I2C, M24LR04E_ADDR, I2C_Direction_Receiver);
2487  08d6 4b01          	push	#1
2488  08d8 4b90          	push	#144
2489  08da ae5210        	ldw	x,#21008
2490  08dd cd0000        	call	_I2C_Send7bitAddress
2492  08e0 85            	popw	x
2494  08e1               L7511:
2495                     ; 745   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))  /* EV6 */
2497  08e1 ae0302        	ldw	x,#770
2498  08e4 89            	pushw	x
2499  08e5 ae5210        	ldw	x,#21008
2500  08e8 cd0000        	call	_I2C_CheckEvent
2502  08eb 85            	popw	x
2503  08ec 4d            	tnz	a
2504  08ed 27f2          	jreq	L7511
2505                     ; 750   I2C_AcknowledgeConfig(M24LR04E_I2C, DISABLE);
2507  08ef 4b00          	push	#0
2508  08f1 ae5210        	ldw	x,#21008
2509  08f4 cd0000        	call	_I2C_AcknowledgeConfig
2511  08f7 84            	pop	a
2512                     ; 753   I2C_GenerateSTOP(M24LR04E_I2C, ENABLE);
2514  08f8 4b01          	push	#1
2515  08fa ae5210        	ldw	x,#21008
2516  08fd cd0000        	call	_I2C_GenerateSTOP
2518  0900 84            	pop	a
2520  0901               L5611:
2521                     ; 756   while (I2C_GetFlagStatus(M24LR04E_I2C, I2C_FLAG_RXNE) == RESET);
2523  0901 ae0140        	ldw	x,#320
2524  0904 89            	pushw	x
2525  0905 ae5210        	ldw	x,#21008
2526  0908 cd0000        	call	_I2C_GetFlagStatus
2528  090b 85            	popw	x
2529  090c 4d            	tnz	a
2530  090d 27f2          	jreq	L5611
2531                     ; 759   RegValue = I2C_ReceiveData(M24LR04E_I2C);
2533  090f ae5210        	ldw	x,#21008
2534  0912 cd0000        	call	_I2C_ReceiveData
2536  0915 6b01          	ld	(OFST+0,sp),a
2537                     ; 762   return (RegValue);
2539  0917 7b01          	ld	a,(OFST+0,sp)
2542  0919 5b01          	addw	sp,#1
2543  091b 81            	ret
2583                     ; 771 void M24LR04E_WriteConfReg(uint8_t RegValue)
2583                     ; 772 {
2584                     	switch	.text
2585  091c               _M24LR04E_WriteConfReg:
2587  091c 88            	push	a
2588       00000000      OFST:	set	0
2591                     ; 775   I2C_GenerateSTART(M24LR04E_I2C, ENABLE);
2593  091d 4b01          	push	#1
2594  091f ae5210        	ldw	x,#21008
2595  0922 cd0000        	call	_I2C_GenerateSTART
2597  0925 84            	pop	a
2599  0926               L1121:
2600                     ; 778   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_MODE_SELECT))  /* EV5 */
2602  0926 ae0301        	ldw	x,#769
2603  0929 89            	pushw	x
2604  092a ae5210        	ldw	x,#21008
2605  092d cd0000        	call	_I2C_CheckEvent
2607  0930 85            	popw	x
2608  0931 4d            	tnz	a
2609  0932 27f2          	jreq	L1121
2610                     ; 783   I2C_Send7bitAddress(M24LR04E_I2C, M24LR04E_ADDR, I2C_Direction_Transmitter);
2612  0934 4b00          	push	#0
2613  0936 4b90          	push	#144
2614  0938 ae5210        	ldw	x,#21008
2615  093b cd0000        	call	_I2C_Send7bitAddress
2617  093e 85            	popw	x
2619  093f               L7121:
2620                     ; 786   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)) /* EV6 */
2622  093f ae0782        	ldw	x,#1922
2623  0942 89            	pushw	x
2624  0943 ae5210        	ldw	x,#21008
2625  0946 cd0000        	call	_I2C_CheckEvent
2627  0949 85            	popw	x
2628  094a 4d            	tnz	a
2629  094b 27f2          	jreq	L7121
2630                     ; 791   I2C_SendData(M24LR04E_I2C, M24LR04E_REG_CONF);
2632  094d 4b01          	push	#1
2633  094f ae5210        	ldw	x,#21008
2634  0952 cd0000        	call	_I2C_SendData
2636  0955 84            	pop	a
2638  0956               L5221:
2639                     ; 794   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_BYTE_TRANSMITTED)) /* EV8 */
2641  0956 ae0784        	ldw	x,#1924
2642  0959 89            	pushw	x
2643  095a ae5210        	ldw	x,#21008
2644  095d cd0000        	call	_I2C_CheckEvent
2646  0960 85            	popw	x
2647  0961 4d            	tnz	a
2648  0962 27f2          	jreq	L5221
2649                     ; 799   I2C_SendData(M24LR04E_I2C, RegValue);
2651  0964 7b01          	ld	a,(OFST+1,sp)
2652  0966 88            	push	a
2653  0967 ae5210        	ldw	x,#21008
2654  096a cd0000        	call	_I2C_SendData
2656  096d 84            	pop	a
2658  096e               L3321:
2659                     ; 802   while (!I2C_CheckEvent(M24LR04E_I2C, I2C_EVENT_MASTER_BYTE_TRANSMITTED)) /* EV8 */
2661  096e ae0784        	ldw	x,#1924
2662  0971 89            	pushw	x
2663  0972 ae5210        	ldw	x,#21008
2664  0975 cd0000        	call	_I2C_CheckEvent
2666  0978 85            	popw	x
2667  0979 4d            	tnz	a
2668  097a 27f2          	jreq	L3321
2669                     ; 807   I2C_GenerateSTOP(M24LR04E_I2C, ENABLE);
2671  097c 4b01          	push	#1
2672  097e ae5210        	ldw	x,#21008
2673  0981 cd0000        	call	_I2C_GenerateSTOP
2675  0984 84            	pop	a
2676                     ; 808 }
2679  0985 84            	pop	a
2680  0986 81            	ret
2708                     ; 815 static void M24LR04E_LowLevel_DeInit(void)
2708                     ; 816 {
2709                     	switch	.text
2710  0987               L3_M24LR04E_LowLevel_DeInit:
2714                     ; 818   I2C_Cmd(M24LR04E_I2C, DISABLE);
2716  0987 4b00          	push	#0
2717  0989 ae5210        	ldw	x,#21008
2718  098c cd0000        	call	_I2C_Cmd
2720  098f 84            	pop	a
2721                     ; 820   I2C_DeInit(M24LR04E_I2C);
2723  0990 ae5210        	ldw	x,#21008
2724  0993 cd0000        	call	_I2C_DeInit
2726                     ; 823   CLK_PeripheralClockConfig(M24LR04E_I2C_CLK, DISABLE);
2728  0996 ae0300        	ldw	x,#768
2729  0999 cd0000        	call	_CLK_PeripheralClockConfig
2731                     ; 826   GPIO_Init(M24LR04E_I2C_SCL_GPIO_PORT, M24LR04E_I2C_SCL_PIN, GPIO_Mode_In_PU_No_IT);
2733  099c 4b40          	push	#64
2734  099e 4b02          	push	#2
2735  09a0 ae500a        	ldw	x,#20490
2736  09a3 cd0000        	call	_GPIO_Init
2738  09a6 85            	popw	x
2739                     ; 829   GPIO_Init(M24LR04E_I2C_SDA_GPIO_PORT, M24LR04E_I2C_SDA_PIN, GPIO_Mode_In_PU_No_IT);
2741  09a7 4b40          	push	#64
2742  09a9 4b01          	push	#1
2743  09ab ae500a        	ldw	x,#20490
2744  09ae cd0000        	call	_GPIO_Init
2746  09b1 85            	popw	x
2747                     ; 831 }
2750  09b2 81            	ret
2775                     ; 838 static void M24LR04E_LowLevel_Init(void)
2775                     ; 839 {
2776                     	switch	.text
2777  09b3               L5_M24LR04E_LowLevel_Init:
2781                     ; 841   CLK_PeripheralClockConfig(M24LR04E_I2C_CLK, ENABLE);
2783  09b3 ae0301        	ldw	x,#769
2784  09b6 cd0000        	call	_CLK_PeripheralClockConfig
2786                     ; 843 }
2789  09b9 81            	ret
2802                     	xdef	_M24LR04E_WriteBuffer
2803                     	xdef	_M24LR04E_WriteOneByte
2804                     	xdef	_M24LR04E_ReadBuffer
2805                     	xdef	_M24LR04E_ReadOneByte
2806                     	xdef	_M24LR04E_WriteConfReg
2807                     	xdef	_M24LR04E_ReadConfReg
2808                     	xdef	_M24LR04E_WriteReg
2809                     	xdef	_M24LR04E_ReadReg
2810                     	xdef	_M24LR04E_ReadTemp
2811                     	xdef	_M24LR04E_GetStatus
2812                     	xdef	_M24LR04E_Init
2813                     	xdef	_M24LR04E_DeInit
2814                     	xref	_I2C_ClearFlag
2815                     	xref	_I2C_GetFlagStatus
2816                     	xref	_I2C_CheckEvent
2817                     	xref	_I2C_Send7bitAddress
2818                     	xref	_I2C_ReceiveData
2819                     	xref	_I2C_SendData
2820                     	xref	_I2C_AcknowledgeConfig
2821                     	xref	_I2C_GenerateSTOP
2822                     	xref	_I2C_GenerateSTART
2823                     	xref	_I2C_Cmd
2824                     	xref	_I2C_Init
2825                     	xref	_I2C_DeInit
2826                     	xref	_GPIO_Init
2827                     	xref	_CLK_PeripheralClockConfig
2846                     	xref	c_lrzmp
2847                     	xref	c_ltor
2848                     	xref	c_lzmp
2849                     	xref	c_lgsbc
2850                     	end
