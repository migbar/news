defmodule News.Repo.Migrations.CreateArticle do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :author, :string
      add :title, :string
      add :description, :string
      add :url, :string
      add :url_to_image, :string
      add :published_at, :date

      timestamps()
    end

  end
end
