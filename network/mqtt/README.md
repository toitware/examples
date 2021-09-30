# MQTT publish/subscribe example

This example shows how to use the Toit MQTT client to publish messages to a topic, and to subscribe on the same topic in order to
receive data - via a public MQTT broker.

## Running the example

First, install the [mqtt package](https://pkg.toit.io/package/github.com%2Ftoitware%2Fmqtt@v1.1.0) by executing the following commands:

```bash
toit pkg init
toit pkg install mqtt
```

To run the example on your ESP32, execute the following command:

```bash
toit run publish_subscribe.toit
```
