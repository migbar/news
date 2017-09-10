defmodule News.ArticleControllerTest do
  use News.ConnCase

  alias News.Article
  @valid_attrs %{author: "some content", description: "some content", published_at: %{day: 17, month: 4, year: 2010}, title: "some content", url: "some content", url_to_image: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    conn =
      conn
      |> put_req_header("accept", "application/vnd.api+json")
      |> put_req_header("content-type", "application/vnd.api+json")

    {:ok, conn: conn}
  end

  # test "create action", %{conn: conn} do
  #   params = Poison.encode!(%{data: %{attributes: @valid_attrs}})
  #   conn = post conn, "/some_resource", params
  #
  #   ...
  # end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, api_v1_article_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    article = Repo.insert! %Article{}
    conn = get conn, api_v1_article_path(conn, :show, article)
    assert json_response(conn, 200)["data"] == %{
      "type" => "article",
      "id" => "#{article.id}",
      "attributes" => %{
        "author" => article.author,
        "title" => article.title,
        "description" => article.description,
        "url" => article.url,
        "url-to-image" => article.url_to_image}
      }
      # "published_at" => article.published_at}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, api_v1_article_path(conn, :show, -1)
    end
  end

end
