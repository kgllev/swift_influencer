defmodule SwiftInfluencer.Twitter.Jobs.Algorithms.Tweet do
  alias ExTwitter


  def list(influencer, count) do
    with{} <-ExTwitter.user_timeline([screen_name: "the_p_plug", trim_user: false]) do
     # tweets
    end
  end

  def retweet_user_ids(tweet) do
    with{} <- ExTwitter.retweeter_ids(tweet) do
      #[id]
    end
  end


end