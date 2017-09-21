defmodule News.Source do
  use News.Web, :model

  schema "sources" do
    field :name, :string
    field :description, :string
    field :url, :string
    field :category, :string
    field :language, :string
    field :country, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :url, :category, :language, :country])
    |> validate_required([:name, :description, :url, :category, :language, :country])
  end
end
