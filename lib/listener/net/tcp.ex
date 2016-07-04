defmodule Listener.Net.Tcp do
  
  def start_link do
    opts = [ port: 8000 ]
    { :ok, _ } = :ranch.start_listener(
      :Listener,
      100,
      :ranch_tcp,
      opts,
      Listener.Handler.Tcp,
      []
    )
  end

end
