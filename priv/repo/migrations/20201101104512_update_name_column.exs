defmodule Cities.Repo.Migrations.UpdateNameColumn do
  use Ecto.Migration

  def change do
    rename table(:cities), :name, to: :city_name
  end
end
