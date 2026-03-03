defmodule ResistorColor do
  @color_map %{
    "black" => 0,
    "brown" => 1,
    "red" => 2,
    "orange" => 3,
    "yellow" => 4,
    "green" => 5,
    "blue" => 6,
    "violet" => 7,
    "grey" => 8,
    "white" => 9
  }
  @moduledoc false

  @spec colors() :: list(String.t())
  def colors do
    Map.to_list(@color_map)
    |> Enum.sort_by(fn {_, value} -> value end)
    |> Enum.map(fn {color, _} -> color end) 
  end

  @spec code(String.t()) :: integer()
  def code(color) do
    Map.get(@color_map, color)
  end
end
