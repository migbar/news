defmodule News.Api.V1.ArticleView do
  use News.Web, :view

  def render("index.json", %{articles: articles}) do
    %{data: render_many(articles, News.Api.V1.ArticleView, "article.json")}
  end

  def render("show.json", %{article: article}) do
    %{data: render_one(article, News.Api.V1.ArticleView, "article.json")}
  end

  def render("article.json", %{article: article}) do
    %{id: article.id,
      author: article.author,
      title: article.title,
      description: article.description,
      url: article.url,
      url_to_image: article.url_to_image}
      # pubished_at: article.pubished_at}
  end
end
