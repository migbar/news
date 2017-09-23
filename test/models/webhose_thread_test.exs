defmodule News.WebhoseThreadTest do
  use News.ModelCase

  alias News.WebhoseThread

  @valid_attrs %{author: "some content", country: "some content", crawled: "some content", domain_rank: 42, external_links: "some content", highlightText: "some content", highlightTitle: "some content", language: "some content", main_image: "some content", ord_in_thread: 42, participants_count: 42, performance_score: 42, published: "some content", replies_count: 42, section_title: "some content", site: "some content", site_categories: "some content", site_full: "some content", site_section: "some content", site_type: "some content", spam_score: 42, text: "some content", title: "some content", title_full: "some content", url: "some content", uuid: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = WebhoseThread.changeset(%WebhoseThread{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = WebhoseThread.changeset(%WebhoseThread{}, @invalid_attrs)
    refute changeset.valid?
  end
end
