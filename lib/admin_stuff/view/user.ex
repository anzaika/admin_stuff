defmodule AdminStuff.View.User do
  def avatar_url(%{avatar_public_id: nil}) do
    "/images/avatar_stub.png"
  end

  def avatar_url(%{avatar_public_id: public_id}) do
    Cloudex.Url.for(
      public_id,
      %{
        crop: "thumb",
        fetch_format: 'auto',
        flags: 'progressive',
        width: 200,
        height: 200,
        gravity: "face",
        radius: "max"
      }
    )
  end

  def full_user_name(%{first_name: first, last_name: last} = _user) do
    "#{first} #{last}"
  end
end
