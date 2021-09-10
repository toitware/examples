/**
Program that listens on input: a magnetic door sensor connected via pin 26.
And turns on an LED when the door is open.
*/

import gpio

pin ::= gpio.Pin 26 --input
led ::= gpio.Pin 19 --output
 
main:
 while true:
   led.set pin.get
   sleep --ms=5
