defmodule FunWithSockets.TcpListener do
  @moduledoc """
  Documentation for `FunWithSockets.TcpListener`.
  """
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil)
  end

  def init(_) do
    {:ok, %{}}
  end

  def handle_info({:tcp_error, _socket}, state) do
    {:noreply, state}
  end

  def handle_info({:tcp_closed, _socket}, state) do
    {:noreply, state}
  end
end
