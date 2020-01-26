defmodule CacheX.Reaction.Content.Count do
  # use Ecto.Schema
  # import Ecto.Changeset
  # import String.Chars

  alias CacheX.Reaction.Content.Count
  @derive Jason.Encoder
  defstruct [
    :content_id, :reaction_count
  ]


  def new(content_id, count) do
    %Count{
      content_id: content_id,
      reaction_count: %{"fire": count}
    }
  end
end
