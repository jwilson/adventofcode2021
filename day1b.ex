defmodule AOC2021Day1B do
  def go() do
    case File.read("day1inputb.txt") do
      {:ok, contents} ->
        contents
        |> String.split("\n")
        |> Enum.map(&String.to_integer/1)
        |> Enum.chunk_every(3, 1, :discard) ## added this for part 2
        |> Enum.reduce({0, 0}, fn i, a ->
            new_count = Enum.sum(i) ## added this for part 2
            case a do
              {0, 0} ->
                {new_count, 0}
              {prev, count} ->
                if new_count > prev do
                  {new_count, count + 1}
                else
                  {new_count, count}
                end
            end
          end)
    end
  end
end

AOC2021Day1B.go()
