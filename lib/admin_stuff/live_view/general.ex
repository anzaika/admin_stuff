defmodule AdminStuff.LiveView.General do
  defmacro mounts(function) do
    quote do
      def mount(_params, %{locale: locale} = assigns, socket) do
        Gettext.put_locale(locale)
        {:ok, apply(unquote(function), [assign(socket, assigns)])}
      end

      def mount(_params, assigns, socket) do
        assigns = Map.put_new_lazy(assigns, :locale, &Gettext.get_locale/0)
        {:ok, apply(unquote(function), [assign(socket, assigns)])}
      end
    end
  end
end
