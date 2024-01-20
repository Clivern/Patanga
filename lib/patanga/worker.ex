# Copyright 2022 Clivern. All rights reserved.
# Use of this source code is governed by the MIT
# license that can be found in the LICENSE file.

defmodule Patanga.Worker do
  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  ## Callbacks
  @impl true
  def init(state) do
    # %{key: "value"}
    IO.inspect(state)

    IO.puts("Worker Started ...")

    schedule_work()

    {:ok, state}
  end

  @impl true
  def handle_info(:work, state) do
    # Reschedule once more
    schedule_work()

    # Do the desired work here
    IO.puts("Process Task")
    # %{key: "value"}
    IO.inspect(state)

    {:noreply, state}
  end

  defp schedule_work do
    # We schedule the work to happen in 60 seconds
    Process.send_after(self(), :work, 60 * 1000)
  end
end
