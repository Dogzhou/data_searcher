defmodule DataSearcher.Repo do
  @moduledoc """
  as a data search center, provide data related function expecially fetch data
  """
  alias DataSearcher.Repo.{Organization, Ticket, User}

  def get_available_fields do
    %{user: User.fields(), organization: Organization.fields(), ticket: Ticket.fields()}
  end

  def search({:user, term, value}) do
    users =
      term
      |> User.find_by(value)
      |> User.resolve_associated_resources()

    {:user, users}
  end

  def search({:ticket, term, value}) do
    tickets =
      term
      |> Ticket.find_by(value)
      |> Ticket.resolve_associated_resources()

    {:ticket, tickets}
  end

  def search({:organization, term, value}) do
    organizations =
      term
      |> Organization.find_by(value)
      |> Organization.resolve_associated_resources()

    {:organization, organizations}
  end

  def all(:user), do: User.all()
  def all(:ticket), do: Ticket.all()
  def all(:organization), do: Organization.all()

  def valid_term?(:user, term), do: term in User.fields()
  def valid_term?(:ticket, term), do: term in Ticket.fields()
  def valid_term?(:organization, term), do: term in Organization.fields()
end
