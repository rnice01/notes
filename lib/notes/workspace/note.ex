defmodule Notes.Workspace.Note do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notes" do
    field :content, :string
    field :title, :string
    
    many_to_many :tags, Notes.Workspace.Tag,
      join_through: Notes.Workspace.NoteTag

    timestamps()
  end

  @doc false
  def changeset(note, attrs) do
    note
    |> cast(attrs, [:title, :content])
    |> validate_required([:title, :content])
    |> cast_assoc(:tags, required: false)
  end
end
