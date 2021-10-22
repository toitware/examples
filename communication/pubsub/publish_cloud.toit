/**
PubSub example code for publishing on a cloud topic.

Publishes the message "Hello from another device" on the cloud topic named "cloud:hello-world" and then terminates.

A cloud topic is used for communication between two separate device. The data is sent via the Toit cloud in this scenario.
The cloud topic can also be used for communication between a device and an external service or client application.
*/

import pubsub
topic ::= "cloud:hello-world"

main:
  pubsub.publish topic "Hello from another device"
