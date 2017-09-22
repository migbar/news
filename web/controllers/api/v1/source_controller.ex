defmodule News.Api.V1.SourceController do
  use News.Web, :controller

  alias News.Source
  alias News.SourceServer

  def index(conn, _params) do
    sources = SourceServer.get_sources()
    render conn, "index.json-api", data: sources
  end

  def show(conn, %{"id" => id}) do
    source = Repo.get!(Source, id)
    render conn, "show.json-api", data: source
  end

end
