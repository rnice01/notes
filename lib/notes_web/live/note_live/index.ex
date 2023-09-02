defmodule NotesWeb.NoteLive.Index do
  use NotesWeb, :live_view

  alias Notes.Workspace
  alias Notes.Workspace.Note

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :notes, Workspace.list_notes())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Note")
    |> assign(:note, Workspace.get_note!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Note")
    |> assign(:note, %Note{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Notes")
    |> assign(:note, nil)
  end

  @impl true
  def handle_info({NotesWeb.NoteLive.FormComponent, {:saved, note}}, socket) do
    {:noreply, stream_insert(socket, :notes, note)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    note = Workspace.get_note!(id)
    {:ok, _} = Workspace.delete_note(note)

    {:noreply, stream_delete(socket, :notes, note)}
  end
end
