defmodule Longlink.InviteCode do
  def validate(code) do
    # temporarrily implemented as hard coded
    # the next version will search the database to check if `code` is in the record
    code == "123456"
  end
end
