import ble

main:
  device := ble.Device.default

  data := ble.AdvertisementData
    --name="Toit device"

  advertiser := device.advertise
  advertiser.set_data data
  advertiser.start

  advertiser.wait_for_done
  