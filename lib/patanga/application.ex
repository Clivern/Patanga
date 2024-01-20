# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Patanga.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do
    children = [
      # Background Worker
      {Patanga.Worker, %{key: "value"}},
      {Plug.Cowboy, scheme: :http, plug: Patanga.Router, options: [port: 8080]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Patanga.Supervisor]

    Logger.info("Starting application...")

    Supervisor.start_link(children, opts)
  end
end
