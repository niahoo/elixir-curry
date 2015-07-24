Curry
=====

Curry allow you to define functions that are automatically curried :

```elixir

defmodule Curry.Lol do

  # 1. Use the Curry module
  use Curry

  # 2. use 'curry' instead of 'def' to define functions
  curry add(a,b), do: a + b

  def test do
    # 3. The first call is not 'dotted'
    increment = add(1)

    # 4. The following calls are 'dotted'
    100 = increment.(99)
  end

end

```

TODO:
 * functions guards
 * first call dotted ?
 * possibility to add more than one argument on first call
 * … on any call ?
 * more tests
 * …
