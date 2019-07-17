defmodule DataSearcher.Repo do
  alias DataSearcher.{Repo, Utils}
  alias DataSearcher.Repo.{Organization, Ticket, User}

  def list_available_fields do
    "Search User With: \n" <> (User.fields |> format()) <> Utils.split_line() <>
      "\nSearch Ticket With: \n" <> (Ticket.fields |> format()) <> Utils.split_line() <>
        "\nSearch Organization with: \n" <> (Organization.fields |> format()) <> Utils.split_line()
        |> Utils.print()
  end

  defp format(fields) do
    fields
    |> Enum.map(& Utils.indent_str(&1) <> "\n")
    |> Enum.join()
  end

  def search("User", term, value), do: User.find_by(term: value)
  def search("Ticket", term, value), do: Ticket.find_by(term: value)
  def search("Organization", term, value), do: Organization.find_by(term: value)
end
