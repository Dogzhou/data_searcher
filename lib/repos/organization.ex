defmodule DataSearcher.Repo.Organization do
  @indexed_fields ~w(_id external_id)
  @fields ~w(_id url external_id name domain_names created_at details shared_tickets tags)

  def fields, do: @fields
  def indexed_fields, do: @indexed_fields
end
