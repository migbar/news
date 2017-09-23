defmodule News.WebhoseServer do
  use GenServer

  @name :webhose_server

  alias News.Api.V1.WebhoseFetcher

  #Client Interface

  def start() do
    GenServer.start(__MODULE__, %{}, name: @name)
  end

  def get_sources() do
    GenServer.call @name, :get_sources
  end

  #Server Callbacks

  def init(_state) do
    initial_state = WebhoseFetcher.fetch_json()
    {:ok, initial_state}
  end

  def handle_info(:refresh, _state) do    
    new_state = WebhoseFetcher.fetch_json()
    {:noreply, new_state}
  end

  def handle_call(:get_sources, _from, state) do
    {:reply, state, state}
  end

end
