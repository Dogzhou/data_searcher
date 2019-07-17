defmodule DataSearcher.Repo do
  alias DataSearcher.Repo
  defstruct menu: nil, term: nil, value: nil

  def search(params) do
    IO.inspect(params)
  end
end
