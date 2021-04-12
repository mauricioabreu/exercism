defmodule IsbnVerifier do
  @doc """
    Checks if a string is a valid ISBN-10 identifier

    ## Examples

      iex> IsbnVerifier.isbn?("3-598-21507-X")
      true

      iex> IsbnVerifier.isbn?("3-598-2K507-0")
      false

  """
  @spec isbn?(String.t()) :: boolean
  def isbn?(isbn) do
    is_valid(isbn)
  end

  defp is_valid(isbn) do
    digits = filter_digits(isbn)
    validate_digits(digits)
    |> calc(digits)
  end

  defp filter_digits(isbn) do
    remove_dashes(String.split(isbn, "", trim: true))
  end

  defp remove_dashes(digits) do
    Enum.filter(digits, fn d -> d != "-" end)
  end

  def filter_numbers(digits) do
    Enum.filter(Enum.take(digits, 9), fn d -> is_number?(d) end)
  end

  defp is_digit?("X") do
    true
  end

  defp is_digit?(digit) do
    is_number?(digit)
  end

  def is_number?(digit) do
    case Integer.parse(digit) do
      {_integer, _remaindar} ->
        true
      :error ->
        false
    end
  end

  defp validate_digits(digits) do
    Enum.all?(
      [
        validate_len(digits),
        validate_check_char(List.last(digits)),
        length(filter_numbers(digits)) == 9,
      ]
    )
  end

  defp validate_len(digits) do
    length(digits) == 10
  end

  defp validate_check_char(digit) do
    is_digit?(digit)
  end

  defp calc(true, digits) do
    replace_check_char(digits)
    |> calc()
  end

  defp calc(false, _digits) do
    false
  end

  def calc(digits) do
    Enum.zip(Enum.map(digits, &String.to_integer/1), Enum.to_list(10..1))
    |> Enum.reduce(0, fn {x, y}, acc -> x * y + acc end)
    |> rem(11) == 0
  end

  def replace_check_char(digits) do
    Enum.take(digits, 9) ++ [replace_check_char(digits, List.last(digits))]
  end

  def replace_check_char(_digits, "X") do
    "10"
  end

  def replace_check_char(_digits, digit) do
    digit
  end
end
