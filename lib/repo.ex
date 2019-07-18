defmodule DataSearcher.Repo do
  @index_fields_map %{
    "user" => ~w(_id name organization_id),
    "ticket" => ~w(_id submitter_id assignee_id organization_id),
    "organization" => ~w(_id external_id)
  }
  alias DataSearcher.{Repo, Utils}
  alias DataSearcher.Repo.{Organization, Ticket, User}

  def list_available_fields do
    ("Search User With: \n" <>
       (User.fields() |> format()) <>
       Utils.split_line() <>
       "\nSearch Ticket With: \n" <>
       (Ticket.fields() |> format()) <>
       Utils.split_line() <>
       "\nSearch Organization with: \n" <>
       (Organization.fields() |> format()) <> Utils.split_line())
    |> Utils.print()
  end

  defp format(fields) do
    fields
    |> Enum.map(&(Utils.indent_str(&1) <> "\n"))
    |> Enum.join()
  end

  def search({:User, term, value}), do: User.find_by(term, value)
  def search({:Ticket, term, value}), do: Ticket.find_by(term, value)
  def search({:Organization, term, value}), do: Organization.find_by(term, value)

  @doc """
  Create index for IDs(@indexed_fields) by build up a map, key is index field, value is an array of object
  eg. create name index for [
    %{"id" => 1, "name" => "Ed"},
    %{"id" => 2, "name" => "Alex"},
    %{"id" => 3, "name" => "Alex"}
  ] => %{
    "Alex" => [%{"id" => 2, "name" => "Alex"}, %{"id" => 3, "name" => "Alex"}],
    "Ed" => [%{"id" => 1, "name" => "Ed"}]
  }
  why we are doing this, performance
  """
  def create_index do
    @index_fields_map
    |> Enum.each(fn {entity_name, indexed_fields} ->
      Enum.each(indexed_fields, fn indexed_field ->
        indexed_data = entity_name
                       |> all()
                       |> Enum.reduce(%{}, fn entity, acc -> Map.update(acc, "#{entity[indexed_field]}", [entity], & &1 ++ [entity]) end)
        index_name = String.to_atom(indexed_field <> "_" <> entity_name)

        Agent.start_link(fn -> indexed_data end, name: index_name)
      end)
    end)
  end

  def all("user"), do: Agent.get(:users, & &1)
  def all("ticket"), do: Agent.get(:tickets, & &1)
  def all("organization"), do: Agent.get(:organizations, & &1)
end
