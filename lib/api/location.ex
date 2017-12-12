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