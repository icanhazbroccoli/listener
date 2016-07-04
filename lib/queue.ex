defmodule Queue do

  use Application

  def start_link( state ) do
    import Supervisor.Spec, warn: false

    children = [
      worker( Queue.Worker, [ state ] )
    ]

    opts = [ strategy: :one_for_one, name: Queue ]
    Supervisor.start_link( children, opts )
  end

end
