defmodule LocationRouting.File.Location do
  @moduledoc """
  Example of a router that will be called by the location plug.
  """
  use LocationRoutingWeb, :router

  def is_location_plug?, do: true

  get "/file", LocationRoutingWeb.Controller.Page, :hello
end