defmodule LonglinkTest do
  use Longlink.RepoCase

  describe "Longlink" do
    test "creates the redirection relation" do
      orig = "https://a_test_url.com"
      {:ok, link} = Longlink.create_redirection(%{"original" => orig})
      assert link.original == orig
    end
  end
end
