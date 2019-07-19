defmodule DataSearcher.Repo.User do
  alias DataSearcher.Utils
  DataSearcher.Repo

  @indexed_fields ~w(_id name organization_id external_id)
  @boolean_type_fields ~w(active shared verified suspended)
  @array_type_fields ~w(tags)
  @timestamp_type_fields ~w(created_at last_login_at)
  @string_type_fields ~w(url alias locale timezone email phone signature role)

  def fields, do: @indexed_fields ++ @boolean_type_fields ++ @array_type_fields ++ @timestamp_type_fields ++ @string_type_fields

  def all, do: Agent.get(:users, & &1)

  def find_by(term, value) when term in @indexed_fields do
    term
    |> get_indexed_data()
    |> Map.get(value)
    |> resolve_organization()
    |> IO.inspect()
  end

  def find_by(term, value) when term in @array_type_fields do
    all()
    |> Enum.filter(& value in &1[term])
    |> resolve_organization()
    |> IO.inspect()
  end

  def find_by(term, value) when term in @timestamp_type_fields do
    all()
    |> Enum.filter(& Utils.get_date(&1[term]) == value)
    |> resolve_organization()
    |> IO.inspect()
  end

  def find_by(term, value) do
    all()
    |> Enum.filter(& to_string(&1) == value)
    |> resolve_organization()
    |> IO.inspect()
  end

  defp resolve_organization(users) do
    users
    |> Enum.map(fn user ->
      Map.update(user, "organization", %{}, &Organization.find_by("_id", &1["organization_id"]))
    end)
  end

  defp get_indexed_data(term) do
    term
    |> Kernel.<>("_user")
    |> String.to_atom()
    |> Agent.get(& &1)
  end
end
