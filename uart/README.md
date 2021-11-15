# UART Example

Demonstrates the use of the UART.

## How to run

This demo can be run on one or two ESP32 boards.
It uses: RX=21, TX=22 for one UART and RX=33, TX=32 for the other.

Connect pin 21 to pin 32, and pin 22 to pin 33.

The easiest is to simple use the `toit run` commands.

For a single board
```
toit run pong.toit
```
and, in another terminal:

```
toit run ping.toit
```

Alternatively, for two boards:

```
toit run -d DEVICE_NAME_1 pong.toit
```
and, in another terminal:

```
toit run -d DEVICE_NAME_2 ping.toit
```
