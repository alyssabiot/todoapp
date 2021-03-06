defmodule TodoappWeb.LiveHelpers do
  import Phoenix.LiveView.Helpers

  @doc """
  Renders a component inside the `TodoappWeb.ModalComponent` component.

  The rendered modal receives a `:return_to` option to properly update
  the URL when the modal is closed.

  ## Examples

      <%= live_modal @socket, TodoappWeb.ItemLive.FormComponent,
        id: @item.id || :new,
        action: @live_action,
        item: @item,
        return_to: Routes.item_index_path(@socket, :index) %>
  """
  def live_modal(_socket, component, opts) do
    path = Keyword.fetch!(opts, :return_to)
    modal_opts = [id: :modal, return_to: path, component: component, opts: opts]
    live_component(TodoappWeb.ModalComponent, modal_opts)
  end
end
