defmodule BrowserNavigationTestWeb.OneLive do
  use BrowserNavigationTestWeb, :live_component

  def render(assigns) do
    ~H"""
      <input type="text" name="test_1" value="" placeholder="Test 1" />
    """
  end
end
