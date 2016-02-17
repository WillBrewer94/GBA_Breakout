# 1 "myLib.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "myLib.c"
# 1 "myLib.h" 1
# 51 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control);






typedef struct
{
        const volatile void *src;
        const volatile void *dst;
        unsigned int cnt;
} DMA_CONTROLLER;
# 89 "myLib.h"
typedef unsigned short u16;

typedef struct {
 int row;
 int col;
 int oldRow;
 int oldCol;
 int width;
 int height;
 u16 color;
 char gameOver;
} PADDLE;

typedef struct {
 int row;
 int col;
 int height;
 int width;
 int active;
 u16 color;
} BRICK;

typedef struct {
 int row;
 int col;
 int oldRow;
 int oldCol;
 int height;
 int width;
 int rd;
 int cd;
 u16 color;
} BALL;


void setPixel(int, int, unsigned short);
void drawRect(int row, int col, int height, int width, unsigned short color);
void drawRectInBounds(int row, int col, int height, int width, unsigned short color);
void waitForVBlank();
# 2 "myLib.c" 2

unsigned int oldButtons;
unsigned int buttons;
unsigned short *videoBuffer = (u16 *)0x6000000;

void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control)
{
 ((volatile DMA_CONTROLLER *) 0x40000B0)[channel].src = source;
 ((volatile DMA_CONTROLLER *) 0x40000B0)[channel].dst = destination;
 ((volatile DMA_CONTROLLER *) 0x40000B0)[channel].cnt = control | (1 << 31);
}

void drawRect(int row, int col, int height, int width, unsigned short color) {
 volatile unsigned short c = color;
 for(int r=0; r<height; r++) {
  DMANow(3, &c, &videoBuffer[((row + r)*240 +(col))], width | (2 << 23));
 }
}

void fillScreen(unsigned short color) {
 volatile unsigned short c = color;
 DMANow(3, &c, videoBuffer, 38400 | (2 << 23));
}

void setPixel(int row, int col, unsigned short color) {
 ((unsigned short *)0x6000000)[((row)*240 +(col))] = color;
}

void waitForVBlank() {
 while(*(volatile unsigned short*) 0x4000006>160);
 while(*(volatile unsigned short*) 0x4000006<160);
}
