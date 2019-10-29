defmodule AdminStuff.View.DateTime do
  defmacro date_to_string(date, _opts \\ []) do
    quote do
      unquote(date) |> Cldr.Date.to_string(locale: @locale) |> elem(1)
    end
  end
end
