/**
Publishes the message "Hello, World!" on the device topic named "device:hello-world" and then terminates.
*/

import pubsub
topic ::= "device:hello-world"

main:
  pubsub.publish topic "Hello, World!"
