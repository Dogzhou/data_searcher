defmodule DataSearcher.Validator do
  alias DataSearcher.Repo.User

  defmacro valid_menu?(menu) do
    quote do
      unquote(menu) in ~w(1 2 3 4)
    end
  end

  defmacro valid_term?(menu, term) do
    quote do
      unquote(term) in unquote(User.fields)
    end
  end
end
