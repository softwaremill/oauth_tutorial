defmodule OauthTutorial.Todos.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :content, :string

    belongs_to :user, OauthTutorial.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
