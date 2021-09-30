/**
Example code for subscribing to a topic in order to receive data (on a device) via a public MQTT broker.
By using the Toit MQTT client.
*/

import net
import mqtt
import encoding.json
import device

// Unique MQTT client ID to identify each client that connects to an MQTT broker
CLIENT_ID ::= "toit-unique-client-id-1"
// The publicly available Mosquitto MQTT server/broker is used in this example
HOST      ::= "test.mosquitto.org"
// MQTT port 1883 is for unencrypted, unauthenticated communication
PORT      ::= 1883

main:
  socket := net.open.tcp_connect HOST PORT
  // Connect the Toit MQTT client to the broker
  client := mqtt.Client
    CLIENT_ID
    mqtt.TcpTransport socket

  // The client is now connected.

  // Start subscribing to a topic using the Toit MQTT client
  subscribe client 


subscribe client/mqtt.Client:
  // Specify the topic(s) to subscribe to
  topic ::= "my/sensor/data"
  client.subscribe topic --qos=1
  // Receive data on the topic(s) and print the result(s)
  client.handle: | topic/string payload/ByteArray |
    decoded := json.decode payload
    print "Received value on '$topic': $(decoded["value"])"