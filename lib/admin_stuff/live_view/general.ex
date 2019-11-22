defmodule AdminStuff.LiveView.General do
  defmacro mounts(function) do
    quote do
      def mount(assigns, socket) do
        Gettext.put_locale(locale)
        {:ok, apply(unquote(function), [assign(socket, assigns)])}
      end

      def mount(assigns, socket) do
        assigns = Map.put_new_lazy(assigns, :locale, &Gettext.get_locale/0)
        {:ok, apply(unquote(function), [assign(socket, assigns)])}
      end
    end
  end
end
