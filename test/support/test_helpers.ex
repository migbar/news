defmodule News.TestHelpers do
  alias News.Repo

  def insert_article(attrs \\ %{}) do
    article = %News.Article{
      url_to_image: "http://default.image.url",
      url: "https://default.url",
      title: "Default Title",
      description: "Default Description",
      author: "Default Author"
    }

    Map.merge(article, attrs) |> Repo.insert!
  end

end
