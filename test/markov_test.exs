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

  test "generate" do
    :rand.seed(:exsplus, {3, 4, 5})
    assert Markov.generate("I like cake. I like pie.", 10) ==
      "I like cake. I like cake. I like pie."
  end
end
