defmodule MarkovTest do
  use ExUnit.Case
  doctest Markov

  test "parse" do
    assert Markov.parse("I like cake. I like pie.") ==
      %{
        {nil, nil} => ["I"],
        {nil, "I"} => ["like"],
        {"I", "like"} => ["pie.", "cake."],
        {"cake.", "I"} => ["like"],
        {"like", "cake."} => ["I"],
        {"like", "pie."} => [nil],
        {"pie.", nil} => [nil],
      }
  end

  #test "generate" do
  #  assert Markov.generate("I like cake. I like pie.", "I", 2) ==
  #    "I like"
  #end
end
