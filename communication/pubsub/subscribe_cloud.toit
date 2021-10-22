/**
The subscriber sets up a subscription on a cloud topic named "cloud:hello-world",
and prints the received message and the hardware ID of the device.

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
      sender = "ExternalSystem($msg.sender.external_name)"
    print "Received message '$msg.payload.to_string' from $sender"
  print "done processing all messages"
