# Arina (renaming the  project)

=== A USECASE

You can also look at this as a way to answer "What is going on?" in an organisation.


Imagine an industrial kitchen that sets gas on and off, and wants to keep track of actively engaged staff.

**Tracking becomes harder as the frequency of concurrent activities increase.


How do we tackle this problem?

Macros can be built with a microsoft Excel spreedsheet using Visual Basic for Application. 
But it limits you. 
How do we handle entries from mobile/web apps, sensors from IOT(internet of things) devices?


Ability to handle volume effeciently is at the heart of communication.

===
Here is a simple, fast, concurrent and scalable Phoenix based microservice that mantains an in-memory cache of users who have reacted to content.

This experimental project takes a basic dive at solving this problem digitally with an API that is powered by Erlang's Open Telecom Platform(OTP).
You can image various use cases. 

Elixir runs on BEAM (Erlang's Virtual Machine)

Using Erlang Term Storage(ETS) we are able to have a battled tested in-memory store capable of handling concurrent requests.


Internally I am able to process some expensive operations asynchronously. This aproach makes execution timefaster. [Lazy operations over eager]



Some food data

===

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

===
NOTE: This service can be optimized further for multiple nodes and backpressure


To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
