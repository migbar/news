defmodule News.Api.V1.SourceView do
  use News.Web, :view
  use JaSerializer.PhoenixView # Or use in web/web.ex

  attributes [:name, :description, :url, :category, :language, :country]
end
