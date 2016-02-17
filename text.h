/*********************************************************************
 *
 * text.h
 *
 ********************************************************************/
#ifndef TEXT_H
#define TEXT_H

void drawChar(int , int , char , unsigned short );
void drawString(int row, int col, char *str, unsigned short color);

extern const unsigned char fontdata_6x8[12288];

#endif
