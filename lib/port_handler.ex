defmodule PortHandler do
  use GenServer

  def start_link cmd do
    GenServer.start_link __MODULE__, cmd
  end

  def command port, msg do
    GenServer.call port, {:command, msg}
  end

  def close port do
    GenServer.call port, {:close}
  end

  ## callbacks

  def init cmd do
    port = Port.open {:spawn, cmd}, [:binary]

    {:ok, port}
  end

  def handle_call {:command, msg}, _, port do
    result = case Port.command port, msg do
	       true -> receive do
		   {^port, {:data, result}} ->
		     {:ok, result}

		       after 5_000 -> {:error, :timed_out}
		 end

	       false -> {:error, :process_dead}
	     end

    case result do
      {:error, reason} -> {:stop, reason, nil}
      x -> {:reply, x, port}
    end
  end

  def handle_call {:close}, _, port do
    Port.close port
    {:reply, :ok, nil}
  end

  def handle_call _, _from, nil do
    {:stop, :port_closed, nil}
  end
end
