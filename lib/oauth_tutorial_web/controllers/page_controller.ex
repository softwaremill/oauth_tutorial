defmodule OauthTutorialWeb.PageController do
  use OauthTutorialWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
