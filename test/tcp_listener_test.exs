defmodule TCPTest do
  use ExUnit.Case
  doctest FunWithSockets.TcpListener
  import ExUnit.CaptureLog

  setup do
    {:ok, socket} = :gen_tcp.connect('127.0.0.1', 7000, [:binary, active: false])
    %{socket: socket}
  end

  test "test Ping Pong", %{socket: socket}  do
    assert :ok == :gen_tcp.send(socket, "ping")
    "pong" = :gen_tcp.recv(socket, 4)
  end

  test "test write log when closing socket", %{socket: socket}  do
    assert capture_log(fn ->
      assert :ok == :gen_tcp.close(socket)
    end) |> String.contains?("Unexpectedly closed connection to")
  end

  test "test write incoming port" do
    assert capture_log(fn ->
      :gen_tcp.connect('127.0.0.1', 7000, [:binary, active: false])
    end) |> String.contains?("Incoming connection from")
  end
end
