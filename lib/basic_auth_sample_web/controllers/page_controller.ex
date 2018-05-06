defmodule BasicAuthSampleWeb.PageController do
  use BasicAuthSampleWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
