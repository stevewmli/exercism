defmodule PigLatin do
  @vowels ["a", "e", "i", "o", "u"]
  @pig_const "ay"

  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split(" ")
    |> Enum.map(fn x ->
      translate(
        String.slice(x, 0..0),
        String.slice(x, 1..1),
        String.slice(x, 2..2),
        x
      ) <> @pig_const
    end)
    |> Enum.join(" ")
  end

  defp translate(_leading1, _leading2, _leading3, "") do
    ""
  end

  defp translate(leading1, _leading2, _leading3, phrase) when leading1 in @vowels do
    "#{phrase}"
  end

  defp translate(leading1, leading2, _leading3, phrase)
       when leading1 in ["x", "y"] and leading2 not in @vowels do
    "#{phrase}"
  end

  defp translate(leading1, leading2, _leading3, phrase)
       when leading1 == "q" and leading2 == "u" do
    "#{String.slice(phrase, 2..-1)}#{String.slice(phrase, 0..1)}"
  end

  defp translate(leading1, leading2, leading3, phrase)
       when leading1 not in @vowels and leading2 == "q" and leading3 == "u" do
    "#{String.slice(phrase, 3..-1)}#{String.slice(phrase, 0..2)}"
  end

  defp translate(_leading1, _leading2, _leading3, phrase) do
    idx = splice_by_vowels_idx(phrase)
    "#{String.slice(phrase, idx..-1)}#{String.slice(phrase, 0..(idx - 1))}"
  end

  defp splice_by_vowels_idx(phrase) do
    Enum.map(@vowels, fn x -> :binary.match(phrase, x) end)
    |> Enum.filter(fn x -> x != :nomatch end)
    |> Enum.map(fn {idx, _} -> idx end)
    |> Enum.min()
  end
end
