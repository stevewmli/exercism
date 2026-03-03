defmodule SecretHandshake do
  use Bitwise
  @handshake %{1 => "wink", 2 => "double blink", 4 => "close your eyes", 8 => "jump"}

  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    [1, 2, 4, 8]
    |> Enum.filter(fn x -> (code &&& x) == x end)
    |> Enum.map(fn x -> Map.fetch!(@handshake, x) end)
    |> reverse_handshake(code)
  end

  defp reverse_handshake(result, code) when (code &&& 16) == 16 do
    Enum.reverse(result)
  end

  defp reverse_handshake(result, _) do
    result
  end
end
