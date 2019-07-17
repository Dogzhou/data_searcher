defmodule DataSearcher.Repo.Orgnization do
  @fields ~w(_id url external_id name domain_names created_at details shared_tickets tags)

  def fields, do: @fields
end
