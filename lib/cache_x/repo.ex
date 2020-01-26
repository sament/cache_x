defmodule CacheX.Repo do
  use Ecto.Repo,
    otp_app: :cache_x,
    adapter: Ecto.Adapters.Postgres
end
