defmodule Recurrent.AuthHandler do
  @moduledoc """
  """
  use Recurrent.Web, :controller

  def unauthenticated(conn, _params) do
    conn
    |> put_flash(:error, "Authentication required")
    |> redirect(to: session_path(conn, :new))
  end
end
