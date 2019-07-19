defmodule DataSearcher.Repo.Organization do
  @indexed_fields ~w(_id external_id name)
  @boolean_type_fields ~w(shared_tickets)
  @array_type_fields ~w(domain_names tags)
  @timestamp_type_fields ~w(created_at )
  @string_type_fields ~w(url details)

  def fields, do: @indexed_fields ++ @boolean_type_fields ++ @array_type_fields ++ @timestamp_type_fields ++ @string_type_fields

  def all, do: Agent.get(:organizations, & &1)

  def find_by(term, value) when term in @indexed_fields do
    term
    |> get_indexed_data()
    |> Map.get(to_string(value))
    |> IO.inspect()
  end

  def find_by(term, value) when term in @array_type_fields do
    all()
    |> Enum.filter(& value in &1[term])
    |> IO.inspect()
  end

  def find_by(term, value) when term in @timestamp_type_fields do
    all()
    |> Enum.filter(& Utils.get_date(&1[term]) == value)
    |> IO.inspect()
  end

  def find_by(term, value) do
    all()
    |> Enum.filter(& to_string(&1) == value)
    |> IO.inspect()
  end

  defp get_indexed_data(term) do
    term
    |> Kernel.<>("_organization")
    |> String.to_atom()
    |> Agent.get(& &1)
  end
end
