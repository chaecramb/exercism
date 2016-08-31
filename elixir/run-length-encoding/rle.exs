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
    |> do_encode 
    |> runs_to_string 
    |> List.flatten 
    |> String.Chars.to_string
  end
  
  defp do_encode(charlist), do: count_runs(hd(charlist), tl(charlist), 1, [])

  defp count_runs(current_char, '', count, runs), do: runs ++ [{current_char, count}]
  defp count_runs(current_char, remaining, count, runs) do
    cond do
      current_char == hd(remaining) -> count_runs(current_char, tl(remaining), count + 1, runs)
      current_char != hd(remaining) -> count_runs(hd(remaining), tl(remaining), 1, runs ++ [{current_char, count}])
    end
  end

  defp runs_to_string(runs) do
    runs |> Enum.map(fn 
      {char, count} -> Integer.to_charlist(count) ++ [char]
    end)
  end
end
