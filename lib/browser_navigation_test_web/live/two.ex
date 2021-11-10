defmodule BrowserNavigationTestWeb.TwoLive do
  use BrowserNavigationTestWeb, :live_component

  def render(assigns) do
    ~H"""
      <input type="text" name="test_2" value="" placeholder="Test 2" />
    """
  end
end
