/**
Example code for advertising a device to other BLE devices.

A BLE device can advertise about itself. The advertisement can contain a list of services and manufactorer data section.

This code can be run without any prerequisites on an ESP32 device, since BLE is built-into the ESP32 chip.

*/

import ble

main:
  device := ble.Device.default

  // Initialize the advertisement payload.
  data := ble.AdvertisementData --name="Toit"

  // Start the advertiser.
  advertiser := device.advertise
  advertiser.set_data data
  advertiser.start

  // Let the advertiser run until done (can be indefinitely).
  advertiser.wait_for_done
