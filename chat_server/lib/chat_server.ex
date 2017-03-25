defmodule ChatServer do

  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, :ok, name: :chat_room)
  end

  def get do
     GenServer.call(:chat_room, {:get})
  end

  def create(content) do
    GenServer.cast(:chat_room, {:create, content})
  end

  def init(:ok) do
    {:ok, []} 
  end

  def handle_call(request, who, state) do

  end

  def handle_cast(request, state) do

  end

  defmodule Message do
    defstruct content: "", username: "anon"
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

# c("chat_server.ex")
