/**
Example code for scanning and discovering BLE peripherals.

This program must run on a BLE device, and will scan for nearby BLE devices.

When a BLE device is found, the program will print its address.

This program can be run without any prerequisites on an ESP32 device, since BLE is
built into the ESP32 chip.

If you want to discover and find your mobile phone using this program, you need to 
download a mobile app, like nRF Connect:

https://apps.apple.com/us/app/nrf-connect-for-mobile/id1054362403 for iOS

or 

https://play.google.com/store/apps/details?id=no.nordicsemi.android.mcp&hl=en for Android

The nRF Connect app allows your iOS or Android device to advertise as a BLE peripheral.

*/

import ble

main:
  device := ble.Device.default

  // Start scanning for devices
  device.scan: | remote_device/ble.RemoteDevice |
    print "Found $remote_device"
