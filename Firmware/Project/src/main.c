#include "stm8l15x.h"
#include "stm8l15x_it.h"
#include "discover_board.h"
#include "I2C_M24LR04E-R.h"
#include "misc.h"
#include "delay.h"

uint8_t NDEFmessage[0x40];

volatile char FLASH_CR2     @0x5051;    
volatile char FLASH_NCR2    @0x17ff;    
volatile char FLASH_IAPSR   @0x5054;    

void deInitClock(void);
void deInitGPIO(void);
char initAnalogControls(void);
char initDigitalControls(void);

void readControlData(void);
void writeControlData(void);
void writeEEPROMByte(const char address, char data);

char digital;
char analog;

void deInitClock(void)
{
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM3, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_I2C1, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_SPI1, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_BEEP, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_DAC, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_RTC, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_LCD, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_DMA1, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_BOOTROM, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_AES, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM5, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_SPI2, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_USART2, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_USART3, DISABLE);
	CLK_PeripheralClockConfig(CLK_Peripheral_CSSLSE, DISABLE);
}

void deInitGPIO (void)
{
	GPIO_Init(GPIOA, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOB, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOC, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOD, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOE, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
	GPIO_Init(GPIOF, GPIO_Pin_All, GPIO_Mode_In_PU_No_IT);
	
	GPIO_Init(GPIOE, GPIO_Pin_6, GPIO_Mode_Out_PP_Low_Slow);
}

char initAnalogControls(void)
{
	analog = 0x0;
} 

char initDigitalControls(void)
{
	digital = 0x0;
	
	GPIO_Init(GPIOC, GPIO_Pin_3, GPIO_Mode_In_FL_No_IT);
} 

void readControlData(void)
{
	char d0 = GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_3) == 0x0 ? 0x1 : 0x0;

	if(d0 != digital)
	{
		digital = d0;
		writeControlData();
	}
}                                  

void writeControlData(void)
{
	writeEEPROMByte(0x0, digital);
	
	/*
	M24LR04E_Init();
	M24LR04E_WriteBuffer(M24LR16_EEPROM_ADDRESS_USER, NDEF_DAS, NUM_DIGITAL_VALUES, digital);
	M24LR04E_DeInit();

	M24LR04E_Init();
	M24LR04E_WriteBuffer(M24LR16_EEPROM_ADDRESS_USER, NDEF_DAS + NUM_DIGITAL_VALUES, NUM_ANALOG_VALUES, analog);
	M24LR04E_DeInit();*/
}                         
                 
void writeEEPROMByte(const char address, char data)
{
	M24LR04E_Init();
	M24LR04E_WriteOneByte(M24LR16_EEPROM_ADDRESS_USER, address, data);
	M24LR04E_DeInit();
	
	//delay_10us(100);
}

void main(void)
{
	deInitClock();
	deInitGPIO();
	
	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_16);        
	
	initDigitalControls();
	initAnalogControls();
	
	GPIO_Init(GPIOF, GPIO_Pin_0, GPIO_Mode_In_FL_IT);
	EXTI_SetPinSensitivity(EXTI_Pin_0, EXTI_Trigger_Rising);
	
	enableInterrupts();

	while (1)
	{
		halt();
	}             
}
