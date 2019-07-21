defmodule Console do
  @moduledoc """
  Program main function
  """
  alias DataSearcher.{Repo, Utils, Formatter}

  @main_menu_msg """
  Hi, what you want to do
   1) Search Users
   2) Search Tickets
   3) Search Organizations
   4) List All Available Fields
   Enter a selection by number, or "quit" to quit:
  """
  @term_search_msg " field to search: "
  @menu_map %{"1" => "user", "2" => "ticket", "3" => "organization", "4" => "listValidFields"}

  def run do
    get_menu_selection()
    |> process_menu_selection()
    |> get_term_input()
    |> process_term()
    |> get_value_input()
    |> Repo.search()
    |> Formatter.to_printable_format()
    |> Utils.print()

    # Make run function repeats
    run()
  end

  defp get_menu_selection() do
    @main_menu_msg |> Utils.get_input_with()
  end

  defp get_term_input(menu) do
    term =
      menu
      |> to_string()
      |> Kernel.<>(@term_search_msg)
      |> Utils.get_input_with()

    {menu, term}
  end

  defp get_value_input({menu, term}) do
    value = "Enter search value: " |> Utils.get_input_with()

    {menu, term, value}
  end

  defp process_menu_selection("4") do
    Repo.get_available_fields()
    |> Formatter.available_fields_printable_format()
    |> Utils.print()

    redo_process_menu()
  end

  defp process_menu_selection("quit"), do: System.halt()
  defp process_menu_selection(menu_index) when menu_index in ~w(1 2 3 4),
    do: @menu_map |> Map.get(menu_index) |> String.to_atom()

  defp process_menu_selection(_) do
    Utils.print("Invalid selection, please input again")

    redo_process_menu()
  end

  defp process_term("quit"), do: System.halt()

  defp process_term({menu, term}) do
    case Repo.valid_term?(menu, term) do
      true -> {menu, term}
      false -> redo_process_term({menu, term})
    end
  end

  defp redo_process_menu do
    get_menu_selection() |> process_menu_selection()
  end

  defp redo_process_term({menu, _term}) do
    Utils.print("the term you input does not exist for " <> to_string(menu))

    menu |> get_term_input() |> process_term()
  end
end
