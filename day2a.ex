defmodule AOC2021Day2A do
  def go() do
    case File.read("day2inputb.txt") do
      {:ok, contents} ->
        contents
        |> String.split("\n")
        |> Enum.map(&(String.split(&1, " ")))
        |> Enum.map(fn [d, u] -> [d, String.to_integer(u)] end)
        |> Enum.reduce({0, 0}, fn i, {h, v} ->
          case i do
            ["forward", f] -> {h + f, v}
            ["up", u] -> {h, v - u}
            ["down", d] -> {h, v + d}
          end
        end)
        |> Tuple.product()
    end
  end
end

AOC2021Day2A.go()
