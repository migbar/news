defmodule News.Repo.Migrations.CreateArticle do
  use Ecto.Migration

  def change do
    create table(:articles) do
      add :author, :string
      add :title, :string
      add :description, :string
      add :url, :string
      add :urlToImage, :string
      add :publishedAt, :date

      timestamps()
    end

  end
end
