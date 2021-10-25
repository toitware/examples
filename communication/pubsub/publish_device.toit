/**
PubSub example code for publishing on a device topic.

Publishes the message "Hello, World!" on the device topic named 
"device:hello-world" and then terminates.

A device topic is used for communication between two apps installed on the same device.
The data is not sent to the Toit cloud in this scenario.
*/

import pubsub
topic ::= "device:hello-world"

main:
  pubsub.publish topic "Hello, World!"
