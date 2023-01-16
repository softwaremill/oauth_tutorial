defmodule OauthTutorial.Repo do
  use Ecto.Repo,
    otp_app: :oauth_tutorial,
    adapter: Ecto.Adapters.Postgres
end
