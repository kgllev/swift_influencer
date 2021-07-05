defmodule SwiftInfluencer.AppsTest do
  use SwiftInfluencer.DataCase

  alias SwiftInfluencer.Apps

  describe "twitters" do
    alias SwiftInfluencer.Apps.Twitter

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def twitter_fixture(attrs \\ %{}) do
      {:ok, twitter} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Apps.create_twitter()

      twitter
    end

    test "list_twitters/0 returns all twitters" do
      twitter = twitter_fixture()
      assert Apps.list_twitters() == [twitter]
    end

    test "get_twitter!/1 returns the twitter with given id" do
      twitter = twitter_fixture()
      assert Apps.get_twitter!(twitter.id) == twitter
    end

    test "create_twitter/1 with valid data creates a twitter" do
      assert {:ok, %Twitter{} = twitter} = Apps.create_twitter(@valid_attrs)
    end

    test "create_twitter/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Apps.create_twitter(@invalid_attrs)
    end

    test "update_twitter/2 with valid data updates the twitter" do
      twitter = twitter_fixture()
      assert {:ok, %Twitter{} = twitter} = Apps.update_twitter(twitter, @update_attrs)
    end

    test "update_twitter/2 with invalid data returns error changeset" do
      twitter = twitter_fixture()
      assert {:error, %Ecto.Changeset{}} = Apps.update_twitter(twitter, @invalid_attrs)
      assert twitter == Apps.get_twitter!(twitter.id)
    end

    test "delete_twitter/1 deletes the twitter" do
      twitter = twitter_fixture()
      assert {:ok, %Twitter{}} = Apps.delete_twitter(twitter)
      assert_raise Ecto.NoResultsError, fn -> Apps.get_twitter!(twitter.id) end
    end

    test "change_twitter/1 returns a twitter changeset" do
      twitter = twitter_fixture()
      assert %Ecto.Changeset{} = Apps.change_twitter(twitter)
    end
  end
end
