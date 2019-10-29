defmodule AdminStuff.View.DateTime do
  defmacro date_to_string(date, locale, _opts \\ []) do
    quote do
      unquote(date) |> Cldr.Date.to_string(locale: unquote(locale)) |> elem(1)
    end
  end
end
