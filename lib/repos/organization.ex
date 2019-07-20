defmodule DataSearcher.Repo.Organization do
  alias DataSearcher.Utils
  alias DataSearcher.Repo.{Organization, Ticket, User}

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
  end

  def find_by(term, value) when term in @array_type_fields, do: all() |> Enum.filter(& value in &1[term])
  def find_by(term, value) when term in @timestamp_type_fields, do: all() |> Enum.filter(& Utils.get_date(&1[term]) == value)
  def find_by(term, value), do: all() |> Enum.filter(& to_string(&1) == value)

  def resolve_associated_resources([]), do: []
  def resolve_associated_resources(nil), do: []

  def resolve_associated_resources(organizations) do
    organizations
    |> resolve_tickets()
    |> resolve_users()
  end

  defp resolve_users(organizations) do
    organizations
    |> Enum.map(fn org ->
      users = User.find_by("organization_id", org["_id"])
      Map.put(org, "users", users)
    end)
  end

  defp resolve_tickets(organizations) do
    organizations
    |> Enum.map(fn org ->
      tickets = Ticket.find_by("organization_id", org["_id"])
      Map.put(org, "tickets", tickets)
    end)
  end

  defp get_indexed_data(term) do
    term
    |> Kernel.<>("_organization")
    |> String.to_atom()
    |> Agent.get(& &1)
  end
end
