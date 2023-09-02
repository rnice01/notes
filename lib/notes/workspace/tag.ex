defmodule Notes.Workspace.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :label, :string

    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:label])
    |> validate_required([:label])
  end
end
