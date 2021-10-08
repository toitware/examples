/**
Example code for scanning for local BLE devices, printing their addresses.
*/

import ble

main:
  device := ble.Device.default

  device.scan: | remote_device/ble.RemoteDevice |
    print "Found $remote_device"
