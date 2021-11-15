// Copyright (C) 2021 Toitware ApS.
// Use of this source code is governed by a Zero-Clause BSD license that can
// be found in the EXAMPLES_LICENSE file.

import uart
import writer show Writer
import reader show BufferedReader
import gpio

RX ::= 21
TX ::= 22

main:
  // The UART port can be configured in many ways.
  // See https://libs.toit.io/uart/class-Port
  port := uart.Port
      --rx=gpio.Pin RX
      --tx=gpio.Pin TX
      --baud_rate=115200

  task::
    // We are using a 'Writer', so we don't need to check whether all data has
    // been written.
    // The 'port.write' function returns the amount of data that was written,
    // and the caller needs to call the 'write' function again if not all data
    // was handled. The 'Writer' class does this for us.
    writer := Writer port
    while true:
      print "pinging"
      writer.write "ping\n"
      sleep --ms=500

  task::
    // We are using a BufferedReader here.
    // It would be possible to just write 'data := port.read' instead.
    // The advantage of using a BufferedReader is that we don't need
    // to worry about Unicode characters (which don't use here anyway).
    // See the 'pong.toit' file for the direct use case.
    reader := BufferedReader port
    while line := reader.read_line:
      print line
