defmodule LocationRoutingWeb.Controller.Page do
  use LocationRoutingWeb, :controller

  def hello(conn, opts) do
    send_resp(conn, 200, "hello #{__MODULE__}")
  end
end