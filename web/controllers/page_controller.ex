defmodule News.PageController do
  use News.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
