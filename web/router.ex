defmodule Recurrent.Router do
  use Recurrent.Web, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session  # Add this
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true # Add this
  end
  # Add this block
  scope "/" do
    pipe_through :browser
    coherence_routes
  end

  # Add this block
  scope "/" do
    pipe_through :protected
    coherence_routes :protected
  end

  scope "/", Recurrent do
    pipe_through :browser
    get "/", PageController, :index
    # Add public routes below
  end

  scope "/", Recurrent do
    pipe_through :protected
    # Add protected routes below
  end

  pipeline :api do
    plug :accepts, ["json"]
  end
end
