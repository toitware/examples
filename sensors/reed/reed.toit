/**
Reed sensor example code.

This example prints 'contact' and 'no contact' depending on the state of the reed switch.

How to wire the reed sensor: 
  - Look at the breadboard or schematic file.
*/
import gpio

/// The GPIO pin the reed sensor is connected to.
REED ::= 26
 
main:
  reed := gpio.Pin REED --input
  while true:
    reed.wait_for 1
    print "Contact"
    sleep --ms=100 // Debounce.
    reed.wait_for 0
    print "No contact"
    sleep --ms=100 // Debounce.
