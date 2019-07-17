defmodule Console do
  import DataSearcher.Validator
  alias DataSearcher.{Repo, Utils}

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
    |> process_menu()
    |> get_term_input()
    |> process_term()
    |> get_value_input()
    |> Repo.search()
  end

  defp get_menu_selection() do
    @main_menu_msg |> Utils.get_input_with()
  end

  defp get_term_input(menu) do
    term =
      menu
      |> Kernel.<>(@term_search_msg)
      |> Utils.get_input_with()

    {menu, term}
  end

  defp get_value_input({menu, term}) do
    value = "Enter search value: " |> Utils.get_input_with()

    {menu, term, value}
  end

  def process_menu("4") do
    Utils.print("list available fields")

    get_menu_selection() |> process_menu()
  end

  def process_menu("quit"), do: System.halt()
  def process_menu(menu_index) when valid_menu?(menu_index), do: Map.get(@menu_map, menu_index)

  def process_menu(_) do
    Utils.print("wrong selection, please select again")

    get_menu_selection() |> process_menu()
  end

  def process_term("quit"), do: System.halt()
  def process_term({menu, term}) when valid_term?(menu, term), do: {menu, term}

  def process_term({menu, _term}) do
    Utils.print("wrong selection, please select again")
    get_term_input(menu) |> process_term()
  end
end
