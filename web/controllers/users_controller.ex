defmodule Recurrent.UserController do
  @moduledoc """
  """
  use Recurrent.Web, :controller
  alias Recurrent.User

  def new(conn, _params) do
    render conn, "new.html", changeset: User.register_changeset(%User{})
  end

  def create(conn, %{"user" => user_params}) do
    result =
      %User{}
      |> User.register_changeset(user_params)
      |> Repo.insert()

    case result do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "Registration successful")
        |> redirect(to: session_path(conn, :new))
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end
end
