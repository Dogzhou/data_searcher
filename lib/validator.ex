defmodule DataSearcher.Validator do
  alias DataSearcher.Repo.{User, Ticket, Organization}

  def valid_term?("User", term), do: term in User.fields()
  def valid_term?("Ticket", term), do: term in Ticket.fields()
  def valid_term?("Organization", term), do: term in Organization.fields()
end
