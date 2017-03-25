defmodule MyRange do
  def create(start, finish) do
    Enum.to_list start..finish
  end
end

defmodule FizzBuzz do
  def fizz_buzz([]) do
    []
  end

  def fizz_buzz(range) do
    [head|tail] = Enum.to_list range
    [fb_check(head) | fizz_buzz(tail)]
  end

  def fb_check(head) when rem(head, 15) == 0 do
    "FIZZBUZZ"
  end

  def fb_check(head) when rem(head, 3) == 0 do
    "FIZZ"
  end

  def fb_check(head) when rem(head, 5) == 0 do
    "BUZZ"
  end

  def fb_check(head) do
    head
  end


end
