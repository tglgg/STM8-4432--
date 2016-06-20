/********************************************************************************************************
*
* File                : ws_UAER3.h
* Hardware Environment: 
* Build Environment   : ST Visual Develop 4.1.6
* Version             : V1.0
* By                  : Xiao xian hui
*
*                                  (c) Copyright 2005-2010, WaveShare
*                                       http://www.waveShare.net
*                                          All Rights Reserved
*
*********************************************************************************************************/

#ifndef _WS_UART3_H
#define _WS_UART3_H

#include <ws_lcd_st7920.h>

void Init_UART3(void)
{
		UART3_CR1=0x00;
		UART3_CR2=0x00;
		UART3_CR3=0x00;
		
		// ���ò����ʣ�����ע�����¼��㣺
		//    (1) ������дBRR2
		//    (2) BRR1��ŵ��Ƿ�Ƶϵ���ĵ�11λ����4λ��
		//    (3) BRR2��ŵ��Ƿ�Ƶϵ���ĵ�15λ����12λ���͵�3λ
		//        ����0λ
		// ������ڲ�����λ9600ʱ����Ƶϵ��=2000000/9600=208
		// ��Ӧ��ʮ��������Ϊ00D0��BBR1=0D,BBR2=00


		UART3_BRR2=0x00;
		UART3_BRR1=0x0d;
		
		UART3_CR2=0x2c;//������գ����ͣ��������ж�
		
}

void UART3_sendchar(u8 data)
{
		while((UART3_SR & 0x80)==0x00);
		UART3_DR=data;
}

@far @interrupt void UART3_Recv_IRQHandler (void)
{
	u8 data;
	data=UART3_DR;
	showLine(6,2,lcd_buffer,"0x%x2",(u16)data);
	return;
}

#endif /*_WS_UART3_H*/