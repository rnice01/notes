defmodule Notes.Repo.Migrations.CreateNoteTags do
  use Ecto.Migration

  def change do
    create table(:note_tags) do
      add :note_id, references(:notes)
      add :tag_id, references(:tags)

      timestamps()
    end
    
    create unique_index(:note_tags, [:note_id, :tag_id])
  end
end
