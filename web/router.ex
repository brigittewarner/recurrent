defmodule Recurrent.Router do
  use Recurrent.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :browser_session do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :auth do
    plug Guardian.Plug.EnsureAuthenticated, handler: Recurrent.AuthHandler
  end

  scope "/admin", Recurrent.Admin do
    pipe_through [:browser, :browser_session, :auth]
    get "/", PageController, :index, as: "admin"
  end

  scope "/", Recurrent do
    pipe_through :browser # Use the default browser stack

    resources "/users", UserController, only: [:new, :create]
     resources "/sessions", SessionController, only: [:new, :create, :delete]
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Recurrent do
  #   pipe_through :api
  # end
end
