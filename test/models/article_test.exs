defmodule News.ArticleTest do
  use News.ModelCase

  alias News.Article

  @valid_attrs %{author: "some content", description: "some content", pubished_at: %{day: 17, month: 4, year: 2010}, title: "some content", url: "some content", url_to_image: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Article.changeset(%Article{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Article.changeset(%Article{}, @invalid_attrs)
    refute changeset.valid?
  end
end
