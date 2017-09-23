defmodule News.WebhoseThread do
  use News.Web, :model

  schema "threads" do
    field :uuid, :string
    field :url, :string
    field :site_full, :string
    field :site, :string
    field :site_section, :string
    field :site_categories, :string
    field :section_title, :string
    field :title, :string
    field :title_full, :string
    field :published, :string
    field :replies_count, :integer
    field :participants_count, :integer
    field :site_type, :string
    field :country, :string
    field :spam_score, :integer
    field :main_image, :string
    field :performance_score, :integer
    field :domain_rank, :integer
    field :ord_in_thread, :integer
    field :author, :string
    field :text, :binary
    field :highlightText, :string
    field :highlightTitle, :string
    field :language, :string
    field :external_links, :string
    field :crawled, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:uuid, :url, :site_full, :site, :site_section, :site_categories, :section_title, :title, :title_full, :published, :replies_count, :participants_count, :site_type, :country, :spam_score, :main_image, :performance_score, :domain_rank, :ord_in_thread, :author, :text, :highlightText, :highlightTitle, :language, :external_links, :crawled])
    |> validate_required([:uuid, :url, :site_full, :site, :site_section, :site_categories, :section_title, :title, :title_full, :published, :replies_count, :participants_count, :site_type, :country, :spam_score, :main_image, :performance_score, :domain_rank, :ord_in_thread, :author, :text, :highlightText, :highlightTitle, :language, :external_links, :crawled])
  end
end
