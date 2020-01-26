defmodule CacheX.Reaction do

  @derive Jason.Encoder
  defstruct [:type, :action,
    :content_id, :user_id, :reaction_type
  ]


  # def new(content_id, user_id, action) do
  #   %Reaction{
      # type: "reaction",
      # action: action,
      # content_id: content_id,
      # user_id: user_id,
      # reaction_type: "fire",
  #   }
  # end


end
