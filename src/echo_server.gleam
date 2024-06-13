import gleam/bytes_builder
import gleam/http/elli
import gleam/http/request
import gleam/http/response
import gleam/io

pub fn main() {
  "listening on port 3000"
  |> io.println

  let assert Ok(_) =
    hello_handler
    |> elli.become(on_port: 3000)
}

fn hello_handler(
  _request: request.Request(t),
) -> response.Response(bytes_builder.BytesBuilder) {
  let b = bytes_builder.from_string("hello world!")

  response.new(200)
  |> response.set_body(b)
}
