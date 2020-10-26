# Shelver.Back

GraphQL backend for the Shelver project, written in Elixir and with an in-memory database for the time being.

## Installation

Clone the project, then execute

```bash
$ mix deps.get
$ mix compile
```

## Running

After the above, run

```bash
$ mix phx.server
```

## TODO

[] Add persistence layer (Cassandra/Scylla?)
[] Add `mix release` support
[] Hook up with `sespinoza-dev/shelver-front`

## Contributors

- [[disalazarg]](https://github.com/disalazarg) Daniel Salazar - creator, maintainer
- [[sespinoza-dev]](https://github.com/sespinoza-dev) Sebastian Espinoza - collaborator, reviewer
