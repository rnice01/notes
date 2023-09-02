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

  def note_with_tag_fixture(tag_label, attrs \\ %{}) do
    note = note_fixture(attrs)
    tag = tag_fixture(%{label: tag_label})
    
    {:ok, _note_tag} = Notes.Workspace.create_note_tag(note, tag)
  
    Map.put(note, :tags, [tag])
  end
  @doc """
  Generate a tag.
  """
  def tag_fixture(attrs \\ %{}) do
    {:ok, tag} =
      attrs
      |> Enum.into(%{
        label: "some label"
      })
      |> Notes.Workspace.create_tag()

    tag
  end
end
