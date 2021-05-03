defmodule FunWithSockets.MixProject do
  use Mix.Project

  def project do
    [
      app: :fun_with_sockets,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: []
    ]
  end

  def application do
    [
      extra_applications: [:logger, :ssl],
      mod: {FunWithSockets.Application, []}
    ]
  end
end
