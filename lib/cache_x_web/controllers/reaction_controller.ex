defmodule CacheXWeb.ReactionController do
use CacheXWeb, :controller

alias CacheX.Reactions
alias CacheX.Reaction.Content.Count

action_fallback CacheXWeb.FallbackController



def reaction_count(conn, %{"content_id" => id}) do
  case  Reactions.get_content_count(id) do
    {:found, result} ->
      counter = Count.new(id, result)
      render(conn, "reaction_counter.json", reaction_counter: counter)

    {:not_found} -> {:error, :not_found}

    _ -> {:error, :unprocessable}

  end

end

  defp refine_reaction(params) do
    case params["action"] do
      "add" -> params |> Map.put("action", :add)
      "remove" -> params |> Map.put("action", :remove)
      _ ->  params |> Map.put("action", :add)
    end
  end

  def react(conn,  reaction_params) do
    refined_reaction = reaction_params
    |> refine_reaction

    case  Reactions.add_reaction(refined_reaction) do
      true ->
        conn
        |> send_resp(:created, "")

      _ -> {:error, :unprocessable}
    end

  end


end
