defmodule CacheXWeb.FallbackController do
 @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  """
  use CacheXWeb, :controller



  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(CacheXWeb.ErrorView)
    |> render(:"404")
  end

  def call(conn, {:error, :unprocessable}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(CacheXWeb.ErrorView)
    |> render(:"422")
  end

end
