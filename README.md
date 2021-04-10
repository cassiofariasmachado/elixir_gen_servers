# Elixir GenServers

An experiment using Elixir GenServers.

## Using Server directly

### Starting Iex

``` powershell
iex.bat -S mix
# or
iex -S mix
```

### Creating alias for Stack

```elixir
alias GenServers.Stack
``` 

### Creating GenServer process

```elixir
{:ok, pid} = GenServer.start_link(Stack, [])
```

### Push elem to stack (sync)

Executes `handle_call` function.

```elixir
GenServer.call(pid, {:push, 1})
GenServer.call(pid, {:push, 2})
GenServer.call(pid, {:push, 3})
```

### Push elem to stack (async)

Executes `handle_cast` function.

```elixir
GenServer.cast(pid, {:push, 1})
GenServer.cast(pid, {:push, 2})
GenServer.cast(pid, {:push, 3})
```

### Pop elem from stack (sync)

Executes `handle_call` function.

```elixir
GenServer.call(pid, :pop)
```

### Pop elem from stack (async)

Executes `handle_cast` function.

```elixir
GenServer.cast(pid, :pop)
```

## Using Client

### Starting Iex

``` powershell
iex.bat -S mix
# or
iex -S mix
```

### Creating alias for Stack

```elixir
alias GenServers.Stack
```

### Starting Stack process

```elixir
{:ok, pid} = Stack.start_link([])
```

### Push elem

```elixir
Stack.push(pid, 1)
Stack.push(pid, 2)
Stack.push(pid, 3)
```

### Pop elem

```elixir
Stack.pop(pid)
```