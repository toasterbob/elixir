defmodule MyRange do
  def create(start, finish) do
    Enum.to_list start..finish
  end
end
