defmodule Notes.WorkspaceTest do
  use Notes.DataCase

  alias Notes.Workspace

  describe "notes" do
    import Notes.WorkspaceFixtures

    test "list_notes/0 returns all notes" do
      note = note_fixture()
      note_with_tag = note_with_tag_fixture("my unique tag")
      [tag] = note_with_tag.tags
      
      [expected_note1, expected_note2] = Workspace.list_notes()
      assert  [expected_note1.id, expected_note2.id] == [note.id, note_with_tag.id]
      assert "my unique tag" == tag.label
    end
  end
end