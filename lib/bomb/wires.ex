defmodule Bomb.Wires do
  def instruct(wires_input) do
    wires_input
    |> parse()
    |> display
  end

  def parse(wires_input) do
    wire_list =
      wires_input
      |> String.trim()
      |> String.split(" ")

    count = Enum.count(wire_list)

    valid = Enum.all?(wire_list, fn wire -> wire in valid_wires() end)

    %{count: count, valid: valid, wire_list: wire_list}
  end

  def display(%{valid: true, count: 3, wire_list: wire_list}) do
    cond do
      count_color(wire_list, "red") == 0 ->
        "Cut the 2nd wire"

      List.last(wire_list) == "white" ->
        "Cut the last wire"

      count_color(wire_list, "blue") > 1 ->
        "Cut the last blue wire"

      true ->
        "Cut the last wire"
    end
  end

  def display(%{valid: true, count: 4}) do
    "there are four wires"
  end

  def display(%{valid: true, count: 5}) do
    "there are five wires"
  end

  def display(%{valid: true, count: count}) when count < 3 do
    "I need more wires"
  end

  def display(%{wire_list: [""]}) do
    "I'm ready"
  end

  def display(%{valid: false, wire_list: wire_list}) do
    invalid_wires = Enum.reject(wire_list, fn wire -> wire in valid_wires() end) |> Enum.join(" ")

    "I don't understand #{invalid_wires}"
  end

  def count_color(wire_list, color) do
    Enum.count(wire_list, fn wire -> wire == color end)
  end

  defp valid_wires do
    ["black", "blue", "red", "white", "yellow"]
  end
end
