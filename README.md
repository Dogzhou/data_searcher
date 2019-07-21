Data Searcher
==============

## Assumptions
* JSON data is not big enough to be loaded in stream way
* No need to worry about memory usage stuff

### Custodian

Edward Zhou(edwardzhou1990@gmail.com)

### Envrionment
Elixir 1.18.1 or Docker

### Install

if Elixir 1.18.1 has been installed on your local

```shell
$ mix deps.get
```

if not please use docker

``` shell
$ docker build -t data_searcher .
```

## Usage

open iex on local or in docker

``` shell
$ iex -S mix
```

or

``` shell
$ docker run -ti data_searcher iex -S mix
```

### The rule of searching(Important)
1. for timestamp type field(created_at/due_at), please use date(YYYY-MM-DD) to search
2. for array type field(tags, domain_names), please use any single value
3. case sensitive for others(sorry I will add it later)

Instruction is given when application is up, it's pretty straightforward to use.

### Development

#### Testing
``` shell
$ mix test
```

#### Style check
``` shell
$ mix credo
```
