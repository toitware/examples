/**
PubSub example code for subscribing to a cloud topic.

The subscriber sets up a subscription on a cloud topic named "cloud:hello-world",
and prints the received message and the hardware ID of the device.

A cloud topic is used for communication between two separate device. The data is sent via the Toit cloud in this scenario.
The cloud topic can also be used for communication between a device and an external service or client application.

*/

import pubsub
topic ::= "cloud:hello-world"

main:
  print "wakeup - checking messages"
  pubsub.subscribe topic --blocking=false: | msg/pubsub.Message |
    sender := ?
    if msg.sender.is_device:
      sender = "Device($msg.sender.hardware_id)"
    else:
      sender = "ExternalSource($msg.sender.external_name)"
    print "Received message '$msg.payload.to_string' from $sender"
  print "done processing all messages"
