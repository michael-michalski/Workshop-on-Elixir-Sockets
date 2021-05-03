defmodule TLSTest do
  use ExUnit.Case
  doctest FunWithSockets.TlsListener

  setup do
    {:ok, socket} = :ssl.connect('127.0.0.1', 7002, opts())
    %{socket: socket}
  end

  test "test Ping Pong", %{socket: socket}  do
    :ok = :ssl.send(socket, "ping")
    "pong" = :ssl.recv(socket, 4)
  end

  defp opts, do: [:binary, active: false, protocol: :tls, versions: [:'tlsv1.2'], verify: :verify_none]
end
