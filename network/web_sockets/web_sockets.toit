// Copyright (C) 2021 Toitware ApS.
// Use of this source code is governed by a Zero-Clause BSD license that can
// be found in the LICENSE file.

/**
A simple example that creates two tasks.  One plays the role of the
  WebSockets server, while the other plays the role of the client.
  Communication is over HTTP, unencrypted.
*/

import expect show *
import http
import monitor  // For communication between tasks in the same process.
import net
import web_socket

YAYA ::= "yayayaya"
LALA ::= "lålalala"

main:
  ready := monitor.Channel 1
  task:: server ready
  port := ready.receive
  task:: client port

network ::= net.open

server ready/monitor.Channel -> none:
  // Listen on a random port.
  server := network.tcp_listen 0
  // Tell the client the port number.
  ready.send server.local_address.port

  // Accept just one TCP connection.
  socket := server.accept
  // Put an HTTP server on the new TCP connection.
  connection := http.Connection socket
  // The other side will make a GET request.
  request := connection.read_request
  // This should be a websocket upgrade request.
  expect request.should_web_socket_upgrade
  // Create the server-side Websocket.
  web_socket := web_socket.WebSocketServer connection request

  // Get some requests from the client, and answer them.
  expect_equals LALA web_socket.read
  web_socket.write YAYA         // Write a string as TEXT.

  expect_equals LALA web_socket.read.to_string
  web_socket.write YAYA.to_byte_array  // Write a byte array as BINARY.

  web_socket.close_write
  expect_null web_socket.read

client port/int -> none:
  // Make a TCP connection to the server port on localhost.
  host := "localhost"
  socket := network.tcp_connect host port

  // Create an HTTP connection on the TCP connection.
  connection := http.Connection socket host
  // Make a GET request which we will use to upgrade to WebSockets.
  request := connection.new_request "GET" "/"

  // Upgrade the connection to WebSocket.
  web_socket := web_socket.WebSocketClient connection request

  // Write some requests to the server and read the responses.
  web_socket.write LALA         // Write a Unicode string as TEXT.
  expect_equals YAYA web_socket.read

  web_socket.write LALA.to_byte_array  // Write a UTF-8 byte array as BINARY.
  expect_equals YAYA web_socket.read.to_string

  web_socket.close_write
  expect_null web_socket.read
