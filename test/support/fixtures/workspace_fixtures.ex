defmodule Notes.WorkspaceFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Notes.Workspace` context.
  """

  @doc """
  Generate a note.
  """
  def note_fixture(attrs \\ %{}) do
    {:ok, note} =
      attrs
      |> Enum.into(%{
        content: "some content",
        title: "some title"
      })
      |> Notes.Workspace.create_note()

    note
  end
end
