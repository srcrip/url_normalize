defmodule UrlNormalizeTest do
  use ExUnit.Case

  doctest UrlNormalize

  defp should_be(x, y), do: assert(x == y)

  describe "normalize/1" do
    test "changing scheme" do
      "http://google.com/"
      |> UrlNormalize.normalize()
      |> then(&URI.to_string/1)
      |> should_be("https://google.com/")
    end

    test "no path: should append a path" do
      "http://google.com"
      |> UrlNormalize.normalize()
      |> then(&URI.to_string/1)
      |> should_be("https://google.com/")
    end

    test "no scheme: should append the default scheme" do
      "google.com/"
      |> UrlNormalize.normalize()
      |> then(&URI.to_string/1)
      |> should_be("https://google.com/")
    end

    test "no path and no scheme: should  add both" do
      "google.com"
      |> UrlNormalize.normalize()
      |> then(&URI.to_string/1)
      |> should_be("https://google.com/")
    end

    test "weird input: should return nil" do
      "/weird/url"
      |> UrlNormalize.normalize()
      |> should_be(nil)
    end
  end
end
