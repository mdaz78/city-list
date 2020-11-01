defmodule Cities.Cities do
  alias Cities.Repo
  import Ecto.Query
  alias Cities.Cities.List

  def get_city_list(query) do
    name = query |> String.capitalize()
    name = "#{name}%"

    Repo.all(from c in List, where: ilike(c.city_name, ^name), limit: 7)
    |> convert_to_list_of_map
    |> format_response()
  end

  defp convert_to_list_of_map(list) do
    Enum.map(list, fn struct ->
      struct_to_map(struct)
    end)
  end

  defp struct_to_map(struct) do
    object =
      ((Map.has_key?(struct, :__meta__) && Map.from_struct(struct)) || struct)
      |> Map.delete(:__meta__)

    for {key, val} <- object, into: %{}, do: {(is_atom(key) && Atom.to_string(key)) || key, val}
  end

  defp format_response(list) do
    Enum.map(list, fn response ->
      response
      |> Map.delete("inserted_at")
      |> Map.delete("updated_at")
      |> Map.delete("id")
      |> Map.delete("lat")
      |> Map.delete("lon")
    end)
  end
end
