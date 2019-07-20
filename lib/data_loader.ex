defmodule DataSearcher.DataLoader do
  @moduledoc """
  load data from json files
  """

  def load_orgnizations do
    with {:ok, body} <- File.read("lib/data/organizations.json"),
         {:ok, organizations} <- Poison.decode(body) do
      Agent.start_link(fn -> organizations end, name: :organizations)
    end
  end

  def load_users do
    with {:ok, body} <- File.read("lib/data/users.json"),
         {:ok, users} <- Poison.decode(body) do
      Agent.start_link(fn -> users end, name: :users)
    end
  end

  def load_tickets do
    with {:ok, body} <- File.read("lib/data/tickets.json"),
         {:ok, tickets} <- Poison.decode(body) do
      Agent.start_link(fn -> tickets end, name: :tickets)
    end
  end
end
