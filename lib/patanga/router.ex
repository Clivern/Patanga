# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Patanga.Router do
  use Plug.Router

  require Logger

  plug(:match)
  plug(Plug.Parsers, parsers: [:urlencoded, :multipart])
  plug(:dispatch)

  def log_request(conn, _opts) do
    Logger.info("Processing #{conn.method} #{conn.request_path}")
    conn
  end

  plug(:log_request)

  get "/" do
    Patanga.Home.call(conn, conn.body_params)
  end

  get "/_ready" do
    Patanga.Ready.call(conn, conn.body_params)
  end

  get "/_health" do
    Patanga.Health.call(conn, conn.body_params)
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
