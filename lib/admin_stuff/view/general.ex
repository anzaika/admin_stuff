defmodule AdminStuff.View.General do
  use Phoenix.HTML
  import Canada.Can, only: [can?: 3]
  import Ui.Gettext

  def lv_delete_btn(entity, current_user) do
    case can?(current_user, :delete, entity) do
      true ->
        content_tag(
          :button,
          content_tag(:i, "", class: "mdi mdi-delete"),
          class: "btn btn-icon btn-danger btn-round btn-sm",
          phx_click: "delete",
          phx_value_id: entity.id,
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

  def lv_edit_btn(entity, current_user) do
    case can?(current_user, :edit, entity) do
      true ->
        content_tag(
          :button,
          content_tag(:i, "", class: "mdi mdi-pencil"),
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

  def lv_copy_btn(entity, current_user) do
    case can?(current_user, :copy, entity) do
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
