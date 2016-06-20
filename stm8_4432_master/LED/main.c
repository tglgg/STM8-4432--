#include <stm8s103f3p.h>
#include <system.h>
#include <gpio.h>
#include <rf4432_src.h>
#include <ws_uart1.h>
//#include <intrist7.h>

#define enableInterrupts() {_asm("rim\n");} /* enable interrupts */
#define disableInterrupts() {_asm("sim\n");} /* disable interrupts */


 /* declare data struct */

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
_Bool flag_wireless_status;
_Bool flag_transimit_RF;





/***********************************************
函 数:	main
功 能:	程序入口
输 入:	/
输 出:	/
描 述:	/
***********************************************/
void main(void)
{
        u8 i;
				Uint16 temp_cal;
        unsigned long time_out;
				
	
	
	
  //启用内部高速晶振32分频500KHz
	CLK_SWR=0xe1;
  CLK_CKDIVR=0x1a;
	CLK_SWCR|=0x02;      //开启切换
	while((CLK_SWCR & 0x01)==0x01);
	CLK_SWCR&=(~0x02);      //关闭切换	
  
	delay_ms(500);
	sbi(PB_DDR,5);//test mode input key
	sbi(PB_CR1,5);
	cbi(PB_CR2,5);
	
	RED_LED_ON;
	
	delay_ms(100);
	RED_LED_OFF;

	
	init_IA4432();
	while(1)
	{
				sending();
				delay_ms(500);
				PB_ODR^=0x20;
						 
		}
}





@far @interrupt void TIM4_UPD_OVF_IRQHandler (void)
{	
      TIM4_SR=0x00;
			
		   //PC_ODR=PC_ODR^0x10;
      return;
}

