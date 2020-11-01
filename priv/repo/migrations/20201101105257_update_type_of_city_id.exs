defmodule Cities.Repo.Migrations.UpdateTypeOfCityId do
  use Ecto.Migration

  def change do
    alter table(:cities) do
      modify :city_id, :string
    end
  end
end
