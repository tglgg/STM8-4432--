/********************************************************************************************************
*
* File                : TIM2.c
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
#include <stm8s207rb.h>
#include <system.h>

u8 i;

void Init_Tim2(void)
{
	TIM2_IER=0x01;    //�����ж�
	TIM2_EGR=0x01;    //�������¼�
	
	TIM2_CNTRH=0x13;  //���ü������Ĵ���(ʮ����Ϊ5000)
	TIM2_CNTRL=0x88;
	
	TIM2_ARRH=0x13;   //�����Զ�װ�ؼĴ���
	TIM2_ARRL=0x88;
	
	TIM2_PSCR=0x02;   //����Ԥ��ƵΪ2M�����뾧���Ƶ��500K
	
	TIM2_CR1=0x01;    //������ʱ��2
}

void Init_GPIO(void)
{
	PD_DDR=0xff;
	PD_CR1=0xff;
}
/********************************************************
��TIM2����0.01S��ʱ��~Ȼ��ѭ��100�β���1S���ӳ�~��PD��ʾ
********************************************************/
void main(void)
{
	Init_GPIO();
	Init_Tim2();
	_asm("rim");      //����ȫ���ж�
	while (1);
}

//�жϳ����ʽ
@far @interrupt void TIM2_UPD_OVF_IRQHandler (void)
{
	TIM2_SR1=0x00;
	i++;
	if(i==100)
	{
		PD_ODR=PD_ODR^0xff;
		i=0;
	}
	return;
}