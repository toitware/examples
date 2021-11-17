// Copyright (C) 2021 Toitware ApS.
// Use of this source code is governed by a Zero-Clause BSD license that can
// be found in the LICENSE file.

import uart
import writer show Writer
import gpio

RX ::= 33
TX ::= 32

main:
  // The UART port can be configured in many ways.
  // See https://libs.toit.io/uart/class-Port
  port := uart.Port
      --rx=gpio.Pin RX
      --tx=gpio.Pin TX
      --baud_rate=115200

  // We are using a 'Writer', so we don't need to check whether all data has
  // been written.
  // The 'port.write' function returns the amount of data that was written,
  // and the caller needs to call the 'write' function again if not all data
  // was handled. The 'Writer' class does this for us.
  writer := Writer port

  while data := port.read:
    writer.write data
