defmodule BrowserNavigationTestWeb.ThreeLive do
  use BrowserNavigationTestWeb, :live_component

  def render(assigns) do
    ~H"""
      <input type="text" name="test_3" value="" placeholder="Test 3" />
    """
  end
end
