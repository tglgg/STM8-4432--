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
2684                     ; 42 void Init_GPIO(u8 port,u8 io)
2684                     ; 43 {
2685                     	switch	.text
2686  004c               _Init_GPIO:
2688  004c 89            	pushw	x
2689       00000000      OFST:	set	0
2692                     ; 44 	if(io==1)
2694  004d 9f            	ld	a,xl
2695  004e a101          	cp	a,#1
2696  0050 263b          	jrne	L1471
2697                     ; 46 		switch(port)
2699  0052 9e            	ld	a,xh
2701                     ; 54 					default: break;
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
2712                     ; 49 					case 0: PA_DDR=0xff;PA_CR1=0xff;break;
2714  0061 35ff5002      	mov	_PA_DDR,#255
2717  0065 35ff5003      	mov	_PA_CR1,#255
2720  0069 203a          	jra	L7471
2721  006b               L3761:
2722                     ; 50 					case 1: PB_DDR=0xff;PB_CR1=0xff;break; 
2724  006b 35ff5007      	mov	_PB_DDR,#255
2727  006f 35ff5008      	mov	_PB_CR1,#255
2730  0073 2030          	jra	L7471
2731  0075               L5761:
2732                     ; 51 					case 2: PC_DDR=0xff;PC_CR1=0xff;break;  
2734  0075 35ff500c      	mov	_PC_DDR,#255
2737  0079 35ff500d      	mov	_PC_CR1,#255
2740  007d 2026          	jra	L7471
2741  007f               L7761:
2742                     ; 52 					case 3: PD_DDR=0xff;PD_CR1=0xff;break;
2744  007f 35ff5011      	mov	_PD_DDR,#255
2747  0083 35ff5012      	mov	_PD_CR1,#255
2750  0087 201c          	jra	L7471
2751  0089               L1071:
2752                     ; 54 					default: break;
2754  0089 201a          	jra	L7471
2755  008b               L5471:
2757  008b 2018          	jra	L7471
2758  008d               L1471:
2759                     ; 60 		switch(port)
2761  008d 7b01          	ld	a,(OFST+1,sp)
2763                     ; 68 					default: break;
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
2774                     ; 63 					case 0: PA_DDR=0x00;PA_CR2=0xff;break;
2776  009d 725f5002      	clr	_PA_DDR
2779  00a1 35ff5004      	mov	_PA_CR2,#255
2781  00a5               L7471:
2782                     ; 72 }
2785  00a5 85            	popw	x
2786  00a6 81            	ret
2787  00a7               L5071:
2788                     ; 64 					case 1: PB_DDR=0x00;PB_CR2=0xff;break; 
2790  00a7 725f5007      	clr	_PB_DDR
2793  00ab 35ff5009      	mov	_PB_CR2,#255
2796  00af 20f4          	jra	L7471
2797  00b1               L7071:
2798                     ; 65 					case 2: PC_DDR=0x00;PC_CR2=0xff;break;  
2800  00b1 725f500c      	clr	_PC_DDR
2803  00b5 35ff500e      	mov	_PC_CR2,#255
2806  00b9 20ea          	jra	L7471
2807  00bb               L1171:
2808                     ; 66 					case 3: PD_DDR=0x00;PD_CR2=0xff;break;
2810  00bb 725f5011      	clr	_PD_DDR
2813  00bf 35ff5013      	mov	_PD_CR2,#255
2816  00c3 20e0          	jra	L7471
2817  00c5               L3171:
2818                     ; 68 					default: break;
2820  00c5 20de          	jra	L7471
2821  00c7               L3571:
2822  00c7 20dc          	jra	L7471
2867                     ; 74 void Send_led(u8 port)
2867                     ; 75 {
2868                     	switch	.text
2869  00c9               _Send_led:
2871  00c9 88            	push	a
2872  00ca 88            	push	a
2873       00000001      OFST:	set	1
2876                     ; 77 	for(i=0;i<8;i++)
2878  00cb 0f01          	clr	(OFST+0,sp)
2879  00cd               L5002:
2880                     ; 79 			switch(port)
2882  00cd 7b02          	ld	a,(OFST+1,sp)
2884                     ; 89 				default: break;
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
2895                     ; 81 				case 0: PA_ODR=GPIO[i];break;
2897  00dd 7b01          	ld	a,(OFST+0,sp)
2898  00df 5f            	clrw	x
2899  00e0 97            	ld	xl,a
2900  00e1 d60000        	ld	a,(_GPIO,x)
2901  00e4 c75000        	ld	_PA_ODR,a
2904  00e7 2022          	jra	L5102
2905  00e9               L7571:
2906                     ; 82 				case 1: PB_ODR=GPIO[i];break; 
2908  00e9 7b01          	ld	a,(OFST+0,sp)
2909  00eb 5f            	clrw	x
2910  00ec 97            	ld	xl,a
2911  00ed d60000        	ld	a,(_GPIO,x)
2912  00f0 c75005        	ld	_PB_ODR,a
2915  00f3 2016          	jra	L5102
2916  00f5               L1671:
2917                     ; 83 				case 2: PC_ODR=GPIO[i];break;  
2919  00f5 7b01          	ld	a,(OFST+0,sp)
2920  00f7 5f            	clrw	x
2921  00f8 97            	ld	xl,a
2922  00f9 d60000        	ld	a,(_GPIO,x)
2923  00fc c7500a        	ld	_PC_ODR,a
2926  00ff 200a          	jra	L5102
2927  0101               L3671:
2928                     ; 84 				case 3: PD_ODR=GPIO[i];break;
2930  0101 7b01          	ld	a,(OFST+0,sp)
2931  0103 5f            	clrw	x
2932  0104 97            	ld	xl,a
2933  0105 d60000        	ld	a,(_GPIO,x)
2934  0108 c7500f        	ld	_PD_ODR,a
2937  010b               L5671:
2938                     ; 89 				default: break;
2940  010b               L5102:
2941                     ; 91 			delay_ms(500);
2943  010b ae01f4        	ldw	x,#500
2944  010e cd0000        	call	_delay_ms
2946                     ; 77 	for(i=0;i<8;i++)
2948  0111 0c01          	inc	(OFST+0,sp)
2951  0113 7b01          	ld	a,(OFST+0,sp)
2952  0115 a108          	cp	a,#8
2953  0117 25b4          	jrult	L5002
2954                     ; 93 }
2957  0119 85            	popw	x
2958  011a 81            	ret
3012                     ; 5 void SPI_Init(void)
3012                     ; 6 {
3013                     	switch	.text
3014  011b               _SPI_Init:
3018                     ; 9 	SPI_CR1|=0x04;   //配置为主设备
3020  011b 72145200      	bset	_SPI_CR1,#2
3021                     ; 11 	SPI_CR2|=0x03;   //配置NSS脚为1
3023  011f c65201        	ld	a,_SPI_CR2
3024  0122 aa03          	or	a,#3
3025  0124 c75201        	ld	_SPI_CR2,a
3026                     ; 13 	SPI_CR1|=0x40;   //开启SPI
3028  0127 721c5200      	bset	_SPI_CR1,#6
3029                     ; 18 }
3032  012b 81            	ret
3066                     ; 20 void SPI_sendchar(u8 data)
3066                     ; 21 {	
3067                     	switch	.text
3068  012c               _SPI_sendchar:
3072                     ; 22 	SPI_DR=data;
3074  012c c75204        	ld	_SPI_DR,a
3076  012f               L3602:
3077                     ; 23 	while(!(SPI_SR & 0x02));
3079  012f c65203        	ld	a,_SPI_SR
3080  0132 a502          	bcp	a,#2
3081  0134 27f9          	jreq	L3602
3082                     ; 24 }
3085  0136 81            	ret
3119                     ; 26 u8 SPI_rechar(void)
3119                     ; 27 {	
3120                     	switch	.text
3121  0137               _SPI_rechar:
3123  0137 88            	push	a
3124       00000001      OFST:	set	1
3127                     ; 30 	SPI_DR=0x55;
3129  0138 35555204      	mov	_SPI_DR,#85
3131  013c               L7012:
3132                     ; 31 	while(!(SPI_SR & 0x02));
3134  013c c65203        	ld	a,_SPI_SR
3135  013f a502          	bcp	a,#2
3136  0141 27f9          	jreq	L7012
3137                     ; 33 	data=SPI_DR;
3139  0143 c65204        	ld	a,_SPI_DR
3140  0146 6b01          	ld	(OFST+0,sp),a
3142  0148               L7112:
3143                     ; 34 	while(!(SPI_SR & 0x01));
3145  0148 c65203        	ld	a,_SPI_SR
3146  014b a501          	bcp	a,#1
3147  014d 27f9          	jreq	L7112
3148                     ; 35 	return data;
3150  014f 7b01          	ld	a,(OFST+0,sp)
3153  0151 5b01          	addw	sp,#1
3154  0153 81            	ret
3167                     	switch	.data
3168  0008               _Flag_MASTER:
3169  0008 01            	dc.b	1
3256                     ; 26 void ByteSend(Uint8 src)
3256                     ; 27 {
3257                     	switch	.text
3258  0154               _ByteSend:
3260  0154 88            	push	a
3261  0155 88            	push	a
3262       00000001      OFST:	set	1
3265  0156               L7612:
3266                     ; 31 		while(!(SPI_SR & 0x02));
3268  0156 c65203        	ld	a,_SPI_SR
3269  0159 a502          	bcp	a,#2
3270  015b 27f9          	jreq	L7612
3271                     ; 32 		SPI_DR=src;
3273  015d 7b02          	ld	a,(OFST+1,sp)
3274  015f c75204        	ld	_SPI_DR,a
3276  0162               L7712:
3277                     ; 33 		while(!(SPI_SR & 0x01));
3279  0162 c65203        	ld	a,_SPI_SR
3280  0165 a501          	bcp	a,#1
3281  0167 27f9          	jreq	L7712
3282                     ; 34 		i==SPI_DR;
3284  0169 7b01          	ld	a,(OFST+0,sp)
3285  016b c15204        	cp	a,_SPI_DR
3286  016e 2605          	jrne	L42
3287  0170 ae0001        	ldw	x,#1
3288  0173 2001          	jra	L62
3289  0175               L42:
3290  0175 5f            	clrw	x
3291  0176               L62:
3292                     ; 38 }
3295  0176 85            	popw	x
3296  0177 81            	ret
3330                     ; 43 Uint8 ByteRead(void)
3330                     ; 44 {
3331                     	switch	.text
3332  0178               _ByteRead:
3334  0178 88            	push	a
3335       00000001      OFST:	set	1
3338  0179               L1222:
3339                     ; 48 	while(!(SPI_SR & 0x02));
3341  0179 c65203        	ld	a,_SPI_SR
3342  017c a502          	bcp	a,#2
3343  017e 27f9          	jreq	L1222
3344                     ; 49 	SPI_DR=0x55;
3346  0180 35555204      	mov	_SPI_DR,#85
3348  0184               L1322:
3349                     ; 51 	while(!(SPI_SR & 0x01));
3351  0184 c65203        	ld	a,_SPI_SR
3352  0187 a501          	bcp	a,#1
3353  0189 27f9          	jreq	L1322
3354                     ; 52 	data=SPI_DR;
3356  018b c65204        	ld	a,_SPI_DR
3357  018e 6b01          	ld	(OFST+0,sp),a
3358                     ; 55 	return data;
3360  0190 7b01          	ld	a,(OFST+0,sp)
3363  0192 5b01          	addw	sp,#1
3364  0194 81            	ret
3412                     ; 76 void SpiWriteRegister (u8 reg, u8 value)
3412                     ; 77 {
3413                     	switch	.text
3414  0195               _SpiWriteRegister:
3416  0195 89            	pushw	x
3417  0196 88            	push	a
3418       00000001      OFST:	set	1
3421                     ; 81     cbi(PA_ODR,3);    //SCS = 0;     NSS = 0;                              
3423  0197 72175000      	bres	_PA_ODR,#3
3424                     ; 82     Temp_byte = (reg|0x80);				//write data into the SPI register		
3426  019b 9e            	ld	a,xh
3427  019c aa80          	or	a,#128
3428  019e 6b01          	ld	(OFST+0,sp),a
3429                     ; 83 	  ByteSend(Temp_byte);
3431  01a0 7b01          	ld	a,(OFST+0,sp)
3432  01a2 adb0          	call	_ByteSend
3434                     ; 85 		Temp_byte = value;
3436  01a4 7b03          	ld	a,(OFST+2,sp)
3437  01a6 6b01          	ld	(OFST+0,sp),a
3438                     ; 86 		ByteSend(Temp_byte);
3440  01a8 7b01          	ld	a,(OFST+0,sp)
3441  01aa ada8          	call	_ByteSend
3443                     ; 88 	  sbi(PA_ODR,3);    //SCS = 1;NSS = 1;    										
3445  01ac 72165000      	bset	_PA_ODR,#3
3446                     ; 89 }
3449  01b0 5b03          	addw	sp,#3
3450  01b2 81            	ret
3499                     ; 104 u8 SpiReadRegister (u8 reg)
3499                     ; 105 {
3500                     	switch	.text
3501  01b3               _SpiReadRegister:
3503  01b3 88            	push	a
3504       00000001      OFST:	set	1
3507                     ; 110 	  cbi(PA_ODR,3);    //SCS = 0; NSS = 0;
3509  01b4 72175000      	bres	_PA_ODR,#3
3510                     ; 112 	  Temp_byte = reg;				//write data into the SPI register
3512  01b8 6b01          	ld	(OFST+0,sp),a
3513                     ; 113 	  ByteSend(Temp_byte);	  
3515  01ba 7b01          	ld	a,(OFST+0,sp)
3516  01bc ad96          	call	_ByteSend
3518                     ; 114 		Result=ByteRead();
3520  01be adb8          	call	_ByteRead
3522  01c0 6b01          	ld	(OFST+0,sp),a
3523                     ; 116 	  sbi(PA_ODR,3);    //SCS = 1;NSS = 1;                            	
3525  01c2 72165000      	bset	_PA_ODR,#3
3526                     ; 117 		return(Result);
3528  01c6 7b01          	ld	a,(OFST+0,sp)
3531  01c8 5b01          	addw	sp,#1
3532  01ca 81            	ret
3576                     ; 126 void init_IA4432(void)
3576                     ; 127 {
3577                     	switch	.text
3578  01cb               _init_IA4432:
3582                     ; 131 		sbi(PA_DDR,3);//SCS OUTPUT
3584  01cb 72165002      	bset	_PA_DDR,#3
3585                     ; 132 		sbi(PA_CR1,3);
3587  01cf 72165003      	bset	_PA_CR1,#3
3588                     ; 133 		cbi(PA_CR2,3);
3590  01d3 72175004      	bres	_PA_CR2,#3
3591                     ; 135 		sbi(PC_DDR,5);//SCK OUTPUT
3593  01d7 721a500c      	bset	_PC_DDR,#5
3594                     ; 136 		sbi(PC_CR1,5);
3596  01db 721a500d      	bset	_PC_CR1,#5
3597                     ; 137 		cbi(PC_CR2,5);
3599  01df 721b500e      	bres	_PC_CR2,#5
3600                     ; 139 		sbi(PC_DDR,6);//SDIO OUTPUT
3602  01e3 721c500c      	bset	_PC_DDR,#6
3603                     ; 140 		sbi(PC_CR1,6);
3605  01e7 721c500d      	bset	_PC_CR1,#6
3606                     ; 141 		cbi(PC_CR2,6);
3608  01eb 721d500e      	bres	_PC_CR2,#6
3609                     ; 143 		cbi(PC_DDR,7);//GIO2 INPUT
3611  01ef 721f500c      	bres	_PC_DDR,#7
3612                     ; 144 		sbi(PC_CR1,7);
3614  01f3 721e500d      	bset	_PC_CR1,#7
3615                     ; 145 		cbi(PC_CR2,7);
3617  01f7 721f500e      	bres	_PC_CR2,#7
3618                     ; 147 		cbi(PD_DDR,3);//GIO1 WTR INPUT
3620  01fb 72175011      	bres	_PD_DDR,#3
3621                     ; 148 		sbi(PD_CR1,3);
3623  01ff 72165012      	bset	_PD_CR1,#3
3624                     ; 149 		cbi(PD_CR2,3);
3626  0203 72175013      	bres	_PD_CR2,#3
3627                     ; 151     sbi(PA_ODR,3);
3629  0207 72165000      	bset	_PA_ODR,#3
3630                     ; 152     cbi(PC_ODR,5);//SCK = 0;
3632  020b 721b500a      	bres	_PC_ODR,#5
3633                     ; 153     sbi(PC_ODR,6);//SDIO = 1;
3635  020f 721c500a      	bset	_PC_ODR,#6
3636                     ; 155 		sbi(PD_DDR,5);//green_led OUTPUT
3638  0213 721a5011      	bset	_PD_DDR,#5
3639                     ; 156 	  sbi(PD_CR1,5);
3641  0217 721a5012      	bset	_PD_CR1,#5
3642                     ; 157 	  cbi(PD_CR2,5);
3644  021b 721b5013      	bres	_PD_CR2,#5
3645                     ; 159 		sbi(PD_DDR,6);//red_led OUTPUT
3647  021f 721c5011      	bset	_PD_DDR,#6
3648                     ; 160 	  sbi(PD_CR1,6);
3650  0223 721c5012      	bset	_PD_CR1,#6
3651                     ; 161 	  cbi(PD_CR2,6);
3653  0227 721d5013      	bres	_PD_CR2,#6
3654                     ; 163 	  cbi(PD_DDR,4);//key INPUT
3656  022b 72195011      	bres	_PD_DDR,#4
3657                     ; 164 	  sbi(PD_CR1,4);
3659  022f 72185012      	bset	_PD_CR1,#4
3660                     ; 165 	  cbi(PD_CR2,4);
3662  0233 72195013      	bres	_PD_CR2,#4
3663                     ; 167 		cbi(PD_DDR,3);//SET INPUT
3665  0237 72175011      	bres	_PD_DDR,#3
3666                     ; 168 	  sbi(PD_CR1,3);
3668  023b 72165012      	bset	_PD_CR1,#3
3669                     ; 169 	  cbi(PD_CR2,3);
3671  023f 72175013      	bres	_PD_CR2,#3
3672                     ; 171 		cbi(PB_DDR,4);//CKO INPUT
3674  0243 72195007      	bres	_PB_DDR,#4
3675                     ; 172 	  sbi(PB_CR1,4);
3677  0247 72185008      	bset	_PB_CR1,#4
3678                     ; 173 	  cbi(PB_CR2,4);
3680  024b 72195009      	bres	_PB_CR2,#4
3681                     ; 175 		SPI_Init();
3683  024f cd011b        	call	_SPI_Init
3685                     ; 181 	delay_ms(5000);
3687  0252 ae1388        	ldw	x,#5000
3688  0255 cd0000        	call	_delay_ms
3690                     ; 188 	ItStatus1 = SpiReadRegister(0x03);													//read the Interrupt Status1 register
3692  0258 a603          	ld	a,#3
3693  025a cd01b3        	call	_SpiReadRegister
3695  025d c7001a        	ld	_ItStatus1,a
3696                     ; 189 	ItStatus2 = SpiReadRegister(0x04);													//read the Interrupt Status2 register
3698  0260 a604          	ld	a,#4
3699  0262 cd01b3        	call	_SpiReadRegister
3701  0265 c70019        	ld	_ItStatus2,a
3702                     ; 192    SpiWriteRegister(0x07, 0x80);															//write 0x80 to the Operating & Function Control1 register 
3704  0268 ae0080        	ldw	x,#128
3705  026b a607          	ld	a,#7
3706  026d 95            	ld	xh,a
3707  026e cd0195        	call	_SpiWriteRegister
3710  0271               L7032:
3711                     ; 196   while((PD_IDR&0x04)==0x04) ; 
3713  0271 c65010        	ld	a,_PD_IDR
3714  0274 a404          	and	a,#4
3715  0276 a104          	cp	a,#4
3716  0278 27f7          	jreq	L7032
3717                     ; 198 	ItStatus1 = SpiReadRegister(0x03);													//read the Interrupt Status1 register
3719  027a a603          	ld	a,#3
3720  027c cd01b3        	call	_SpiReadRegister
3722  027f c7001a        	ld	_ItStatus1,a
3723                     ; 199 	ItStatus2 = SpiReadRegister(0x04);													//read the Interrupt Status2 register
3725  0282 a604          	ld	a,#4
3726  0284 cd01b3        	call	_SpiReadRegister
3728  0287 c70019        	ld	_ItStatus2,a
3730  028a               L7132:
3731                     ; 203   while((PD_IDR&0x04)==0x04) ;   
3733  028a c65010        	ld	a,_PD_IDR
3734  028d a404          	and	a,#4
3735  028f a104          	cp	a,#4
3736  0291 27f7          	jreq	L7132
3737                     ; 205 	ItStatus1 = SpiReadRegister(0x03);													//read the Interrupt Status1 register
3739  0293 a603          	ld	a,#3
3740  0295 cd01b3        	call	_SpiReadRegister
3742  0298 c7001a        	ld	_ItStatus1,a
3743                     ; 206 	ItStatus2 = SpiReadRegister(0x04);													//read the Interrupt Status2 register
3745  029b a604          	ld	a,#4
3746  029d cd01b3        	call	_SpiReadRegister
3748  02a0 c70019        	ld	_ItStatus2,a
3749                     ; 215 	SpiWriteRegister(0x75, 0x53);															//write 0x75 to the Frequency Band Select register             
3751  02a3 ae0053        	ldw	x,#83
3752  02a6 a675          	ld	a,#117
3753  02a8 95            	ld	xh,a
3754  02a9 cd0195        	call	_SpiWriteRegister
3756                     ; 216 	SpiWriteRegister(0x76, 0x64);															//write 0xBB to the Nominal Carrier Frequency1 register
3758  02ac ae0064        	ldw	x,#100
3759  02af a676          	ld	a,#118
3760  02b1 95            	ld	xh,a
3761  02b2 cd0195        	call	_SpiWriteRegister
3763                     ; 217 	SpiWriteRegister(0x77, 0x00); 
3765  02b5 5f            	clrw	x
3766  02b6 a677          	ld	a,#119
3767  02b8 95            	ld	xh,a
3768  02b9 cd0195        	call	_SpiWriteRegister
3770                     ; 227 	SpiWriteRegister(0x2a, 0x14);	
3772  02bc ae0014        	ldw	x,#20
3773  02bf a62a          	ld	a,#42
3774  02c1 95            	ld	xh,a
3775  02c2 cd0195        	call	_SpiWriteRegister
3777                     ; 232 	SpiWriteRegister(0x6E, 0x09);															//write 0x4E to the TXDataRate 1 register
3779  02c5 ae0009        	ldw	x,#9
3780  02c8 a66e          	ld	a,#110
3781  02ca 95            	ld	xh,a
3782  02cb cd0195        	call	_SpiWriteRegister
3784                     ; 233 	SpiWriteRegister(0x6F, 0xd5);															//write 0xA5 to the TXDataRate 0 register
3786  02ce ae00d5        	ldw	x,#213
3787  02d1 a66f          	ld	a,#111
3788  02d3 95            	ld	xh,a
3789  02d4 cd0195        	call	_SpiWriteRegister
3791                     ; 234 	SpiWriteRegister(0x70, 0x2C);	
3793  02d7 ae002c        	ldw	x,#44
3794  02da a670          	ld	a,#112
3795  02dc 95            	ld	xh,a
3796  02dd cd0195        	call	_SpiWriteRegister
3798                     ; 240     SpiWriteRegister(0x72, 0x38);	//(1.2kbps)	
3800  02e0 ae0038        	ldw	x,#56
3801  02e3 a672          	ld	a,#114
3802  02e5 95            	ld	xh,a
3803  02e6 cd0195        	call	_SpiWriteRegister
3805                     ; 243 	SpiWriteRegister(0x1C, 0x1b);															//write 0x1E to the IF Filter Bandwidth register		
3807  02e9 ae001b        	ldw	x,#27
3808  02ec a61c          	ld	a,#28
3809  02ee 95            	ld	xh,a
3810  02ef cd0195        	call	_SpiWriteRegister
3812                     ; 244 	SpiWriteRegister(0x20, 0x83);															//write 0xD0 to the Clock Recovery Oversampling Ratio register		
3814  02f2 ae0083        	ldw	x,#131
3815  02f5 a620          	ld	a,#32
3816  02f7 95            	ld	xh,a
3817  02f8 cd0195        	call	_SpiWriteRegister
3819                     ; 245 	SpiWriteRegister(0x21, 0xc0);															//write 0x00 to the Clock Recovery Offset 2 register		
3821  02fb ae00c0        	ldw	x,#192
3822  02fe a621          	ld	a,#33
3823  0300 95            	ld	xh,a
3824  0301 cd0195        	call	_SpiWriteRegister
3826                     ; 246 	SpiWriteRegister(0x22, 0x13);															//write 0x9D to the Clock Recovery Offset 1 register		
3828  0304 ae0013        	ldw	x,#19
3829  0307 a622          	ld	a,#34
3830  0309 95            	ld	xh,a
3831  030a cd0195        	call	_SpiWriteRegister
3833                     ; 247 	SpiWriteRegister(0x23, 0xa9);															//write 0x49 to the Clock Recovery Offset 0 register		
3835  030d ae00a9        	ldw	x,#169
3836  0310 a623          	ld	a,#35
3837  0312 95            	ld	xh,a
3838  0313 cd0195        	call	_SpiWriteRegister
3840                     ; 248 	SpiWriteRegister(0x24, 0x00);															//write 0x00 to the Clock Recovery Timing Loop Gain 1 register		
3842  0316 5f            	clrw	x
3843  0317 a624          	ld	a,#36
3844  0319 95            	ld	xh,a
3845  031a cd0195        	call	_SpiWriteRegister
3847                     ; 249 	SpiWriteRegister(0x25, 0x03);															//write 0x24 to the Clock Recovery Timing Loop Gain 0 register		
3849  031d ae0003        	ldw	x,#3
3850  0320 a625          	ld	a,#37
3851  0322 95            	ld	xh,a
3852  0323 cd0195        	call	_SpiWriteRegister
3854                     ; 250 	SpiWriteRegister(0x1D, 0x40);															//write 0x40 to the AFC Loop Gearshift Override register		
3856  0326 ae0040        	ldw	x,#64
3857  0329 a61d          	ld	a,#29
3858  032b 95            	ld	xh,a
3859  032c cd0195        	call	_SpiWriteRegister
3861                     ; 251 	SpiWriteRegister(0x1E, 0x0A);															//write 0x0A to the AFC Timing Control register		
3863  032f ae000a        	ldw	x,#10
3864  0332 a61e          	ld	a,#30
3865  0334 95            	ld	xh,a
3866  0335 cd0195        	call	_SpiWriteRegister
3868                     ; 252 	SpiWriteRegister(0x2A, 0x14);															//write 0x20 to the AFC Limiter register		
3870  0338 ae0014        	ldw	x,#20
3871  033b a62a          	ld	a,#42
3872  033d 95            	ld	xh,a
3873  033e cd0195        	call	_SpiWriteRegister
3875                     ; 256 	SpiWriteRegister(0x34, 0x0A);															//write 0x0A to the Preamble Length register
3877  0341 ae000a        	ldw	x,#10
3878  0344 a634          	ld	a,#52
3879  0346 95            	ld	xh,a
3880  0347 cd0195        	call	_SpiWriteRegister
3882                     ; 258 	SpiWriteRegister(0x35, 0x2A); 														//write 0x2A to the Preamble Detection Control  register
3884  034a ae002a        	ldw	x,#42
3885  034d a635          	ld	a,#53
3886  034f 95            	ld	xh,a
3887  0350 cd0195        	call	_SpiWriteRegister
3889                     ; 262 	SpiWriteRegister(0x33, 0x02);															//write 0x02 to the Header Control2 register    
3891  0353 ae0002        	ldw	x,#2
3892  0356 a633          	ld	a,#51
3893  0358 95            	ld	xh,a
3894  0359 cd0195        	call	_SpiWriteRegister
3896                     ; 265 	SpiWriteRegister(0x36, 0x2D);															//write 0x2D to the Sync Word 3 register
3898  035c ae002d        	ldw	x,#45
3899  035f a636          	ld	a,#54
3900  0361 95            	ld	xh,a
3901  0362 cd0195        	call	_SpiWriteRegister
3903                     ; 266 	SpiWriteRegister(0x37, 0xD4);															//write 0xD4 to the Sync Word 2 register
3905  0365 ae00d4        	ldw	x,#212
3906  0368 a637          	ld	a,#55
3907  036a 95            	ld	xh,a
3908  036b cd0195        	call	_SpiWriteRegister
3910                     ; 269 	SpiWriteRegister(0x30, 0x8D);															//write 0x8D to the Data Access Control register
3912  036e ae008d        	ldw	x,#141
3913  0371 a630          	ld	a,#48
3914  0373 95            	ld	xh,a
3915  0374 cd0195        	call	_SpiWriteRegister
3917                     ; 271    SpiWriteRegister(0x32, 0x00 );														//write 0x00 to the Header Control1 register            
3919  0377 5f            	clrw	x
3920  0378 a632          	ld	a,#50
3921  037a 95            	ld	xh,a
3922  037b cd0195        	call	_SpiWriteRegister
3924                     ; 273 	SpiWriteRegister(0x71, 0x63);															//write 0x63 to the Modulation Mode Control 2 register
3926  037e ae0063        	ldw	x,#99
3927  0381 a671          	ld	a,#113
3928  0383 95            	ld	xh,a
3929  0384 cd0195        	call	_SpiWriteRegister
3931                     ; 276    SpiWriteRegister(0x0b, 0x12);															//write 0x12 to the GPIO1 Configuration(set the TX state)
3933  0387 ae0012        	ldw	x,#18
3934  038a a60b          	ld	a,#11
3935  038c 95            	ld	xh,a
3936  038d cd0195        	call	_SpiWriteRegister
3938                     ; 277 	SpiWriteRegister(0x0c, 0x15);															//write 0x15 to the GPIO2 Configuration(set the RX state) 
3940  0390 ae0015        	ldw	x,#21
3941  0393 a60c          	ld	a,#12
3942  0395 95            	ld	xh,a
3943  0396 cd0195        	call	_SpiWriteRegister
3945                     ; 281 	SpiWriteRegister(0x09, 0xD7);															//write 0xD7 to the Crystal Oscillator Load Capacitance register
3947  0399 ae00d7        	ldw	x,#215
3948  039c a609          	ld	a,#9
3949  039e 95            	ld	xh,a
3950  039f cd0195        	call	_SpiWriteRegister
3952                     ; 283 	SpiWriteRegister(0x69, 0x60);															//write 0x60 to the AGC Override1 register	
3954  03a2 ae0060        	ldw	x,#96
3955  03a5 a669          	ld	a,#105
3956  03a7 95            	ld	xh,a
3957  03a8 cd0195        	call	_SpiWriteRegister
3959                     ; 287 	SpiWriteRegister(0x6d, 0x1e);	
3961  03ab ae001e        	ldw	x,#30
3962  03ae a66d          	ld	a,#109
3963  03b0 95            	ld	xh,a
3964  03b1 cd0195        	call	_SpiWriteRegister
3966                     ; 290 	SpiWriteRegister(0x07, 0x05);															//write 0x05 to the Operating Function Control 1 register
3968  03b4 ae0005        	ldw	x,#5
3969  03b7 a607          	ld	a,#7
3970  03b9 95            	ld	xh,a
3971  03ba cd0195        	call	_SpiWriteRegister
3973                     ; 294 	SpiWriteRegister(0x05, 0x03); 														//write 0x03 to the Interrupt Enable 1 register
3975  03bd ae0003        	ldw	x,#3
3976  03c0 a605          	ld	a,#5
3977  03c2 95            	ld	xh,a
3978  03c3 cd0195        	call	_SpiWriteRegister
3980                     ; 295 	SpiWriteRegister(0x06, 0x00); 														//write 0x00 to the Interrupt Enable 2 register
3982  03c6 5f            	clrw	x
3983  03c7 a606          	ld	a,#6
3984  03c9 95            	ld	xh,a
3985  03ca cd0195        	call	_SpiWriteRegister
3987                     ; 297 	ItStatus1 = SpiReadRegister(0x03);													//read the Interrupt Status1 register
3989  03cd a603          	ld	a,#3
3990  03cf cd01b3        	call	_SpiReadRegister
3992  03d2 c7001a        	ld	_ItStatus1,a
3993                     ; 298 	ItStatus2 = SpiReadRegister(0x04);													//read the Interrupt Status2 register
3995  03d5 a604          	ld	a,#4
3996  03d7 cd01b3        	call	_SpiReadRegister
3998  03da c70019        	ld	_ItStatus2,a
3999                     ; 302 		SpiWriteRegister(0x07, 0x05);	
4001  03dd ae0005        	ldw	x,#5
4002  03e0 a607          	ld	a,#7
4003  03e2 95            	ld	xh,a
4004  03e3 cd0195        	call	_SpiWriteRegister
4006                     ; 304 		SpiWriteRegister(0x0d, 0xf4);	
4008  03e6 ae00f4        	ldw	x,#244
4009  03e9 a60d          	ld	a,#13
4010  03eb 95            	ld	xh,a
4011  03ec cd0195        	call	_SpiWriteRegister
4013                     ; 307 	}
4016  03ef 81            	ret
4046                     ; 309 void sending(void)
4046                     ; 310 {
4047                     	switch	.text
4048  03f0               _sending:
4052                     ; 314 			SpiWriteRegister(0x07, 0x01);													//write 0x01 to the Operating Function Control 1 register			
4054  03f0 ae0001        	ldw	x,#1
4055  03f3 a607          	ld	a,#7
4056  03f5 95            	ld	xh,a
4057  03f6 cd0195        	call	_SpiWriteRegister
4059                     ; 318       RED_LED_ON;			
4061  03f9 721b5005      	bres	_PB_ODR,#5
4062                     ; 321 			SpiWriteRegister(0x3E, 8);														//write 8 to the Transmit Packet Length register		
4064  03fd ae0008        	ldw	x,#8
4065  0400 a63e          	ld	a,#62
4066  0402 95            	ld	xh,a
4067  0403 cd0195        	call	_SpiWriteRegister
4069                     ; 323 			SpiWriteRegister(0x7F, 0x42);													//write 0x42 ('B') to the FIFO Access register	
4071  0406 ae0042        	ldw	x,#66
4072  0409 a67f          	ld	a,#127
4073  040b 95            	ld	xh,a
4074  040c cd0195        	call	_SpiWriteRegister
4076                     ; 324 			SpiWriteRegister(0x7F, 0x55);													//write 0x55 ('U') to the FIFO Access register	
4078  040f ae0055        	ldw	x,#85
4079  0412 a67f          	ld	a,#127
4080  0414 95            	ld	xh,a
4081  0415 cd0195        	call	_SpiWriteRegister
4083                     ; 325 			SpiWriteRegister(0x7F, 0x54);													//write 0x54 ('T') to the FIFO Access register	
4085  0418 ae0054        	ldw	x,#84
4086  041b a67f          	ld	a,#127
4087  041d 95            	ld	xh,a
4088  041e cd0195        	call	_SpiWriteRegister
4090                     ; 326 			SpiWriteRegister(0x7F, 0x54);													//write 0x54 ('T') to the FIFO Access register	
4092  0421 ae0054        	ldw	x,#84
4093  0424 a67f          	ld	a,#127
4094  0426 95            	ld	xh,a
4095  0427 cd0195        	call	_SpiWriteRegister
4097                     ; 327 			SpiWriteRegister(0x7F, 0x4F);													//write 0x4F ('O') to the FIFO Access register	
4099  042a ae004f        	ldw	x,#79
4100  042d a67f          	ld	a,#127
4101  042f 95            	ld	xh,a
4102  0430 cd0195        	call	_SpiWriteRegister
4104                     ; 328 			SpiWriteRegister(0x7F, 0x4E);													//write 0x4E ('N') to the FIFO Access register	
4106  0433 ae004e        	ldw	x,#78
4107  0436 a67f          	ld	a,#127
4108  0438 95            	ld	xh,a
4109  0439 cd0195        	call	_SpiWriteRegister
4111                     ; 329 			SpiWriteRegister(0x7F, 0x31);													//write 0x31 ('1') to the FIFO Access register	
4113  043c ae0031        	ldw	x,#49
4114  043f a67f          	ld	a,#127
4115  0441 95            	ld	xh,a
4116  0442 cd0195        	call	_SpiWriteRegister
4118                     ; 330 			SpiWriteRegister(0x7F, 0x0D);													//write 0x0D (CR) to the FIFO Access register	
4120  0445 ae000d        	ldw	x,#13
4121  0448 a67f          	ld	a,#127
4122  044a 95            	ld	xh,a
4123  044b cd0195        	call	_SpiWriteRegister
4125                     ; 334 			SpiWriteRegister(0x05, 0x04);													//write 0x04 to the Interrupt Enable 1 register	
4127  044e ae0004        	ldw	x,#4
4128  0451 a605          	ld	a,#5
4129  0453 95            	ld	xh,a
4130  0454 cd0195        	call	_SpiWriteRegister
4132                     ; 335 			SpiWriteRegister(0x06, 0x00);													//write 0x03 to the Interrupt Enable 2 register	
4134  0457 5f            	clrw	x
4135  0458 a606          	ld	a,#6
4136  045a 95            	ld	xh,a
4137  045b cd0195        	call	_SpiWriteRegister
4139                     ; 337 			ItStatus1 = SpiReadRegister(0x03);											//read the Interrupt Status1 register
4141  045e a603          	ld	a,#3
4142  0460 cd01b3        	call	_SpiReadRegister
4144  0463 c7001a        	ld	_ItStatus1,a
4145                     ; 338 			ItStatus2 = SpiReadRegister(0x04);											//read the Interrupt Status2 register
4147  0466 a604          	ld	a,#4
4148  0468 cd01b3        	call	_SpiReadRegister
4150  046b c70019        	ld	_ItStatus2,a
4151                     ; 342 			SpiWriteRegister(0x07, 0x09);													//write 0x09 to the Operating Function Control 1 register
4153  046e ae0009        	ldw	x,#9
4154  0471 a607          	ld	a,#7
4155  0473 95            	ld	xh,a
4156  0474 cd0195        	call	_SpiWriteRegister
4159  0477               L5332:
4160                     ; 347 			while((PD_IDR&0x04)==0x04) ; 
4162  0477 c65010        	ld	a,_PD_IDR
4163  047a a404          	and	a,#4
4164  047c a104          	cp	a,#4
4165  047e 27f7          	jreq	L5332
4166                     ; 349 			ItStatus1 = SpiReadRegister(0x03);											//read the Interrupt Status1 register
4168  0480 a603          	ld	a,#3
4169  0482 cd01b3        	call	_SpiReadRegister
4171  0485 c7001a        	ld	_ItStatus1,a
4172                     ; 350 			ItStatus2 = SpiReadRegister(0x04);											//read the Interrupt Status2 register
4174  0488 a604          	ld	a,#4
4175  048a cd01b3        	call	_SpiReadRegister
4177  048d c70019        	ld	_ItStatus2,a
4178                     ; 351       delay_ms(20);
4180  0490 ae0014        	ldw	x,#20
4181  0493 cd0000        	call	_delay_ms
4183                     ; 357 			RED_LED_OFF;
4185  0496 721a5005      	bset	_PB_ODR,#5
4186                     ; 363 			SpiWriteRegister(0x05, 0x03); 												//write 0x03 to the Interrupt Enable 1 register
4188  049a ae0003        	ldw	x,#3
4189  049d a605          	ld	a,#5
4190  049f 95            	ld	xh,a
4191  04a0 cd0195        	call	_SpiWriteRegister
4193                     ; 364 			SpiWriteRegister(0x06, 0x00); 												//write 0x00 to the Interrupt Enable 2 register
4195  04a3 5f            	clrw	x
4196  04a4 a606          	ld	a,#6
4197  04a6 95            	ld	xh,a
4198  04a7 cd0195        	call	_SpiWriteRegister
4200                     ; 366 			ItStatus1 = SpiReadRegister(0x03);											//read the Interrupt Status1 register
4202  04aa a603          	ld	a,#3
4203  04ac cd01b3        	call	_SpiReadRegister
4205  04af c7001a        	ld	_ItStatus1,a
4206                     ; 367 			ItStatus2 = SpiReadRegister(0x04);											//read the Interrupt Status2 register
4208  04b2 a604          	ld	a,#4
4209  04b4 cd01b3        	call	_SpiReadRegister
4211  04b7 c70019        	ld	_ItStatus2,a
4212                     ; 370 			SpiWriteRegister(0x07, 0x05);	   
4214  04ba ae0005        	ldw	x,#5
4215  04bd a607          	ld	a,#7
4216  04bf 95            	ld	xh,a
4217  04c0 cd0195        	call	_SpiWriteRegister
4219                     ; 372 }	
4222  04c3 81            	ret
4265                     	switch	.data
4266  0009               _rs232_flag:
4267  0009 00            	dc.b	0
4319                     ; 91 void    Init_Rs232(u8 rs_rate,u8 mode)
4319                     ; 92 {
4320                     	switch	.text
4321  04c4               _Init_Rs232:
4323  04c4 89            	pushw	x
4324       00000000      OFST:	set	0
4327                     ; 93         UART1_CR1=0x00;
4329  04c5 725f5234      	clr	_UART1_CR1
4330                     ; 94 		    UART1_CR2=0x00;
4332  04c9 725f5235      	clr	_UART1_CR2
4333                     ; 95 		    UART1_CR3=0x00;
4335  04cd 725f5236      	clr	_UART1_CR3
4336                     ; 99         switch(rs_rate)
4338  04d1 9e            	ld	a,xh
4340                     ; 157                  break;
4341  04d2 4a            	dec	a
4342  04d3 2723          	jreq	L3532
4343  04d5 4a            	dec	a
4344  04d6 272e          	jreq	L5532
4345  04d8 4a            	dec	a
4346  04d9 2739          	jreq	L7532
4347  04db 4a            	dec	a
4348  04dc 2744          	jreq	L1632
4349  04de 4a            	dec	a
4350  04df 274f          	jreq	L3632
4351  04e1 4a            	dec	a
4352  04e2 275a          	jreq	L5632
4353  04e4 4a            	dec	a
4354  04e5 2765          	jreq	L7632
4355  04e7 4a            	dec	a
4356  04e8 2770          	jreq	L1732
4357  04ea               L3732:
4358                     ; 152             default:
4358                     ; 153                  /* 1.2kbps */
4358                     ; 154                  UART1_BRR2=0x35;
4360  04ea 35355233      	mov	_UART1_BRR2,#53
4361                     ; 155 		             UART1_BRR1=0x41;
4363  04ee 35415232      	mov	_UART1_BRR1,#65
4364                     ; 156                  time_rs232_back        = rs232_over_1k2bps;
4366  04f2 350a0046      	mov	_time_rs232_back,#10
4367                     ; 157                  break;
4369  04f6 206e          	jra	L3242
4370  04f8               L3532:
4371                     ; 101             case rs_1k2bps:
4371                     ; 102                  /* 1.2kbps */
4371                     ; 103                  UART1_BRR2=0x35;
4373  04f8 35355233      	mov	_UART1_BRR2,#53
4374                     ; 104 		             UART1_BRR1=0x41;
4376  04fc 35415232      	mov	_UART1_BRR1,#65
4377                     ; 105                  time_rs232_back        = rs232_over_1k2bps;
4379  0500 350a0046      	mov	_time_rs232_back,#10
4380                     ; 106                  break;
4382  0504 2060          	jra	L3242
4383  0506               L5532:
4384                     ; 107             case rs_2k4bps:
4384                     ; 108                  /* 2.4kbps */
4384                     ; 109                  UART1_BRR2=0x1b;
4386  0506 351b5233      	mov	_UART1_BRR2,#27
4387                     ; 110 		             UART1_BRR1=0xa0;
4389  050a 35a05232      	mov	_UART1_BRR1,#160
4390                     ; 111                  time_rs232_back        = rs232_over_2k4bps;
4392  050e 35060046      	mov	_time_rs232_back,#6
4393                     ; 112                  break;
4395  0512 2052          	jra	L3242
4396  0514               L7532:
4397                     ; 113             case rs_4k8bps:
4397                     ; 114                  /* 4.8kbps */
4397                     ; 115                  UART1_BRR2=0x05;
4399  0514 35055233      	mov	_UART1_BRR2,#5
4400                     ; 116 		             UART1_BRR1=0xd0;
4402  0518 35d05232      	mov	_UART1_BRR1,#208
4403                     ; 117                  time_rs232_back        = rs232_over_4k8bps;
4405  051c 35040046      	mov	_time_rs232_back,#4
4406                     ; 118                  break;
4408  0520 2044          	jra	L3242
4409  0522               L1632:
4410                     ; 119             case rs_9k6bps:
4410                     ; 120                  /* 9.6kbps */
4410                     ; 121                  UART1_BRR2=0x00;
4412  0522 725f5233      	clr	_UART1_BRR2
4413                     ; 122 		             UART1_BRR1=0x0d;
4415  0526 350d5232      	mov	_UART1_BRR1,#13
4416                     ; 123                  time_rs232_back        = rs232_over_9k6bps;
4418  052a 35030046      	mov	_time_rs232_back,#3
4419                     ; 124                  break;
4421  052e 2036          	jra	L3242
4422  0530               L3632:
4423                     ; 125             case rs_19k2bps:
4423                     ; 126                  /* 19.2kbps */
4423                     ; 127                  UART1_BRR2=0x01;
4425  0530 35015233      	mov	_UART1_BRR2,#1
4426                     ; 128 		             UART1_BRR1=0x34;
4428  0534 35345232      	mov	_UART1_BRR1,#52
4429                     ; 129                  time_rs232_back        = rs232_over_19k2bps;
4431  0538 35020046      	mov	_time_rs232_back,#2
4432                     ; 130                  break;
4434  053c 2028          	jra	L3242
4435  053e               L5632:
4436                     ; 131             case rs_38k4bps:
4436                     ; 132                  /* 38.4kbps */
4436                     ; 133                  UART1_BRR2=0x01;
4438  053e 35015233      	mov	_UART1_BRR2,#1
4439                     ; 134 		             UART1_BRR1=0x1a;
4441  0542 351a5232      	mov	_UART1_BRR1,#26
4442                     ; 135                  time_rs232_back        = rs232_over_38k4bps;
4444  0546 35020046      	mov	_time_rs232_back,#2
4445                     ; 136                  break;
4447  054a 201a          	jra	L3242
4448  054c               L7632:
4449                     ; 137              case rs_57k6bps:
4449                     ; 138                  /* 56.6kbps */
4449                     ; 139                  UART1_BRR2=0x06;
4451  054c 35065233      	mov	_UART1_BRR2,#6
4452                     ; 140 		             UART1_BRR1=0x11;
4454  0550 35115232      	mov	_UART1_BRR1,#17
4455                     ; 141                  time_rs232_back        = rs232_over_57k6bps;
4457  0554 35020046      	mov	_time_rs232_back,#2
4458                     ; 142                  break;
4460  0558 200c          	jra	L3242
4461  055a               L1732:
4462                     ; 144              case rs_115k2bps:
4462                     ; 145                  /* 115.2kbps */
4462                     ; 146                  UART1_BRR2=0x01;
4464  055a 35015233      	mov	_UART1_BRR2,#1
4465                     ; 147 		             UART1_BRR1=0x01;
4467  055e 35015232      	mov	_UART1_BRR1,#1
4468                     ; 148                  time_rs232_back        = rs232_over_115k2bps;
4470  0562 35020046      	mov	_time_rs232_back,#2
4471                     ; 149                  break;
4473  0566               L3242:
4474                     ; 163         if(mode == mode_config)
4476  0566 7b02          	ld	a,(OFST+2,sp)
4477  0568 a101          	cp	a,#1
4478  056a 2606          	jrne	L5242
4479                     ; 164              UART1_CR2 = 0x0c;
4481  056c 350c5235      	mov	_UART1_CR2,#12
4483  0570 2022          	jra	L7242
4484  0572               L5242:
4485                     ; 167 				     UART1_CR2 = 0x2c;
4487  0572 352c5235      	mov	_UART1_CR2,#44
4488                     ; 169 						 if(Format_rs232==2)
4490  0576 c60010        	ld	a,_Format_rs232
4491  0579 a102          	cp	a,#2
4492  057b 2606          	jrne	L1342
4493                     ; 170 						 UART1_CR1=0x16;            //8o1
4495  057d 35165234      	mov	_UART1_CR1,#22
4497  0581 2011          	jra	L7242
4498  0583               L1342:
4499                     ; 171 						 else if(Format_rs232==3)
4501  0583 c60010        	ld	a,_Format_rs232
4502  0586 a103          	cp	a,#3
4503  0588 2606          	jrne	L5342
4504                     ; 172 						 UART1_CR1=0x14;            //8e1
4506  058a 35145234      	mov	_UART1_CR1,#20
4508  058e 2004          	jra	L7242
4509  0590               L5342:
4510                     ; 174              UART1_CR1=0x00;            //8n1 
4512  0590 725f5234      	clr	_UART1_CR1
4513  0594               L7242:
4514                     ; 179 }
4517  0594 85            	popw	x
4518  0595 81            	ret
4542                     ; 188 void    Wait_Rs232_Tx(void)
4542                     ; 189 {
4543                     	switch	.text
4544  0596               _Wait_Rs232_Tx:
4548  0596               L3542:
4549                     ; 192 				while((UART1_SR&0x40)==0x00);
4551  0596 c65230        	ld	a,_UART1_SR
4552  0599 a540          	bcp	a,#64
4553  059b 27f9          	jreq	L3542
4554                     ; 193 }
4557  059d 81            	ret
4583                     ; 201 void    Wait_Rs232_Rx(void)
4583                     ; 202 {
4584                     	switch	.text
4585  059e               _Wait_Rs232_Rx:
4589                     ; 203         time_rs232_over     = 0x03;
4591  059e 35030011      	mov	_time_rs232_over,#3
4593  05a2               L3742:
4594                     ; 206 				while(((UART1_SR&0x20)==0x00)&&((PD_IDR&0x04)==0x00)&&(time_rs232_over));
4596  05a2 c65230        	ld	a,_UART1_SR
4597  05a5 a520          	bcp	a,#32
4598  05a7 260d          	jrne	L7742
4600  05a9 c65010        	ld	a,_PD_IDR
4601  05ac a504          	bcp	a,#4
4602  05ae 2606          	jrne	L7742
4604  05b0 725d0011      	tnz	_time_rs232_over
4605  05b4 26ec          	jrne	L3742
4606  05b6               L7742:
4607                     ; 207 }
4610  05b6 81            	ret
4644                     ; 212 void UART1_sendchar(u8 data)
4644                     ; 213 {
4645                     	switch	.text
4646  05b7               _UART1_sendchar:
4648  05b7 88            	push	a
4649       00000000      OFST:	set	0
4652  05b8               L1252:
4653                     ; 214 		while((UART1_SR & 0x80)==0x00);
4655  05b8 c65230        	ld	a,_UART1_SR
4656  05bb a580          	bcp	a,#128
4657  05bd 27f9          	jreq	L1252
4658                     ; 215 		UART1_DR=data;
4660  05bf 7b01          	ld	a,(OFST+1,sp)
4661  05c1 c75231        	ld	_UART1_DR,a
4662                     ; 216 }
4665  05c4 84            	pop	a
4666  05c5 81            	ret
4696                     ; 218 @far @interrupt void UART1_Recv_IRQHandler (void)
4696                     ; 219 {
4698                     	switch	.text
4699  05c6               f_UART1_Recv_IRQHandler:
4704                     ; 220 	TxRFbuff[TxRFbuffPointHead++]  = UART1_DR;
4706  05c6 c60015        	ld	a,_TxRFbuffPointHead
4707  05c9 97            	ld	xl,a
4708  05ca 725c0015      	inc	_TxRFbuffPointHead
4709  05ce 9f            	ld	a,xl
4710  05cf 5f            	clrw	x
4711  05d0 97            	ld	xl,a
4712  05d1 c65231        	ld	a,_UART1_DR
4713  05d4 d7000a        	ld	(_TxRFbuff,x),a
4714                     ; 222   if(TxRFbuffPointHead > point_top)
4716  05d7 c60015        	ld	a,_TxRFbuffPointHead
4717  05da a114          	cp	a,#20
4718  05dc 2504          	jrult	L5352
4719                     ; 223   TxRFbuffPointHead = point_bottom;
4721  05de 725f0015      	clr	_TxRFbuffPointHead
4722  05e2               L5352:
4723                     ; 225   flag_rs232data_check = true;
4725  05e2 72100001      	bset	_flag_rs232data_check
4726                     ; 227   time_rs232_over      = time_rs232_back;
4728  05e6 5500460011    	mov	_time_rs232_over,_time_rs232_back
4729                     ; 228 	return;
4732  05eb 80            	iret
4760                     	switch	.data
4761  000a               _TxRFbuff:
4762  000a 00            	dc.b	0
4763  000b 000000000000  	ds.b	19
4764  001e               _RxRFbuff:
4765  001e 00            	dc.b	0
4766  001f 000000000000  	ds.b	19
4767  0032               _read_buffer:
4768  0032 aa            	dc.b	170
4769  0033 000000000000  	ds.b	19
4770  0046               _time_rs232_back:
4771  0046 06            	dc.b	6
4772  0047               _Seq:
4773  0047 00            	dc.b	0
4822                     ; 61 void main(void)
4822                     ; 62 {
4824                     	switch	.text
4825  05ec               _main:
4829                     ; 72 	CLK_SWR=0xe1;
4831  05ec 35e150c4      	mov	_CLK_SWR,#225
4832                     ; 73   CLK_CKDIVR=0x1a;
4834  05f0 351a50c6      	mov	_CLK_CKDIVR,#26
4835                     ; 74 	CLK_SWCR|=0x02;      //开启切换
4837  05f4 721250c5      	bset	_CLK_SWCR,#1
4839  05f8               L5652:
4840                     ; 75 	while((CLK_SWCR & 0x01)==0x01);
4842  05f8 c650c5        	ld	a,_CLK_SWCR
4843  05fb a401          	and	a,#1
4844  05fd a101          	cp	a,#1
4845  05ff 27f7          	jreq	L5652
4846                     ; 76 	CLK_SWCR&=(~0x02);      //关闭切换	
4848  0601 721350c5      	bres	_CLK_SWCR,#1
4849                     ; 78 	delay_ms(500);
4851  0605 ae01f4        	ldw	x,#500
4852  0608 cd0000        	call	_delay_ms
4854                     ; 80 	sbi(PB_DDR,5);//red_led OUTPUT
4856  060b 721a5007      	bset	_PB_DDR,#5
4857                     ; 81 	sbi(PB_CR1,5);
4859  060f 721a5008      	bset	_PB_CR1,#5
4860                     ; 82 	cbi(PB_CR2,5);
4862  0613 721b5009      	bres	_PB_CR2,#5
4863                     ; 83 	RED_LED_ON;
4865  0617 721b5005      	bres	_PB_ODR,#5
4866                     ; 85 	delay_ms(100);
4868  061b ae0064        	ldw	x,#100
4869  061e cd0000        	call	_delay_ms
4871                     ; 86 	RED_LED_OFF;
4873  0621 721a5005      	bset	_PB_ODR,#5
4874                     ; 87 	GREEN_LED_OFF;
4876  0625 721a500f      	bset	_PD_ODR,#5
4877                     ; 89 	Init_Rs232(rs_115k2bps,mode_commun);
4879  0629 5f            	clrw	x
4880  062a a608          	ld	a,#8
4881  062c 95            	ld	xh,a
4882  062d cd04c4        	call	_Init_Rs232
4884                     ; 90 	init_IA4432();
4886  0630 cd01cb        	call	_init_IA4432
4888  0633               L1752:
4889                     ; 93         delay_ms(1);	
4891  0633 ae0001        	ldw	x,#1
4892  0636 cd0000        	call	_delay_ms
4894                     ; 94 		if((PD_IDR&0x04)==0)		
4896  0639 c65010        	ld	a,_PD_IDR
4897  063c a504          	bcp	a,#4
4898  063e 26f3          	jrne	L1752
4899                     ; 97 					SpiWriteRegister(0x07, 0x01);													//write 0x01 to the Operating Function Control 1 register
4901  0640 ae0001        	ldw	x,#1
4902  0643 a607          	ld	a,#7
4903  0645 95            	ld	xh,a
4904  0646 cd0195        	call	_SpiWriteRegister
4906                     ; 99 					ItStatus1 = SpiReadRegister(0x03);											//read the Interrupt Status1 register
4908  0649 a603          	ld	a,#3
4909  064b cd01b3        	call	_SpiReadRegister
4911  064e c7001a        	ld	_ItStatus1,a
4912                     ; 100 					ItStatus2 = SpiReadRegister(0x04);											//read the Interrupt Status2 register
4914  0651 a604          	ld	a,#4
4915  0653 cd01b3        	call	_SpiReadRegister
4917  0656 c70019        	ld	_ItStatus2,a
4918                     ; 102 					if ( (ItStatus1 & 0x02) == 0x02 )
4920  0659 c6001a        	ld	a,_ItStatus1
4921  065c a402          	and	a,#2
4922  065e a102          	cp	a,#2
4923  0660 2643          	jrne	L7752
4924                     ; 105 						length = SpiReadRegister(0x4B);											//read the Received Packet Length register
4926  0662 a64b          	ld	a,#75
4927  0664 cd01b3        	call	_SpiReadRegister
4929  0667 c70018        	ld	_length,a
4930                     ; 107 						if (length < 11)
4932  066a c60018        	ld	a,_length
4933  066d a10b          	cp	a,#11
4934  066f 2434          	jruge	L7752
4935                     ; 110 							for (temp8=0;temp8 < length;temp8++)
4937  0671 725f0017      	clr	_temp8
4939  0675 201e          	jra	L7062
4940  0677               L3062:
4941                     ; 112 								payload[temp8] = SpiReadRegister(0x7F);						//read the FIFO Access register
4943  0677 c60017        	ld	a,_temp8
4944  067a 5f            	clrw	x
4945  067b 97            	ld	xl,a
4946  067c 89            	pushw	x
4947  067d a67f          	ld	a,#127
4948  067f cd01b3        	call	_SpiReadRegister
4950  0682 85            	popw	x
4951  0683 d70000        	ld	(_payload,x),a
4952                     ; 113 							  UART1_sendchar(payload[temp8]);
4954  0686 c60017        	ld	a,_temp8
4955  0689 5f            	clrw	x
4956  068a 97            	ld	xl,a
4957  068b d60000        	ld	a,(_payload,x)
4958  068e cd05b7        	call	_UART1_sendchar
4960                     ; 110 							for (temp8=0;temp8 < length;temp8++)
4962  0691 725c0017      	inc	_temp8
4963  0695               L7062:
4966  0695 c60017        	ld	a,_temp8
4967  0698 c10018        	cp	a,_length
4968  069b 25da          	jrult	L3062
4969                     ; 115 							PB_ODR^=0x20;
4971  069d c65005        	ld	a,_PB_ODR
4972  06a0 a820          	xor	a,	#32
4973  06a2 c75005        	ld	_PB_ODR,a
4974  06a5               L7752:
4975                     ; 123 					SpiWriteRegister(0x08, 0x02);													//write 0x02 to the Operating Function Control 2 register
4977  06a5 ae0002        	ldw	x,#2
4978  06a8 a608          	ld	a,#8
4979  06aa 95            	ld	xh,a
4980  06ab cd0195        	call	_SpiWriteRegister
4982                     ; 124 					SpiWriteRegister(0x08, 0x00);													//write 0x00 to the Operating Function Control 2 register
4984  06ae 5f            	clrw	x
4985  06af a608          	ld	a,#8
4986  06b1 95            	ld	xh,a
4987  06b2 cd0195        	call	_SpiWriteRegister
4989                     ; 126 					SpiWriteRegister(0x07, 0x05);													//write 0x05 to the Operating Function Control 1 register
4991  06b5 ae0005        	ldw	x,#5
4992  06b8 a607          	ld	a,#7
4993  06ba 95            	ld	xh,a
4994  06bb cd0195        	call	_SpiWriteRegister
4996  06be ac330633      	jpf	L1752
5021                     ; 134 @far @interrupt void TIM4_UPD_OVF_IRQHandler (void)
5021                     ; 135 {	
5023                     	switch	.text
5024  06c2               f_TIM4_UPD_OVF_IRQHandler:
5029                     ; 136       TIM4_SR=0x00;
5031  06c2 725f5344      	clr	_TIM4_SR
5032                     ; 139       return;
5035  06c6 80            	iret
5229                     	xdef	f_TIM4_UPD_OVF_IRQHandler
5230                     	xdef	_main
5231                     .bit:	section	.data,bit
5232  0000               _flag_transimit_RF:
5233  0000 00            	ds.b	1
5234                     	xdef	_flag_transimit_RF
5235                     	switch	.bss
5236  0000               _payload:
5237  0000 000000000000  	ds.b	10
5238                     	xdef	_payload
5239                     	xdef	_Seq
5240  000a               _testH:
5241  000a 00            	ds.b	1
5242                     	xdef	_testH
5243  000b               _testbuf3:
5244  000b 00            	ds.b	1
5245                     	xdef	_testbuf3
5246  000c               _testbuf2:
5247  000c 00            	ds.b	1
5248                     	xdef	_testbuf2
5249  000d               _testbuf1:
5250  000d 00            	ds.b	1
5251                     	xdef	_testbuf1
5252  000e               _testbuf0:
5253  000e 00            	ds.b	1
5254                     	xdef	_testbuf0
5255                     	xdef	_RxRFbuff
5256  000f               _rate_rs232:
5257  000f 00            	ds.b	1
5258                     	xdef	_rate_rs232
5259                     	xdef	f_UART1_Recv_IRQHandler
5260                     	xdef	_UART1_sendchar
5261                     	xdef	_Wait_Rs232_Rx
5262                     	xdef	_Wait_Rs232_Tx
5263                     	xdef	_Init_Rs232
5264                     	switch	.bit
5265  0001               _flag_rs232data_check:
5266  0001 00            	ds.b	1
5267                     	xdef	_flag_rs232data_check
5268                     	switch	.bss
5269  0010               _Format_rs232:
5270  0010 00            	ds.b	1
5271                     	xdef	_Format_rs232
5272                     	xdef	_time_rs232_back
5273  0011               _time_rs232_over:
5274  0011 00            	ds.b	1
5275                     	xdef	_time_rs232_over
5276  0012               _RxRFbuffPointTail:
5277  0012 00            	ds.b	1
5278                     	xdef	_RxRFbuffPointTail
5279  0013               _RxRFbuffPointHead:
5280  0013 00            	ds.b	1
5281                     	xdef	_RxRFbuffPointHead
5282  0014               _TxRFbuffPointTail:
5283  0014 00            	ds.b	1
5284                     	xdef	_TxRFbuffPointTail
5285  0015               _TxRFbuffPointHead:
5286  0015 00            	ds.b	1
5287                     	xdef	_TxRFbuffPointHead
5288                     	xdef	_TxRFbuff
5289  0016               _rs232_temp:
5290  0016 00            	ds.b	1
5291                     	xdef	_rs232_temp
5292                     	xdef	_rs232_flag
5293                     	xdef	_sending
5294                     	xdef	_init_IA4432
5295                     	xdef	_SpiReadRegister
5296                     	xdef	_SpiWriteRegister
5297                     	xdef	_ByteRead
5298                     	xdef	_ByteSend
5299  0017               _temp8:
5300  0017 00            	ds.b	1
5301                     	xdef	_temp8
5302  0018               _length:
5303  0018 00            	ds.b	1
5304                     	xdef	_length
5305  0019               _ItStatus2:
5306  0019 00            	ds.b	1
5307                     	xdef	_ItStatus2
5308  001a               _ItStatus1:
5309  001a 00            	ds.b	1
5310                     	xdef	_ItStatus1
5311  001b               _cal_pll2:
5312  001b 0000          	ds.b	2
5313                     	xdef	_cal_pll2
5314  001d               _cal_pll1:
5315  001d 0000          	ds.b	2
5316                     	xdef	_cal_pll1
5317                     	xdef	_read_buffer
5318  001f               _testL:
5319  001f 00            	ds.b	1
5320                     	xdef	_testL
5321  0020               _test:
5322  0020 0000          	ds.b	2
5323                     	xdef	_test
5324                     	xdef	_Flag_MASTER
5325                     	xdef	_SPI_rechar
5326                     	xdef	_SPI_sendchar
5327                     	xdef	_SPI_Init
5328                     	xdef	_Send_led
5329                     	xdef	_Init_GPIO
5330                     	xdef	_GPIO
5331                     	xdef	_delay_us
5332                     	xdef	_delay_ms
5352                     	end
