defmodule Console do
  import DataSearcher.Validator
  alias DataSearcher.Repo

  @main_menu_msg """
  Main menu
   1) Search Users
   2) Search Tickets
   3) Search Organizations
   4) List Available Fields
   Enter a selection by number, or "quit" to quit:
  """
  @term_search_msg " field to search (press enter to list available fields): "
  @menu_map %{"1" => "User", "2" => "Ticket", "3" => "Organization", "4" => "ListValidFields"}

  def run do
    get_menu_selection()
    |> receive_menu()
    |> get_term_input()
    |> receive_term()
    |> get_value_input()
    |> Repo.search()
  end

  defp get_menu_selection() do
    @main_menu_msg |> get_input_with()
  end

  defp get_term_input(menu) do
    term =
      menu
      |> Kernel.<>(@term_search_msg)
      |> get_input_with()

    {menu, term}
  end

  defp get_value_input({menu, term}) do
    value = "Enter search value: " |> get_input_with()

    {menu, term, value}
  end

  def receive_menu("4") do
    put_str("list available fields")
    get_menu_selection()
  end

  def receive_menu(menu_index) when valid_menu?(menu_index), do: Map.get(@menu_map, menu_index)

  def receive_menu(_) do
    put_str("wrong selection, please select again")
    get_menu_selection() |> receive_menu()
  end

  def receive_term({menu, term}) when valid_term?(menu, term), do: {menu, term}

  def receive_term({menu, _term}) do
    put_str("wrong selection, please select again")
    get_term_input(menu) |> receive_term()
  end

  defp get_input_with(message) do
    message
    |> IO.gets()
    |> String.trim()
  end

  defp put_str(str) do
    IO.puts(str)
  end
end
