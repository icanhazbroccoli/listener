defmodule Listener do
  use Application

  def start( _type, _args ) do
    import Supervisor.Spec, warn: false

    children = [
      worker( Listener.Net.Tcp, [] )
    ]

    opts = [ strategy: :one_for_one, name: Listener.Supervisor ]
    Supervisor.start_link( children, opts )
  end
end
