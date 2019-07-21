defmodule DataSearcher.Printer do
  @moduledoc """
  view layer, provide format functions and then print
  """
  alias DataSearcher.{Utils}
  alias DataSearcher.Repo.{User, Organization, Ticket}

  def print_available_fields(fields_map) do
    ("Search User With: \n" <>
       (fields_map.user |> format()) <>
       Utils.split_line() <>
       "\nSearch Ticket With: \n" <>
       (fields_map.ticket |> format()) <>
       Utils.split_line() <>
       "\nSearch Organization with: \n" <>
       (fields_map.organization |> format()) <> Utils.split_line())
    |> Utils.print()
  end

  def print({_, []}), do: Utils.print("No result was found, Please search again\n")
  def print({:user, users}), do: print_users(users)
  def print({:ticket, tickets}), do: print_tickets(tickets)
  def print({:organization, organizations}), do: print_organizations(organizations)

  def print_users(users) do
    users
    |> Enum.map(&format_user(&1))
    |> Enum.join()
    |> Utils.print()
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
    "Submitted Tickets: \n" <>
      (user["submitted_tickets"] |> Enum.map_join("\n", &Utils.indent_str(&1["subject"], 4)))
  end

  defp assigned_tickets_printable_format(user) do
    "Assigned Tickets: \n" <>
      (user["assigned_tickets"] |> Enum.map_join("\n", &Utils.indent_str(&1["subject"], 4)))
  end

  defp user_self_printable_format(user) do
    user
    |> Map.drop(Map.keys(user) -- User.fields())
    |> Enum.map_join("\n", fn {field, value} -> format_self_properties(field, value) end)
  end

  def print_organizations(organizations) do
    organizations
    |> Enum.map(&format_organization(&1))
    |> Enum.join()
    |> Utils.print()
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
    "Users: \n" <>
      (organization["users"] |> Enum.map_join("\n", &Utils.indent_str(&1["name"], 4)))
  end

  defp tickets_printable_format(organization) do
    "Tickets: \n" <>
      (organization["tickets"] |> Enum.map_join("\n", &Utils.indent_str(&1["subject"], 4)))
  end

  defp organization_self_printable_format(organization) do
    organization
    |> Map.drop(Map.keys(organization) -- Organization.fields())
    |> Enum.map_join("\n", fn {field, value} -> format_self_properties(field, value) end)
  end

  def print_tickets(tickets) do
    tickets
    |> Enum.map(&format_ticket(&1))
    |> Enum.join()
    |> Utils.print()
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
