defmodule BombWeb.WiresLive do
  use Phoenix.LiveView
  alias Bomb.Wires
  defstruct user_input: ""

  def render(assigns) do
    ~H"""
    <form
      phx-change="update"
    >
          <div class="mb-4">
        <label class="block text-gray-700 text-sm mb-1" for="name">
          List of wires
        </label>
        <input
          type="text"
          name="wires-input"
          value={@wires_input}
          placeholder="List of wires, separated by spaces"
          autocomplete="off"
          id="wires-input"
        />
      </div>
      </form>


    <%= @instructions %>
    """
  end

  def mount(_params, %{}, socket) do
    {:ok,
     assign(socket,
       wires_input: "",
       instructions: ""
     )}
  end

  def handle_event(
        "update",
        %{"_target" => ["wires-input"], "wires-input" => wires_input},
        socket
      ) do
    {:noreply,
     assign(socket,
       wires_input: wires_input,
       instructions: Wires.instruct(wires_input)
     )}
  end
end
