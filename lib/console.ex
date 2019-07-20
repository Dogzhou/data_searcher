defmodule Console do
  alias DataSearcher.{Repo, Utils}
  alias DataSearcher.Validator

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
    |> IO.inspect()

    run() # Make run function repeats
  end

  defp get_menu_selection() do
    @main_menu_msg |> Utils.get_input_with()
  end

  defp get_term_input(menu) do
    term =
      menu
      |> Atom.to_string()
      |> Kernel.<>(@term_search_msg)
      |> Utils.get_input_with()

    {menu, term}
  end

  defp get_value_input({menu, term}) do
    value = "Enter search value: " |> Utils.get_input_with()

    {menu, term, value}
  end

  defp process_menu("4") do
    Repo.list_available_fields()

    redo_process_menu()
  end

  defp process_menu("quit"), do: System.halt()
  defp process_menu(menu_index) when menu_index in ~w(1 2 3 4),
    do: Map.get(@menu_map, menu_index) |> String.to_atom()

  defp process_menu(_) do
    Utils.print("Invalid selection, please input again")

    redo_process_menu()
  end

  defp process_term("quit"), do: System.halt()

  defp process_term({menu, term}) do
    case Validator.valid_term?(menu, term) do
      true -> {menu, term}
      false -> redo_process_term({menu, term})
    end
  end

  defp redo_process_menu do
    get_menu_selection() |> process_menu()
  end

  defp redo_process_term({menu, _term}) do
    Utils.print("the term you input does not exist for " <> (menu |> Atom.to_string()))

    get_term_input(menu) |> process_term()
  end
end
