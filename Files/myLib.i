# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1
# 55 "myLib.h"
typedef unsigned short u16;


void setPixel(int, int, unsigned short color);
void setPixel4(int row, int col, unsigned char index);
void waitForVBlank();
void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control);
void drawRect(int x, int y, int height, int width, unsigned short color);
void drawRect4(int row, int col, int height, int width, unsigned char index);
void loadPalette(volatile const unsigned short* palette);
void fillScreen(unsigned short color);
void fillScreen4(unsigned char colorIndex);
void flipPage();
# 76 "myLib.h"
typedef struct {
 const volatile void *src;
 const volatile void *dst;
 unsigned int cnt;

} DMA_CONTROLLER;
# 2 "myLib.c" 2
# 1 "text.h" 1

void drawChar(int row, int col, char ch, char index);
void drawString(int row, int col, char *str, char index);

extern const unsigned char fontdata_6x8[];
# 3 "myLib.c" 2

unsigned short *videoBuffer = (u16 *)0x6000000;
# 19 "myLib.c"
void setPixel(int row, int col, unsigned short color) {

 ((unsigned short *)0x6000000)[((row)*240 +(col))] = color;
}

void setPixel4(int row, int col, unsigned char index) {

 unsigned short pixel = videoBuffer[((row)*240 +(col)) / 2];
 if (col & 1) {

  pixel &= 0x00FF;
  videoBuffer[((row)*240 +(col)) / 2] = pixel | (index << 8);

 } else {

  pixel &= 0xFF00;
  videoBuffer[((row)*240 +(col)) / 2] = pixel | (index);
 }
}

void waitForVBlank() {

 while(*(volatile unsigned short*) 0x4000006>160);
 while(*(volatile unsigned short*) 0x4000006<160);
}


void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control) {

 ((volatile DMA_CONTROLLER *) 0x040000B0)[channel].src = source;
 ((volatile DMA_CONTROLLER *) 0x040000B0)[channel].dst = destination;
 ((volatile DMA_CONTROLLER *) 0x040000B0)[channel].cnt = control | (1 << 31);
}

void drawRect(int x, int y, int height, int width, unsigned short color) {

 volatile unsigned short c = color;
 for (int y2 = 0; y2 < height; y2++) {
  DMANow(3, &c, &videoBuffer[((y + y2)*240 +(x))], width | (2 << 23));
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
    DMANow(3, palette, ((u16 *)0x5000000), 256);
}

void fillScreen(unsigned short color) {

 volatile unsigned short c = color;
 DMANow(3, &c, videoBuffer, 38400 | (2 << 23));
}

void fillScreen4(unsigned char colorIndex) {
 volatile unsigned short pixels = (colorIndex << 8) | colorIndex;
 DMANow(3, &pixels, videoBuffer, (2 << 23) | (240 * 160) / 2);
}

void flipPage() {
 if(*(unsigned short *)0x4000000 & 0x10)
 {

  *(unsigned short *)0x4000000 = *(unsigned short *)0x4000000 & ~0x10;
  videoBuffer = (unsigned short *)0x600A000;
 }
 else
 {

  *(unsigned short *)0x4000000 = *(unsigned short *)0x4000000 | 0x10;
  videoBuffer = (unsigned short *)0x6000000;
 }
}
