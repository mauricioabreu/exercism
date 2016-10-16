defmodule Bob do
  def hey(input) do
    cond do
      String.strip(input) == "" -> "Fine. Be that way!"
      String.ends_with?(input, "?") -> "Sure."
      input == String.upcase(input) && Regex.match?(~r/\p{L}+/, input)-> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
