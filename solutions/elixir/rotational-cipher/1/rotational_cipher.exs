defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> to_charlist()
    |> Enum.map(fn x -> encode_char(x, shift) end)
    |> List.to_string()
  end

  defp encode_char(char, shift) when char >= ?a and char <= ?z do
    if (char + shift) <= ?z, do: (char + shift), else: rem((char + shift - 1), ?z) + ?a
  end

  defp encode_char(char, shift) when char >= ?A and char <= ?Z do
    if (char + shift) <= ?Z, do: (char + shift), else: rem((char + shift - 1), ?Z) + ?A
  end

  defp encode_char(char, _) do
    char
  end
end
