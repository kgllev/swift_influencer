defmodule SwiftInfluencer.TwitterTest do
  use SwiftInfluencer.DataCase

  alias SwiftInfluencer.Twitter

  describe "influencers" do
    alias SwiftInfluencer.Twitter.Influencer

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def influencer_fixture(attrs \\ %{}) do
      {:ok, influencer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Twitter.create_influencer()

      influencer
    end

    test "list_influencers/0 returns all influencers" do
      influencer = influencer_fixture()
      assert Twitter.list_influencers() == [influencer]
    end

    test "get_influencer!/1 returns the influencer with given id" do
      influencer = influencer_fixture()
      assert Twitter.get_influencer!(influencer.id) == influencer
    end

    test "create_influencer/1 with valid data creates a influencer" do
      assert {:ok, %Influencer{} = influencer} = Twitter.create_influencer(@valid_attrs)
    end

    test "create_influencer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Twitter.create_influencer(@invalid_attrs)
    end

    test "update_influencer/2 with valid data updates the influencer" do
      influencer = influencer_fixture()
      assert {:ok, %Influencer{} = influencer} = Twitter.update_influencer(influencer, @update_attrs)
    end

    test "update_influencer/2 with invalid data returns error changeset" do
      influencer = influencer_fixture()
      assert {:error, %Ecto.Changeset{}} = Twitter.update_influencer(influencer, @invalid_attrs)
      assert influencer == Twitter.get_influencer!(influencer.id)
    end

    test "delete_influencer/1 deletes the influencer" do
      influencer = influencer_fixture()
      assert {:ok, %Influencer{}} = Twitter.delete_influencer(influencer)
      assert_raise Ecto.NoResultsError, fn -> Twitter.get_influencer!(influencer.id) end
    end

    test "change_influencer/1 returns a influencer changeset" do
      influencer = influencer_fixture()
      assert %Ecto.Changeset{} = Twitter.change_influencer(influencer)
    end
  end

  describe "friends" do
    alias SwiftInfluencer.Twitter.Friends

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def friends_fixture(attrs \\ %{}) do
      {:ok, friends} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Twitter.create_friends()

      friends
    end

    test "list_friends/0 returns all friends" do
      friends = friends_fixture()
      assert Twitter.list_friends() == [friends]
    end

    test "get_friends!/1 returns the friends with given id" do
      friends = friends_fixture()
      assert Twitter.get_friends!(friends.id) == friends
    end

    test "create_friends/1 with valid data creates a friends" do
      assert {:ok, %Friends{} = friends} = Twitter.create_friends(@valid_attrs)
    end

    test "create_friends/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Twitter.create_friends(@invalid_attrs)
    end

    test "update_friends/2 with valid data updates the friends" do
      friends = friends_fixture()
      assert {:ok, %Friends{} = friends} = Twitter.update_friends(friends, @update_attrs)
    end

    test "update_friends/2 with invalid data returns error changeset" do
      friends = friends_fixture()
      assert {:error, %Ecto.Changeset{}} = Twitter.update_friends(friends, @invalid_attrs)
      assert friends == Twitter.get_friends!(friends.id)
    end

    test "delete_friends/1 deletes the friends" do
      friends = friends_fixture()
      assert {:ok, %Friends{}} = Twitter.delete_friends(friends)
      assert_raise Ecto.NoResultsError, fn -> Twitter.get_friends!(friends.id) end
    end

    test "change_friends/1 returns a friends changeset" do
      friends = friends_fixture()
      assert %Ecto.Changeset{} = Twitter.change_friends(friends)
    end
  end

  describe "followers" do
    alias SwiftInfluencer.Twitter.Follower

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def follower_fixture(attrs \\ %{}) do
      {:ok, follower} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Twitter.create_follower()

      follower
    end

    test "list_followers/0 returns all followers" do
      follower = follower_fixture()
      assert Twitter.list_followers() == [follower]
    end

    test "get_follower!/1 returns the follower with given id" do
      follower = follower_fixture()
      assert Twitter.get_follower!(follower.id) == follower
    end

    test "create_follower/1 with valid data creates a follower" do
      assert {:ok, %Follower{} = follower} = Twitter.create_follower(@valid_attrs)
    end

    test "create_follower/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Twitter.create_follower(@invalid_attrs)
    end

    test "update_follower/2 with valid data updates the follower" do
      follower = follower_fixture()
      assert {:ok, %Follower{} = follower} = Twitter.update_follower(follower, @update_attrs)
    end

    test "update_follower/2 with invalid data returns error changeset" do
      follower = follower_fixture()
      assert {:error, %Ecto.Changeset{}} = Twitter.update_follower(follower, @invalid_attrs)
      assert follower == Twitter.get_follower!(follower.id)
    end

    test "delete_follower/1 deletes the follower" do
      follower = follower_fixture()
      assert {:ok, %Follower{}} = Twitter.delete_follower(follower)
      assert_raise Ecto.NoResultsError, fn -> Twitter.get_follower!(follower.id) end
    end

    test "change_follower/1 returns a follower changeset" do
      follower = follower_fixture()
      assert %Ecto.Changeset{} = Twitter.change_follower(follower)
    end
  end

  describe "unfollows" do
    alias SwiftInfluencer.Twitter.Unfollow

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def unfollow_fixture(attrs \\ %{}) do
      {:ok, unfollow} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Twitter.create_unfollow()

      unfollow
    end

    test "list_unfollows/0 returns all unfollows" do
      unfollow = unfollow_fixture()
      assert Twitter.list_unfollows() == [unfollow]
    end

    test "get_unfollow!/1 returns the unfollow with given id" do
      unfollow = unfollow_fixture()
      assert Twitter.get_unfollow!(unfollow.id) == unfollow
    end

    test "create_unfollow/1 with valid data creates a unfollow" do
      assert {:ok, %Unfollow{} = unfollow} = Twitter.create_unfollow(@valid_attrs)
    end

    test "create_unfollow/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Twitter.create_unfollow(@invalid_attrs)
    end

    test "update_unfollow/2 with valid data updates the unfollow" do
      unfollow = unfollow_fixture()
      assert {:ok, %Unfollow{} = unfollow} = Twitter.update_unfollow(unfollow, @update_attrs)
    end

    test "update_unfollow/2 with invalid data returns error changeset" do
      unfollow = unfollow_fixture()
      assert {:error, %Ecto.Changeset{}} = Twitter.update_unfollow(unfollow, @invalid_attrs)
      assert unfollow == Twitter.get_unfollow!(unfollow.id)
    end

    test "delete_unfollow/1 deletes the unfollow" do
      unfollow = unfollow_fixture()
      assert {:ok, %Unfollow{}} = Twitter.delete_unfollow(unfollow)
      assert_raise Ecto.NoResultsError, fn -> Twitter.get_unfollow!(unfollow.id) end
    end

    test "change_unfollow/1 returns a unfollow changeset" do
      unfollow = unfollow_fixture()
      assert %Ecto.Changeset{} = Twitter.change_unfollow(unfollow)
    end
  end

  describe "follows" do
    alias SwiftInfluencer.Twitter.Follow

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def follow_fixture(attrs \\ %{}) do
      {:ok, follow} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Twitter.create_follow()

      follow
    end

    test "list_follows/0 returns all follows" do
      follow = follow_fixture()
      assert Twitter.list_follows() == [follow]
    end

    test "get_follow!/1 returns the follow with given id" do
      follow = follow_fixture()
      assert Twitter.get_follow!(follow.id) == follow
    end

    test "create_follow/1 with valid data creates a follow" do
      assert {:ok, %Follow{} = follow} = Twitter.create_follow(@valid_attrs)
    end

    test "create_follow/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Twitter.create_follow(@invalid_attrs)
    end

    test "update_follow/2 with valid data updates the follow" do
      follow = follow_fixture()
      assert {:ok, %Follow{} = follow} = Twitter.update_follow(follow, @update_attrs)
    end

    test "update_follow/2 with invalid data returns error changeset" do
      follow = follow_fixture()
      assert {:error, %Ecto.Changeset{}} = Twitter.update_follow(follow, @invalid_attrs)
      assert follow == Twitter.get_follow!(follow.id)
    end

    test "delete_follow/1 deletes the follow" do
      follow = follow_fixture()
      assert {:ok, %Follow{}} = Twitter.delete_follow(follow)
      assert_raise Ecto.NoResultsError, fn -> Twitter.get_follow!(follow.id) end
    end

    test "change_follow/1 returns a follow changeset" do
      follow = follow_fixture()
      assert %Ecto.Changeset{} = Twitter.change_follow(follow)
    end
  end

  describe "comments" do
    alias SwiftInfluencer.Twitter.Comment

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def comment_fixture(attrs \\ %{}) do
      {:ok, comment} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Twitter.create_comment()

      comment
    end

    test "list_comments/0 returns all comments" do
      comment = comment_fixture()
      assert Twitter.list_comments() == [comment]
    end

    test "get_comment!/1 returns the comment with given id" do
      comment = comment_fixture()
      assert Twitter.get_comment!(comment.id) == comment
    end

    test "create_comment/1 with valid data creates a comment" do
      assert {:ok, %Comment{} = comment} = Twitter.create_comment(@valid_attrs)
    end

    test "create_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Twitter.create_comment(@invalid_attrs)
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{} = comment} = Twitter.update_comment(comment, @update_attrs)
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = comment_fixture()
      assert {:error, %Ecto.Changeset{}} = Twitter.update_comment(comment, @invalid_attrs)
      assert comment == Twitter.get_comment!(comment.id)
    end

    test "delete_comment/1 deletes the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{}} = Twitter.delete_comment(comment)
      assert_raise Ecto.NoResultsError, fn -> Twitter.get_comment!(comment.id) end
    end

    test "change_comment/1 returns a comment changeset" do
      comment = comment_fixture()
      assert %Ecto.Changeset{} = Twitter.change_comment(comment)
    end
  end

  describe "favorites" do
    alias SwiftInfluencer.Twitter.Favorite

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def favorite_fixture(attrs \\ %{}) do
      {:ok, favorite} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Twitter.create_favorite()

      favorite
    end

    test "list_favorites/0 returns all favorites" do
      favorite = favorite_fixture()
      assert Twitter.list_favorites() == [favorite]
    end

    test "get_favorite!/1 returns the favorite with given id" do
      favorite = favorite_fixture()
      assert Twitter.get_favorite!(favorite.id) == favorite
    end

    test "create_favorite/1 with valid data creates a favorite" do
      assert {:ok, %Favorite{} = favorite} = Twitter.create_favorite(@valid_attrs)
    end

    test "create_favorite/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Twitter.create_favorite(@invalid_attrs)
    end

    test "update_favorite/2 with valid data updates the favorite" do
      favorite = favorite_fixture()
      assert {:ok, %Favorite{} = favorite} = Twitter.update_favorite(favorite, @update_attrs)
    end

    test "update_favorite/2 with invalid data returns error changeset" do
      favorite = favorite_fixture()
      assert {:error, %Ecto.Changeset{}} = Twitter.update_favorite(favorite, @invalid_attrs)
      assert favorite == Twitter.get_favorite!(favorite.id)
    end

    test "delete_favorite/1 deletes the favorite" do
      favorite = favorite_fixture()
      assert {:ok, %Favorite{}} = Twitter.delete_favorite(favorite)
      assert_raise Ecto.NoResultsError, fn -> Twitter.get_favorite!(favorite.id) end
    end

    test "change_favorite/1 returns a favorite changeset" do
      favorite = favorite_fixture()
      assert %Ecto.Changeset{} = Twitter.change_favorite(favorite)
    end
  end

  describe "tweeter_users" do
    alias SwiftInfluencer.Twitter.User

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Twitter.create_user()

      user
    end

    test "list_tweeter_users/0 returns all tweeter_users" do
      user = user_fixture()
      assert Twitter.list_tweeter_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Twitter.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Twitter.create_user(@valid_attrs)
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Twitter.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Twitter.update_user(user, @update_attrs)
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Twitter.update_user(user, @invalid_attrs)
      assert user == Twitter.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Twitter.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Twitter.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Twitter.change_user(user)
    end
  end

  describe "tweeter_fetish" do
    alias SwiftInfluencer.Twitter.Fetish

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def fetish_fixture(attrs \\ %{}) do
      {:ok, fetish} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Twitter.create_fetish()

      fetish
    end

    test "list_tweeter_fetish/0 returns all tweeter_fetish" do
      fetish = fetish_fixture()
      assert Twitter.list_tweeter_fetish() == [fetish]
    end

    test "get_fetish!/1 returns the fetish with given id" do
      fetish = fetish_fixture()
      assert Twitter.get_fetish!(fetish.id) == fetish
    end

    test "create_fetish/1 with valid data creates a fetish" do
      assert {:ok, %Fetish{} = fetish} = Twitter.create_fetish(@valid_attrs)
    end

    test "create_fetish/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Twitter.create_fetish(@invalid_attrs)
    end

    test "update_fetish/2 with valid data updates the fetish" do
      fetish = fetish_fixture()
      assert {:ok, %Fetish{} = fetish} = Twitter.update_fetish(fetish, @update_attrs)
    end

    test "update_fetish/2 with invalid data returns error changeset" do
      fetish = fetish_fixture()
      assert {:error, %Ecto.Changeset{}} = Twitter.update_fetish(fetish, @invalid_attrs)
      assert fetish == Twitter.get_fetish!(fetish.id)
    end

    test "delete_fetish/1 deletes the fetish" do
      fetish = fetish_fixture()
      assert {:ok, %Fetish{}} = Twitter.delete_fetish(fetish)
      assert_raise Ecto.NoResultsError, fn -> Twitter.get_fetish!(fetish.id) end
    end

    test "change_fetish/1 returns a fetish changeset" do
      fetish = fetish_fixture()
      assert %Ecto.Changeset{} = Twitter.change_fetish(fetish)
    end
  end
end
