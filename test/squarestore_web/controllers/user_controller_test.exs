defmodule SquarestoreWeb.UserControllerTest do
use SquarestoreWeb.ConnCase

alias Squarestore.Identity

@create_attrs %{fname: "some fname", lname: "some lname", password: "some password", phone: "some phone", wishlist: %{}}
@update_attrs %{fname: "some updated fname", lname: "some updated lname", password: "some updated password", phone: "some updated phone", wishlist: %{}}
  @invalid_attrs %{fname: nil, lname: nil, password: nil, phone: nil, wishlist: nil}

  def fixture(:user) do
      {:ok, user} = Identity.create_user(@create_attrs)
      user
  end
end
