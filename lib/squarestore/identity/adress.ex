defmodule Squarestore.Identity.Adress do
  use Ecto.Schema
  import Ecto.Changeset


  schema "adresses" do
    field :adress, :string
    field :postnumber, :integer
    field :country, :string
    field :city, :string

    timestamps()
  end
end
