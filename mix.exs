defmodule Elixirbot.Mixfile do
  use Mix.Project

  def project do
    [app: :elixirbot,
     version: "1.0.0",
     deps: deps(),
     elixirc_options: [debuf_info: true],
     escript_embed_elixir: true,
     escript_main_module: Elixirbot.Application,
     release_options: [path: "rel"]]
  end

  def application do
    [applications: [:genx],
     mod: {Elixirbot.Application, []}]
  end

  defp deps do
    [{:genx, github: "chrissphinx/genx"}]
  end
end
