defmodule GenServers.Stack do
  use GenServer

  # Client
  def start_link(initial_stack) when is_list(initial_stack) do
    GenServer.start_link(__MODULE__, initial_stack)
  end

  def push(pid, elem) do
    GenServer.cast(pid, {:push, elem})
  end

  def pop(pid) do
    GenServer.call(pid, :pop)
  end

  # Server
  @impl true
  def init(stack) do
    {:ok, stack}
  end

  # sinc functions
  @impl true
  def handle_call({:push, elem}, _from, stack) do
    new_stack = [elem | stack]
    {:reply, new_stack, new_stack}
  end

  @impl true
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  def handle_call(:pop, _from, []) do
    {:reply, nil, []}
  end

  # async functions
  @impl true
  def handle_cast({:push, elem}, stack) do
    new_stack = [elem | stack]
    {:noreply, new_stack}
  end

  @impl true
  def handle_cast(:pop, [_head | tail]) do
    {:noreply, tail}
  end

  @impl true
  def handle_cast(:pop, []) do
    {:noreply, []}
  end
end
