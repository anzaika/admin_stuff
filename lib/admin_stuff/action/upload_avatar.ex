defmodule AdminStuff.Action.UploadAvatar do
  import Ecto.Changeset

  def update_avatar(%{valid?: true} = ch, %{"avatar" => %{} = image} = _attrs) do
    with {:ok, uploaded_image} <- __MODULE__.call(ch.data, image.path) do
      ch |> put_change(:avatar_public_id, uploaded_image.public_id)
    end
  end

  def update_avatar(ch, _), do: ch

  def call(user, path_to_avatar) do
    with {:ok, _} <- maybe_delete_old_avatar(user) do
      upload_new_avatar(user, path_to_avatar)
    end
  end

  defp maybe_delete_old_avatar(%{avatar_public_id: nil}) do
    {:ok, :no_old_avatar}
  end

  defp maybe_delete_old_avatar(%{avatar_public_id: public_id}) do
    Cloudex.delete(public_id)
  end

  defp upload_new_avatar(user, path) do
    path
    |> Cloudex.upload(%{
      tags: ["avatar", "##{user.id}"],
      upload_preset: "avatar"
    })
  end
end
