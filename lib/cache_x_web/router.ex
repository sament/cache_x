defmodule CacheXWeb.Router do
  use CacheXWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1", CacheXWeb do
    pipe_through :api

    post "/reaction", ReactionController, :react
    get "/reaction/reaction_counts/:content_id", ReactionController, :reaction_count


    # http://localhost:4000/api/v1/reaction/reaction_counts/iidd0kdj
  end

end
