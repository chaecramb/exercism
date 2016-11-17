require IEx

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

  @spec decode(String.t) :: String.t
  def decode(""), do: ""
  def decode(string) do
    string
    |> string_to_runs 
    |> do_decode 
    |> Enum.join
  end

  defp do_encode(charlist), do: count_runs(hd(charlist), tl(charlist), 1, '')

  defp count_runs(current_char, '', count, code), do: [[Integer.to_charlist(count) | [current_char | code]]]
  defp count_runs(current_char, remaining, count, code) do
    cond do
      current_char == hd(remaining) -> count_runs(current_char, tl(remaining), count + 1, code)
      current_char != hd(remaining) -> count_runs(hd(remaining), tl(remaining), 1, [[Integer.to_charlist(count) | [current_char | code]]])
    end
  end

  defp do_decode(run_list) do
    Enum.map(run_list, fn(run) -> run |> parse_run |> decode_run end)
  end

  defp parse_run(run) do
    Regex.split(~r{\d+}, run, include_captures: true, trim: true)
  end

  defp decode_run(run) do
    String.duplicate(List.last(run), String.to_integer(List.first(run)))
  end

  defp string_to_runs(encoded_string) do
    Regex.split(~r{(\d+)(.)}, encoded_string, include_captures: true, trim: true)
  end
end
