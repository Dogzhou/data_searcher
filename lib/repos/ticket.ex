defmodule DataSearcher.Repo.Ticket do
  alias DataSearcher.Repo.{Organization, User}
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
    |> Map.get(to_string(value))
  end

  def find_by(term, value) when term in @array_type_fields, do: all() |> Enum.filter(& value in &1[term])
  def find_by(term, value) when term in @timestamp_type_fields, do: all() |> Enum.filter(& Utils.get_date(&1[term]) == value)
  def find_by(term, value), do: all() |> Enum.filter(& to_string(&1) == value)

  def resolve_associated_resources([]), do: []
  def resolve_associated_resources(nil), do: []

  def resolve_associated_resources(tickets) do
    tickets
    |> resolve_submitter()
    |> resolve_assignee()
    |> resolve_organization()
  end

  defp resolve_submitter(tickets) do
    tickets
    |> Enum.map(fn ticket ->
      submitter = User.find_by("_id", ticket["submitter_id"])
      Map.put(ticket, "submitter", submitter)
    end)
  end

  defp resolve_assignee(tickets) do
    tickets
    |> Enum.map(fn ticket ->
      assignee = User.find_by("_id", ticket["assignee_id"])
      Map.put(ticket, "assignee", assignee)
    end)
  end

  defp resolve_organization(tickets) do
    tickets
    |> Enum.map(fn ticket ->
      organization = Organization.find_by("_id", ticket["organization_id"])
      Map.put(ticket, "organization", organization)
    end)
  end

  defp get_indexed_data(term) do
    term
    |> Kernel.<>("_ticket")
    |> String.to_atom()
    |> Agent.get(& &1)
  end
end
