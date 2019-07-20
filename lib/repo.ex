defmodule DataSearcher.Repo do
  alias DataSearcher.Repo.{Organization, Ticket, User}

  def get_available_fields do
    %{user: User.fields(), organization: Organization.fields, ticket: Ticket.fields()}
  end

  def search({:User, term, value}), do: User.find_by(term, value) |> User.resolve_organization() |> User.resolve_submitted_tickets() |> User.resolve_assigned_tickets()
  def search({:Ticket, term, value}), do: Ticket.find_by(term, value) |> Ticket.resolve_submitter() |> Ticket.resolve_assignee() |> Ticket.resolve_organization()
  def search({:Organization, term, value}), do: Organization.find_by(term, value) |> Organization.resolve_tickets() |> Organization.resolve_users()

  def all("user"), do: Agent.get(:users, & &1)
  def all("ticket"), do: Agent.get(:tickets, & &1)
  def all("organization"), do: Agent.get(:organizations, & &1)

  def valid_term?(:User, term), do: term in User.fields()
  def valid_term?(:Ticket, term), do: term in Ticket.fields()
  def valid_term?(:Organization, term), do: term in Organization.fields()
end
