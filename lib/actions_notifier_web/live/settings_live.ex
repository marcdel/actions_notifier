defmodule ActionsNotifierWeb.UserSettingsLive do
  @moduledoc false
  use ActionsNotifierWeb, :live_view

  @impl true
  def render(assigns) do
    ~H"""
    <div class="w-2/5">
    </div>
    """
  end

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(params, _uri, socket) do
    {:noreply, socket}
  end
end
