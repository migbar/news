defmodule News.SourceServer do
  use GenServer

  @name :source_server
  @refresh_interval :timer.hours(4)

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
    schedule_refresh()
    {:ok, initial_state}
  end

  def handle_info(:refresh, _state) do
    IO.puts "Refreshing sources cache..."
    new_state = SourceFetcher.fetch_sources()
    schedule_refresh()
    {:noreply, new_state}
  end

  def handle_call(:get_sources, _from, state) do
    {:reply, state, state}
  end

  defp schedule_refresh do
    Process.send_after(self(), :refresh, @refresh_interval)
  end

end
