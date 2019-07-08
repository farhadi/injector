# Injector

Simple dependency injection for Elixir. Suitable to use with [Mox](https://hex.pm/packages/mox).

## Installation

Add `injector` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:injector, "~> 0.2"}
  ]
end
```

## Usage

You can inject dependencies to your modules using `inject` macro with the same syntax as `alias`:

```
def MyApp.MyModule do
  import Injector

  inject MyApp.DB

  def find() do
    DB.query()
  end
end
```

Erlang modules can also be injected:
```
inject :mnesia, as: Mnesia
```

Now in `config/test.exs` you can specify mock modules to be injected in test environment:
```
config :injector, [
  {MyApp.DB, MyApp.DBMock},
  {:mnesia, MnesiaMock}
]
```

It is up to you to define mock modules, but it was desiged to be used in combination with [Mox](https://hex.pm/packages/mox).

## License

Injector is released under MIT license.
