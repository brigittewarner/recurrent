defmodule Recurrent.Admin.PageController do
  use Recurrent.Web, :controller

  def index(conn, _params) do
    current_user = Guardian.Plug.current_resource(conn)

    render conn, "index.html"
  end
end
