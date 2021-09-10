/**
Button example code.

This example prints 'Button clicked', when you press click the button.

How to wire the button:
  - See breadboard or schematic image.
*/

import gpio

/// The GPIO pin the button is connected to.
BUTTON ::= 21

main:
  button ::= gpio.Pin BUTTON --input
  while true:
    button.wait_for 1
    print "Button clicked"
    sleep --ms=100  // Debounce.
    // Wait for the button to be released.
    button.wait_for 0
    sleep --ms=100  // Debounce
