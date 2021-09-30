/**
Example code for subscribing to a topic in order to receive data (on a device) via a public MQTT broker.
By using the Toit MQTT client.
*/

import net
import mqtt
import encoding.json
import device

// Unique MQTT client ID to identify each client that connects to the MQTT broker.
CLIENT_ID ::= "$device.hardware_id"
// The publicly available Mosquitto MQTT server/broker is used in this example.
HOST      ::= "test.mosquitto.org"
// MQTT port 1883 is for unencrypted communication.
PORT      ::= 1883
TOPIC     ::= "my/sensor/data"

main:
  socket := net.open.tcp_connect HOST PORT
  // Connect the Toit MQTT client to the broker
  client := mqtt.Client
    CLIENT_ID
    mqtt.TcpTransport socket

  // The client is now connected.
  print "Connected to MQTT Broker @ $HOST:$PORT"

  // Start subscribing to a topic.
  subscribe client  

  payload := 42.0

  // Publish message to topic
  client.publish
    TOPIC 
    json.encode {
      "value": payload
    }
  print "Published message $payload on '$TOPIC'"  

  // Process subscribed messages.
  client.handle: | topic/string payload/ByteArray |
    decoded := json.decode payload
    print "Received message on '$topic': $(decoded["value"])"
    // Stop after first message.
    return

subscribe client/mqtt.Client:
  client.subscribe TOPIC --qos=1
  print "Subscribed to MQTT client"