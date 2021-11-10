defmodule BrowserNavigationTest.Repo do
  use Ecto.Repo,
    otp_app: :browser_navigation_test,
    adapter: Ecto.Adapters.Postgres
end
