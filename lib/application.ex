defmodule FunWithSockets.Application do
  use Application
  alias FunWithSockets.{TcpListener, TlsListener, UdpListener}

  def start(_type, _args) do
    children = [
      TcpListener,
      TlsListener,
      UdpListener
    ]
    Supervisor.start_link(children, opts())
  end

  defp opts, do: [strategy: :one_for_one, max_restarts: 5, max_seconds: 1]
end
