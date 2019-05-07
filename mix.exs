defmodule Injector.MixProject do
  use Mix.Project

  def project do
    [
      app: :injector,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps()
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
      {:ex_doc, "~> 0.19", only: :dev, runtime: false}
    ]
  end

  defp description() do
    "Dependency injection for Elixir"
  end

  defp package() do
    [
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/farhadi/injector"}
    ]
  end
end
