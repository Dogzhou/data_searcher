defmodule DataSearcher.Indexer do
  @index_fields_map %{
    "user" => ~w(_id name organization_id),
    "ticket" => ~w(_id submitter_id assignee_id organization_id),
    "organization" => ~w(_id external_id)
  }

  alias DataSearcher.Repo

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
                       |> Repo.all()
                       |> Enum.reduce(%{}, fn entity, acc -> Map.update(acc, "#{entity[indexed_field]}", [entity], & &1 ++ [entity]) end)
        index_name = String.to_atom(indexed_field <> "_" <> entity_name)

        Agent.start_link(fn -> indexed_data end, name: index_name)
      end)
    end)
  end
end
