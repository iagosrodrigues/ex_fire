defmodule FHIR.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_fire,
      version: "0.1.0",
      elixir: "~> 1.11",
      description: description(),
      package: package(),
      name: "Ex_Fire",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.24", only: :dev, runtime: false},
      {:mix_test_watch, "~> 1.0", only: :dev}
    ]
  end

  defp description do
    "An implementation of HL7 FHIR"
  end

  defp package() do
    [
      name: "ex_fire",
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/iagosrodrigues/ex_fire"}
    ]
  end
end
