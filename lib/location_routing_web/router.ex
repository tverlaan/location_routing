defmodule LocationRoutingWeb.Router do
  use LocationRoutingWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LocationRoutingWeb do
    pipe_through :api
  end
end
