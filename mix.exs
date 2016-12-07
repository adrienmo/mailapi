defmodule Mailapi.Mixfile do
  use Mix.Project

  def project do
    [app: :mailapi,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      mod: {Mailapi, []},
      applications: [:logger, :cowboy, :poison, :gen_smtp]
    ]
  end

  defp deps do
    [
      {:cowboy, "~> 1.0"},
      {:gen_smtp, "~> 0.11.0"},
      {:poison, "~> 3.0"},
      {:distillery, "~> 1.0"}
    ]
  end
end
