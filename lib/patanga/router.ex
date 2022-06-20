# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Patanga.Router do
  use Plug.Router

  require Logger

  plug(:match)
  plug(:dispatch)

  get "/" do
    Logger.info("Incoming request to /")
    Patanga.Home.call(conn, conn.body_params)
  end

  get "/_ready" do
    Logger.info("Incoming request to /_ready")
    Patanga.Ready.call(conn, conn.body_params)
  end

  get "/_health" do
    Logger.info("Incoming request to /_health")
    Patanga.Health.call(conn, conn.body_params)
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
