defmodule OauthTutorial.Plugs.SetUser do
  import Plug.Conn
  import Phoenix.Controller

  alias OauthTutorial.Repo
  alias OauthTutorial.Accounts.User

  def init(opts), do: opts

  def call(conn, _opts) do
    user_id = get_session(conn, :user_id)
    cond do
      user = user_id && Repo.get(User, user_id)->
        assign(conn, :user, user)
      true ->
        assign(conn, :user, nil)
    end
  end
end