defmodule DataSearcher.Repo.Ticket do
  @fields ~w(_id url external_id created_at type subject description priority status submitter_id assignee_id organization_id tags has_incidents due_at via)

  def fields, do: @fields
end
