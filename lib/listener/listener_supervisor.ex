defmodule Elixirbot.Listener.ListenerSupervisor do
  @behaviour :supervisor

  require :supervisor
  require :application

  import GenX.Supervisor

  @spec start_link() :: pid()
  def start_link() do
    {:ok, _} = :supervisor.start_link(__MODULE__, nil)
  end

  @spec init(nil) :: {:ok, {{:supervisor.strategy(),
                                 non_neg_integer(),
                                 non_neg_integer()},
                                [:supervisor.child_spec()]}}
    def init(nil) do
        spec = GenX.Supervisor.Child.new(id: :ircbot_worker,
                                         start_func:
                                            {Elixirbot.Listener.Bot,
                                            :start, []},
                                         modules:
                                            [Elixirbot.Listener.Bot],
                                          shutdown: :infinity,
                                          type: :worker)
        {:ok, {{:one_for_one, 1, 60}, [spec]}}
    end
end
