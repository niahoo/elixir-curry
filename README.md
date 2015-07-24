Curry
=====

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

TODO:
 * functions guards
 * first call dotted ?
 * possibility to add more than one argument on first call
 * … on any call ?
 * `curryp` for `defp`
 * more tests
 * …
