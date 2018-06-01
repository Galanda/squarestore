defmodule Squarestore.Identity.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :fname, :string
    field :lname, :string
    field :password, :string
    field :phone, :string
    field :wishlist, :map

    timestamps()
  end
end
