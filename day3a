defmodule AOC2021Day3A do
  def go() do
    case File.read("day3inputa.txt") do
      {:ok, contents} ->
        contents
        |> String.split("\n")
        |> Enum.map(fn i ->
          String.graphemes(i)
          |> Enum.map(&String.to_integer/1)
        end)
        |> reduce
        |> calc_total
        |> calc_final_answer
    end
  end

  def reduce(items) do
    {
      Enum.reduce(items, make_empty_list(hd(items), []), fn line, acc ->
        process_line(line, acc, 0, acc)
      end),
      length(items)
    }
  end

  defp make_empty_list([], empty_list), do: empty_list
  defp make_empty_list([_head | tail], empty_list) do
    make_empty_list(tail, [0] ++ empty_list)
  end

  defp process_line([], acc, _, _), do: acc
  defp process_line([head | tail], acc, count, iter) do
    process_line(tail, List.update_at(acc, count, fn _ -> head + hd(iter) end), count + 1, tl(iter))
  end

  defp calc_total({results, row_count}), do: calc_col(results, [], [], row_count)

  defp calc_col([], cols, icols, _), do: {Enum.reverse(cols), Enum.reverse(icols)}
  defp calc_col([head | tail], cols, icols, row_count) do
    if row_count - head <= 6 do
      calc_col(tail, [1] ++ cols, [0] ++ icols, row_count)
    else
      calc_col(tail, [0] ++ cols, [1] ++ icols, row_count)
    end
  end

  defp calc_final_answer({gamma, epsilon}) do
    IO.puts(inspect(Integer.parse(List.to_string(gamma)), 2))
  end
end

AOC2021Day3A.go()
