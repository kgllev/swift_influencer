defmodule SwiftInfluencer.Twitter.Jobs.Generators.Followers do
  alias ExTwitter

  def followers(screen_name, acc \\ [], cursor \\ -1) do
    cursor = fetch_next(screen_name, cursor)
    if Enum.count(cursor.items) == 0 do
      List.flatten(acc)
    else
      followers(screen_name, [cursor.items | acc], cursor.next_cursor)
    end
  end

  defp fetch_next(screen_name, cursor) do
    try do
      ExTwitter.follower_ids(screen_name, cursor: cursor)
    rescue
      e in ExTwitter.RateLimitExceededError ->
          :timer.sleep ((e.reset_in + 1) * 1000)
        fetch_next(screen_name, cursor)
    end
  end
end