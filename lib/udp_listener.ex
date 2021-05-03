defmodule FunWithSockets.UdpListener do
  @moduledoc """
  Documentation for `FunWithSockets.UdpListener`.
  """
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil)
  end

  def init(_) do
    {:ok, %{}}
  end
end
