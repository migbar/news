defmodule News.SourceServer do
  use GenServer

  @name :source_server

  alias News.Api.V1.SourceFetcher

  #Client Interface

  def start() do
    GenServer.start(__MODULE__, %{}, name: @name)
  end

  def get_sources() do
    GenServer.call @name, :get_sources
  end

  #Server Callbacks

  def init(_state) do
    initial_state = SourceFetcher.fetch_sources()
    {:ok, initial_state}
  end

  def handle_call(:get_sources, _from, state) do
    {:reply, state, state}
  end

end
