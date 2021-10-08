import ble

BATTERY_SERVICE ::= ble.uuid 0x180F
SCAN_DURATION   ::= Duration --s=3

main:
  device := ble.Device.default

  addresses := []

  device.scan --duration=SCAN_DURATION: | remote_device/ble.RemoteDevice |
    if remote_device.data.service_classes.contains BATTERY_SERVICE:
      addresses.add remote_device.address

  print addresses