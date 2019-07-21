Data Searcher
==============

## Assumptions
* JSON data is not big enough to be loaded in stream way
* No need to worry about memory usage stuff

## Design
1. **DataLoader** load JSON files into memory
2. **Indexer** create index on common used fields(ids, name) for entities
3. **Console** handles user interactions
4. **Repo** take care of search logic, dispatch request to corresponding repo(User/Organization/Ticket)
5. **Formatter** is used for formatting search result to printable strings
6. **Utils** contains basic common functions

### Custodian

(censored at the moment)

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
3. case insensitive for other types

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

### Last
Sorry this is not a result of TDD, I didn't have 100% confidence of my solution and Elixir is still new to me, it was like "let me try if this make sense" everywhere during development;

only core search function and format function was tested(many test cases missing), and I personally don't quite like the test strategy, ***Property Based Testing*** would make more sense but couldn't introduce it before deadline.

after done this project I love Elixir more.

### TODO
* More unit test
* Continue refactoring, remove duplicate code as necessary, extract reusable component
* Add results count in the search result
