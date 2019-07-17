defmodule DataSearcher.Repo.User do
  @fields ~w(_id url external_id name alias created_at active verified shared locale timezone last_login_at
  email phone signature organization_id tags suspended role)

  def fields, do: @fields
end
