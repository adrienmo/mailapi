defmodule Mailapi.MailHandler do
  alias Mailapi.Database
  def init(_transport, req, []) do
    {:ok, req, nil}
  end

  def handle(req, state) do
    {email, _} = :cowboy_req.qs_val("email", req)
    {_, emails} = Enum.unzip(Database.get(email))
    {:ok, req} = :cowboy_req.reply(200, [], Poison.encode!(emails), req)

    {:ok, req, state}
  end

  def terminate(_reason, _req, _state), do: :ok
end
