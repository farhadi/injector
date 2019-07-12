[
  inputs: ["{mix,.formatter}.exs", "{lib,test}/**/*.{ex,exs}"],
  locals_without_parens: [inject: 1, inject: 2],
  export: [
    locals_without_parens: [inject: 1, inject: 2]
  ]
]
