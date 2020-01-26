defmodule CacheX.Cache.Storage do

  use GenServer

  @moduledoc """
  Logic for caching and counting reactions in a GenServer process
  ETS is already optimized for concurrency.
  Noitice get and put operations don’t go through the server process (handle_call).
  This means multiple clients can work with the key/value store simultaneously, without blocking each othe.

  Operations working on different keys can be executed in parallel.
  Multiple operations working on the same key will be properly synchronized to prevent
  possible race conditions.
  """


@name :reactions_cache


  @doc """
  Starts the table owner process
  """

def start_link(_) do
  GenServer.start_link(__MODULE__, nil, name: @name)
end

#Creates table
def init(_) do
  :ets.new(@name, [:set, :public, :named_table, write_concurrency: true])
  {:ok, nil}
end



defp get(key) do
  case :ets.lookup(@name, key) do
    [] -> {:not_found}
    [{_key, result}] -> {:found, result}
  end
end

defp set(key, value) do
  true = :ets.insert(@name, {key, value})
end


def add(content_id, user_id, action \\ :add) do
  reaction = create_reaction(content_id, user_id, action)

  case get(content_id) do
    {:not_found} ->
       new_list = preppend_list([], reaction)
      set(content_id, new_list)

    {:found, result} ->
      new_list = preppend_list(result, reaction)
      set(content_id, new_list)

      _ ->  false

    end

end

def get_content_fire_counts(content_id) do
  case get(content_id) do
    {:not_found} -> {:not_found}
    {:found, result} ->{:found, compute_count(result)}

    _ -> {:error, :unkown}

  end
    #check for add where remove don't occue
end

defp compute_count(list) do

  #remove duplicate rows
   u_list =
  list
  |> Enum.uniq()

   #fetch users with remove action
  unfired  =
  Enum.filter(u_list, fn i -> i.action == :remove end)
  |> Enum.map(fn i -> i.user_id end)

  #fetch all users with add action
  fired =
  Enum.filter(u_list, fn i -> i.action == :add end)
  |> Enum.map(fn i -> i.user_id end)

  #remove users who fired remove
  case fired -- unfired  do
    [] -> 0
    unique_fired -> length unique_fired
  end

end


defp preppend_list(old_list, item) when is_list(old_list) do
  [item] ++ old_list  #preppending is faster
end

#creates the reaction payload to be added to cache
defp create_reaction(content_id, user_id, reaction) do
  %{
    action: reaction,
    content_id: content_id,
    user_id: user_id,
    reaction_type: "fire",
    timestamp: DateTime.utc_now()
}
end



end
