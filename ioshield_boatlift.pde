
/************************************************************************/
/*									*/
/*  IOShieldOled.c  --  OLED Display Driver for Basic I/O Shield        */
/*									*/
/************************************************************************/
/*  Author: 	Oliver Jones						*/
/*  Copyright 2011, Digilent Inc.					*/
/************************************************************************/
/*
  This program is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with this library; if not, write to the Free Software
  Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
*/
/************************************************************************/
/*  Module Description: 						*/
/*									*/
/*  This program demonstrates the basic operation of the OLED graphics  */
/*  display on the Digilent Basic I/O Shield. It illustrates the        */
/*  initialization of the display and some basic character and graphic  */
/*  operations.                                                         */
/*									*/
/************************************************************************/
/*  Revision History:							*/
/*									*/
/*  06/01/2011(GeneA): created						*/
/*  08/04/2011(GeneA): prepare first release				*/
/*									*/
/************************************************************************/

#include <IOShieldOled.h>

void setup()
{
  IOShieldOled.begin();
  pinMode(37, Input);
  pinMode(36, Input);
  pinMode(34, Input);
  pinMode(4,  Input);
  pinMode(33, Output);
  pinMode(32, Output);
  pinMode(31, Output);
  pinMode(30, Output);
  pinMode(29, Output);
  pinMode(28, Output);
  pinMode(27, Output);
  pinMode(26, Output);
  
}

void loop()
{
  int irow;
  int ib;
  int button1 =0;
  int button2 =0;
  int button3 =0;
  int button4 =0;
  
  //Clear the virtual buffer
  IOShieldOled.clearBuffer();
  
  //Chosing Fill pattern 0
  IOShieldOled.setFillPattern(IOShieldOled.getStdPattern(0));
  //Turn automatic updating off
  IOShieldOled.setCharUpdate(0);
  
  //Draw a rectangle over writing then slide the rectagle
  //down slowly displaying all writing
  for (irow = 0; irow < IOShieldOled.rowMax; irow++)
  {
    IOShieldOled.clearBuffer();
    IOShieldOled.setCursor(0, 0);
    IOShieldOled.putString("chipKIT");
    IOShieldOled.setCursor(0, 1);
    IOShieldOled.putString("Basic I/O Shield");
    IOShieldOled.setCursor(0, 2);
    IOShieldOled.putString("by Digilent");
    
    IOShieldOled.moveTo(0, irow);
    IOShieldOled.drawFillRect(127,31);
    IOShieldOled.moveTo(0, irow);
    IOShieldOled.drawLine(127,irow);
    IOShieldOled.updateDisplay();
    delay(100);
  }
  
  button1 = digitalread(32);
  button2 = digitalread(36);
  button3 = digitalread(34);
  button4 = digitalread(4); 

}
  
  
