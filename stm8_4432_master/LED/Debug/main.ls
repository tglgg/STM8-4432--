   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
2467                     ; 52 void delay_ms(u16 ms)
2467                     ; 53 {
2469                     	switch	.text
2470  0000               _delay_ms:
2472  0000 89            	pushw	x
2473  0001 88            	push	a
2474       00000001      OFST:	set	1
2477  0002 201b          	jra	L1161
2478  0004               L7061:
2479                     ; 57 				for(i=0;i<250;i++)
2481  0004 0f01          	clr	(OFST+0,sp)
2482  0006               L5161:
2485  0006 0c01          	inc	(OFST+0,sp)
2488  0008 7b01          	ld	a,(OFST+0,sp)
2489  000a a1fa          	cp	a,#250
2490  000c 25f8          	jrult	L5161
2491                     ; 59 				for(i=0;i<75;i++)
2493  000e 0f01          	clr	(OFST+0,sp)
2494  0010               L3261:
2497  0010 0c01          	inc	(OFST+0,sp)
2500  0012 7b01          	ld	a,(OFST+0,sp)
2501  0014 a14b          	cp	a,#75
2502  0016 25f8          	jrult	L3261
2503                     ; 61 				ms--;
2505  0018 1e02          	ldw	x,(OFST+1,sp)
2506  001a 1d0001        	subw	x,#1
2507  001d 1f02          	ldw	(OFST+1,sp),x
2508  001f               L1161:
2509                     ; 55 			while(ms!=0)
2511  001f 1e02          	ldw	x,(OFST+1,sp)
2512  0021 26e1          	jrne	L7061
2513                     ; 63 }
2516  0023 5b03          	addw	sp,#3
2517  0025 81            	ret
2556                     ; 65 void delay_us(u16 us)
2556                     ; 66 {
2557                     	switch	.text
2558  0026               _delay_us:
2560  0026 89            	pushw	x
2561  0027 88            	push	a
2562       00000001      OFST:	set	1
2565  0028 201b          	jra	L1561
2566  002a               L7461:
2567                     ; 70 				for(i=0;i<25;i++)
2569  002a 0f01          	clr	(OFST+0,sp)
2570  002c               L5561:
2573  002c 0c01          	inc	(OFST+0,sp)
2576  002e 7b01          	ld	a,(OFST+0,sp)
2577  0030 a119          	cp	a,#25
2578  0032 25f8          	jrult	L5561
2579                     ; 72 				for(i=0;i<7;i++)
2581  0034 0f01          	clr	(OFST+0,sp)
2582  0036               L3661:
2585  0036 0c01          	inc	(OFST+0,sp)
2588  0038 7b01          	ld	a,(OFST+0,sp)
2589  003a a107          	cp	a,#7
2590  003c 25f8          	jrult	L3661
2591                     ; 74 				us--;
2593  003e 1e02          	ldw	x,(OFST+1,sp)
2594  0040 1d0001        	subw	x,#1
2595  0043 1f02          	ldw	(OFST+1,sp),x
2596  0045               L1561:
2597                     ; 68 			while(us!=0)
2599  0045 1e02          	ldw	x,(OFST+1,sp)
2600  0047 26e1          	jrne	L7461
2601                     ; 76 }
2604  0049 5b03          	addw	sp,#3
2605  004b 81            	ret
2618                     	switch	.data
2619  0000               _GPIO:
2620  0000 01            	dc.b	1
2621  0001 02            	dc.b	2
2622  0002 04            	dc.b	4
2623  0003 08            	dc.b	8
2624  0004 10            	dc.b	16
2625  0005 20            	dc.b	32
2626  0006 40            	dc.b	64
2627  0007 80            	dc.b	128
2684                     ; 29 void Init_GPIO(u8 port,u8 io)
2684                     ; 30 {
2685                     	switch	.text
2686  004c               _Init_GPIO:
2688  004c 89            	pushw	x
2689       00000000      OFST:	set	0
2692                     ; 31 	if(io==1)
2694  004d 9f            	ld	a,xl
2695  004e a101          	cp	a,#1
2696  0050 263b          	jrne	L1471
2697                     ; 33 		switch(port)
2699  0052 9e            	ld	a,xh
2701                     ; 44 					default: break;
2702  0053 4d            	tnz	a
2703  0054 270b          	jreq	L1761
2704  0056 4a            	dec	a
2705  0057 2712          	jreq	L3761
2706  0059 4a            	dec	a
2707  005a 2719          	jreq	L5761
2708  005c 4a            	dec	a
2709  005d 2720          	jreq	L7761
2710  005f 2044          	jra	L7471
2711  0061               L1761:
2712                     ; 36 					case 0: PA_DDR=0xff;PA_CR1=0xff;break;
2714  0061 35ff5002      	mov	_PA_DDR,#255
2717  0065 35ff5003      	mov	_PA_CR1,#255
2720  0069 203a          	jra	L7471
2721  006b               L3761:
2722                     ; 37 					case 1: PB_DDR=0xff;PB_CR1=0xff;break; 
2724  006b 35ff5007      	mov	_PB_DDR,#255
2727  006f 35ff5008      	mov	_PB_CR1,#255
2730  0073 2030          	jra	L7471
2731  0075               L5761:
2732                     ; 38 					case 2: PC_DDR=0xff;PC_CR1=0xff;break;  
2734  0075 35ff500c      	mov	_PC_DDR,#255
2737  0079 35ff500d      	mov	_PC_CR1,#255
2740  007d 2026          	jra	L7471
2741  007f               L7761:
2742                     ; 39 					case 3: PD_DDR=0xff;PD_CR1=0xff;break;
2744  007f 35ff5011      	mov	_PD_DDR,#255
2747  0083 35ff5012      	mov	_PD_CR1,#255
2750  0087 201c          	jra	L7471
2751  0089               L1071:
2752                     ; 44 					default: break;
2754  0089 201a          	jra	L7471
2755  008b               L5471:
2757  008b 2018          	jra	L7471
2758  008d               L1471:
2759                     ; 50 		switch(port)
2761  008d 7b01          	ld	a,(OFST+1,sp)
2763                     ; 61 					default: break;
2764  008f 4d            	tnz	a
2765  0090 270b          	jreq	L3071
2766  0092 4a            	dec	a
2767  0093 2712          	jreq	L5071
2768  0095 4a            	dec	a
2769  0096 2719          	jreq	L7071
2770  0098 4a            	dec	a
2771  0099 2720          	jreq	L1171
2772  009b 2008          	jra	L7471
2773  009d               L3071:
2774                     ; 53 					case 0: PA_DDR=0x00;PA_CR2=0xff;break;
2776  009d 725f5002      	clr	_PA_DDR
2779  00a1 35ff5004      	mov	_PA_CR2,#255
2781  00a5               L7471:
2782                     ; 65 }
2785  00a5 85            	popw	x
2786  00a6 81            	ret
2787  00a7               L5071:
2788                     ; 54 					case 1: PB_DDR=0x00;PB_CR2=0xff;break; 
2790  00a7 725f5007      	clr	_PB_DDR
2793  00ab 35ff5009      	mov	_PB_CR2,#255
2796  00af 20f4          	jra	L7471
2797  00b1               L7071:
2798                     ; 55 					case 2: PC_DDR=0x00;PC_CR2=0xff;break;  
2800  00b1 725f500c      	clr	_PC_DDR
2803  00b5 35ff500e      	mov	_PC_CR2,#255
2806  00b9 20ea          	jra	L7471
2807  00bb               L1171:
2808                     ; 56 					case 3: PD_DDR=0x00;PD_CR2=0xff;break;
2810  00bb 725f5011      	clr	_PD_DDR
2813  00bf 35ff5013      	mov	_PD_CR2,#255
2816  00c3 20e0          	jra	L7471
2817  00c5               L3171:
2818                     ; 61 					default: break;
2820  00c5 20de          	jra	L7471
2821  00c7               L3571:
2822  00c7 20dc          	jra	L7471
2867                     ; 67 void Send_led(u8 port)
2867                     ; 68 {
2868                     	switch	.text
2869  00c9               _Send_led:
2871  00c9 88            	push	a
2872  00ca 88            	push	a
2873       00000001      OFST:	set	1
2876                     ; 70 	for(i=0;i<8;i++)
2878  00cb 0f01          	clr	(OFST+0,sp)
2879  00cd               L5002:
2880                     ; 72 			switch(port)
2882  00cd 7b02          	ld	a,(OFST+1,sp)
2884                     ; 82 				default: break;
2885  00cf 4d            	tnz	a
2886  00d0 270b          	jreq	L5571
2887  00d2 4a            	dec	a
2888  00d3 2714          	jreq	L7571
2889  00d5 4a            	dec	a
2890  00d6 271d          	jreq	L1671
2891  00d8 4a            	dec	a
2892  00d9 2726          	jreq	L3671
2893  00db 202e          	jra	L5102
2894  00dd               L5571:
2895                     ; 74 				case 0: PA_ODR=GPIO[i];break;
2897  00dd 7b01          	ld	a,(OFST+0,sp)
2898  00df 5f            	clrw	x
2899  00e0 97            	ld	xl,a
2900  00e1 d60000        	ld	a,(_GPIO,x)
2901  00e4 c75000        	ld	_PA_ODR,a
2904  00e7 2022          	jra	L5102
2905  00e9               L7571:
2906                     ; 75 				case 1: PB_ODR=GPIO[i];break; 
2908  00e9 7b01          	ld	a,(OFST+0,sp)
2909  00eb 5f            	clrw	x
2910  00ec 97            	ld	xl,a
2911  00ed d60000        	ld	a,(_GPIO,x)
2912  00f0 c75005        	ld	_PB_ODR,a
2915  00f3 2016          	jra	L5102
2916  00f5               L1671:
2917                     ; 76 				case 2: PC_ODR=GPIO[i];break;  
2919  00f5 7b01          	ld	a,(OFST+0,sp)
2920  00f7 5f            	clrw	x
2921  00f8 97            	ld	xl,a
2922  00f9 d60000        	ld	a,(_GPIO,x)
2923  00fc c7500a        	ld	_PC_ODR,a
2926  00ff 200a          	jra	L5102
2927  0101               L3671:
2928                     ; 77 				case 3: PD_ODR=GPIO[i];break;
2930  0101 7b01          	ld	a,(OFST+0,sp)
2931  0103 5f            	clrw	x
2932  0104 97            	ld	xl,a
2933  0105 d60000        	ld	a,(_GPIO,x)
2934  0108 c7500f        	ld	_PD_ODR,a
2937  010b               L5671:
2938                     ; 82 				default: break;
2940  010b               L5102:
2941                     ; 84 			delay_ms(500);
2943  010b ae01f4        	ldw	x,#500
2944  010e cd0000        	call	_delay_ms
2946                     ; 70 	for(i=0;i<8;i++)
2948  0111 0c01          	inc	(OFST+0,sp)
2951  0113 7b01          	ld	a,(OFST+0,sp)
2952  0115 a108          	cp	a,#8
2953  0117 25b4          	jrult	L5002
2954                     ; 86 }
2957  0119 85            	popw	x
2958  011a 81            	ret
3012                     ; 17 void SPI_Init(void)
3012                     ; 18 {
3013                     	switch	.text
3014  011b               _SPI_Init:
3018                     ; 21 	SPI_CR1|=0x04;   //配置为主设备
3020  011b 72145200      	bset	_SPI_CR1,#2
3021                     ; 23 	SPI_CR2|=0x03;   //配置NSS脚为1
3023  011f c65201        	ld	a,_SPI_CR2
3024  0122 aa03          	or	a,#3
3025  0124 c75201        	ld	_SPI_CR2,a
3026                     ; 25 	SPI_CR1|=0x40;   //开启SPI
3028  0127 721c5200      	bset	_SPI_CR1,#6
3029                     ; 30 }
3032  012b 81            	ret
3066                     ; 32 void SPI_sendchar(u8 data)
3066                     ; 33 {	
3067                     	switch	.text
3068  012c               _SPI_sendchar:
3072                     ; 34 	SPI_DR=data;
3074  012c c75204        	ld	_SPI_DR,a
3076  012f               L3602:
3077                     ; 35 	while(!(SPI_SR & 0x02));
3079  012f c65203        	ld	a,_SPI_SR
3080  0132 a502          	bcp	a,#2
3081  0134 27f9          	jreq	L3602
3082                     ; 36 }
3085  0136 81            	ret
3119                     ; 38 u8 SPI_rechar(void)
3119                     ; 39 {	
3120                     	switch	.text
3121  0137               _SPI_rechar:
3123  0137 88            	push	a
3124       00000001      OFST:	set	1
3127                     ; 42 	SPI_DR=0x55;
3129  0138 35555204      	mov	_SPI_DR,#85
3131  013c               L7012:
3132                     ; 43 	while(!(SPI_SR & 0x02));
3134  013c c65203        	ld	a,_SPI_SR
3135  013f a502          	bcp	a,#2
3136  0141 27f9          	jreq	L7012
3137                     ; 45 	data=SPI_DR;
3139  0143 c65204        	ld	a,_SPI_DR
3140  0146 6b01          	ld	(OFST+0,sp),a
3142  0148               L7112:
3143                     ; 46 	while(!(SPI_SR & 0x01));
3145  0148 c65203        	ld	a,_SPI_SR
3146  014b a501          	bcp	a,#1
3147  014d 27f9          	jreq	L7112
3148                     ; 47 	return data;
3150  014f 7b01          	ld	a,(OFST+0,sp)
3153  0151 5b01          	addw	sp,#1
3154  0153 81            	ret
3212                     ; 31 void ByteSend(Uint8 src)
3212                     ; 32 {
3213                     	switch	.text
3214  0154               _ByteSend:
3216  0154 88            	push	a
3217  0155 88            	push	a
3218       00000001      OFST:	set	1
3221  0156               L1512:
3222                     ; 37 		while(!(SPI_SR & 0x02));
3224  0156 c65203        	ld	a,_SPI_SR
3225  0159 a502          	bcp	a,#2
3226  015b 27f9          	jreq	L1512
3227                     ; 38 		SPI_DR=src;
3229  015d 7b02          	ld	a,(OFST+1,sp)
3230  015f c75204        	ld	_SPI_DR,a
3232  0162               L1612:
3233                     ; 39 		while(!(SPI_SR & 0x01));
3235  0162 c65203        	ld	a,_SPI_SR
3236  0165 a501          	bcp	a,#1
3237  0167 27f9          	jreq	L1612
3238                     ; 40 		i==SPI_DR;
3240  0169 7b01          	ld	a,(OFST+0,sp)
3241  016b c15204        	cp	a,_SPI_DR
3242  016e 2605          	jrne	L42
3243  0170 ae0001        	ldw	x,#1
3244  0173 2001          	jra	L62
3245  0175               L42:
3246  0175 5f            	clrw	x
3247  0176               L62:
3248                     ; 44 }
3251  0176 85            	popw	x
3252  0177 81            	ret
3286                     ; 49 Uint8 ByteRead(void)
3286                     ; 50 {
3287                     	switch	.text
3288  0178               _ByteRead:
3290  0178 88            	push	a
3291       00000001      OFST:	set	1
3294  0179               L3022:
3295                     ; 54 	while(!(SPI_SR & 0x02));
3297  0179 c65203        	ld	a,_SPI_SR
3298  017c a502          	bcp	a,#2
3299  017e 27f9          	jreq	L3022
3300                     ; 55 	SPI_DR=0x55;
3302  0180 35555204      	mov	_SPI_DR,#85
3304  0184               L3122:
3305                     ; 57 	while(!(SPI_SR & 0x01));
3307  0184 c65203        	ld	a,_SPI_SR
3308  0187 a501          	bcp	a,#1
3309  0189 27f9          	jreq	L3122
3310                     ; 58 	data=SPI_DR;
3312  018b c65204        	ld	a,_SPI_DR
3313  018e 6b01          	ld	(OFST+0,sp),a
3314                     ; 61 	return data;
3316  0190 7b01          	ld	a,(OFST+0,sp)
3319  0192 5b01          	addw	sp,#1
3320  0194 81            	ret
3368                     ; 82 void SpiWriteRegister (u8 reg, u8 value)
3368                     ; 83 {
3369                     	switch	.text
3370  0195               _SpiWriteRegister:
3372  0195 89            	pushw	x
3373  0196 88            	push	a
3374       00000001      OFST:	set	1
3377                     ; 87     cbi(PA_ODR,3);    //SCS = 0;     NSS = 0;                              
3379  0197 72175000      	bres	_PA_ODR,#3
3380                     ; 88     Temp_byte = (reg|0x80);				//write data into the SPI register		
3382  019b 9e            	ld	a,xh
3383  019c aa80          	or	a,#128
3384  019e 6b01          	ld	(OFST+0,sp),a
3385                     ; 89 	  ByteSend(Temp_byte);
3387  01a0 7b01          	ld	a,(OFST+0,sp)
3388  01a2 adb0          	call	_ByteSend
3390                     ; 91 		Temp_byte = value;
3392  01a4 7b03          	ld	a,(OFST+2,sp)
3393  01a6 6b01          	ld	(OFST+0,sp),a
3394                     ; 92 		ByteSend(Temp_byte);
3396  01a8 7b01          	ld	a,(OFST+0,sp)
3397  01aa ada8          	call	_ByteSend
3399                     ; 94 	  sbi(PA_ODR,3);    //SCS = 1;NSS = 1;    										
3401  01ac 72165000      	bset	_PA_ODR,#3
3402                     ; 95 }
3405  01b0 5b03          	addw	sp,#3
3406  01b2 81            	ret
3455                     ; 110 u8 SpiReadRegister (u8 reg)
3455                     ; 111 {
3456                     	switch	.text
3457  01b3               _SpiReadRegister:
3459  01b3 88            	push	a
3460       00000001      OFST:	set	1
3463                     ; 116 	  cbi(PA_ODR,3);    //SCS = 0; NSS = 0;
3465  01b4 72175000      	bres	_PA_ODR,#3
3466                     ; 118 	  Temp_byte = reg;				//write data into the SPI register
3468  01b8 6b01          	ld	(OFST+0,sp),a
3469                     ; 119 	  ByteSend(Temp_byte);	  
3471  01ba 7b01          	ld	a,(OFST+0,sp)
3472  01bc ad96          	call	_ByteSend
3474                     ; 120 		Result=ByteRead();
3476  01be adb8          	call	_ByteRead
3478  01c0 6b01          	ld	(OFST+0,sp),a
3479                     ; 122 	  sbi(PA_ODR,3);    //SCS = 1;NSS = 1;                            	
3481  01c2 72165000      	bset	_PA_ODR,#3
3482                     ; 123 		return(Result);
3484  01c6 7b01          	ld	a,(OFST+0,sp)
3487  01c8 5b01          	addw	sp,#1
3488  01ca 81            	ret
3532                     ; 132 void init_IA4432(void)
3532                     ; 133 {
3533                     	switch	.text
3534  01cb               _init_IA4432:
3538                     ; 137 		sbi(PA_DDR,3);//SCS OUTPUT
3540  01cb 72165002      	bset	_PA_DDR,#3
3541                     ; 138 		sbi(PA_CR1,3);
3543  01cf 72165003      	bset	_PA_CR1,#3
3544                     ; 139 		cbi(PA_CR2,3);
3546  01d3 72175004      	bres	_PA_CR2,#3
3547                     ; 141 		sbi(PC_DDR,5);//SCK OUTPUT
3549  01d7 721a500c      	bset	_PC_DDR,#5
3550                     ; 142 		sbi(PC_CR1,5);
3552  01db 721a500d      	bset	_PC_CR1,#5
3553                     ; 143 		cbi(PC_CR2,5);
3555  01df 721b500e      	bres	_PC_CR2,#5
3556                     ; 145 		sbi(PC_DDR,6);//SDIO OUTPUT
3558  01e3 721c500c      	bset	_PC_DDR,#6
3559                     ; 146 		sbi(PC_CR1,6);
3561  01e7 721c500d      	bset	_PC_CR1,#6
3562                     ; 147 		cbi(PC_CR2,6);
3564  01eb 721d500e      	bres	_PC_CR2,#6
3565                     ; 149 		cbi(PC_DDR,7);//GIO2 INPUT
3567  01ef 721f500c      	bres	_PC_DDR,#7
3568                     ; 150 		sbi(PC_CR1,7);
3570  01f3 721e500d      	bset	_PC_CR1,#7
3571                     ; 151 		cbi(PC_CR2,7);
3573  01f7 721f500e      	bres	_PC_CR2,#7
3574                     ; 153 		cbi(PD_DDR,3);//GIO1 WTR INPUT
3576  01fb 72175011      	bres	_PD_DDR,#3
3577                     ; 154 		sbi(PD_CR1,3);
3579  01ff 72165012      	bset	_PD_CR1,#3
3580                     ; 155 		cbi(PD_CR2,3);
3582  0203 72175013      	bres	_PD_CR2,#3
3583                     ; 157     sbi(PA_ODR,3);
3585  0207 72165000      	bset	_PA_ODR,#3
3586                     ; 158     cbi(PC_ODR,5);//SCK = 0;
3588  020b 721b500a      	bres	_PC_ODR,#5
3589                     ; 159     sbi(PC_ODR,6);//SDIO = 1;
3591  020f 721c500a      	bset	_PC_ODR,#6
3592                     ; 161 		sbi(PD_DDR,5);//green_led OUTPUT
3594  0213 721a5011      	bset	_PD_DDR,#5
3595                     ; 162 	  sbi(PD_CR1,5);
3597  0217 721a5012      	bset	_PD_CR1,#5
3598                     ; 163 	  cbi(PD_CR2,5);
3600  021b 721b5013      	bres	_PD_CR2,#5
3601                     ; 165 		sbi(PD_DDR,6);//red_led OUTPUT
3603  021f 721c5011      	bset	_PD_DDR,#6
3604                     ; 166 	  sbi(PD_CR1,6);
3606  0223 721c5012      	bset	_PD_CR1,#6
3607                     ; 167 	  cbi(PD_CR2,6);
3609  0227 721d5013      	bres	_PD_CR2,#6
3610                     ; 169 	  cbi(PD_DDR,4);//key INPUT
3612  022b 72195011      	bres	_PD_DDR,#4
3613                     ; 170 	  sbi(PD_CR1,4);
3615  022f 72185012      	bset	_PD_CR1,#4
3616                     ; 171 	  cbi(PD_CR2,4);
3618  0233 72195013      	bres	_PD_CR2,#4
3619                     ; 173 		cbi(PD_DDR,3);//SET INPUT
3621  0237 72175011      	bres	_PD_DDR,#3
3622                     ; 174 	  sbi(PD_CR1,3);
3624  023b 72165012      	bset	_PD_CR1,#3
3625                     ; 175 	  cbi(PD_CR2,3);
3627  023f 72175013      	bres	_PD_CR2,#3
3628                     ; 177 		cbi(PB_DDR,4);//CKO INPUT
3630  0243 72195007      	bres	_PB_DDR,#4
3631                     ; 178 	  sbi(PB_CR1,4);
3633  0247 72185008      	bset	_PB_CR1,#4
3634                     ; 179 	  cbi(PB_CR2,4);
3636  024b 72195009      	bres	_PB_CR2,#4
3637                     ; 181 		SPI_Init();
3639  024f cd011b        	call	_SPI_Init
3641                     ; 187 	delay_ms(5000);
3643  0252 ae1388        	ldw	x,#5000
3644  0255 cd0000        	call	_delay_ms
3646                     ; 194 	ItStatus1 = SpiReadRegister(0x03);													//read the Interrupt Status1 register
3648  0258 a603          	ld	a,#3
3649  025a cd01b3        	call	_SpiReadRegister
3651  025d c7001c        	ld	_ItStatus1,a
3652                     ; 195 	ItStatus2 = SpiReadRegister(0x04);													//read the Interrupt Status2 register
3654  0260 a604          	ld	a,#4
3655  0262 cd01b3        	call	_SpiReadRegister
3657  0265 c7001b        	ld	_ItStatus2,a
3658                     ; 198    SpiWriteRegister(0x07, 0x80);															//write 0x80 to the Operating & Function Control1 register 
3660  0268 ae0080        	ldw	x,#128
3661  026b a607          	ld	a,#7
3662  026d 95            	ld	xh,a
3663  026e cd0195        	call	_SpiWriteRegister
3666  0271               L1722:
3667                     ; 202   while((PD_IDR&0x04)==0x04) ; 
3669  0271 c65010        	ld	a,_PD_IDR
3670  0274 a404          	and	a,#4
3671  0276 a104          	cp	a,#4
3672  0278 27f7          	jreq	L1722
3673                     ; 204 	ItStatus1 = SpiReadRegister(0x03);													//read the Interrupt Status1 register
3675  027a a603          	ld	a,#3
3676  027c cd01b3        	call	_SpiReadRegister
3678  027f c7001c        	ld	_ItStatus1,a
3679                     ; 205 	ItStatus2 = SpiReadRegister(0x04);													//read the Interrupt Status2 register
3681  0282 a604          	ld	a,#4
3682  0284 cd01b3        	call	_SpiReadRegister
3684  0287 c7001b        	ld	_ItStatus2,a
3686  028a               L1032:
3687                     ; 209   while((PD_IDR&0x04)==0x04) ;   
3689  028a c65010        	ld	a,_PD_IDR
3690  028d a404          	and	a,#4
3691  028f a104          	cp	a,#4
3692  0291 27f7          	jreq	L1032
3693                     ; 211 	ItStatus1 = SpiReadRegister(0x03);													//read the Interrupt Status1 register
3695  0293 a603          	ld	a,#3
3696  0295 cd01b3        	call	_SpiReadRegister
3698  0298 c7001c        	ld	_ItStatus1,a
3699                     ; 212 	ItStatus2 = SpiReadRegister(0x04);													//read the Interrupt Status2 register
3701  029b a604          	ld	a,#4
3702  029d cd01b3        	call	_SpiReadRegister
3704  02a0 c7001b        	ld	_ItStatus2,a
3705                     ; 221 	SpiWriteRegister(0x75, 0x53);															//write 0x75 to the Frequency Band Select register             
3707  02a3 ae0053        	ldw	x,#83
3708  02a6 a675          	ld	a,#117
3709  02a8 95            	ld	xh,a
3710  02a9 cd0195        	call	_SpiWriteRegister
3712                     ; 222 	SpiWriteRegister(0x76, 0x64);															//write 0xBB to the Nominal Carrier Frequency1 register
3714  02ac ae0064        	ldw	x,#100
3715  02af a676          	ld	a,#118
3716  02b1 95            	ld	xh,a
3717  02b2 cd0195        	call	_SpiWriteRegister
3719                     ; 223 	SpiWriteRegister(0x77, 0x00); 
3721  02b5 5f            	clrw	x
3722  02b6 a677          	ld	a,#119
3723  02b8 95            	ld	xh,a
3724  02b9 cd0195        	call	_SpiWriteRegister
3726                     ; 233 	SpiWriteRegister(0x2a, 0x14);	
3728  02bc ae0014        	ldw	x,#20
3729  02bf a62a          	ld	a,#42
3730  02c1 95            	ld	xh,a
3731  02c2 cd0195        	call	_SpiWriteRegister
3733                     ; 238 	SpiWriteRegister(0x6E, 0x09);															//write 0x4E to the TXDataRate 1 register
3735  02c5 ae0009        	ldw	x,#9
3736  02c8 a66e          	ld	a,#110
3737  02ca 95            	ld	xh,a
3738  02cb cd0195        	call	_SpiWriteRegister
3740                     ; 239 	SpiWriteRegister(0x6F, 0xd5);															//write 0xA5 to the TXDataRate 0 register
3742  02ce ae00d5        	ldw	x,#213
3743  02d1 a66f          	ld	a,#111
3744  02d3 95            	ld	xh,a
3745  02d4 cd0195        	call	_SpiWriteRegister
3747                     ; 240 	SpiWriteRegister(0x70, 0x2C);	
3749  02d7 ae002c        	ldw	x,#44
3750  02da a670          	ld	a,#112
3751  02dc 95            	ld	xh,a
3752  02dd cd0195        	call	_SpiWriteRegister
3754                     ; 246     SpiWriteRegister(0x72, 0x38);	//(1.2kbps)	
3756  02e0 ae0038        	ldw	x,#56
3757  02e3 a672          	ld	a,#114
3758  02e5 95            	ld	xh,a
3759  02e6 cd0195        	call	_SpiWriteRegister
3761                     ; 249 	SpiWriteRegister(0x1C, 0x1b);															//write 0x1E to the IF Filter Bandwidth register		
3763  02e9 ae001b        	ldw	x,#27
3764  02ec a61c          	ld	a,#28
3765  02ee 95            	ld	xh,a
3766  02ef cd0195        	call	_SpiWriteRegister
3768                     ; 250 	SpiWriteRegister(0x20, 0x83);															//write 0xD0 to the Clock Recovery Oversampling Ratio register		
3770  02f2 ae0083        	ldw	x,#131
3771  02f5 a620          	ld	a,#32
3772  02f7 95            	ld	xh,a
3773  02f8 cd0195        	call	_SpiWriteRegister
3775                     ; 251 	SpiWriteRegister(0x21, 0xc0);															//write 0x00 to the Clock Recovery Offset 2 register		
3777  02fb ae00c0        	ldw	x,#192
3778  02fe a621          	ld	a,#33
3779  0300 95            	ld	xh,a
3780  0301 cd0195        	call	_SpiWriteRegister
3782                     ; 252 	SpiWriteRegister(0x22, 0x13);															//write 0x9D to the Clock Recovery Offset 1 register		
3784  0304 ae0013        	ldw	x,#19
3785  0307 a622          	ld	a,#34
3786  0309 95            	ld	xh,a
3787  030a cd0195        	call	_SpiWriteRegister
3789                     ; 253 	SpiWriteRegister(0x23, 0xa9);															//write 0x49 to the Clock Recovery Offset 0 register		
3791  030d ae00a9        	ldw	x,#169
3792  0310 a623          	ld	a,#35
3793  0312 95            	ld	xh,a
3794  0313 cd0195        	call	_SpiWriteRegister
3796                     ; 254 	SpiWriteRegister(0x24, 0x00);															//write 0x00 to the Clock Recovery Timing Loop Gain 1 register		
3798  0316 5f            	clrw	x
3799  0317 a624          	ld	a,#36
3800  0319 95            	ld	xh,a
3801  031a cd0195        	call	_SpiWriteRegister
3803                     ; 255 	SpiWriteRegister(0x25, 0x03);															//write 0x24 to the Clock Recovery Timing Loop Gain 0 register		
3805  031d ae0003        	ldw	x,#3
3806  0320 a625          	ld	a,#37
3807  0322 95            	ld	xh,a
3808  0323 cd0195        	call	_SpiWriteRegister
3810                     ; 256 	SpiWriteRegister(0x1D, 0x40);															//write 0x40 to the AFC Loop Gearshift Override register		
3812  0326 ae0040        	ldw	x,#64
3813  0329 a61d          	ld	a,#29
3814  032b 95            	ld	xh,a
3815  032c cd0195        	call	_SpiWriteRegister
3817                     ; 257 	SpiWriteRegister(0x1E, 0x0A);															//write 0x0A to the AFC Timing Control register		
3819  032f ae000a        	ldw	x,#10
3820  0332 a61e          	ld	a,#30
3821  0334 95            	ld	xh,a
3822  0335 cd0195        	call	_SpiWriteRegister
3824                     ; 258 	SpiWriteRegister(0x2A, 0x14);															//write 0x20 to the AFC Limiter register		
3826  0338 ae0014        	ldw	x,#20
3827  033b a62a          	ld	a,#42
3828  033d 95            	ld	xh,a
3829  033e cd0195        	call	_SpiWriteRegister
3831                     ; 262 	SpiWriteRegister(0x34, 0x0A);															//write 0x0A to the Preamble Length register
3833  0341 ae000a        	ldw	x,#10
3834  0344 a634          	ld	a,#52
3835  0346 95            	ld	xh,a
3836  0347 cd0195        	call	_SpiWriteRegister
3838                     ; 264 	SpiWriteRegister(0x35, 0x2A); 														//write 0x2A to the Preamble Detection Control  register
3840  034a ae002a        	ldw	x,#42
3841  034d a635          	ld	a,#53
3842  034f 95            	ld	xh,a
3843  0350 cd0195        	call	_SpiWriteRegister
3845                     ; 268 	SpiWriteRegister(0x33, 0x02);															//write 0x02 to the Header Control2 register    
3847  0353 ae0002        	ldw	x,#2
3848  0356 a633          	ld	a,#51
3849  0358 95            	ld	xh,a
3850  0359 cd0195        	call	_SpiWriteRegister
3852                     ; 271 	SpiWriteRegister(0x36, 0x2D);															//write 0x2D to the Sync Word 3 register
3854  035c ae002d        	ldw	x,#45
3855  035f a636          	ld	a,#54
3856  0361 95            	ld	xh,a
3857  0362 cd0195        	call	_SpiWriteRegister
3859                     ; 272 	SpiWriteRegister(0x37, 0xD4);															//write 0xD4 to the Sync Word 2 register
3861  0365 ae00d4        	ldw	x,#212
3862  0368 a637          	ld	a,#55
3863  036a 95            	ld	xh,a
3864  036b cd0195        	call	_SpiWriteRegister
3866                     ; 275 	SpiWriteRegister(0x30, 0x8D);															//write 0x8D to the Data Access Control register
3868  036e ae008d        	ldw	x,#141
3869  0371 a630          	ld	a,#48
3870  0373 95            	ld	xh,a
3871  0374 cd0195        	call	_SpiWriteRegister
3873                     ; 277    SpiWriteRegister(0x32, 0x00 );														//write 0x00 to the Header Control1 register            
3875  0377 5f            	clrw	x
3876  0378 a632          	ld	a,#50
3877  037a 95            	ld	xh,a
3878  037b cd0195        	call	_SpiWriteRegister
3880                     ; 279 	SpiWriteRegister(0x71, 0x63);															//write 0x63 to the Modulation Mode Control 2 register
3882  037e ae0063        	ldw	x,#99
3883  0381 a671          	ld	a,#113
3884  0383 95            	ld	xh,a
3885  0384 cd0195        	call	_SpiWriteRegister
3887                     ; 282    SpiWriteRegister(0x0B, 0x12);															//write 0x12 to the GPIO2 Configuration(set the TX state)
3889  0387 ae0012        	ldw	x,#18
3890  038a a60b          	ld	a,#11
3891  038c 95            	ld	xh,a
3892  038d cd0195        	call	_SpiWriteRegister
3894                     ; 283 	SpiWriteRegister(0x0C, 0x15);															//write 0x15 to the GPIO1 Configuration(set the RX state) 
3896  0390 ae0015        	ldw	x,#21
3897  0393 a60c          	ld	a,#12
3898  0395 95            	ld	xh,a
3899  0396 cd0195        	call	_SpiWriteRegister
3901                     ; 287 	SpiWriteRegister(0x09, 0xD7);															//write 0xD7 to the Crystal Oscillator Load Capacitance register
3903  0399 ae00d7        	ldw	x,#215
3904  039c a609          	ld	a,#9
3905  039e 95            	ld	xh,a
3906  039f cd0195        	call	_SpiWriteRegister
3908                     ; 289 	SpiWriteRegister(0x69, 0x60);															//write 0x60 to the AGC Override1 register	
3910  03a2 ae0060        	ldw	x,#96
3911  03a5 a669          	ld	a,#105
3912  03a7 95            	ld	xh,a
3913  03a8 cd0195        	call	_SpiWriteRegister
3915                     ; 293 	SpiWriteRegister(0x6d, 0x1e);	
3917  03ab ae001e        	ldw	x,#30
3918  03ae a66d          	ld	a,#109
3919  03b0 95            	ld	xh,a
3920  03b1 cd0195        	call	_SpiWriteRegister
3922                     ; 296 	SpiWriteRegister(0x07, 0x05);															//write 0x05 to the Operating Function Control 1 register
3924  03b4 ae0005        	ldw	x,#5
3925  03b7 a607          	ld	a,#7
3926  03b9 95            	ld	xh,a
3927  03ba cd0195        	call	_SpiWriteRegister
3929                     ; 300 	SpiWriteRegister(0x05, 0x03); 														//write 0x03 to the Interrupt Enable 1 register
3931  03bd ae0003        	ldw	x,#3
3932  03c0 a605          	ld	a,#5
3933  03c2 95            	ld	xh,a
3934  03c3 cd0195        	call	_SpiWriteRegister
3936                     ; 301 	SpiWriteRegister(0x06, 0x00); 														//write 0x00 to the Interrupt Enable 2 register
3938  03c6 5f            	clrw	x
3939  03c7 a606          	ld	a,#6
3940  03c9 95            	ld	xh,a
3941  03ca cd0195        	call	_SpiWriteRegister
3943                     ; 303 	ItStatus1 = SpiReadRegister(0x03);													//read the Interrupt Status1 register
3945  03cd a603          	ld	a,#3
3946  03cf cd01b3        	call	_SpiReadRegister
3948  03d2 c7001c        	ld	_ItStatus1,a
3949                     ; 304 	ItStatus2 = SpiReadRegister(0x04);													//read the Interrupt Status2 register
3951  03d5 a604          	ld	a,#4
3952  03d7 cd01b3        	call	_SpiReadRegister
3954  03da c7001b        	ld	_ItStatus2,a
3955                     ; 308 		SpiWriteRegister(0x07, 0x05);	
3957  03dd ae0005        	ldw	x,#5
3958  03e0 a607          	ld	a,#7
3959  03e2 95            	ld	xh,a
3960  03e3 cd0195        	call	_SpiWriteRegister
3962                     ; 310 		SpiWriteRegister(0x0d, 0xf4);	
3964  03e6 ae00f4        	ldw	x,#244
3965  03e9 a60d          	ld	a,#13
3966  03eb 95            	ld	xh,a
3967  03ec cd0195        	call	_SpiWriteRegister
3969                     ; 313 	}
3972  03ef 81            	ret
4002                     ; 315 void sending(void)
4002                     ; 316 {
4003                     	switch	.text
4004  03f0               _sending:
4008                     ; 320 			SpiWriteRegister(0x07, 0x01);													//write 0x01 to the Operating Function Control 1 register			
4010  03f0 ae0001        	ldw	x,#1
4011  03f3 a607          	ld	a,#7
4012  03f5 95            	ld	xh,a
4013  03f6 cd0195        	call	_SpiWriteRegister
4015                     ; 324       RED_LED_ON;			
4017  03f9 721b5005      	bres	_PB_ODR,#5
4018                     ; 327 			SpiWriteRegister(0x3E, 8);														//write 8 to the Transmit Packet Length register		
4020  03fd ae0008        	ldw	x,#8
4021  0400 a63e          	ld	a,#62
4022  0402 95            	ld	xh,a
4023  0403 cd0195        	call	_SpiWriteRegister
4025                     ; 329 			SpiWriteRegister(0x7F, 0x42);													//write 0x42 ('B') to the FIFO Access register	
4027  0406 ae0042        	ldw	x,#66
4028  0409 a67f          	ld	a,#127
4029  040b 95            	ld	xh,a
4030  040c cd0195        	call	_SpiWriteRegister
4032                     ; 330 			SpiWriteRegister(0x7F, 0x55);													//write 0x55 ('U') to the FIFO Access register	
4034  040f ae0055        	ldw	x,#85
4035  0412 a67f          	ld	a,#127
4036  0414 95            	ld	xh,a
4037  0415 cd0195        	call	_SpiWriteRegister
4039                     ; 331 			SpiWriteRegister(0x7F, 0x54);													//write 0x54 ('T') to the FIFO Access register	
4041  0418 ae0054        	ldw	x,#84
4042  041b a67f          	ld	a,#127
4043  041d 95            	ld	xh,a
4044  041e cd0195        	call	_SpiWriteRegister
4046                     ; 332 			SpiWriteRegister(0x7F, 0x54);													//write 0x54 ('T') to the FIFO Access register	
4048  0421 ae0054        	ldw	x,#84
4049  0424 a67f          	ld	a,#127
4050  0426 95            	ld	xh,a
4051  0427 cd0195        	call	_SpiWriteRegister
4053                     ; 333 			SpiWriteRegister(0x7F, 0x4F);													//write 0x4F ('O') to the FIFO Access register	
4055  042a ae004f        	ldw	x,#79
4056  042d a67f          	ld	a,#127
4057  042f 95            	ld	xh,a
4058  0430 cd0195        	call	_SpiWriteRegister
4060                     ; 334 			SpiWriteRegister(0x7F, 0x4E);													//write 0x4E ('N') to the FIFO Access register	
4062  0433 ae004e        	ldw	x,#78
4063  0436 a67f          	ld	a,#127
4064  0438 95            	ld	xh,a
4065  0439 cd0195        	call	_SpiWriteRegister
4067                     ; 335 			SpiWriteRegister(0x7F, 0x32);													//write 0x31 ('1') to the FIFO Access register	
4069  043c ae0032        	ldw	x,#50
4070  043f a67f          	ld	a,#127
4071  0441 95            	ld	xh,a
4072  0442 cd0195        	call	_SpiWriteRegister
4074                     ; 336 			SpiWriteRegister(0x7F, 0x0D);													//write 0x0D (CR) to the FIFO Access register	
4076  0445 ae000d        	ldw	x,#13
4077  0448 a67f          	ld	a,#127
4078  044a 95            	ld	xh,a
4079  044b cd0195        	call	_SpiWriteRegister
4081                     ; 340 			SpiWriteRegister(0x05, 0x04);													//write 0x04 to the Interrupt Enable 1 register	
4083  044e ae0004        	ldw	x,#4
4084  0451 a605          	ld	a,#5
4085  0453 95            	ld	xh,a
4086  0454 cd0195        	call	_SpiWriteRegister
4088                     ; 341 			SpiWriteRegister(0x06, 0x00);													//write 0x03 to the Interrupt Enable 2 register	
4090  0457 5f            	clrw	x
4091  0458 a606          	ld	a,#6
4092  045a 95            	ld	xh,a
4093  045b cd0195        	call	_SpiWriteRegister
4095                     ; 343 			ItStatus1 = SpiReadRegister(0x03);											//read the Interrupt Status1 register
4097  045e a603          	ld	a,#3
4098  0460 cd01b3        	call	_SpiReadRegister
4100  0463 c7001c        	ld	_ItStatus1,a
4101                     ; 344 			ItStatus2 = SpiReadRegister(0x04);											//read the Interrupt Status2 register
4103  0466 a604          	ld	a,#4
4104  0468 cd01b3        	call	_SpiReadRegister
4106  046b c7001b        	ld	_ItStatus2,a
4107                     ; 348 			SpiWriteRegister(0x07, 0x09);													//write 0x09 to the Operating Function Control 1 register
4109  046e ae0009        	ldw	x,#9
4110  0471 a607          	ld	a,#7
4111  0473 95            	ld	xh,a
4112  0474 cd0195        	call	_SpiWriteRegister
4115  0477               L7132:
4116                     ; 353 			while((PD_IDR&0x04)==0x04) ; 
4118  0477 c65010        	ld	a,_PD_IDR
4119  047a a404          	and	a,#4
4120  047c a104          	cp	a,#4
4121  047e 27f7          	jreq	L7132
4122                     ; 355 			ItStatus1 = SpiReadRegister(0x03);											//read the Interrupt Status1 register
4124  0480 a603          	ld	a,#3
4125  0482 cd01b3        	call	_SpiReadRegister
4127  0485 c7001c        	ld	_ItStatus1,a
4128                     ; 356 			ItStatus2 = SpiReadRegister(0x04);											//read the Interrupt Status2 register
4130  0488 a604          	ld	a,#4
4131  048a cd01b3        	call	_SpiReadRegister
4133  048d c7001b        	ld	_ItStatus2,a
4134                     ; 357       delay_ms(20);
4136  0490 ae0014        	ldw	x,#20
4137  0493 cd0000        	call	_delay_ms
4139                     ; 363 			RED_LED_OFF;
4141  0496 721a5005      	bset	_PB_ODR,#5
4142                     ; 369 			SpiWriteRegister(0x05, 0x03); 												//write 0x03 to the Interrupt Enable 1 register
4144  049a ae0003        	ldw	x,#3
4145  049d a605          	ld	a,#5
4146  049f 95            	ld	xh,a
4147  04a0 cd0195        	call	_SpiWriteRegister
4149                     ; 370 			SpiWriteRegister(0x06, 0x00); 												//write 0x00 to the Interrupt Enable 2 register
4151  04a3 5f            	clrw	x
4152  04a4 a606          	ld	a,#6
4153  04a6 95            	ld	xh,a
4154  04a7 cd0195        	call	_SpiWriteRegister
4156                     ; 372 			ItStatus1 = SpiReadRegister(0x03);											//read the Interrupt Status1 register
4158  04aa a603          	ld	a,#3
4159  04ac cd01b3        	call	_SpiReadRegister
4161  04af c7001c        	ld	_ItStatus1,a
4162                     ; 373 			ItStatus2 = SpiReadRegister(0x04);											//read the Interrupt Status2 register
4164  04b2 a604          	ld	a,#4
4165  04b4 cd01b3        	call	_SpiReadRegister
4167  04b7 c7001b        	ld	_ItStatus2,a
4168                     ; 376 			SpiWriteRegister(0x07, 0x05);	   
4170  04ba ae0005        	ldw	x,#5
4171  04bd a607          	ld	a,#7
4172  04bf 95            	ld	xh,a
4173  04c0 cd0195        	call	_SpiWriteRegister
4175                     ; 378 }	
4178  04c3 81            	ret
4228                     	switch	.data
4229  0008               _rs232_flag:
4230  0008 00            	dc.b	0
4282                     ; 91 void    Init_Rs232(u8 rs_rate,u8 mode)
4282                     ; 92 {
4283                     	switch	.text
4284  04c4               _Init_Rs232:
4286  04c4 89            	pushw	x
4287       00000000      OFST:	set	0
4290                     ; 93         UART1_CR1=0x00;
4292  04c5 725f5234      	clr	_UART1_CR1
4293                     ; 94 		    UART1_CR2=0x00;
4295  04c9 725f5235      	clr	_UART1_CR2
4296                     ; 95 		    UART1_CR3=0x00;
4298  04cd 725f5236      	clr	_UART1_CR3
4299                     ; 99         switch(rs_rate)
4301  04d1 9e            	ld	a,xh
4303                     ; 157                  break;
4304  04d2 4a            	dec	a
4305  04d3 2723          	jreq	L7332
4306  04d5 4a            	dec	a
4307  04d6 272e          	jreq	L1432
4308  04d8 4a            	dec	a
4309  04d9 2739          	jreq	L3432
4310  04db 4a            	dec	a
4311  04dc 2744          	jreq	L5432
4312  04de 4a            	dec	a
4313  04df 274f          	jreq	L7432
4314  04e1 4a            	dec	a
4315  04e2 275a          	jreq	L1532
4316  04e4 4a            	dec	a
4317  04e5 2765          	jreq	L3532
4318  04e7 4a            	dec	a
4319  04e8 2770          	jreq	L5532
4320  04ea               L7532:
4321                     ; 152             default:
4321                     ; 153                  /* 1.2kbps */
4321                     ; 154                  UART1_BRR2=0x35;
4323  04ea 35355233      	mov	_UART1_BRR2,#53
4324                     ; 155 		             UART1_BRR1=0x41;
4326  04ee 35415232      	mov	_UART1_BRR1,#65
4327                     ; 156                  time_rs232_back        = rs232_over_1k2bps;
4329  04f2 350a0045      	mov	_time_rs232_back,#10
4330                     ; 157                  break;
4332  04f6 206e          	jra	L7042
4333  04f8               L7332:
4334                     ; 101             case rs_1k2bps:
4334                     ; 102                  /* 1.2kbps */
4334                     ; 103                  UART1_BRR2=0x35;
4336  04f8 35355233      	mov	_UART1_BRR2,#53
4337                     ; 104 		             UART1_BRR1=0x41;
4339  04fc 35415232      	mov	_UART1_BRR1,#65
4340                     ; 105                  time_rs232_back        = rs232_over_1k2bps;
4342  0500 350a0045      	mov	_time_rs232_back,#10
4343                     ; 106                  break;
4345  0504 2060          	jra	L7042
4346  0506               L1432:
4347                     ; 107             case rs_2k4bps:
4347                     ; 108                  /* 2.4kbps */
4347                     ; 109                  UART1_BRR2=0x1b;
4349  0506 351b5233      	mov	_UART1_BRR2,#27
4350                     ; 110 		             UART1_BRR1=0xa0;
4352  050a 35a05232      	mov	_UART1_BRR1,#160
4353                     ; 111                  time_rs232_back        = rs232_over_2k4bps;
4355  050e 35060045      	mov	_time_rs232_back,#6
4356                     ; 112                  break;
4358  0512 2052          	jra	L7042
4359  0514               L3432:
4360                     ; 113             case rs_4k8bps:
4360                     ; 114                  /* 4.8kbps */
4360                     ; 115                  UART1_BRR2=0x05;
4362  0514 35055233      	mov	_UART1_BRR2,#5
4363                     ; 116 		             UART1_BRR1=0xd0;
4365  0518 35d05232      	mov	_UART1_BRR1,#208
4366                     ; 117                  time_rs232_back        = rs232_over_4k8bps;
4368  051c 35040045      	mov	_time_rs232_back,#4
4369                     ; 118                  break;
4371  0520 2044          	jra	L7042
4372  0522               L5432:
4373                     ; 119             case rs_9k6bps:
4373                     ; 120                  /* 9.6kbps */
4373                     ; 121                  UART1_BRR2=0x02;
4375  0522 35025233      	mov	_UART1_BRR2,#2
4376                     ; 122 		             UART1_BRR1=0x68;
4378  0526 35685232      	mov	_UART1_BRR1,#104
4379                     ; 123                  time_rs232_back        = rs232_over_9k6bps;
4381  052a 35030045      	mov	_time_rs232_back,#3
4382                     ; 124                  break;
4384  052e 2036          	jra	L7042
4385  0530               L7432:
4386                     ; 125             case rs_19k2bps:
4386                     ; 126                  /* 19.2kbps */
4386                     ; 127                  UART1_BRR2=0x01;
4388  0530 35015233      	mov	_UART1_BRR2,#1
4389                     ; 128 		             UART1_BRR1=0x34;
4391  0534 35345232      	mov	_UART1_BRR1,#52
4392                     ; 129                  time_rs232_back        = rs232_over_19k2bps;
4394  0538 35020045      	mov	_time_rs232_back,#2
4395                     ; 130                  break;
4397  053c 2028          	jra	L7042
4398  053e               L1532:
4399                     ; 131             case rs_38k4bps:
4399                     ; 132                  /* 38.4kbps */
4399                     ; 133                  UART1_BRR2=0x01;
4401  053e 35015233      	mov	_UART1_BRR2,#1
4402                     ; 134 		             UART1_BRR1=0x1a;
4404  0542 351a5232      	mov	_UART1_BRR1,#26
4405                     ; 135                  time_rs232_back        = rs232_over_38k4bps;
4407  0546 35020045      	mov	_time_rs232_back,#2
4408                     ; 136                  break;
4410  054a 201a          	jra	L7042
4411  054c               L3532:
4412                     ; 137              case rs_57k6bps:
4412                     ; 138                  /* 56.6kbps */
4412                     ; 139                  UART1_BRR2=0x06;
4414  054c 35065233      	mov	_UART1_BRR2,#6
4415                     ; 140 		             UART1_BRR1=0x11;
4417  0550 35115232      	mov	_UART1_BRR1,#17
4418                     ; 141                  time_rs232_back        = rs232_over_57k6bps;
4420  0554 35020045      	mov	_time_rs232_back,#2
4421                     ; 142                  break;
4423  0558 200c          	jra	L7042
4424  055a               L5532:
4425                     ; 144              case rs_115k2bps:
4425                     ; 145                  /* 115.2kbps */
4425                     ; 146                  UART1_BRR2=0x0b;
4427  055a 350b5233      	mov	_UART1_BRR2,#11
4428                     ; 147 		             UART1_BRR1=0x08;
4430  055e 35085232      	mov	_UART1_BRR1,#8
4431                     ; 148                  time_rs232_back        = rs232_over_115k2bps;
4433  0562 35020045      	mov	_time_rs232_back,#2
4434                     ; 149                  break;
4436  0566               L7042:
4437                     ; 163         if(mode == mode_config)
4439  0566 7b02          	ld	a,(OFST+2,sp)
4440  0568 a101          	cp	a,#1
4441  056a 2606          	jrne	L1142
4442                     ; 164              UART1_CR2 = 0x0c;
4444  056c 350c5235      	mov	_UART1_CR2,#12
4446  0570 2022          	jra	L3142
4447  0572               L1142:
4448                     ; 167 				     UART1_CR2 = 0x2c;
4450  0572 352c5235      	mov	_UART1_CR2,#44
4451                     ; 169 						 if(Format_rs232==2)
4453  0576 c60012        	ld	a,_Format_rs232
4454  0579 a102          	cp	a,#2
4455  057b 2606          	jrne	L5142
4456                     ; 170 						 UART1_CR1=0x16;            //8o1
4458  057d 35165234      	mov	_UART1_CR1,#22
4460  0581 2011          	jra	L3142
4461  0583               L5142:
4462                     ; 171 						 else if(Format_rs232==3)
4464  0583 c60012        	ld	a,_Format_rs232
4465  0586 a103          	cp	a,#3
4466  0588 2606          	jrne	L1242
4467                     ; 172 						 UART1_CR1=0x14;            //8e1
4469  058a 35145234      	mov	_UART1_CR1,#20
4471  058e 2004          	jra	L3142
4472  0590               L1242:
4473                     ; 174              UART1_CR1=0x00;            //8n1 
4475  0590 725f5234      	clr	_UART1_CR1
4476  0594               L3142:
4477                     ; 179 }
4480  0594 85            	popw	x
4481  0595 81            	ret
4505                     ; 188 void    Wait_Rs232_Tx(void)
4505                     ; 189 {
4506                     	switch	.text
4507  0596               _Wait_Rs232_Tx:
4511  0596               L7342:
4512                     ; 192 				while((UART1_SR&0x40)==0x00);
4514  0596 c65230        	ld	a,_UART1_SR
4515  0599 a540          	bcp	a,#64
4516  059b 27f9          	jreq	L7342
4517                     ; 193 }
4520  059d 81            	ret
4546                     ; 201 void    Wait_Rs232_Rx(void)
4546                     ; 202 {
4547                     	switch	.text
4548  059e               _Wait_Rs232_Rx:
4552                     ; 203         time_rs232_over     = 0x03;
4554  059e 35030013      	mov	_time_rs232_over,#3
4556  05a2               L7542:
4557                     ; 206 				while(((UART1_SR&0x20)==0x00)&&((PD_IDR&0x04)==0x00)&&(time_rs232_over));
4559  05a2 c65230        	ld	a,_UART1_SR
4560  05a5 a520          	bcp	a,#32
4561  05a7 260d          	jrne	L3642
4563  05a9 c65010        	ld	a,_PD_IDR
4564  05ac a504          	bcp	a,#4
4565  05ae 2606          	jrne	L3642
4567  05b0 725d0013      	tnz	_time_rs232_over
4568  05b4 26ec          	jrne	L7542
4569  05b6               L3642:
4570                     ; 207 }
4573  05b6 81            	ret
4607                     ; 212 void UART1_sendchar(u8 data)
4607                     ; 213 {
4608                     	switch	.text
4609  05b7               _UART1_sendchar:
4611  05b7 88            	push	a
4612       00000000      OFST:	set	0
4615  05b8               L5052:
4616                     ; 214 		while((UART1_SR & 0x80)==0x00);
4618  05b8 c65230        	ld	a,_UART1_SR
4619  05bb a580          	bcp	a,#128
4620  05bd 27f9          	jreq	L5052
4621                     ; 215 		UART1_DR=data;
4623  05bf 7b01          	ld	a,(OFST+1,sp)
4624  05c1 c75231        	ld	_UART1_DR,a
4625                     ; 216 }
4628  05c4 84            	pop	a
4629  05c5 81            	ret
4659                     ; 218 @far @interrupt void UART1_Recv_IRQHandler (void)
4659                     ; 219 {
4661                     	switch	.text
4662  05c6               f_UART1_Recv_IRQHandler:
4667                     ; 220 	TxRFbuff[TxRFbuffPointHead++]  = UART1_DR;
4669  05c6 c60017        	ld	a,_TxRFbuffPointHead
4670  05c9 97            	ld	xl,a
4671  05ca 725c0017      	inc	_TxRFbuffPointHead
4672  05ce 9f            	ld	a,xl
4673  05cf 5f            	clrw	x
4674  05d0 97            	ld	xl,a
4675  05d1 c65231        	ld	a,_UART1_DR
4676  05d4 d70009        	ld	(_TxRFbuff,x),a
4677                     ; 222   if(TxRFbuffPointHead > point_top)
4679  05d7 c60017        	ld	a,_TxRFbuffPointHead
4680  05da a114          	cp	a,#20
4681  05dc 2504          	jrult	L1252
4682                     ; 223   TxRFbuffPointHead = point_bottom;
4684  05de 725f0017      	clr	_TxRFbuffPointHead
4685  05e2               L1252:
4686                     ; 225   flag_rs232data_check = true;
4688  05e2 72100002      	bset	_flag_rs232data_check
4689                     ; 227   time_rs232_over      = time_rs232_back;
4691  05e6 5500450013    	mov	_time_rs232_over,_time_rs232_back
4692                     ; 228 	return;
4695  05eb 80            	iret
4723                     	switch	.data
4724  0009               _TxRFbuff:
4725  0009 00            	dc.b	0
4726  000a 000000000000  	ds.b	19
4727  001d               _RxRFbuff:
4728  001d 00            	dc.b	0
4729  001e 000000000000  	ds.b	19
4730  0031               _read_buffer:
4731  0031 aa            	dc.b	170
4732  0032 000000000000  	ds.b	19
4733  0045               _time_rs232_back:
4734  0045 06            	dc.b	6
4735  0046               _Seq:
4736  0046 00            	dc.b	0
4775                     ; 54 void main(void)
4775                     ; 55 {
4777                     	switch	.text
4778  05ec               _main:
4782                     ; 64 	CLK_SWR=0xe1;
4784  05ec 35e150c4      	mov	_CLK_SWR,#225
4785                     ; 65   CLK_CKDIVR=0x1a;
4787  05f0 351a50c6      	mov	_CLK_CKDIVR,#26
4788                     ; 66 	CLK_SWCR|=0x02;      //开启切换
4790  05f4 721250c5      	bset	_CLK_SWCR,#1
4792  05f8               L1552:
4793                     ; 67 	while((CLK_SWCR & 0x01)==0x01);
4795  05f8 c650c5        	ld	a,_CLK_SWCR
4796  05fb a401          	and	a,#1
4797  05fd a101          	cp	a,#1
4798  05ff 27f7          	jreq	L1552
4799                     ; 68 	CLK_SWCR&=(~0x02);      //关闭切换	
4801  0601 721350c5      	bres	_CLK_SWCR,#1
4802                     ; 70 	delay_ms(500);
4804  0605 ae01f4        	ldw	x,#500
4805  0608 cd0000        	call	_delay_ms
4807                     ; 71 	sbi(PB_DDR,5);//test mode input key
4809  060b 721a5007      	bset	_PB_DDR,#5
4810                     ; 72 	sbi(PB_CR1,5);
4812  060f 721a5008      	bset	_PB_CR1,#5
4813                     ; 73 	cbi(PB_CR2,5);
4815  0613 721b5009      	bres	_PB_CR2,#5
4816                     ; 75 	RED_LED_ON;
4818  0617 721b5005      	bres	_PB_ODR,#5
4819                     ; 77 	delay_ms(100);
4821  061b ae0064        	ldw	x,#100
4822  061e cd0000        	call	_delay_ms
4824                     ; 78 	RED_LED_OFF;
4826  0621 721a5005      	bset	_PB_ODR,#5
4827                     ; 81 	init_IA4432();
4829  0625 cd01cb        	call	_init_IA4432
4831  0628               L5552:
4832                     ; 84 				sending();
4834  0628 cd03f0        	call	_sending
4836                     ; 85 				delay_ms(800);
4838  062b ae0320        	ldw	x,#800
4839  062e cd0000        	call	_delay_ms
4841                     ; 86 				PB_ODR^=0x20;
4843  0631 c65005        	ld	a,_PB_ODR
4844  0634 a820          	xor	a,	#32
4845  0636 c75005        	ld	_PB_ODR,a
4847  0639 20ed          	jra	L5552
4872                     ; 95 @far @interrupt void TIM4_UPD_OVF_IRQHandler (void)
4872                     ; 96 {	
4874                     	switch	.text
4875  063b               f_TIM4_UPD_OVF_IRQHandler:
4880                     ; 97       TIM4_SR=0x00;
4882  063b 725f5344      	clr	_TIM4_SR
4883                     ; 100       return;
4886  063f 80            	iret
5084                     	xdef	f_TIM4_UPD_OVF_IRQHandler
5085                     	xdef	_main
5086                     .bit:	section	.data,bit
5087  0000               _flag_transimit_RF:
5088  0000 00            	ds.b	1
5089                     	xdef	_flag_transimit_RF
5090  0001               _flag_wireless_status:
5091  0001 00            	ds.b	1
5092                     	xdef	_flag_wireless_status
5093                     	switch	.bss
5094  0000               _payload:
5095  0000 000000000000  	ds.b	10
5096                     	xdef	_payload
5097                     	xdef	_Seq
5098  000a               _test:
5099  000a 0000          	ds.b	2
5100                     	xdef	_test
5101  000c               _testL:
5102  000c 00            	ds.b	1
5103                     	xdef	_testL
5104  000d               _testH:
5105  000d 00            	ds.b	1
5106                     	xdef	_testH
5107  000e               _testbuf3:
5108  000e 00            	ds.b	1
5109                     	xdef	_testbuf3
5110  000f               _testbuf2:
5111  000f 00            	ds.b	1
5112                     	xdef	_testbuf2
5113  0010               _testbuf1:
5114  0010 00            	ds.b	1
5115                     	xdef	_testbuf1
5116  0011               _testbuf0:
5117  0011 00            	ds.b	1
5118                     	xdef	_testbuf0
5119                     	xdef	_read_buffer
5120                     	xdef	_RxRFbuff
5121                     	xdef	f_UART1_Recv_IRQHandler
5122                     	xdef	_UART1_sendchar
5123                     	xdef	_Wait_Rs232_Rx
5124                     	xdef	_Wait_Rs232_Tx
5125                     	xdef	_Init_Rs232
5126                     	switch	.bit
5127  0002               _flag_rs232data_check:
5128  0002 00            	ds.b	1
5129                     	xdef	_flag_rs232data_check
5130                     	switch	.bss
5131  0012               _Format_rs232:
5132  0012 00            	ds.b	1
5133                     	xdef	_Format_rs232
5134                     	xdef	_time_rs232_back
5135  0013               _time_rs232_over:
5136  0013 00            	ds.b	1
5137                     	xdef	_time_rs232_over
5138  0014               _RxRFbuffPointTail:
5139  0014 00            	ds.b	1
5140                     	xdef	_RxRFbuffPointTail
5141  0015               _RxRFbuffPointHead:
5142  0015 00            	ds.b	1
5143                     	xdef	_RxRFbuffPointHead
5144  0016               _TxRFbuffPointTail:
5145  0016 00            	ds.b	1
5146                     	xdef	_TxRFbuffPointTail
5147  0017               _TxRFbuffPointHead:
5148  0017 00            	ds.b	1
5149                     	xdef	_TxRFbuffPointHead
5150                     	xdef	_TxRFbuff
5151  0018               _rs232_temp:
5152  0018 00            	ds.b	1
5153                     	xdef	_rs232_temp
5154                     	xdef	_rs232_flag
5155                     	xdef	_sending
5156                     	xdef	_init_IA4432
5157                     	xdef	_SpiReadRegister
5158                     	xdef	_SpiWriteRegister
5159                     	xdef	_ByteRead
5160                     	xdef	_ByteSend
5161  0019               _temp8:
5162  0019 00            	ds.b	1
5163                     	xdef	_temp8
5164  001a               _length:
5165  001a 00            	ds.b	1
5166                     	xdef	_length
5167  001b               _ItStatus2:
5168  001b 00            	ds.b	1
5169                     	xdef	_ItStatus2
5170  001c               _ItStatus1:
5171  001c 00            	ds.b	1
5172                     	xdef	_ItStatus1
5173  001d               _testv:
5174  001d 0000          	ds.b	2
5175                     	xdef	_testv
5176                     	xdef	_SPI_rechar
5177                     	xdef	_SPI_sendchar
5178                     	xdef	_SPI_Init
5179                     	xdef	_Send_led
5180                     	xdef	_Init_GPIO
5181                     	xdef	_GPIO
5182                     	xdef	_delay_us
5183                     	xdef	_delay_ms
5203                     	end
