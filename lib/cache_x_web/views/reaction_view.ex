defmodule CacheXWeb.ReactionView do
  use CacheXWeb, :view
  alias CacheXWeb.ReactionView


  # def render("reaction.json", %{reaction: reaction}) do
  #   %{action: reaction.action,
  #   content_id: reaction.content_id,
  #   user_id: reaction.user_id,
  #   reaction_type: "fire"}
  # end

  def render("reaction_counter.json", %{reaction_counter: reaction_counter}) do
    reaction_counter
  end


end
