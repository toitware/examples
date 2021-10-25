/**
Photoresistor example code.

This example prints whether the lighting level is above the threshold.

How to wire the LED: 
  - Place a 10K ohm resistor in between the one leg of the photo resistor and ground. 
    Connect the other leg of the photo resistor to PIN 32.
*/

import gpio
import gpio.adc

/// The PIN for the photo resistor.
PHOTO_RESISTOR_PIN ::= 32

/// Lighting threshold. Change the threshold to fit your lighting conditions.
THRESHOLD ::= 2.2

main:
  pin := gpio.Pin PHOTO_RESISTOR_PIN
  sensor := adc.Adc pin
  on_off := sensor.get > THRESHOLD ? "on" : "off"
  print "Light is $on_off"
