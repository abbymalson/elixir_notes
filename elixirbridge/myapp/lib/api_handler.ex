defmodule Myapp.ApiHandler do
  use GenServer
  def init(args) do
    {:ok, args}
  end

  def terminate(reason, state) do
    :ok
  end



  def handle_call({:get_poke, id_or_name}, _pid, state) do
    IO.inspect(id_or_name)
    {:ok, response} = get_poke_request(id_or_name)
    {:reply, response, state}
  end


  def get_poke_request(id) do
    IO.inspect(id)
    url = api_route("#{id}")
    IO.inspect(url)
    case HTTPoison.get(url, [], []) do
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect("Error: " <> reason)
        {:error, reason}
      {:ok, %HTTPoison.Response{body: body}} ->
        IO.inspect("ok: " <> body)
        {:ok, body }
    end
  end

  def get_pokemon(id_or_name) do
    GenServer.call(__MODULE__, {:get_poke, id_or_name})
  end

  


  
  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__) 
  end

  defp api_route(path) do
    #"http://pokeapi.co/api/v2/#{path}"
    "https://anapioficeandfire.com/api/characters/#{path}"
  end

end
