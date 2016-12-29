defmodule Recurrent.SessionController do
  @moduledoc """
  """
  use Recurrent.Web, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, params) do
  end

  def delete(conn, _params) do
  end

end
