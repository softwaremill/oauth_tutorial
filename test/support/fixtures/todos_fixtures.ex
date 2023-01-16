defmodule OauthTutorial.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `OauthTutorial.Todos` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        content: "some content"
      })
      |> OauthTutorial.Todos.create_todo()

    todo
  end
end
