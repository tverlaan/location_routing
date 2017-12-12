defmodule LocationRoutingWeb.Location do
  @moduledoc """
  This module is two things:
    - a behaviour for a "Location" plug
    - a plug you can put in your endpoint to use that "Location" for further routing
  """  

  defmacro __using__(_) do
    quote do
      use Plug.Builder

      def is_location_plug?, do: true
    end
  end

  def init(options) do
    options
  end

  def call(%{path_info: [path|_]} = conn, opts) do
    path = path |> String.downcase() |> Macro.camelize()
    
    module =
      try do
        Module.safe_concat [LocationRouting, path, Location]
      rescue
        _ -> nil
      end
    
    call(module, conn, opts)
  end

  def call(conn, opts) do
    conn
  end

  def call(nil, conn, _), do: conn
  def call(module, conn, opts) do
    if module.is_location_plug? do
      module.call(conn, opts)
    else
      conn
    end
  end

end