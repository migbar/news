defmodule News.Api.V1.ArticleSerializer do
  use JaSerializer

  location "/articles/:id"
  attributes [:title, :author, :description, :url, :url_to_image]
end
