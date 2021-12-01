defmodule AOC2021Day1A do
  def go() do
    case File.read("day1inputa.txt") do
      {:ok, contents} ->
        contents
        |> String.split("\n")
        |> Enum.map(&String.to_integer/1)
        |> Enum.reduce({0, 0}, fn i, a ->
            case a do
              {0, 0} ->
                {i, 0}
              {prev, count} ->
                if i > prev do
                  {i, count + 1}
                else
                  {i, count}
                end
            end
          end)
    end
  end
end

AOC2021Day1A.go()
