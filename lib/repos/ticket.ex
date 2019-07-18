defmodule DataSearcher.Repo.Ticket do
  @indexed_fields ~w(_id submitter_id assignee_id organization_id)
  @fields ~w(_id url external_id created_at type subject description priority status submitter_id assignee_id organization_id tags has_incidents due_at via)

  def fields, do: @fields
  def indexed_fields, do: @indexed_fields

  # def create_index do
  #   @indexed_fields
  #   |> Enum.each(fn index_field ->
  #     indexed_data = all() |> Enum.reduce(%{}, fn user, acc -> Map.update(acc, "#{user[index_field]}", [user], & &1 ++ [user]) end)
  #       index_name = String.to_atom(index_field <> "_user")
  #     Agent.start_link(fn -> indexed_data end, name: index_name)
  #   end)
  # end
end
