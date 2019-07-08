defmodule InjectorTest do
  use ExUnit.Case

  import Injector

  Application.put_env(:injector, ModuleB, InjectedModuleB)
  Application.put_env(:injector, :erlang_module_b, :injected_module_b)

  test "inject without :as option" do
    inject ModuleA
    assert ModuleA == :"Elixir.ModuleA"

    inject ModuleB
    assert ModuleB == InjectedModuleB
  end

  test "inject with :as option" do
    inject ModuleA, as: A
    assert A == :"Elixir.ModuleA"

    inject ModuleB, as: B
    assert B == InjectedModuleB
  end

  test "inject erlang modules" do
    assert_raise(CompileError, ~r"option :as is required for injecting erlang modules", fn ->
      defmodule WillFail do
        inject :erlang_module
      end
    end)

    inject :erlang_module_a, as: ErlangModuleA
    assert ErlangModuleA == :erlang_module_a

    inject :erlang_module_b, as: ErlangModuleB
    assert ErlangModuleB == :injected_module_b
  end
end
