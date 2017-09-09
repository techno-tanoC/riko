defmodule ESpec.Phoenix.Extend do
  def model do
    quote do
      alias Riko.Repo
    end
  end

  def controller do
    quote do
      alias Riko
      import Riko.Router.Helpers

      @endpoint Riko.Endpoint
    end
  end

  def view do
    quote do
      import Riko.Router.Helpers
    end
  end

  def channel do
    quote do
      alias Riko.Repo

      @endpoint Riko.Endpoint
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
