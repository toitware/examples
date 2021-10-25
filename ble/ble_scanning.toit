/**
Example code for scanning BLE devices.

This code is run on a BLE device, and will scan for nearby devices.
When a BLE device is found, the code will print its address.

This code can be run without any prerequisites on an ESP32 device, since BLE is
built-into the ESP32 chip.

*/

import ble

main:
  device := ble.Device.default

  // Start scanning for devices
  device.scan: | remote_device/ble.RemoteDevice |
    print "Found $remote_device"
