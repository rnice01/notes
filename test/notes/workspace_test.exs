defmodule Notes.WorkspaceTest do
  use Notes.DataCase

  alias Notes.Workspace

  describe "notes" do
    alias Notes.Workspace.Note

    import Notes.WorkspaceFixtures

    @invalid_attrs %{content: nil, title: nil}

    test "list_notes/0 returns all notes" do
      note = note_fixture()
      assert Workspace.list_notes() == [note]
    end

    test "get_note!/1 returns the note with given id" do
      note = note_fixture()
      assert Workspace.get_note!(note.id) == note
    end

    test "create_note/1 with valid data creates a note" do
      valid_attrs = %{content: "some content", title: "some title"}

      assert {:ok, %Note{} = note} = Workspace.create_note(valid_attrs)
      assert note.content == "some content"
      assert note.title == "some title"
    end

    test "create_note/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Workspace.create_note(@invalid_attrs)
    end

    test "update_note/2 with valid data updates the note" do
      note = note_fixture()
      update_attrs = %{content: "some updated content", title: "some updated title"}

      assert {:ok, %Note{} = note} = Workspace.update_note(note, update_attrs)
      assert note.content == "some updated content"
      assert note.title == "some updated title"
    end

    test "update_note/2 with invalid data returns error changeset" do
      note = note_fixture()
      assert {:error, %Ecto.Changeset{}} = Workspace.update_note(note, @invalid_attrs)
      assert note == Workspace.get_note!(note.id)
    end

    test "delete_note/1 deletes the note" do
      note = note_fixture()
      assert {:ok, %Note{}} = Workspace.delete_note(note)
      assert_raise Ecto.NoResultsError, fn -> Workspace.get_note!(note.id) end
    end

    test "change_note/1 returns a note changeset" do
      note = note_fixture()
      assert %Ecto.Changeset{} = Workspace.change_note(note)
    end
  end
end
