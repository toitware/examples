// Copyright (C) 2021 Toitware ApS.
// Use of this source code is governed by a Zero-Clause BSD license that can
// be found in the LICENSE file.

/**
A simple example that contacts a public echo server over an encrypted TLS
  connection.
*/

import certificate_roots
import expect show *
import http
import net
import tls
import web_socket

HOST ::= "ws.ifelse.io"
PORT ::= 443

YAYA ::= "yayayaya"
LALA ::= "lålalala"

network ::= net.open

main:
  // Make a TCP connection to the server port on localhost.
  tcp := network.tcp_connect HOST PORT

  // Put a TLS socket on the TCP connection
  socket := tls.Socket.client tcp
    --server_name=HOST
    --root_certificates=[certificate_roots.ISRG_ROOT_X1]

  // Create an HTTP connection on the TLS connection.
  connection := http.Connection socket HOST

  // Make a GET request which we will use to upgrade to WebSockets.
  request := connection.new_request "GET" "/"

  // Upgrade the connection to WebSocket.
  web_socket := web_socket.WebSocketClient connection request

  // Write some requests to the server and read the responses.
  web_socket.write LALA         // Write a Unicode string as TEXT.
  print web_socket.read         // Welcome message from server.
  expect_equals LALA web_socket.read  // Verify echo.

  web_socket.write YAYA.to_byte_array  // Write a UTF-8 byte array as BINARY.
  expect_equals YAYA web_socket.read.to_string  // Verify echo.

  web_socket.close_write
  expect_null web_socket.read
