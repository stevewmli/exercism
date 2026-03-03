defmodule PigLatin do
  @vowels ["a", "e", "i", "o", "u"]
  @pig_suffix "ay"

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
      do_translate(x) <> @pig_suffix
    end)
    |> Enum.join(" ")
  end

  defp do_translate(<<leading1::binary-size(1), _rest::binary>> = phrase) when leading1 in @vowels do
    phrase
  end

  defp do_translate(<<leading1::binary-size(1), leading2::binary-size(1), _rest::binary>> = phrase)
       when leading1 in ["x", "y"] and leading2 not in @vowels do
    phrase
  end

  defp do_translate(<<leading1::binary-size(2), rest::binary>>)
       when leading1 == "qu" do
    "#{rest}#{leading1}"
  end

  defp do_translate(<<leading1::binary-size(1), leading2::binary-size(2), rest::binary>>)
       when leading1 not in @vowels and leading2 == "qu" do
    "#{rest}#{leading1}#{leading2}"
  end

  defp do_translate(phrase) do
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
