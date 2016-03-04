defmodule Markov.CLITest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  @input_filename "./test/fixtures/alice.txt"

  test "generates text based on input file and maximum number of words to generate" do
    :rand.seed(:exsplus, {1, 2, 3})
    output = capture_io(fn ->
      Markov.CLI.main([@input_filename, "10"])
    end)

    assert output == "Alice was not quite sure whether it was impossible to\n"
  end
end
