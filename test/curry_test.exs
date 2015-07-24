defmodule CurryTest do
  use ExUnit.Case
  use Curry

  curry add(a,b), do: a + b

  curryp three(s1, s2, s3) do
  	s1 <> " " <> s2 <> " " <> s3
  end

  test "the truth" do
  	increment = add(1)
    assert :erlang.is_function(increment)
    assert increment.(100) == 101
    assert three("I").("am").("you") == "I am you"
  end

end
