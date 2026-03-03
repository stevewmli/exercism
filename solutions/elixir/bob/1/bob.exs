defmodule Bob do
	def hey(input) do
		cond do
			Regex.replace(~r/\s/, input, "") == "" -> "Fine. Be that way!"
			String.last(input) == "?" -> "Sure."
			String.last(input) == "!" && (String.upcase(input) == input) -> "Whoa, chill out!"
			String.upcase(input) == input && !Regex.match?(~r/^[0-9,\s]+$/, input) -> "Whoa, chill out!"
			true -> "Whatever."

		end
	end
end