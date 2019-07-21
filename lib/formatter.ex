defmodule DataSearcher.Formatter do
  @moduledoc """
  view layer, provide format functions and then print
  """
  alias DataSearcher.{Utils}
  alias DataSearcher.Repo.{User, Organization, Ticket}

  def available_fields_printable_format(fields_map) do
    "Search User With: \n" <>
       (fields_map.user |> format()) <>
       Utils.split_line() <>
       "\nSearch Ticket With: \n" <>
       (fields_map.ticket |> format()) <>
       Utils.split_line() <>
       "\nSearch Organization with: \n" <>
       (fields_map.organization |> format()) <> Utils.split_line()
  end

  def to_printable_format({_, []}), do: "No result was found, Please search again\n"
  def to_printable_format({:user, users}), do: to_user_printable_format(users)
  def to_printable_format({:ticket, tickets}), do: to_ticket_printable_format(tickets)
  def to_printable_format({:organization, organizations}), do: to_organization_printable_format(organizations)

  defp to_user_printable_format(users) do
    users
    |> Enum.map(&format_user(&1))
    |> Enum.join()
  end

  defp format_user(user) do
    [
      Utils.split_line(),
      organization_printable_format(user),
      submitted_tickets_printable_format(user),
      assigned_tickets_printable_format(user),
      user_self_printable_format(user),
      Utils.split_line()
    ]
    |> Enum.join("\n")
  end

  defp organization_printable_format(map) do
    "Organization: " <> (map["organization"] |> hd() |> Map.get("name"))
  end

  defp submitted_tickets_printable_format(user) do
    "Submitted Tickets:\n" <>
      (user["submitted_tickets"] |> Enum.map_join("\n", &Utils.indent_str(&1["subject"], 4)))
  end

  defp assigned_tickets_printable_format(user) do
    "Assigned Tickets:\n" <>
      (user["assigned_tickets"] |> Enum.map_join("\n", &Utils.indent_str(&1["subject"], 4)))
  end

  defp user_self_printable_format(user) do
    user
    |> Map.drop(Map.keys(user) -- User.fields())
    |> Enum.map_join("\n", fn {field, value} -> format_self_properties(field, value) end)
  end

  defp to_organization_printable_format(organizations) do
    organizations
    |> Enum.map(&format_organization(&1))
    |> Enum.join()
  end

  defp format_organization(organization) do
    [
      Utils.split_line(),
      users_printable_format(organization),
      tickets_printable_format(organization),
      organization_self_printable_format(organization),
      Utils.split_line()
    ]
    |> Enum.join("\n")
  end

  defp users_printable_format(organization) do
    "Users:\n" <>
      (organization["users"] |> Enum.map_join("\n", &Utils.indent_str(&1["name"], 4)))
  end

  defp tickets_printable_format(organization) do
    "Tickets:\n" <>
      (organization["tickets"] |> Enum.map_join("\n", &Utils.indent_str(&1["subject"], 4)))
  end

  defp organization_self_printable_format(organization) do
    organization
    |> Map.drop(Map.keys(organization) -- Organization.fields())
    |> Enum.map_join("\n", fn {field, value} -> format_self_properties(field, value) end)
  end

  defp to_ticket_printable_format(tickets) do
    tickets
    |> Enum.map(&format_ticket(&1))
    |> Enum.join()
  end

  defp format_ticket(ticket) do
    [
      Utils.split_line(),
      organization_printable_format(ticket),
      submit_users_printable_format(ticket),
      assigned_user_printable_format(ticket),
      ticket_self_printable_format(ticket),
      Utils.split_line()
    ]
    |> Enum.join("\n")
  end

  defp submit_users_printable_format(ticket) do
    "Submitted By: " <> (ticket["submitter"] |> hd() |> Map.get("name"))
  end

  defp assigned_user_printable_format(ticket) do
    "Assigned To: " <> (ticket["assignee"] |> hd() |> Map.get("name"))
  end

  defp ticket_self_printable_format(ticket) do
    ticket
    |> Map.drop(Map.keys(ticket) -- Ticket.fields())
    |> Enum.map_join("\n", fn {field, value} -> format_self_properties(field, value) end)
  end

  defp format_self_properties(_field, []), do: "[]"

  defp format_self_properties(field, value) when is_list(value) do
    String.pad_leading(field <> ": ", 30) <> Utils.wrap_str(value |> Enum.join(", "), "[]")
  end

  defp format_self_properties(field, value),
    do: String.pad_leading(field <> ": ", 30) <> to_string(value)

  defp format(fields) do
    fields
    |> Enum.map(&(Utils.indent_str(&1) <> "\n"))
    |> Enum.join()
  end
end
