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


defmodule MyList do
  def sum([]) do
    0
  end

  def sum(list) do
    [head|tail] = list
    head + sum(tail)
  end

  def my_reduce([], acc, func) do
    acc
  end

  def my_reduce(list, acc, func) do
    [head|tail] = list
    my_reduce(tail, func.(head, acc), func)
  end

  def my_select([], result, func) do
    result
  end

  def my_select(list, func) do
    my_select(list, [], func)
  end

  def my_select(list, result, func) do
    [head|tail] = list
    if func.(head) do
      my_select(tail, result ++ [head], func)
    else
      my_select(tail, result, func)
    end

  end

end
