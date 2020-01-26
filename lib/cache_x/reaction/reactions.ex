defmodule CacheX.Reactions do

  alias CacheX.Reaction
  alias CacheX.Cache.Storage



  def add_reaction(reaction_params) do

    Storage.add(
      reaction_params["content_id"],
      reaction_params["user_id"],
      reaction_params["action"])

  end

  def get_content_count(content_id) do
    Storage.get_content_fire_counts(content_id)
  end


end
