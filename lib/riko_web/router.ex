defmodule RikoWeb.Router do
  use RikoWeb, :router

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

  scope "/", RikoWeb do
    pipe_through :browser # Use the default browser stack

    get "/", ItemController, :index
    resources "/items", ItemController
  end

  # Other scopes may use custom stacks.
  # scope "/api", RikoWeb do
  #   pipe_through :api
  # end
end
