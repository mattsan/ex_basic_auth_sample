defmodule BasicAuthSampleWeb.Router do
  use BasicAuthSampleWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug BasicAuth, use_config: {:basic_auth_sample, :basic_auth_sample_config}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BasicAuthSampleWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", BasicAuthSampleWeb do
  #   pipe_through :api
  # end
end
