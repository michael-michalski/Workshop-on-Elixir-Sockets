defmodule UdpTest do
  use ExUnit.Case
  doctest FunWithSockets.UdpListener
  alias FunWithSockets.CustomDatagramProtocol, as: Cudp
  import ExUnit.CaptureLog

  @host '127.0.0.1'
  @port 7001
  @timeout 1_000

  setup do
    {:ok, socket} = :gen_udp.open(0)
    %{socket: socket}
  end

  test "test Ping Pong", %{socket: socket}  do
    port = 9000
    {:ok, recv_socket} = :gen_udp.open(port, [:binary, active: false])
    assert :ok == :gen_udp.send(socket, @host, @port, Cudp.gen_msg(Cudp.msg_type_ping(), "#{port}"))
    assert Cudp.gen_msg(Cudp.msg_type_pong(), "7000") == :gen_udp.recv(recv_socket, Cudp.msg_size(), @timeout)
  end

  test "test connection msg", %{socket: socket} do
    assert capture_log(fn ->
      assert :ok == :gen_udp.send(socket, @host, @port, Cudp.gen_msg(Cudp.msg_type_connection(), "node 1"))
    end) |> String.contains?("Connected with node 1 from ip")
  end
end
