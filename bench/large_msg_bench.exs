defmodule LargeMsgBench do
  use Benchfella

  setup_all do
    {:ok, go_port} = PortHandler.start_link("./bench/go_port")
    {:ok, node_port} = PortHandler.start_link("node ./bench/node_port.js")
    {:ok, java_port} = PortHandler.start_link("java -cp bench JavaPort")
    {:ok, rust_port} = PortHandler.start_link("./bench/rust_port")

    msg = "#{inspect gen_many_complex_terms(75)}\n"
    IO.puts "large message is #{String.length (msg)} bytes."

    {:ok, %{ go: go_port,
	     node: node_port,
	     java: java_port,
             rust: rust_port,
	     msg: msg }}
  end

  teardown_all ports do
    PortHandler.close(ports.go)
    PortHandler.close(ports.node)
    PortHandler.close(ports.java)
    PortHandler.close(ports.rust)
  end

  bench("go", [ port: bench_context.go,
		msg: bench_context.msg ]) do
    iteration(port, msg)
  end

  bench("node", [ port: bench_context.node,
		  msg: bench_context.msg ]) do
    iteration(port, msg)
  end

  bench("java", [ port: bench_context.java,
		  msg: bench_context.msg ]) do
    iteration(port, msg)
  end

  bench("rust", [ port: bench_context.rust,
                  msg: bench_context.msg ]) do
    iteration(port, msg)
  end

  defp gen_complex_term(id), do: %{ id: id,
				    type: :complex_term,
				    name: "Term no. #{id}",
				    children: [%{ foo: "bar" }, %{ bim: ['b', 'a', 'z'] }] }

  defp gen_many_complex_terms(num) do
    1..num
    |> Enum.map(&("#{inspect gen_complex_term(&1)}"))
    |> Enum.join
  end

  defp iteration(port, msg) when is_binary(msg) do
    case PortHandler.command(port, msg) do
      {:error, reason} -> raise "Port error: #{inspect reason}"
      {:ok, result} -> result
    end
  end
end
