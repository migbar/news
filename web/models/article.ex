defmodule News.Article do
  use News.Web, :model

  schema "articles" do
    field :author, :string
    field :title, :string
    field :description, :string
    field :url, :string
    field :url_to_image, :string
    # field :pubished_at, :datetime

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:author, :title, :description, :url, :url_to_image, :pubished_at])
    |> validate_required([:author, :title, :description, :url, :url_to_image, :pubished_at])
  end
end
