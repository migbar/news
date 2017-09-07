defmodule News.Article do
  use News.Web, :model

  schema "articles" do
    field :author, :string
    field :title, :string
    field :description, :string
    field :url, :string
    field :urlToImage, :string
    # field :publishedAt, :datetime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:author, :title, :description, :url, :urlToImage, :publishedAt])
    |> validate_required([:author, :title, :description, :url, :urlToImage, :publishedAt])
  end
end
