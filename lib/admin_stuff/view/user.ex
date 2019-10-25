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
end
