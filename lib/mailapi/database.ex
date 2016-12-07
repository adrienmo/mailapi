defmodule Mailapi.Database do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, nil, [name: __MODULE__])
  end

  def init(state) do
    ets_options = [:public, :duplicate_bag, :named_table,
      {:write_concurrency, true}]
    :ets.new(__MODULE__, ets_options)
    {:ok, state}
  end

  def add(key, element) do
    :ets.insert(__MODULE__, {key, element})
  end

  def get(key) do
    :ets.lookup(__MODULE__, key)
  end
end
