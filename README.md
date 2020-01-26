# CacheX
A phoenix based microservice that mantains an in-memory cache of users who have reacted to content.

Think Instagram likes, Medium claps etc


To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
Post reactions with post http://localhost:4000/api/v1/reaction

    JSON payload for adding a fire action on Stew by Sam  
    {
      "type": "reaction",
      "action": "add",
      "content_id": "Stew",
      "user_id": "Sam",
      "reaction_type": "fire"
    }

    JSON payload for removing a fire action on Stew by Sam
    {
      "type": "reaction",
      "action": "remove",
      "content_id": "Stew",
      "user_id": "Sam",
        "reaction_type": "fire"
    }

    A count of all users who have added fire to their Stew and not removed 
    HTTP GET reaction/reactions_count/content_id
    Returns the following response. A count of unique users who added fire reaction to Stew and did not later remove it
    {
      "content_id": "Stew",
      "reaction_count": {"fire": 3}
    } 



Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
