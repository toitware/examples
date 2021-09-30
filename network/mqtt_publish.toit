/**
Example code for publishing data (from a device) to a public MQTT broker on a specific topic.
By using the Toit MQTT client.
*/

import net
import mqtt
import encoding.json
import device

// Unique MQTT client ID to identify each client that connects to an MQTT broker
CLIENT_ID ::= "$device.hardware_id"
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
 
  // Publish a value, here 42.0, using the Toit MQTT client
  publish 42.0 client
  client.close


// Publish data on a given topic
publish value/float client/mqtt.Client:
  // Specify the topic name
  topic ::= "my/sensor/data"
  payload := json.encode {
    "value": value
  }
  // Publish the data on the topic and print the value
  client.publish topic payload
  print "Published value $value on topic: '$topic'"