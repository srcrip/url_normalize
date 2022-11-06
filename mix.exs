defmodule UrlNormalize.MixProject do
  use Mix.Project

  @moduledoc false
  @description "url_normalize is a tiny elixir library for normalizing urls."
  @source_url "https://github.com/sevensidedmarble/url_normalize"
  @version "1.0.0"

  def project do
    [
      app: :url_normalize,
      description: @description,
      version: @version,
      package: package(),
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs()
    ]
  end

  def application, do: [extra_applications: [:logger]]

  defp deps do
    [
      {:ex_check, "~> 0.14.0", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.29.0", only: :dev, runtime: false},
      {:credo, ">= 0.0.0", only: [:dev, :test]},
      {:dialyxir, "~> 1.0", only: [:dev], runtime: false}
    ]
  end

  defp docs do
    [
      main: "readme",
      source_url: @source_url,
      extras: ["README.md"],
      source_url: @source_url,
      source_ref: "v#{@version}"
    ]
  end

  defp package do
    [
      files: ~w(lib mix.exs README.md LICENSE),
      maintainers: ["sevensidedmarble"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url
      }
    ]
  end
end
