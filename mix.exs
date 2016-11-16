defmodule Arc.Storage.Rackspace.Mixfile do
  use Mix.Project

  @version "0.0.1"

  def project do
    [app: :arc_rackspace,
     version: @version,
     elixir: "~> 1.3",
     deps: deps,
     description: description,
     package: package]
  end

  defp description do
    """
    Provides Rackspace storage backend for Arc.
    """
  end

  defp package do
    [maintainers: ["Anton Maminov"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/lokalebasen/arc_rackspace"},
     files: ~w(mix.exs README.md lib)]
  end

  def application do
    [applications: [:logger, :rackspace]]
  end

  defp deps do
    [
      {:arc, "~> 0.6.0-rc3"},
      {:poison, "~> 2.0"},
      {:rackspace, github: "lokalebasen/ex-rackspace"}
    ]
  end
end
