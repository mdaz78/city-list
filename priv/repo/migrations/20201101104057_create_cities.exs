defmodule Cities.Repo.Migrations.CreateCities do
  use Ecto.Migration

  def change do
    create table(:cities) do
      add :lat, :float
      add :lon, :float
      add :country, :string
      add :city_id, :integer
      add :name, :string
      add :state, :string

      timestamps()
    end

  end
end
