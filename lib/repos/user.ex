defmodule DataSearcher.Repo.User do
  @indexed_fields ~w(_id name organization_id)
  @fields ~w(_id url external_id name alias created_at active verified shared locale timezone last_login_at
  email phone signature organization_id tags suspended role)

  def fields, do: @fields

  def find_by(term, value) when term in @indexed_fields do
    term
    |> Kernel.<>("_user")
    |> IO.inspect()
    |> String.to_atom()
    |> Agent.get(& &1)
    |> Map.get(value)
    |> IO.inspect()
  end

  def find_by(term, value) do
    IO.puts("no index search")
  end

  defp all do
    Agent.get(:users, & &1)
  end

  def index_on do
    @indexed_fields
    |> Enum.each(fn index_field ->
      indexed_result = all() |> Enum.into(%{}, fn user -> {user[index_field], user} end)
      index_name = String.to_atom(index_field <> "_user")
      Agent.start_link(fn -> indexed_result end, name: index_name)
    end)
  end
end
