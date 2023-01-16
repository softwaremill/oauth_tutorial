defmodule OauthTutorialWeb.AuthController do
  use OauthTutorialWeb, :controller
  plug Ueberauth

  alias OauthTutorial.Accounts.User
  alias OauthTutorial.Repo


  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    user_data = %{token: auth.credentials.token, email: auth.info.email, provider: "github"}
    case findOrCreateUser(user_data) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome to OAuth Tutorial!")
        |> put_session(:user_id, user.id)
        |> redirect(to: "/")

      {:error, changeset} ->
        conn
        |> put_flash(:error, "Something went wrong")
        |> redirect(to: "/")
    end
  end

  def signout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: Routes.page_path(conn, :index))
  end

  defp findOrCreateUser(user_data) do
    changeset = User.changeset(%User{}, user_data)
    case Repo.get_by(User, email: changeset.changes.email) do
      nil ->
        IO.puts("User not found, creating new one")
        Repo.insert(changeset)
      user -> {:ok, user}
    end
  end

end
