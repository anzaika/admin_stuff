defmodule AdminStuff.MixProject do
  use Mix.Project

  def project do
    [
      app: :admin_stuff,
      version: "0.1.2",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package do
    [
      organization: "buhar",
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Andrey Zaika"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/anzaika/admin_stuff"}
    ]
  end

  defp deps do
    [
      {:phoenix_html, "~> 2.11"},
      {:cloudex, "~> 1.3"},
      {:ecto_sql, "~> 3.1"},
      {:gettext, "~> 0.11"},
      {:canada, "~> 2.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end
