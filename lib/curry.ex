defmodule Curry do
  @moduledoc """
  About the module
  """

  defmacro __using__(_) do
    quote do
      import Curry, only: [curry: 2]
    end
  end

  defmacro curry(head, do: body) do
    IO.puts "head: #{inspect head}"
    {fname, _, fargs} = head
    arity = length(fargs)
    if (arity == 0) do
      raise ArgumentError, "cannot curry a function when its arity is 0"
    end
    {fname, ctx, [arg1|args_rest]} = head
    small_head = {fname,ctx,[arg1]}
    body = make_fns(args_rest, body)
    quote do
      def unquote(small_head), do: unquote(body)
    end
  end

  defp make_fns([last_arg], body) do
    IO.puts "last_arg: #{inspect last_arg}"
    quote do
      fn unquote(last_arg) ->
        unquote(body)
      end
    end
  end

  defp make_fns([arg|args], body) do
    IO.puts "arg: #{inspect arg}"
    body = make_fns(args, body)
    quote do
      fn unquote(arg) ->
        unquote(body)
      end
    end
  end

end
