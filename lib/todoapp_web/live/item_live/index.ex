defmodule TodoappWeb.ItemLive.Index do
  use TodoappWeb, :live_view

  alias Todoapp.Todos
  alias Todoapp.Todos.Item

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :items, list_items())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Item")
    |> assign(:item, Todos.get_item!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Item")
    |> assign(:item, %Item{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Items")
    |> assign(:item, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    item = Todos.get_item!(id)
    {:ok, _} = Todos.delete_item(item)

    {:noreply, assign(socket, :items, list_items())}
  end

  def handle_event("toggle", %{"id" => id}, socket) do
    item = Todos.get_item!(id)
    new_status = if item.is_done, do: false, else: true
    {:ok, _item} = Todos.update_item(item, %{is_done: new_status})

    {:noreply, assign(socket, :items, list_items())}
  end

  defp list_items do
    Todos.list_items()
  end
end
