defmodule DataSearcher.Utils do
  def get_input_with(message) do
    message
    |> IO.gets()
    |> String.trim()
  end

  def print(str) do
    IO.puts(str)
  end
end
