defmodule DataSearcher.Repo.Ticket do
  @indexed_fields ~w(_id submitter_id assignee_id organization_id type external_id)
  @boolean_type_fields ~w(has_incidents)
  @array_type_fields ~w(tags)
  @timestamp_type_fields ~w(due_at)
  @string_type_fields ~w(url subject description priority status via)

  def fields, do: @indexed_fields ++ @boolean_type_fields ++ @array_type_fields ++ @timestamp_type_fields ++ @string_type_fields

  def all, do: Agent.get(:tickets, & &1)

  def find_by(term, value) when term in @indexed_fields do
    term
    |> get_indexed_data()
    |> Map.get(value)
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
