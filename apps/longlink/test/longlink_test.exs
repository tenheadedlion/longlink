defmodule LonglinkTest do
  use Longlink.RepoCase

  describe "Longlink" do
    test "create_redirection/1 creates an database entry" do
      original = "https://a_test_url.com"
      {:ok, link} = Longlink.create_redirection(%{"original" => original})
      assert link.original == original
    end

    test "create/1 create a complete data entry" do
      original = "https://another_test_url.com"
      {:ok, link} = Longlink.create(original)
      link
      |> IO.inspect()
      |> Map.get(:short)
      |> Base62.decode()
      |> Kernel.==(link.id)
    end
  end
end
