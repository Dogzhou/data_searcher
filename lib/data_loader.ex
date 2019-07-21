defmodule DataSearcher.DataLoader do
  @moduledoc """
  load data from json files
  """

  def load_organizations(path \\ "lib/data/organizations.json") do
    with {:ok, body} <- File.read(path),
         {:ok, organizations} <- Poison.decode(body) do
      Agent.start_link(fn -> organizations end, name: :organizations)
    end
  end

  def load_users(path \\ "lib/data/users.json") do
    with {:ok, body} <- File.read(path),
         {:ok, users} <- Poison.decode(body) do
      Agent.start_link(fn -> users end, name: :users)
    end
  end

  def load_tickets(path \\ "lib/data/tickets.json") do
    with {:ok, body} <- File.read(path),
         {:ok, tickets} <- Poison.decode(body) do
      Agent.start_link(fn -> tickets end, name: :tickets)
    end
  end
end
