defmodule BrowserNavigationTestWeb.NavigationTestLive do
  @moduledoc """
    Testing a few things
  """

  use BrowserNavigationTestWeb, :live_view

  @steps [
    %{name: "1", previous: nil, next: "2"},
    %{name: "2", previous: "1", next: "3"},
    %{name: "3", previous: "2", next: nil}
  ]

  def mount(_params, _session, socket) do
    first_step = List.first(@steps)

    socket = assign(socket, progress: first_step)

    {:ok, socket}
  end

  def handle_params(params, _url, socket) when map_size(params) == 0 do
    default_route = Routes.live_path(socket, __MODULE__, %{step: socket.assigns.progress.name})
    {:noreply, push_patch(socket, to: default_route, replace: true)}
  end

  def handle_params(params, _url, socket) do
    next_step = Enum.find(@steps, &(&1.name === params["step"])) || List.first(@steps)
    socket = assign(socket, %{progress: next_step})

    {:noreply, socket}
  end

  def render(assigns) do
    ~H"""
      <div class={unless @progress.name == "1", do: "hidden"}>
        <.live_component
          module={BrowserNavigationTestWeb.OneLive}
          id="1"
        />
      </div>

      <div class={unless @progress.name == "2", do: "hidden"}>
        <.live_component
          module={BrowserNavigationTestWeb.TwoLive}
          id="2"
        />
      </div>

      <div class={unless @progress.name == "3", do: "hidden"}>
        <.live_component
          module={BrowserNavigationTestWeb.ThreeLive}
          id="3"
        />
      </div>

      <%= live_patch "Previous", to: Routes.live_path(@socket, __MODULE__, %{step: @progress.previous}) %>
      <%= live_patch "Next", to: Routes.live_path(@socket, __MODULE__, %{step: @progress.next}) %>
    """
  end
end
