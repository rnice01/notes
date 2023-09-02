defmodule Notes.Workspace.NoteTag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "note_tags" do
    belongs_to :note, Notes.Workspace.Note
    belongs_to :tag, Notes.Workspace.Tag

    timestamps()
  end

  @doc false
  def changeset(note_tag, attrs) do
    note_tag
    |> cast(attrs, [:note_id, :tag_id])
    |> validate_required([:note_id, :tag_id])
  end
end
