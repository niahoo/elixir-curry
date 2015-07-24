Curry
=====

### Howto

Curry allows you to define curried functions :

```elixir
defmodule Curry.Example do

  # 1. Use the Curry module
  use Curry

  # 2. use 'curry' instead of 'def' to define functions
  curry add(a,b), do: a + b

  # also, use 'curryp' instead of 'defp'
  curryp secret(replaced, by, sentence) do
    sentence |> String.replace(replaced, by)
  end

  def test do
    # 3. The first call is not 'dotted'
    increment = add(1)

    # 4. The following calls are 'dotted'
    100 = increment.(99)

    encoder = secret("o").("_")
    "hell_" = encoder.("hello")
  end

end
```

### Limitations

It is not currently possible to curry functions with multiple clauses, or
functions that share their name with arity/1 functions.

Look at the following definitions, we have a defaut loop repetition amount
amount, and a match on the value `0` to stop the loop :

```elixir
curry loop(value, 0), do: :ok
curry loop(value, i) do
  do_something(value)
  loop(value, i - 1)
end

def loop(value), do: loop(value, @default_loop_repeat)
```

The currying macro will rewrite it as the following :

```elixir
def loop(value), do: fn (0) -> :ok end
def loop(value) do
  fn (i) ->
    do_something(value)
    loop(value, i - 1)
  end
end

def loop(value), do: loop(value, @default_loop_repeat)
```

So, the first `loop/1` definition will always match, and always return a `fn` that will only accept `0`.

Plus, the original `loop/1` isn't available no more.

The next version will define curried functions with 0-arity, which will be more convenient in most cases.

### Todo

 * Dotted first call (curried function with arity = 0) ?
 * Functions guards
 * Possibility to add more than one argument on first call
 * … on any call ?
 * More tests
