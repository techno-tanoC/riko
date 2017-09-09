defmodule Riko.Accounts.Item do
  use Ecto.Schema
  import Ecto.Changeset
  alias Riko.Accounts.Item


  schema "items" do
    field :title, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(%Item{} = item, attrs) do
    item
    |> cast(attrs, [:title, :url])
    |> validate_required([:title, :url])
  end
end
