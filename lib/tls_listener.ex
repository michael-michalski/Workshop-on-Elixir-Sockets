defmodule FunWithSockets.TlsListener do
  @moduledoc """
  Documentation for `FunWithSockets.TlsListener`.
  """
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil)
  end

  def init(_) do
    {:ok, %{}}
  end
end
