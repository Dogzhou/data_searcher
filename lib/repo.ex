defmodule DataSearcher.Repo do
  alias DataSearcher.Repo.{Organization, Ticket, User}

  def get_available_fields do
    %{user: User.fields(), organization: Organization.fields, ticket: Ticket.fields()}
  end

  def search({:User, term, value}) do
    users = term
            |> User.find_by(value)
            |> User.resolve_organization()
            |> User.resolve_submitted_tickets()
            |> User.resolve_assigned_tickets()

    {:User, users}
  end

  def search({:Ticket, term, value}) do
    tickets = term
              |> Ticket.find_by(term)
              |> Ticket.resolve_submitter()
              |> Ticket.resolve_assignee()
              |> Ticket.resolve_organization()

    {:Ticket, tickets}
  end

  def search({:Organization, term, value}) do
    organizations = term
                    |> Organization.find_by(value)
                    |> Organization.resolve_tickets()
                    |> Organization.resolve_users()

    {:Organization, organizations}
  end

  def all("user"), do: User.all()
  def all("ticket"), do: Ticket.all()
  def all("organization"), do: Organization.all()

  def valid_term?(:User, term), do: term in User.fields()
  def valid_term?(:Ticket, term), do: term in Ticket.fields()
  def valid_term?(:Organization, term), do: term in Organization.fields()
end
