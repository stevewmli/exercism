defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
  	Regex.split(~r/[\s_,!&@\$%^:;]/, sentence, trim: true) |> Enum.reduce(%{}, fn(word, result) -> Map.update(result, String.downcase(word), 1, &(&1 + 1)) end)
  end
end