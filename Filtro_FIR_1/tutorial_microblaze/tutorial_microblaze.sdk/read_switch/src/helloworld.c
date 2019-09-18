#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xgpio.h"
#include "xbasic_types.h"

XGpio GpioLed, GpioSwitch, GpioAnodes, Gpio7Seg;

int main()
{
	Xuint32 newData,oldData,val;
	Xuint32 delay,max_delay;
	const Xuint8 LUT7seg[]={(0xc0),(0xf9),(0xa4),(0xb0),(0x99),(0x92),(0x82),(0xf8),(0x80),(0x90),(0x88),
(0x83),(0xc6),(0xa1),(0x86),(0x8e)};
	const Xuint8 LUT7an[]={(0x0e),(0x0d),(0x0b),(0x7)}; max_delay=20000;
	init_platform();
	xil_printf("wsrite 7seg program\n\r");
	// initialize swithes and leds

	XGpio_Initialize(&GpioSwitch,XPAR_AXI_GPIO_1_DEVICE_ID);
	XGpio_SetDataDirection(&GpioSwitch,2,1);
	XGpio_Initialize(&GpioLed,XPAR_AXI_GPIO_1_DEVICE_ID);
	XGpio_SetDataDirection(&GpioLed,1,0);

	// initialize 7 segment display
	XGpio_Initialize(&GpioAnodes,XPAR_AXI_GPIO_0_DEVICE_ID);
	XGpio_SetDataDirection(&GpioAnodes,1,0);
	XGpio_Initialize(&Gpio7Seg,XPAR_AXI_GPIO_0_DEVICE_ID);
	XGpio_SetDataDirection(&Gpio7Seg,2,0);
	XGpio_DiscreteWrite(&GpioAnodes,1,15); // power on all 7 seg displays
	XGpio_DiscreteWrite(&Gpio7Seg,2,249);

	while(1){
	newData = XGpio_DiscreteRead(&GpioSwitch,2); val = newData;
	for(int i=0;i<4;i++){
	XGpio_DiscreteWrite(&GpioAnodes,1,LUT7an[i]);
	XGpio_DiscreteWrite(&Gpio7Seg,2,LUT7seg[val]);
	for(delay=0;delay<max_delay;delay++){};val = val>>4; //xil_printf("7seg data = %d\n\r",(val && 0x0F));  }
	if(newData!=oldData){ XGpio_DiscreteWrite(&GpioLed,1,newData);
	xil_printf("sw value = %d\n\r",newData); oldData=newData; }
	}

cleanup_platform();


}
return 0;
}
