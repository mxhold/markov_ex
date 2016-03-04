defmodule Markov do
  def parse(string) do
    parts = string |> String.split
    [nil, nil] ++ parts ++ [nil, nil]
    |> Enum.chunk(3, 1)
    |> Enum.reduce(%{}, fn [a, b, suffix], acc ->
      prefix = {a, b}
      Map.update(acc, prefix, [suffix], fn current ->
        [suffix | current]
      end)
    end)
  end

  def generate(string, count), do: generate(parse(string), "", nil, nil, count)

  def generate(_, result, _, _, 0), do: result

  def generate(table, result, w1, w2, count) do
    next = Enum.random(table[{w1, w2}])

    if is_nil(next) do
      result
    else
      generate(table, result <> " " <> next, w2, next, count - 1)
    end
  end
end
