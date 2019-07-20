defmodule DataSearcher.Repo.User do
  alias DataSearcher.{Utils, Repo}
  alias DataSearcher.Repo.{Organization, Ticket}

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
    |> Map.get(to_string(value))
  end

  def find_by(term, value) when term in @array_type_fields, do: all() |> Enum.filter(& value in &1[term])
  def find_by(term, value) when term in @timestamp_type_fields, do: all() |> Enum.filter(& Utils.get_date(&1[term]) == value)
  def find_by(term, value), do: all() |> Enum.filter(& to_string(&1) == value)

  def resolve_associated_resources([]), do: []
  def resolve_associated_resources(nil), do: []

  def resolve_associated_resources(users) do
    users
    |> resolve_organization()
    |> resolve_submitted_tickets()
    |> resolve_assigned_tickets()
  end

  defp resolve_organization(users) do
    users
    |> Enum.map(fn user ->
      organization = Organization.find_by("_id", user["organization_id"])
      Map.put(user, "organization", organization)
    end)
  end

  defp resolve_submitted_tickets(users) do
    users
    |> Enum.map(fn user ->
      submitted_tickets = Ticket.find_by("submitter_id", user["_id"])
      Map.put(user, "submitted_tickets", submitted_tickets)
    end)
  end

  defp resolve_assigned_tickets(users) do
    users
    |> Enum.map(fn user ->
      assigned_tickets = Ticket.find_by("assignee_id", user["_id"])
      Map.put(user, "assigned_tickets", assigned_tickets)
    end)
  end

  defp get_indexed_data(term) do
    term
    |> Kernel.<>("_user")
    |> String.to_atom()
    |> Agent.get(& &1)
  end
end
