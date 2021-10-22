/**
Publishes the message "Hello from another device" on the cloud topic named "cloud:hello-world" and then terminates.
*/

import pubsub
topic ::= "cloud:hello-world"

main:
  pubsub.publish topic "Hello from another device"
