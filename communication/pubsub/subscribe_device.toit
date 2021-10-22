/**
The subscriber sets up a subscription on a device topic named "device:hello-world" and then terminates.
*/

import pubsub
topic ::= "device:hello-world"

main:
  pubsub.subscribe topic: | msg/pubsub.Message |
    print "Received message '$msg.payload.to_string'"
    // Stop listening for other messages and exit 'main'.
    return
