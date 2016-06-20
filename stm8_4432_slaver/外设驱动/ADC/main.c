/********************************************************************************************************
*
* File                : ADC.c
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

void Init_AD(void)
{
		ADC_CSR=0x08;      //ѡ��ͨ��AIN8
		ADC_CR2|=0x08;     //	��������,�Ҷ���
		//ADC_TDRL=0x20;
}

void main(void)
{
		u8 i;
		PB_DDR = 0xff;     
		PB_CR1 = 0xff;
		
		PD_DDR = 0xff;
		PD_CR1 = 0xff;
		
		Init_AD();
		while (1)
		{
				ADC_CR1|=0x01;         //��CR1�Ĵ��������λ��1,����ADת��
				for(i=0;i<100;i++);    //��ʱһ��ʱ�䣬����7uS����֤ADCģ����ϵ����
				ADC_CR1|=0x01;         //�ٴν�CR1�Ĵ��������λ��1,����ADת��

				while((ADC_CSR & 0x80)!=0x80);  // �ȴ�ת������
				PB_ODR=ADC_DRH;        //�Ѹ�λ��PB��ʾ����
				PD_ODR=ADC_DRL;        //�ѵ�λ��PD��ʾ����
				ADC_CSR&=(~0x80);      //������� ת������ ��־λ
		}
}