#include "myLib.h"
#include "text.h"

unsigned short *videoBuffer = (u16 *)0x6000000;

// // A less efficient draw rect function that takes the bounds of the screen into consideration
// void drawRectInBounds(int row, int col, int height, int width, unsigned short color) {

// 	for(int r = 0; r < height; r++) {

// 		for(int c = 0; c < width; c++) {

// 			if(col + c > 0 && col + c < 240 && row + r > 0 && row + r < 160) // If the pixel is on the screen essentially
// 				setPixel(row+r, col+c, color);
// 		}
// 	}
// }

void setPixel(int row, int col, unsigned short color) {

	VIDEO_BUFFER[OFFSET(row, col, 240)] = color;
}

void setPixel4(int row, int col, unsigned char index) {

	unsigned short pixel = videoBuffer[OFFSET(row, col, 240) / 2];
	if (col & 1) {
		// left side of short
		pixel &= 0x00FF;
		videoBuffer[OFFSET(row, col, 240) / 2] = pixel | (index << 8);

	} else {
		// right side of short
		pixel &= 0xFF00;
		videoBuffer[OFFSET(row, col, 240) / 2] = pixel | (index);
	}
}

void waitForVBlank() {

	while(SCANLINECOUNTER>160);
	while(SCANLINECOUNTER<160);
}


void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control) {

	DMA[channel].src = source;
	DMA[channel].dst = destination;
	DMA[channel].cnt = control | DMA_ON;
}

void drawRect(int x, int y, int height, int width, unsigned short color) {

	volatile unsigned short c = color;
	for (int y2 = 0; y2 < height; y2++) {
		DMANow(3, &c, &videoBuffer[OFFSET(y + y2, x, 240)], width | DMA_SOURCE_FIXED);
	}
       
}

void drawRect4(int xLoc, int yLoc, int height, int width, unsigned char index) {
	for(int r=0; r<height; r++)
	{
		for(int c=0; c<width; c++)
		{
			setPixel4(yLoc+r, xLoc+c, index);
		}
	}
}

void loadPalette(volatile const unsigned short* palette) {
    DMANow(3, palette, PALETTE, 256);
}

void fillScreen(unsigned short color) {

	volatile unsigned short c = color;
	DMANow(3, &c, videoBuffer, 38400 | DMA_SOURCE_FIXED);
}

void fillScreen4(unsigned char colorIndex) {
	volatile unsigned short pixels = (colorIndex << 8) | colorIndex;
	DMANow(3, &pixels, videoBuffer, DMA_SOURCE_FIXED | (240 * 160) / 2); 
}

void flipPage() {
	if(REG_DISPCTL & BUFFER1FLAG)
	{
		// We were display BUFFER1 and drawing on BUFFER0
		REG_DISPCTL = REG_DISPCTL & ~BUFFER1FLAG;
		videoBuffer = BUFFER1;
	}
	else
	{
		// We were display BUFFER0 and drawing on BUFFER1
		REG_DISPCTL = REG_DISPCTL | BUFFER1FLAG;
		videoBuffer = BUFFER0;
	}
}

