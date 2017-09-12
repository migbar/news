defmodule News.ArticleControllerTest do
  use News.ConnCase
  alias News.TestHelpers

  @valid_attrs %{
    title: "this is the title",
    author: "John Doe",
    description: "this is the description",
    url: "http://foo.com",
    url_to_image: "http://bar.com"
  }

  setup %{conn: conn} do
    conn =
      conn
      |> put_req_header("accept", "application/vnd.api+json")
      |> put_req_header("content-type", "application/vnd.api+json")

    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    article = TestHelpers.insert_article(@valid_attrs)

    conn = get conn, api_v1_article_path(conn, :index)
    response = json_response(conn, 200)

    [%{"type" => type, "attributes" => attributes} | _tail] = response["data"]

    assert response["jsonapi"] == %{"version" => "1.0"}

    assert type == "article"
  	assert attributes == %{
      "title" => article.title,
      "author" => article.author,
      "description" => article.description,
      "url" => article.url,
      "url-to-image" => article.url_to_image
  		}
  end

  test "returns an empty list if no articles exist", %{conn: conn} do
    conn = get conn, api_v1_article_path(conn, :index)
    response = json_response(conn, 200)
    [] = response["data"]
  end

  test "shows chosen resource", %{conn: conn} do
    article = TestHelpers.insert_article(@valid_attrs)

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
