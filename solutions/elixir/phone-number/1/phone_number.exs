defmodule Phone do
  @phone_separators [?+, ?(, ?), ?-, ?., 0x20]
  @number ~c(0123456789)
  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    raw
    |> String.to_charlist()
    |> Enum.filter(fn(x) -> !Enum.member?(@phone_separators, x) end)
    |> verify_phone_len()
  end

  defp verify_phone_len(list) when length(list) == 10 or length(list) == 11 do
    verify_phone(Enum.filter(list, fn(x) -> Enum.member?(@number, x) end))
  end

  defp verify_phone_len(_) do
    "0000000000"
  end

  defp verify_phone([?1|t]) when length(t) == 10 do
    to_string(t)
  end

  defp verify_phone(list) when length(list) == 10 do
    to_string(list)
  end

  defp verify_phone(_) do
    "0000000000"
  end


  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    String.slice(number(raw), 0..2)
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    n = number(raw)
    s = String.slice(n, 0..2)
    m = String.slice(n, 3..5)
    e = String.slice(n, 6..9)
    "(#{s}) #{m}-#{e}"
  end
end