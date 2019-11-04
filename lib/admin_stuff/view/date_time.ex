defmodule AdminStuff.View.DateTime do
  defmacro date_to_string(date, locale, _opts \\ []) do
    quote do
      unquote(date) |> Cldr.Date.to_string(locale: unquote(locale)) |> elem(1)
    end
  end

  defmacro datetime_to_string(date, locale, _opts \\ []) do
    quote do
      unquote(date) |> Cldr.DateTime.to_string(locale: unquote(locale)) |> elem(1)
    end
  end

  defmacro format_time(time, opts \\ []) do
    quote do
      case unquote(time) do
        nil -> unquote("")
        t -> t |> Cldr.Time.to_string(unquote(opts)) |> elem(1)
      end
    end
  end
end
