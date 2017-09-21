defmodule News.Repo.Migrations.CreateSource do
  use Ecto.Migration

  def change do
    create table(:sources) do
      add :name, :string
      add :description, :binary
      add :url, :string
      add :category, :string
      add :language, :string
      add :country, :string

      timestamps()
    end

  end
end
