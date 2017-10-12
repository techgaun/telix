defmodule Telix.Mixfile do
  use Mix.Project

  @version "0.1.0-dev"

  def project do
    [
      app: :telix,
      version: @version,
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      description: "Telit API Client For Elixir",
      name: "Telix",
      docs: docs(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 0.13"},
      {:poison, "~> 3.1"},
      {:ex_doc, "~> 0.17", only: :docs},
    ]
  end

  defp docs do
    [
      main: "Telix",
      source_ref: "v#{@version}",
      source_url: "https://github.com/techgaun/telix"
    ]
  end

  defp package do
    [
      maintainers: ["Samar Acharya"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/techgaun/telix"},
      files: ~w(mix.exs README.md lib config)
    ]
  end
end
