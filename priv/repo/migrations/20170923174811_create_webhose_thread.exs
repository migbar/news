defmodule News.Repo.Migrations.CreateWebhoseThread do
  use Ecto.Migration

  def change do
    create table(:threads) do
      add :uuid, :string
      add :url, :binary
      add :site_full, :binary
      add :site, :binary
      add :site_section, :binary
      add :site_categories, :binary
      add :section_title, :binary
      add :title, :binary
      add :title_full, :binary
      add :published, :string
      add :replies_count, :integer
      add :participants_count, :integer
      add :site_type, :string
      add :country, :string
      add :spam_score, :integer
      add :main_image, :binary
      add :performance_score, :integer
      add :domain_rank, :integer
      add :ord_in_thread, :integer
      add :author, :binary
      add :text, :binary
      add :highlightText, :binary
      add :highlightTitle, :binary
      add :language, :string
      add :external_links, :string
      add :crawled, :string

      timestamps()
    end

  end
end
