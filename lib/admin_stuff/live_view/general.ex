defmodule AdminStuff.LiveView.General do
  defmacro mounts(function) do
    quote do
      def mount(session, socket) do
        Map.get(session, :locale, "en") |> Gettext.put_locale()

        socket = assign(socket, session |> Map.to_list())

        {
          :ok,
          apply(unquote(function), [socket])
        }
      end
    end
  end
end
