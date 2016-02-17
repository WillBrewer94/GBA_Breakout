#include "myLib.h"

unsigned int oldButtons;
unsigned int buttons;
unsigned short *videoBuffer = (u16 *)0x6000000;

void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control)
{
	DMA[channel].src = source;
	DMA[channel].dst = destination;
	DMA[channel].cnt = control | DMA_ON;
}

void drawRect(int row, int col, int height, int width, unsigned short color) {
	volatile unsigned short c = color;
	for(int r=0; r<height; r++) {
		DMANow(3, &c, &videoBuffer[OFFSET(row + r, col, 240)], width | DMA_SOURCE_FIXED);
	} 
}

void fillScreen(unsigned short color) {
	volatile unsigned short c = color;
	DMANow(3, &c, videoBuffer, 38400 | DMA_SOURCE_FIXED);   
}

void setPixel(int row, int col, unsigned short color) {
	VIDEO_BUFFER[OFFSET(row, col, 240)] = color;
}

void waitForVBlank() {
	while(SCANLINECOUNTER>160);
	while(SCANLINECOUNTER<160);
}