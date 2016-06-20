/********************************************************************************************************
*
* File                : led.c
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

#include <stm8s103f3p.h>
#include <system.h>
#include <gpio.h>
#include <rf4432_src.h>
#include <ws_uart1.h>


u8 rate_rs232;         

u8 Format_rs232;

    /*  declare variable */
u8  TxRFbuff[buff_length] = {0};
u8  RxRFbuff[buff_length] = {0};
u8  read_buffer[C_FIFO_Byte]    = {0xaa};
u8  TxRFbuffPointHead,TxRFbuffPointTail;
u8  RxRFbuffPointHead,RxRFbuffPointTail;
u8  time_rs232_over;
u8  time_rs232_back=6;


u8 testbuf0,testbuf1,testbuf2,testbuf3;

u8 testH,testL;
u16 test;
u8 Seq = 0;

u8 length,temp8;
u8 payload[10];


extern u8 rs232_flag;
extern u8 rs232_temp;

_Bool flag_rs232data_check;

_Bool flag_transimit_RF;


/***********************************************
�� ��:	main
�� ��:	�������
�� ��:	/
�� ��:	/
�� ��:	/
***********************************************/
void main(void)
{
        u8 i;
				u8 flag_eeprom;
				Uint16 temp_cal;
        unsigned long time_out;
				
	
	
	//�����ⲿ���پ�����16��Ƶ500KHz
  
	CLK_SWR=0xe1;
  CLK_CKDIVR=0x1a;
	CLK_SWCR|=0x02;      //�����л�
	while((CLK_SWCR & 0x01)==0x01);
	CLK_SWCR&=(~0x02);      //�ر��л�	
  
	delay_ms(500);
	
	sbi(PB_DDR,5);//red_led OUTPUT
	sbi(PB_CR1,5);
	cbi(PB_CR2,5);
	RED_LED_ON;
	
	delay_ms(100);
	RED_LED_OFF;
	GREEN_LED_OFF;
	
	Init_Rs232(rs_9k6bps,mode_commun);
	init_IA4432();
	while(1)
	{
        delay_ms(1);	
		if((PD_IDR&0x04)==0)		
		{
					//disable the receiver chain
					SpiWriteRegister(0x07, 0x01);													//write 0x01 to the Operating Function Control 1 register
					//read interrupt status registers
					ItStatus1 = SpiReadRegister(0x03);											//read the Interrupt Status1 register
					ItStatus2 = SpiReadRegister(0x04);											//read the Interrupt Status2 register

					/*CRC Error interrupt occured*/
					if ( (ItStatus1 & 0x01) == 0x01 )
					{
						//reset the RX FIFO
						SpiWriteRegister(0x08, 0x02);												//write 0x02 to the Operating Function Control 2 register
						SpiWriteRegister(0x08, 0x00);												//write 0x00 to the Operating Function Control 2 register
						//blink all LEDs to show the error
						
						
					}
					/*packet received interrupt occured*/
					if ( (ItStatus1 & 0x02) == 0x02 )
					{
						//Read the length of the received payload
						length = SpiReadRegister(0x4B);											//read the Received Packet Length register
						//check whether the received payload is not longer than the allocated buffer in the MCU
						if (length < 11)
						{
							//Get the reeived payload from the RX FIFO
							for (temp8=0;temp8 < length;temp8++)
							{
								payload[temp8] = SpiReadRegister(0x7F);						//read the FIFO Access register
							  UART1_sendchar(payload[temp8]);
							}
							PB_ODR^=0x20;

						}
					}



					//reset the RX FIFO
					SpiWriteRegister(0x08, 0x02);													//write 0x02 to the Operating Function Control 2 register
					SpiWriteRegister(0x08, 0x00);													//write 0x00 to the Operating Function Control 2 register
					//enable the receiver chain again
					SpiWriteRegister(0x07, 0x05);													//write 0x05 to the Operating Function Control 1 register
		}
		
	}
	
	
	
	
	
        
}



@far @interrupt void TIM4_UPD_OVF_IRQHandler (void)
{	
      TIM4_SR=0x00;
			
			
      return;
}

