defmodule Injector do
  defmacro inject({:__aliases__, _, module}) do
    as = :"Elixir.#{List.last(module)}"
    module = :"Elixir.#{Enum.join(module, ".")}"
    injection = Application.get_env(:injector, module, module)

    quote do
      alias unquote(injection), as: unquote(as)
    end
  end

  defmacro inject({:__aliases__, _, module}, as: as) do
    module = :"Elixir.#{Enum.join(module, ".")}"
    injection = Application.get_env(:injector, module, module)

    quote do
      alias unquote(injection), as: unquote(as)
    end
  end
 end
