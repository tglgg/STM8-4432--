
#ifndef _SPI_H_
#define _SPI_H_

void SPI_Init(void)
{
	
	
	SPI_CR1|=0x04;   //����Ϊ���豸
	//SPI_CR2|=0xc0;   //ѡ����˫������ģʽ�����ģʽ��
	SPI_CR2|=0x03;   //����NSS��Ϊ1
	
	SPI_CR1|=0x40;   //����SPI

	
	
	
}

void SPI_sendchar(u8 data)
{	
	SPI_DR=data;
	while(!(SPI_SR & 0x02));
}

u8 SPI_rechar(void)
{	
	u8 data;
	
	SPI_DR=0x55;
	while(!(SPI_SR & 0x02));
	
	data=SPI_DR;
	while(!(SPI_SR & 0x01));
	return data;
}

#endif /*_SPI_H_*/