defmodule ChatServer do
  @moduledoc """
  Documentation for ChatServer.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ChatServer.hello
      :world

  """
  defmodule Message do
    defstruct content: "", username: "anon"
  end

  def hello do
    :world
  end

  def loop do
    loop([])
  end

  def loop(state) do
    receive do
      {:get, from} ->
        send(from, state)
        loop(state)
      {:create, message} ->
        if is_map(message) do
          structure = struct(Message, message)
          loop(state ++ [structure])
        else
          structure = %Message{content: message}
          loop(state ++ [structure])
        end
    end
  end

end
