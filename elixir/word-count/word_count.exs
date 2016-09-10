defmodule Words do
  def to_words(sentence) do
    Regex.split(~r/[\s.,\/#!@$%\^&\*;:{}=\_`~()]+/, sentence, trim: true)
  end

  def count_words(words) do
    words
    |> Enum.reduce(%{}, &update_counts/2)
  end

  defp update_counts(word, word_counts) do
    Map.update(word_counts, word, 1, &(&1 + 1))
  end

  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> String.downcase 
    |> to_words 
    |> count_words
  end
end
