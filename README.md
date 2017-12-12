# LocationRouting

This is an example project demonstrating the `Location` plug. It demonstrates jumping to different modules for further routing. It is likely most useful in umbrella applications to serve multiple applications using the same endpoint but on different "locations". This allows for easy addition of an umbrella application without the need to maintain a single router.

A location is the first path after `/`. For example `/api` will route to `LocationRouting.Api.Location`. Please read [location.ex](https://github.com/tverlaan/location_routing/blob/master/lib/location_routing_web/plugs/location.ex) to see how that works.

## Start

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000/api`](http://localhost:4000/api) from your browser.

Make sure to also visit `/file`. A fallback for the root hasn't been implemented.

## Alternatives

1. You can use `forward` from the router. However that requires maintaining a single file with all forwards. That is something I like to prevent for my usecase. Another downside is that it removes the first part of the path.
2. See anoter option at [SO - How to structure a Phoenix umbrella framework for many applications](https://stackoverflow.com/questions/43491506/how-to-structure-a-phoenix-umbrella-framework-for-many-applications)

## Relevant parts

The plug itself (simplified)
```elixir
  def call(%{path_info: [path|_]} = conn, opts) do
    path = path |> String.downcase() |> Macro.camelize()
    module =
      try do
        Module.safe_concat [LocationRouting, path, Location]
      rescue
        _ -> nil
      end
    module.call(conn, opts)
  end
```

In your endpoint (before Router)
```elixir
plug LocationRoutingWeb.Location
```

Sample destination
```elixir
defmodule LocationRouting.Api.Location do
  @moduledoc """
  Example implementing the location plug behaviour.
  """
  use LocationRoutingWeb.Location

  plug :hello

  def hello(conn, opts) do
    send_resp(conn, 200, "hello #{__MODULE__}!")
  end
end
```

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
