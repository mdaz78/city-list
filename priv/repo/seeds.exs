# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Cities.Repo.insert!(%Cities.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Cities.Repo
alias Cities.Cities.List

"priv/seed_data/city-list.json"
|> File.read!()
|> Jason.decode!()
|> Enum.each(fn city_list ->
  city_id = city_list["id"]
  lat = city_list["coord"]["lat"]
  lon = city_list["coord"]["lon"]
  city_name = city_list["name"] |> String.capitalize() || ""
  state = city_list["state"] |> String.capitalize() || ""
  country = city_list["state"] |> String.capitalize() || ""

  %List{
    city_id: city_id |> Kernel.to_string(),
    lat: lat,
    lon: lon,
    city_name: city_name,
    state: state,
    country: country
  }
  |> Repo.insert!()
end)
