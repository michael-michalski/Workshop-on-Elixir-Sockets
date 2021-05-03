defmodule FunWithSockets.CustomDatagramProtocol do
  @moduledoc """
  Documentation for `FunWithSockets.CustomDatagramProtocol`.
  """
  def msg_size, do: 128

  def msg_type_ping, do: 0
  def msg_type_pong, do: 1
  def msg_type_connection, do:  2

  @spec gen_msg(pos_integer, binary) :: binary
  def gen_msg(msg_type, msg), do: <<msg_type::size(8)>> <> msg
end
