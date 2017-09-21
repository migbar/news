defmodule News.Api.V1.SourceController do
  use News.Web, :controller

  alias News.Source

  def index(conn, _params) do
    sources = Repo.all(Source)
    render conn, "index.json-api", data: sources
  end

  def show(conn, %{"id" => id}) do
    source = Repo.get!(Source, id)
    render conn, "show.json-api", data: source
  end

end
