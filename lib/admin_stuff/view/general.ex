defmodule AdminStuff.View.General do
  use Phoenix.HTML
  import Canada.Can, only: [can?: 3]

  defmacro lv_delete_btn(entity, current_user) do
    quote do
      case can?(unquote(current_user), :delete, unquote(entity)) do
        true ->
          content_tag(
            :button,
            content_tag(:i, gettext("Delete"), class: "mdi mdi-delete"),
            class: "btn btn-icon btn-danger btn-round btn-sm",
            phx_click: "delete",
            phx_value_id: unquote(entity).id,
            data_confirm: gettext("Are you sure?")
          )

        _ ->
          content_tag(
            :button,
            content_tag(:i, "", class: "mdi mdi-delete"),
            class: "btn btn-icon btn-danger btn-round btn-sm",
            disabled: ""
          )
      end
    end
  end

  defmacro lv_edit_btn(entity, current_user) do
    quote do
      case can?(unquote(current_user), :edit, unquote(entity)) do
        true ->
          content_tag(
            :button,
            content_tag(:i, Gettext.gettext("Edit"), class: "mdi mdi-pencil"),
            class: "btn btn-icon btn-info btn-round btn-sm",
            phx_click: "edit",
            phx_value_id: entity.id
          )

        _ ->
          content_tag(
            :button,
            content_tag(:i, "", class: "mdi mdi-pencil"),
            class: "btn btn-icon btn-info btn-round btn-sm",
            disabled: ""
          )
      end
    end
  end

  defmacro lv_copy_btn(entity, current_user) do
    quote do
      case can?(unquote(current_user), :copy, unquote(entity)) do
        true ->
          content_tag(
            :button,
            content_tag(:i, "", class: "mdi mdi-content-copy"),
            class: "btn btn-icon btn-success btn-round btn-sm",
            phx_click: "copy",
            phx_value_id: entity.id
          )

        _ ->
          content_tag(
            :button,
            content_tag(:i, "", class: "mdi mdi-content-copy"),
            class: "btn btn-icon btn-success btn-round btn-sm",
            disabled: ""
          )
      end
    end
  end

  def name(%{first_name: first, last_name: last}) do
    "#{first} #{last}"
  end
end
