#include "stm8l15x.h"
#include "stm8l15x_it.h"
#include "discover_board.h"
#include "I2C_M24LR04E-R.h"
#include "misc.h"
#include "delay.h"

#define NUM_VALUES 2

volatile char FLASH_CR2     @0x5051;    
volatile char FLASH_NCR2    @0x17ff;    
volatile char FLASH_IAPSR   @0x5054;    

char sampleADC(void);
void initMemory(void);
void deInitClock(void);
void deInitGPIO(void);
char initAnalogControls(void);
char initDigitalControls(void);

void readControlData(void);
void writeControlData(void);
void writeEEPROMByte(const char address, char data);

char values[NUM_VALUES];

char sampleADC(void)
{
	char res = 0x0;

  CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
  ADC_DeInit(ADC1);
  
  ADC_VrefintCmd(ENABLE);
  delay_10us(3);
  
  ADC_Cmd(ADC1, ENABLE);	 
  ADC_Init(ADC1, ADC_ConversionMode_Single,
  ADC_Resolution_6Bit, ADC_Prescaler_1);
  
  ADC_SamplingTimeConfig(ADC1, ADC_Group_SlowChannels, ADC_SamplingTime_9Cycles);
  ADC_ChannelCmd(ADC1, ADC_Channel_0, ENABLE);
  delay_10us(3);

	ADC_SoftwareStartConv(ADC1);
	while( ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == 0);
	res = (char)ADC_GetConversionValue(ADC1);
	
  ADC_VrefintCmd(DISABLE);
  ADC_DeInit(ADC1);
 
	/* disable SchmittTrigger for ADC_Channel_24, to save power */
  //ADC_SchmittTriggerConfig(ADC1, ADC_Channel_24, DISABLE);
	
  CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, DISABLE);
  ADC_ChannelCmd(ADC1, ADC_Channel_0, DISABLE);
	
  return res;
}

void initMemory(void)
{
	writeEEPROMByte(0x0, 0x0);
	writeEEPROMByte(0x1, 0x0);
	writeEEPROMByte(0x2, 0x0);
	writeEEPROMByte(0x3, 0x0);
}

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
	values[1] = 0x0;
	
	GPIO_Init(GPIOA, GPIO_Pin_6, GPIO_Mode_In_FL_No_IT);
} 

char initDigitalControls(void)
{
	values[0] = 0x0;
	
	GPIO_Init(GPIOC, GPIO_Pin_3, GPIO_Mode_In_FL_No_IT);
} 

void readControlData(void)
{
	char a0 = 0x0;
	char v0 = 0x0;
	
	a0 = sampleADC();
	
	v0 |= GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_3) != 0x0 ? 0x0 : 0x1;
	v0 |= (GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_2) != 0x0 ? 0x0 : 0x1) << 0x1;
	v0 |= (a0 << 0x2); 
	
	if(v0 != values[0])
	{
		values[0] = v0;
				
		writeControlData();
	}
}                                  

void writeControlData(void)
{
	writeEEPROMByte(0x0, values[0]);
	
	//M24LR04E_Init();
	//M24LR04E_WriteBuffer(M24LR16_EEPROM_ADDRESS_USER, 0x0, NUM_VALUES, values);
	//M24LR04E_DeInit();
}                         
                 
void writeEEPROMByte(const char address, char data)
{
	M24LR04E_Init();
	M24LR04E_WriteOneByte(M24LR16_EEPROM_ADDRESS_USER, address, data);
	M24LR04E_DeInit();
	
	delay_10us(100);
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
	initMemory();

	while (1)
	{
		halt();
	}             
}
