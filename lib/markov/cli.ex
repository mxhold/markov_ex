defmodule Markov.CLI do
  def main([filename, max_word_count]) do
    {:ok, input} = File.read(filename)
    {max_word_count, _} = Integer.parse(max_word_count)
    IO.puts Markov.generate(input, max_word_count)
  end
end
