defmodule UrlNormalize do
  @moduledoc """
  Parse user input that should be a URL on the web.
  """

  @doc """
  Tries to create fully qualified URLs from a string.

  ## Examples

    iex> UrlNormalize.normalize("google.com") |> URI.to_string
    "https://google.com/"

  """
  def normalize("http://" <> url), do: normalize(url)

  def normalize(url) do
    case URI.parse(url) do
      %URI{scheme: nil} -> normalize("https://#{url}")
      %URI{path: nil} -> normalize("#{url}/")
      %URI{host: nil} -> nil
      %URI{host: ""} -> nil
      parsed -> parsed
    end
  end
end
