/**
Example code for advertising the Toit device to other devices.
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
  
