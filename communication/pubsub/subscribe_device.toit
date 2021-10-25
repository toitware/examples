/**
PubSub example code for subscribing to a device topic.

The subscriber sets up a subscription on a device topic named "device:hello-world" 
and then terminates.

A device topic is used for communication between two apps installed on the same device. 
The data is not sent to the Toit cloud in this scenario.
*/

import pubsub
topic ::= "device:hello-world"

main:
  pubsub.subscribe topic: | msg/pubsub.Message |
    print "Received message '$msg.payload.to_string'"
    // Stop listening for other messages and exit 'main'.
    return
