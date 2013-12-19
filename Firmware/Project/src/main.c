#include "stm8l15x.h"
#include "stm8l15x_it.h"
#include "discover_board.h"
#include "I2C_M24LR04E-R.h"
#include "misc.h"
#include "delay.h"

uint8_t state_machine;
uint8_t NDEFmessage[0x40];
EEPROM uint8_t EEMenuState;

volatile char FLASH_CR2     @0x5051;    
volatile char FLASH_NCR2    @0x17ff;    
volatile char FLASH_IAPSR   @0x5054;    

#define USE_HSI

#define NDEF_CC0 0x0000
#define NDEF_CC1 0x0001
#define NDEF_CC2 0x0002
#define NDEF_CC3 0x0003
#define NDEF_TLV 0x0004
#define NDEF_LEN 0x0005
#define NDEF_VRH 0x0006
#define NDEF_VTL 0x0007
#define NDEF_VPL 0x0008
#define NDEF_VTT 0x0009
#define NDEF_VSB 0x000A
#define NDEF_VL1 0x000B
#define NDEF_VL2 0x000C
#define NDEF_PAD 0x000D
#define NDEF_DAS 0x0010

#define HEADER_EXTRA_LEN 0x4
#define PAYLOAD_EXTRA_LEN 0x7 
#define LAN_CODE "en"

#define NUM_DIGITAL_VALUES 4
#define NUM_ANALOG_VALUES 4

void deInitClock(void);
void deInitGPIO(void);
char initCharArray(char *array, char length);
char initAnalogControls(void);
char initDigitalControls(void);
char initNDEFMessage(void);
char readControlData(void);
void writeControlData(void);
void writeEEPROMByte(const char address, char data);

char digital[NUM_DIGITAL_VALUES];
char analog[NUM_ANALOG_VALUES];

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
	GPIO_Init( GPIOA, GPIO_Pin_All, GPIO_Mode_Out_OD_Low_Fast);
	GPIO_Init( GPIOB, GPIO_Pin_All, GPIO_Mode_Out_OD_Low_Fast);

	GPIO_Init( GPIOC, GPIO_Pin_2 | GPIO_Pin_3 | GPIO_Pin_4 | GPIO_Pin_5 |\
GPIO_Pin_5 | GPIO_Pin_6 |GPIO_Pin_7, GPIO_Mode_Out_OD_Low_Fast);
	GPIO_Init( GPIOD, GPIO_Pin_All, GPIO_Mode_Out_OD_Low_Fast);
	GPIO_Init( GPIOE, GPIO_Pin_All, GPIO_Mode_Out_OD_Low_Fast);

	GPIOA->ODR = 0xFF;
	GPIOB->ODR = 0xFF;
	GPIOC->ODR = 0xFF;
	GPIOD->ODR = 0xFF;
	GPIOE->ODR = 0xFF;
}

char initCharArray(char *array, char length)
{
	char i;
	
	for(i = 0; i < length; i++)
	{
		array[i] = 0x0;
	}
}

char initAnalogControls(void)
{
	initCharArray(analog, NUM_ANALOG_VALUES);
} 

char initDigitalControls(void)
{
  initCharArray(digital, NUM_DIGITAL_VALUES);
        
  GPIO_Init(GPIOC, GPIO_Pin_7, GPIO_Mode_In_FL_No_IT);
} 

char initNDEFMessage(void)
{
	char i;
	char length = NUM_DIGITAL_VALUES + NUM_ANALOG_VALUES;
	
	writeEEPROMByte(NDEF_CC0, 0xE1);
	writeEEPROMByte(NDEF_CC1, 0x40);
	writeEEPROMByte(NDEF_CC2, 0xFF);
	writeEEPROMByte(NDEF_CC3, 0x00);
	writeEEPROMByte(NDEF_TLV, 0x03);
	writeEEPROMByte(NDEF_LEN, length + HEADER_EXTRA_LEN);
	writeEEPROMByte(NDEF_VRH, 0xD1);
	writeEEPROMByte(NDEF_VTL, 0x01);
	writeEEPROMByte(NDEF_VPL, length + PAYLOAD_EXTRA_LEN);
	writeEEPROMByte(NDEF_VTT, 0x54);
	writeEEPROMByte(NDEF_VSB, 0x02);
	writeEEPROMByte(NDEF_VL1, LAN_CODE[0]);
	writeEEPROMByte(NDEF_VL2, LAN_CODE[1]);
	writeEEPROMByte(NDEF_PAD, 0x0);
	writeEEPROMByte(NDEF_PAD + 1, 0x0);
	writeEEPROMByte(NDEF_PAD + 2, 0x0);
	writeEEPROMByte(NDEF_DAS + length, 0xFE);
	
	for(i = 0; i < length; i++)
	{ 
		writeEEPROMByte(NDEF_DAS + i, 0x0);
	}
}

char readControlData(void)
{
	digital[0] = GPIO_ReadInputDataBit(GPIOC, GPIO_Pin_7);
}                                  

void writeControlData(void)
{
	GPIO_WriteBit(LED_GPIO_PORT, LED_GPIO_PIN, 0x1);
	
	M24LR04E_Init();
	M24LR04E_WriteBuffer(M24LR16_EEPROM_ADDRESS_USER, NDEF_DAS, NUM_DIGITAL_VALUES, digital);
	M24LR04E_DeInit();

	M24LR04E_Init();
	M24LR04E_WriteBuffer(M24LR16_EEPROM_ADDRESS_USER, NDEF_DAS + NUM_DIGITAL_VALUES, NUM_ANALOG_VALUES, analog);
	M24LR04E_DeInit();
	
	GPIO_WriteBit(LED_GPIO_PORT, LED_GPIO_PIN, 0x0);
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
	
	/* Select HSI as system clock source */
	#ifdef USE_HSI
	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_16);        
	#else
	CLK_SYSCLKSourceSwitchCmd(ENABLE);
	/* Select 2MHz HSE as system clock source */
	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSE);
	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_4);        
	CLK_HSICmd(DISABLE);
	#endif
	
	GPIO_Init(LED_GPIO_PORT, LED_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
	GPIOE->ODR &= ~LED_GPIO_PIN;
	
	initDigitalControls();
	initAnalogControls();
	initNDEFMessage();
	
	GPIO_Init(GPIOF, GPIO_Pin_0, GPIO_Mode_In_FL_IT);
	EXTI_SetPinSensitivity(EXTI_Pin_0, EXTI_Trigger_Rising);
	
	enableInterrupts();
	
	while (1) 
	{
		wfi();
	}             
}
