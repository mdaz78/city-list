defmodule Cities.Repo do
  use Ecto.Repo,
    otp_app: :cities,
    adapter: Ecto.Adapters.Postgres
end
