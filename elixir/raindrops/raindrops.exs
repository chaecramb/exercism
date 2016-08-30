defmodule Raindrops do
  @sounds [
      Pling: 3,
      Plang: 5,
      Plong: 7
    ]

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    number
    |> to_sounds
    |> output(number)
  end

  defp to_sounds(number) do
    for {sound, value} <- @sounds, factor?(number, value), do: Atom.to_string(sound)
  end

  defp output(sounds, number) do
    case sounds do
      [] -> Integer.to_string(number)
      _ -> Enum.join(sounds)
    end
  end

  defp factor?(number, value) do
    rem(number, value) == 0
  end



end
