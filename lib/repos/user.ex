defmodule DataSearcher.Repo.User do
  @indexed_fields ~w(_id name organization_id)
  @fields ~w(_id url external_id name alias created_at active verified shared locale timezone last_login_at
  email phone signature organization_id tags suspended role)

  def fields, do: @fields

  def find_by(term: value) when term in @indexed_fields do
    
  end
end
