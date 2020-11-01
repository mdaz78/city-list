defmodule Cities.Cities.List do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cities" do
    field :city_id, :string
    field :country, :string
    field :lat, :float
    field :lon, :float
    field :city_name, :string
    field :state, :string

    timestamps()
  end

  @doc false
  def changeset(list, attrs) do
    list
    |> cast(attrs, [:lat, :lon, :country, :city_id, :city_name, :state])
    |> validate_required([:city_id, :city_name])
  end
end
