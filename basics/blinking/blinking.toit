/**
Blinking LED example code.

This example prints 'blink' and makes the LED blink with a 1 second frequency.

How to wire the LED:
    - Place a 220ohm resistor in between the anode of the LED and GPIO19 and connect the cathode to ground.
    - The resistor limits the current that flows through the LED and the ESP32, increasing their life.
*/

import gpio

/// The GPIO pin the LED is connected to.
LED ::= 19

main:
  led := gpio.Pin LED --output
  while true:
    print "blink"
    led.set 1
    sleep --ms=500
    led.set 0
    sleep --ms=500
