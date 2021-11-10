defmodule BrowserNavigationTestWeb.PageController do
  use BrowserNavigationTestWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
