defmodule AOC2021Day2A do
  def go() do
    case File.read("day2inputb.txt") do
      {:ok, contents} ->
        results =
          contents
          |> String.split("\n")
          |> Enum.map(&(String.split(&1, " ")))
          |> Enum.map(fn [d, u] -> [d, String.to_integer(u)] end)
          |> Enum.reduce({0, 0, 0}, fn i, {h, v, a} ->
            case i do
              ["forward", f] -> {h + f, v + (f * a), a}
              ["up", u] -> {h, v, a - u}
              ["down", d] -> {h, v, a + d}
            end
          end)
        Tuple.product({elem(results, 0), elem(results, 1)})
    end
  end
end

AOC2021Day2A.go()
