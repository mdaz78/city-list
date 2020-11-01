defmodule CitiesWeb.CityController do
  use CitiesWeb, :controller
  alias Cities.Cities, as: City

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def get_list_of_cities(conn, params) do
    query = params["q"]

    if !is_nil(query) do
      list_of_cities =
        query
        |> Jason.decode!()
        |> String.capitalize()
        |> City.get_city_list()

      json(conn, list_of_cities)
    else
      error =
        %{
          error: "Missing query parameter"
        }
        |> Jason.encode!()

      conn = conn |> put_status(500)
      json(conn, error)
    end
  end
end
