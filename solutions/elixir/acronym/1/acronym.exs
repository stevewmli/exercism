defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
  	string
  	|> String.split(~r/[\s,\-]/, trim: true)
  	|> Enum.map(fn(word) -> upcaseFirstChar(word)
  		|>  stripDowncase() end)
  	|> Enum.join("")
  end

  defp upcaseFirstChar(word) do
  	(String.first(word) |> String.upcase()) <> String.slice(word, 1..-1) 
  end

  defp stripDowncase(word) do
  	String.replace(word, ~r/[^A-Z]/, "", global: true)
  end
end