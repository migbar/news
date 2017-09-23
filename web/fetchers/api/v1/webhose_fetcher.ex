defmodule News.Api.V1.WebhoseFetcher do
  use HTTPoison.Base

  @endpoint "http://webhose.io"
  @expected_fields ~w(posts thread uuid url site_full site site_section site_categories)

  #Overrides
  def process_url(url) do
    IO.puts "processing URL #{@endpoint <> url}"
    IO.puts "processing URL #{@endpoint <> url}"
    IO.puts "processing URL #{@endpoint <> url}"

    @endpoint <> url
  end

  def process_response_body(body) do
    IO.puts "ABOUT TO PROCESS RESPONSE BODY"
    IO.puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    IO.inspect body
    IO.puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    body
      |> Poison.decode!
      |> Map.take(@expected_fields)
      |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end

  #Webhose

  def fetch_json do
    token = System.get_env("WEBHOSE_API_TOKEN")
    IO.puts "the WEBHOSE TOKEN IS #{token}"
    IO.puts "the WEBHOSE TOKEN IS #{token}"
    IO.puts "the WEBHOSE TOKEN IS #{token}"
    IO.puts "the WEBHOSE TOKEN IS #{token}"
    IO.puts "the WEBHOSE TOKEN IS #{token}"

    query = [
      {"token", token},
      {"format", "json"},
      {"q", "Hurricane Harvey"},
      {"sort", "crawled"},
      {"is_first", "true"},
      {"thread.country", "US"}]

    case get("/filterWebContent", [], params: query) do
      {:ok, resp} ->
        resp.body

      {:error, reason} ->
        IO.puts "^^^^^^^ ERROR ^^^^^^^^^^^^^"
        IO.inspect reason
        IO.puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        []
    end
  end

end
