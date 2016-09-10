defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(""), do: ""
  def encode(string) do
    string 
    |> String.to_charlist
    |> Enum.reverse 
    |> do_encode 
    |> String.Chars.to_string
  end

  @spec dencode(String.t) :: String.t
  def encode(""), do: ""
  def encode(string) do
    string 
    |> String.to_charlist
    |> Enum.reverse 
    |> do_dencode 
    |> String.Chars.to_string
  end
  
  defp do_encode(charlist), do: count_runs(hd(charlist), tl(charlist), 1, '')

  defp count_runs(current_char, '', count, code), do: [[Integer.to_charlist(count) | [current_char | code]]]
  defp count_runs(current_char, remaining, count, code) do
    cond do
      current_char == hd(remaining) -> count_runs(current_char, tl(remaining), count + 1, code)
      current_char != hd(remaining) -> count_runs(hd(remaining), tl(remaining), 1, [[Integer.to_charlist(count) | [current_char | code]]])
    end
  end

  defp do_dencode(charlist), do: convert_runs(hd(charlist), tl(charlist), 1, '')

  defp convert_runs(current_char, '', count, code), do: [[Integer.to_charlist(count) | [current_char | code]]]
  defp convert_runs(current_char, remaining, count, code) do
    cond do
      current_char == hd(remaining) -> convert_runs(current_char, tl(remaining), count + 1, code)
      current_char != hd(remaining) -> convert_runs(hd(remaining), tl(remaining), 1, [[Integer.to_charlist(count) | [current_char | code]]])
    end
  end
end
