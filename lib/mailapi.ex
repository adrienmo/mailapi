defmodule Mailapi do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    dispatch = :cowboy_router.compile([
                 {:_, [
                   {"/", Mailapi.HomeHandler, []},
                   {"/mail", Mailapi.MailHandler, []}
                 ]}
               ])
    {:ok, _} = :cowboy.start_http(:http, 100,
                                  [port: 8080],
                                  [env: [dispatch: dispatch]])

    opts = [
      strategy: :one_for_one,
      max_restarts: 1_000_000,
      max_seconds: 1,
      name: Mailapi.Supervisor
    ]

    children = [
      worker(Mailapi.Database, [], []),
      worker(Mailapi.SmtpServer, [], restart: :transient)
    ]

    Supervisor.start_link(children, opts)
  end
end
