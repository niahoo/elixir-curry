defmodule CurryTest do
  use ExUnit.Case
  use Curry

  curry add(a,b), do: a + b

  curry three(s1, s2, s3) do
  	s1 <> " " <> s2 <> " " <> s3
  end

  test "the truth" do
  	increment = add(1)
  	IO.puts "increment: #{inspect increment}"
    assert :erlang.is_function(increment)
    assert increment.(100) == 101
    assert three("I").("am").("you") == "I am you"
  end

  defp call_yourself(arg, fun) do
  	fun(arg)
  end

end
