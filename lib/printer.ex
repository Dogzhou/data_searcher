defmodule DataSearcher.Printer do
  alias DataSearcher.{Utils, Repo}
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
    ] |> Enum.join("\n")
  end

  defp organization_printable_format(user) do
    "Organization: " <> (user["organization"] |> hd() |> Map.get("name"))
  end

  defp submitted_tickets_printable_format(user) do
    "Submitted Tickets: \n" <> (user["submitted_tickets"] |> Enum.map_join("\n", & &1["subject"] |> Utils.indent_str(4)))
  end

  defp assigned_tickets_printable_format(user) do
    "Assigned Tickets: \n" <> (user["assigned_tickets"] |> Enum.map_join("\n", & &1["subject"] |> Utils.indent_str(4)))
  end

  defp user_self_printable_format(user) do
    user
    |> Map.drop(Map.keys(user) -- User.fields())
    |> Enum.map_join("\n", fn {field, value} ->
      case field do
        "tags" -> String.pad_leading(field <> ": ", 30) <> Utils.wrap_str(value |> Enum.join(", "), "[]")
        _ -> String.pad_leading(field <> ": ", 30) <> to_string(value)
      end
    end)
  end

  defp format(fields) do
    fields
    |> Enum.map(&(Utils.indent_str(&1) <> "\n"))
    |> Enum.join()
  end
end
