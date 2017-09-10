defmodule News.Api.V1.ArticleController do
  use News.Web, :controller

  alias News.Article

  def index(conn, _params) do
    articles = Repo.all(Article)
    render conn, "index.json-api", data: articles
  end

  def show(conn, %{"id" => id}) do
    article = Repo.get!(Article, id)
    render conn, "show.json-api", data: article
  end
  
end
