defmodule TodoWeb.PillComponent do
  @moduledoc """
  ## Assigns
  Pills have defaults set so the only required assigns is `content`.
  ## Available types
  * `teal` - default
  * `confirm` - green
  * `warning` - yellow
  ## Examples
      <%= live_component @socket, TodoWeb.PillComponent, content: "removed", type: "warning" %>
  """
  # use Phoenix.LiveComponent
  use TodoappWeb, :live_component

  alias Todoapp.Todos

  @impl true
  def render(assigns) do
    type = Map.get(assigns, :type, "teal")

    ~L"""
    <span class="pill-component-container <%= type %>" phx-click= "toggle" phx-value-id= <%= assigns.id %>>
      <div class="content">
        <span class="dot"></span>
        <%= @content %>
      </div>
    </span>
    """
  end
end
