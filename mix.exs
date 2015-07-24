defmodule Curry.Mixfile do
  use Mix.Project

  def project do
    [app: :curry,
     version: "0.0.1",
     elixir: "~> 1.0",
     description: "A simple currying macro allowing to define curried functions in Elixir modules.",
     package: [
      contributors: ["Ludovic Demblans"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/niahoo/elixir-curry"}
    ],
     deps: deps]
  end

  def application do
    []
  end

  defp deps do
    []
  end
end
