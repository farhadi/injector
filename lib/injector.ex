defmodule Injector do
  defmacro inject(module) when is_atom(module) do
    raise CompileError, description: "option :as is required for injecting erlang modules"
  end

  defmacro inject(module) do
    inject_as(module, as: module)
  end

  defmacro inject(module, as) do
    inject_as(module, as)
  end

  defp inject_as({:__aliases__, _, aliases}, as) do
    aliases |> Module.concat() |> inject_as(as)
  end

  defp inject_as(module, as: as) do
    injection = Application.get_env(:injector, module, module)

    quote do
      alias unquote(injection), as: unquote(as)
    end
  end
end
