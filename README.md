# FunWithSockets

This is a small workshop that gets you up to speed with sockets in Elixir.

## Installation

If You don't have elixir locally, You can use the docker image.

 * docker build . -t fun_with_sockets
 * docker run -it fun_with_sockets

## Exercise 1

Finish up *tcp_listener.ex* so that unit tests pass.

You can draw inspiration from https://erlang.org/doc/man/gen_tcp.html


* mix test test/tcp_listener_test.exs

Add an info level log message that prints the incoming ip and port

## Exercise 2

Here we try to implement around a custom protocol.

You can draw inspiration from https://erlang.org/doc/man/gen_udp.html

Finish up *udp_listener.ex* so that unit tests pass.

* mix test test/udp_listener_test.exs

## Exercise 3

Working with ssl in elixir

You can draw inspiration from https://erlang.org/doc/man/ssl.html

Finish up *tls_listener.ex* so that unit tests pass.

* mix test test/tls_listener_test.exs

## Exercise 4

Lets use *https://github.com/bencheeorg/benchee* to benchmark our tls implementation

Add benchee to the deps of mix.exs.

And write a benchmark that can calculate the timing for handshakes.