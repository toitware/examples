/**
Fading LED example code.

This example increases and decreases the lighting level of a LED over and over again.

How to wire the LED: 
  - Place a 220ohm resistor in between the anode of the LED and GPIO19 and connect the cathode to ground.
  - The resistor limits the current that flows through the LED and the ESP32, increasing their life.
*/

import gpio.pwm as gpio
import gpio

/// The GPIO pin for the LED.
LED ::= 19

/// The configured range of the PWM.
DUTY_MIN ::= 0.0
DUTY_MAX ::= 1.0
CHANGE_RATE ::= 0.01  // The amount of change every 5ms.

main:
  step := CHANGE_RATE
  duty := DUTY_MIN
  led_pwm ::= gpio.Pwm --frequency=100
  led := gpio.Pin LED
  fading_led := led_pwm.start led
  while true:
    fading_led.set_duty_factor(duty)
    duty += step
    if not DUTY_MIN <= duty <= DUTY_MAX:
      step = -step
    sleep --ms=5
