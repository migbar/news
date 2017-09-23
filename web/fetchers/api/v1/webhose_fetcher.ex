defmodule News.Api.V1.WebhoseFetcher do
  use HTTPoison.Base

  @endpoint "http://webhose.io"
  @expected_fields ~w(posts thread uuid url site_full site site_section site_categories
  section_title title title_full published replies_count participants_count site_type
  country spam_score main_image performance_score domain_rank ord_in_thread
  author text highlightText highlightTitle language external_links crawled)

  def process_url(url) do
    @endpoint <> url
  end

  def process_response_body(body) do
    body
      |> Poison.decode!
      |> Map.take(@expected_fields)
      |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end

  def fetch_json do
    fetch_threads_from_api()
    |> make_threads()
    |> persist_threads()
  end

  defp fetch_threads_from_api do
    case get("/filterWebContent", [], params: get_query_params()) do
      {:ok, resp} ->
        resp.body[:posts]

      {:error, reason} ->
        IO.puts "^^^^^^^ ERROR ^^^^^^^^^^^^^"
        IO.inspect reason
        IO.puts "^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        []
    end
  end

  defp get_query_params() do
    token = System.get_env("WEBHOSE_API_TOKEN")
    [{"token", token},
      {"format", "json"},
      {"q", "Apple"},
      {"sort", "crawled"},
      {"is_first", "true"},
      {"thread.country", "US"}]
  end

  def make_threads(threads) do
    threads |> Enum.map(&make_thread/1)
  end

  defp make_thread(thread) do
    %News.WebhoseThread{
      uuid: thread["uuid"],
      title: thread["title"],
      author: thread["author"],
      url: thread["url"],
      site_full: thread["site_full"],
      site: thread["site"],
      site_section: thread["site_section"],
      site_categories: thread["site_categories"],
      section_title: thread["section_title"],
      title_full: thread["title_full"],
      published: thread["published"],
      replies_count: thread["replies_count"],
      participants_count: thread["participants_count"],
      site_type: thread["site_type"],
      country: thread["country"],
      spam_score: thread["spam_score"],
      main_image: thread["main_image"],
      performance_score: thread["performance_score"],
      domain_rank: thread["domain_rank"],
      ord_in_thread: thread["ord_in_thread"],
      text: thread["text"],
      highlightText: thread["highlightText"],
      highlightTitle: thread["highlightTitle"],
      language: thread["language"],
      # external_links: thread["external_links"],
      external_links: "",
      crawled: thread["crawled"]
    }
  end

  defp persist_threads(threads) do
    threads
      |> Enum.map(&log_thread/1)
      |> Enum.map(&persist_thread/1)
  end

  defp log_thread(thread) do
    IO.puts "WebhoseThread[#{thread.uuid}] - #{thread.title}"
    thread
  end

  defp persist_thread(thread) do
    found = News.Repo.get_by(News.WebhoseThread, uuid: thread.uuid)

    if found == nil do
       News.Repo.insert!(thread)
    end
  end

end
