defmodule DataSearcher.Validator do
  defmacro valid_menu?(menu) do
    quote do
      unquote(menu) in ~w(1 2 3 4)
    end
  end

  defmacro valid_term?(menu, term) do
    quote do
      unquote(menu) == unquote(term)
    end
  end
end
