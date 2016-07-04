defmodule Queue.Worker do
  
  use GenServer

  def push( data ) do
    GenServer.cast( __MODULE__, { :push, data } )
  end

  def slice do
    GenServer.call( __MODULE__, :slice )
  end

  def handle_cast( { :push, data }, state ) do
    { :noreply, state ++ [ data ] }
  end

  def handle_call( :slice, _from, state ) do
    { :reply, state, [] }
  end

  def start_link( state ) do
    GenServer.start_link( __MODULE__, state, name: __MODULE__ )
  end

end

