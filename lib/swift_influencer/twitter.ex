defmodule SwiftInfluencer.Twitter do
  @moduledoc """
  The Twitter context.
  """

  import Ecto.Query, warn: false
  alias SwiftInfluencer.Repo

  alias SwiftInfluencer.Twitter.Influencer

  @doc """
  Returns the list of influencers.

  ## Examples

      iex> list_influencers()
      [%Influencer{}, ...]

  """
  def list_influencers do
    Repo.all(Influencer)
  end

  @doc """
  Gets a single influencer.

  Raises `Ecto.NoResultsError` if the Influencer does not exist.

  ## Examples

      iex> get_influencer!(123)
      %Influencer{}

      iex> get_influencer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_influencer!(id), do: Repo.get!(Influencer, id)

  @doc """
  Creates a influencer.

  ## Examples

      iex> create_influencer(%{field: value})
      {:ok, %Influencer{}}

      iex> create_influencer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_influencer(attrs \\ %{}) do
    %Influencer{}
    |> Influencer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a influencer.

  ## Examples

      iex> update_influencer(influencer, %{field: new_value})
      {:ok, %Influencer{}}

      iex> update_influencer(influencer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_influencer(%Influencer{} = influencer, attrs) do
    influencer
    |> Influencer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a influencer.

  ## Examples

      iex> delete_influencer(influencer)
      {:ok, %Influencer{}}

      iex> delete_influencer(influencer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_influencer(%Influencer{} = influencer) do
    Repo.delete(influencer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking influencer changes.

  ## Examples

      iex> change_influencer(influencer)
      %Ecto.Changeset{source: %Influencer{}}

  """
  def change_influencer(%Influencer{} = influencer) do
    Influencer.changeset(influencer, %{})
  end

  alias SwiftInfluencer.Twitter.Friends

  @doc """
  Returns the list of friends.

  ## Examples

      iex> list_friends()
      [%Friends{}, ...]

  """
  def list_friends do
    Repo.all(Friends)
  end

  @doc """
  Gets a single friends.

  Raises `Ecto.NoResultsError` if the Friends does not exist.

  ## Examples

      iex> get_friends!(123)
      %Friends{}

      iex> get_friends!(456)
      ** (Ecto.NoResultsError)

  """
  def get_friends!(id), do: Repo.get!(Friends, id)

  @doc """
  Creates a friends.

  ## Examples

      iex> create_friends(%{field: value})
      {:ok, %Friends{}}

      iex> create_friends(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_friends(attrs \\ %{}) do
    %Friends{}
    |> Friends.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a friends.

  ## Examples

      iex> update_friends(friends, %{field: new_value})
      {:ok, %Friends{}}

      iex> update_friends(friends, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_friends(%Friends{} = friends, attrs) do
    friends
    |> Friends.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a friends.

  ## Examples

      iex> delete_friends(friends)
      {:ok, %Friends{}}

      iex> delete_friends(friends)
      {:error, %Ecto.Changeset{}}

  """
  def delete_friends(%Friends{} = friends) do
    Repo.delete(friends)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking friends changes.

  ## Examples

      iex> change_friends(friends)
      %Ecto.Changeset{source: %Friends{}}

  """
  def change_friends(%Friends{} = friends) do
    Friends.changeset(friends, %{})
  end

  alias SwiftInfluencer.Twitter.Follower

  @doc """
  Returns the list of followers.

  ## Examples

      iex> list_followers()
      [%Follower{}, ...]

  """
  def list_followers do
    Repo.all(Follower)
  end

  @doc """
  Gets a single follower.

  Raises `Ecto.NoResultsError` if the Follower does not exist.

  ## Examples

      iex> get_follower!(123)
      %Follower{}

      iex> get_follower!(456)
      ** (Ecto.NoResultsError)

  """
  def get_follower!(id), do: Repo.get!(Follower, id)

  @doc """
  Creates a follower.

  ## Examples

      iex> create_follower(%{field: value})
      {:ok, %Follower{}}

      iex> create_follower(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_follower(attrs \\ %{}) do
    %Follower{}
    |> Follower.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a follower.

  ## Examples

      iex> update_follower(follower, %{field: new_value})
      {:ok, %Follower{}}

      iex> update_follower(follower, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_follower(%Follower{} = follower, attrs) do
    follower
    |> Follower.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a follower.

  ## Examples

      iex> delete_follower(follower)
      {:ok, %Follower{}}

      iex> delete_follower(follower)
      {:error, %Ecto.Changeset{}}

  """
  def delete_follower(%Follower{} = follower) do
    Repo.delete(follower)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking follower changes.

  ## Examples

      iex> change_follower(follower)
      %Ecto.Changeset{source: %Follower{}}

  """
  def change_follower(%Follower{} = follower) do
    Follower.changeset(follower, %{})
  end

  alias SwiftInfluencer.Twitter.Unfollow

  @doc """
  Returns the list of unfollows.

  ## Examples

      iex> list_unfollows()
      [%Unfollow{}, ...]

  """
  def list_unfollows do
    Repo.all(Unfollow)
  end

  @doc """
  Gets a single unfollow.

  Raises `Ecto.NoResultsError` if the Unfollow does not exist.

  ## Examples

      iex> get_unfollow!(123)
      %Unfollow{}

      iex> get_unfollow!(456)
      ** (Ecto.NoResultsError)

  """
  def get_unfollow!(id), do: Repo.get!(Unfollow, id)

  @doc """
  Creates a unfollow.

  ## Examples

      iex> create_unfollow(%{field: value})
      {:ok, %Unfollow{}}

      iex> create_unfollow(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_unfollow(attrs \\ %{}) do
    %Unfollow{}
    |> Unfollow.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a unfollow.

  ## Examples

      iex> update_unfollow(unfollow, %{field: new_value})
      {:ok, %Unfollow{}}

      iex> update_unfollow(unfollow, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_unfollow(%Unfollow{} = unfollow, attrs) do
    unfollow
    |> Unfollow.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a unfollow.

  ## Examples

      iex> delete_unfollow(unfollow)
      {:ok, %Unfollow{}}

      iex> delete_unfollow(unfollow)
      {:error, %Ecto.Changeset{}}

  """
  def delete_unfollow(%Unfollow{} = unfollow) do
    Repo.delete(unfollow)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking unfollow changes.

  ## Examples

      iex> change_unfollow(unfollow)
      %Ecto.Changeset{source: %Unfollow{}}

  """
  def change_unfollow(%Unfollow{} = unfollow) do
    Unfollow.changeset(unfollow, %{})
  end

  alias SwiftInfluencer.Twitter.Follow

  @doc """
  Returns the list of follows.

  ## Examples

      iex> list_follows()
      [%Follow{}, ...]

  """
  def list_follows do
    Repo.all(Follow)
  end

  @doc """
  Gets a single follow.

  Raises `Ecto.NoResultsError` if the Follow does not exist.

  ## Examples

      iex> get_follow!(123)
      %Follow{}

      iex> get_follow!(456)
      ** (Ecto.NoResultsError)

  """
  def get_follow!(id), do: Repo.get!(Follow, id)
  def get_follow_by_follows!(follows) do
    Repo.get_by(Follow, follows: follows)
  end
  @doc """
  Creates a follow.

  ## Examples

      iex> create_follow(%{field: value})
      {:ok, %Follow{}}

      iex> create_follow(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_follow(attrs \\ %{}) do
    %Follow{}
    |> Follow.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a follow.

  ## Examples

      iex> update_follow(follow, %{field: new_value})
      {:ok, %Follow{}}

      iex> update_follow(follow, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_follow(follow, attrs) do
    IO.inspect follow
    follow
    |> Follow.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a follow.

  ## Examples

      iex> delete_follow(follow)
      {:ok, %Follow{}}

      iex> delete_follow(follow)
      {:error, %Ecto.Changeset{}}

  """
  def delete_follow(%Follow{} = follow) do
    Repo.delete(follow)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking follow changes.

  ## Examples

      iex> change_follow(follow)
      %Ecto.Changeset{source: %Follow{}}

  """
  def change_follow(%Follow{} = follow) do
    Follow.changeset(follow, %{})
  end

  alias SwiftInfluencer.Twitter.Comment

  @doc """
  Returns the list of comments.

  ## Examples

      iex> list_comments()
      [%Comment{}, ...]

  """
  def list_comments do
    Repo.all(Comment)
  end

  @doc """
  Gets a single comment.

  Raises `Ecto.NoResultsError` if the Comment does not exist.

  ## Examples

      iex> get_comment!(123)
      %Comment{}

      iex> get_comment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_comment!(id), do: Repo.get!(Comment, id)

  @doc """
  Creates a comment.

  ## Examples

      iex> create_comment(%{field: value})
      {:ok, %Comment{}}

      iex> create_comment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_comment(attrs \\ %{}) do
    %Comment{}
    |> Comment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a comment.

  ## Examples

      iex> update_comment(comment, %{field: new_value})
      {:ok, %Comment{}}

      iex> update_comment(comment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_comment(%Comment{} = comment, attrs) do
    comment
    |> Comment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a comment.

  ## Examples

      iex> delete_comment(comment)
      {:ok, %Comment{}}

      iex> delete_comment(comment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_comment(%Comment{} = comment) do
    Repo.delete(comment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking comment changes.

  ## Examples

      iex> change_comment(comment)
      %Ecto.Changeset{source: %Comment{}}

  """
  def change_comment(%Comment{} = comment) do
    Comment.changeset(comment, %{})
  end

  alias SwiftInfluencer.Twitter.Favorite

  @doc """
  Returns the list of favorites.

  ## Examples

      iex> list_favorites()
      [%Favorite{}, ...]

  """
  def list_favorites do
    Repo.all(Favorite)
  end

  @doc """
  Gets a single favorite.

  Raises `Ecto.NoResultsError` if the Favorite does not exist.

  ## Examples

      iex> get_favorite!(123)
      %Favorite{}

      iex> get_favorite!(456)
      ** (Ecto.NoResultsError)

  """
  def get_favorite!(id), do: Repo.get!(Favorite, id)

  @doc """
  Creates a favorite.

  ## Examples

      iex> create_favorite(%{field: value})
      {:ok, %Favorite{}}

      iex> create_favorite(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_favorite(attrs \\ %{}) do
    %Favorite{}
    |> Favorite.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a favorite.

  ## Examples

      iex> update_favorite(favorite, %{field: new_value})
      {:ok, %Favorite{}}

      iex> update_favorite(favorite, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_favorite(%Favorite{} = favorite, attrs) do
    favorite
    |> Favorite.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a favorite.

  ## Examples

      iex> delete_favorite(favorite)
      {:ok, %Favorite{}}

      iex> delete_favorite(favorite)
      {:error, %Ecto.Changeset{}}

  """
  def delete_favorite(%Favorite{} = favorite) do
    Repo.delete(favorite)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking favorite changes.

  ## Examples

      iex> change_favorite(favorite)
      %Ecto.Changeset{source: %Favorite{}}

  """
  def change_favorite(%Favorite{} = favorite) do
    Favorite.changeset(favorite, %{})
  end

  alias SwiftInfluencer.Twitter.User

  @doc """
  Returns the list of tweeter_users.

  ## Examples

      iex> list_tweeter_users()
      [%User{}, ...]

  """
  def list_tweeter_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias SwiftInfluencer.Twitter.Fetish

  @doc """
  Returns the list of tweeter_fetish.

  ## Examples

      iex> list_tweeter_fetish()
      [%Fetish{}, ...]

  """
  def list_tweeter_fetish do
    Repo.all(Fetish)
  end

  @doc """
  Gets a single fetish.

  Raises `Ecto.NoResultsError` if the Fetish does not exist.

  ## Examples

      iex> get_fetish!(123)
      %Fetish{}

      iex> get_fetish!(456)
      ** (Ecto.NoResultsError)

  """
  def get_fetish!(id), do: Repo.get!(Fetish, id)

  @doc """
  Creates a fetish.

  ## Examples

      iex> create_fetish(%{field: value})
      {:ok, %Fetish{}}

      iex> create_fetish(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_fetish(attrs \\ %{}) do
    %Fetish{}
    |> Fetish.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a fetish.

  ## Examples

      iex> update_fetish(fetish, %{field: new_value})
      {:ok, %Fetish{}}

      iex> update_fetish(fetish, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_fetish(%Fetish{} = fetish, attrs) do
    fetish
    |> Fetish.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a fetish.

  ## Examples

      iex> delete_fetish(fetish)
      {:ok, %Fetish{}}

      iex> delete_fetish(fetish)
      {:error, %Ecto.Changeset{}}

  """
  def delete_fetish(%Fetish{} = fetish) do
    Repo.delete(fetish)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking fetish changes.

  ## Examples

      iex> change_fetish(fetish)
      %Ecto.Changeset{source: %Fetish{}}

  """
  def change_fetish(%Fetish{} = fetish) do
    Fetish.changeset(fetish, %{})
  end
end
