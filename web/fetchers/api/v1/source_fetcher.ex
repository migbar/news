defmodule News.Api.V1.SourceFetcher do
  use HTTPoison.Base

  @endpoint "https://newsapi.org"
  @expected_fields ~w(status sources id name description url category language country)

  # @endpoint "https://api.github.com"
  # @expected_fields ~w(login id avatar_url gravatar_id name)

  #Overrides
  def process_url(url) do
    @endpoint <> url
  end

  def process_response_body(body) do
    body
      |> Poison.decode!
      |> Map.take(@expected_fields)
      |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end

  #News
  def fetch_sources do
    fetch_sources_json_from_api()
      |> make_sources()
      |> persist_sources()
  end

  defp fetch_sources_json_from_api do
    case get("/v1/sources") do
    # case get("/users/migbar") do

      {:ok, resp} ->
        IO.puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        IO.puts "Response from API"
        IO.inspect resp.body
        IO.puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        resp.body

      {:error, reason} ->
        IO.puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        IO.puts "Received error from API"
        IO.inspect reason
        IO.puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        []
    end
  end

  defp make_sources(sources) do
    sources |> Enum.map(&make_source/1)
  end

  defp make_source(source) do
    %News.Source{
      api_id: source["id"],
      description: source["description"],
      category: source["category"],
      country: source["country"],
      language: source["language"],
      url: source["url"],
      name: source["name"]
    }
  end

  defp persist_sources(sources) do
    sources |> Enum.map(&persist_or_update_source/1)
  end

  defp persist_or_update_source(api_source) do
    found_source = News.Repo.get_by(News.Source, api_id: api_source.api_id)

    if found_source == nil do
      api_source
        |> News.Repo.insert!
    else
      changes = changes_from(api_source)

      found_source
        |> Ecto.Changeset.change(changes)
        |> News.Repo.update!
    end
  end

  defp changes_from(api_source) do
    %{
      description: api_source.description,
      category: api_source.category,
      country: api_source.country,
      language: api_source.language,
      url: api_source.url,
      name: api_source.name
    }
  end

end
