defmodule RestServerWeb.UserController do
  use RestServerWeb, :controller

  @users [%{id: 1, username: "Bob"}, %{id: 2, username: "Jeff"}]

  def index(conn, params) do
    send_resp(conn, 200, Jason.encode!(%{"data" => @users}))
  end

  def show(conn, %{"id" => id}) do
    data = Enum.find(@users, &(&1.id === String.to_integer(id)))

    send_resp(
      conn,
      200,
      Jason.encode!(%{"data" => Enum.find(@users, &(&1.id === String.to_integer(id)))})
    )
  end

  def create(conn, %{"username" => username}) do
    new_user = %{"id" => 4, "username" => username}

    send_resp(conn, 201, Jason.encode!(%{"data" => new_user}))
  end

  def update(conn, %{"id" => id, "username" => new_username}) do
    found = Enum.find(@users, &(&1.id === String.to_integer(id)))
    send_resp(conn, 204, Jason.encode!(""))
  end

  def delete(conn, %{"id" => id}) do
    send_resp(conn, 204, [])
  end
end
