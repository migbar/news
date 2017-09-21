defmodule News.SourceTest do
  use News.ModelCase

  alias News.Source

  @valid_attrs %{category: "some content", country: "some content", description: "some content", language: "some content", name: "some content", url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Source.changeset(%Source{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Source.changeset(%Source{}, @invalid_attrs)
    refute changeset.valid?
  end
end
