### OPENAI_API Comparison


|Lang|Curl|Rust|Python|Javascript(Node)|Go|
| ---: | ---: | ---: | ---: | ---: | ---: |
|Mean|1.673s|1.672s|2.330s|1.907s|1.729s|
|Std|± 0.249s|± 0.257|± 0.387s|± 0.754s|± 0.265s|
|Max|2.156s|2.522s|3.427s|4.116s|2.468s|
|Min|1.328s|1.418s|1.838s|0.867s|1.358|
> * 30 trials per language.
> * use Hyperfine


```shell
$ curl https://api.openai.com/v1/chat/completions \ 
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $OPENAI_API_KEY" \
  -d '{
     "model": "gpt-3.5-turbo",
     "messages": [{"role": "user", "content": "hello"}],
     "temperature": 0.0
   }'
```


# Curl
```shell
$ curl --version                            
curl 7.68.0 (x86_64-pc-linux-gnu)
```

```bash
$ hyperfine -i --warmup 5 -m 'bash ./native.sh'
  Benchmark 1: bash ./native.sh
  Time (mean ± σ):      1.673 s ±  0.249 s    [User: 0.008 s, System: 0.004 s]
  Range (min … max):    1.328 s …  2.156 s    30 runs  
```

# Rust
```shell
$ cargo --version
cargo 1.69.0 (6e9a83356 2023-04-12)
$ cargo build --release
```

```shell
$ hyperfine -i --warmup 5 -m 30 ./target/release/openai_rs 
  Benchmark 1: ./target/release/openai_rs
  Time (mean ± σ):      1.672 s ±  0.257 s    [User: 0.006 s, System: 0.003 s]
  Range (min … max):    1.418 s …  2.522 s    30 runs
```

# Python3.11

```shell
$ hyperfine -i --warmup 5 -m 30 'poetry run python openai_py/main.py'
  Benchmark 1: poetry run python openai_py/main.py
  Time (mean ± σ):      2.330 s ±  0.387 s    [User: 0.488 s, System: 0.054 s]
  Range (min … max):    1.838 s …  3.427 s    30 runs  
```

# Go

```shell
$ go version
go version go1.20.4 linux/amd64
$ go build -ldflags "-s -w"
```

```shell
$ hyperfine -i --warmup 5 -m 30 ./mod           
  Benchmark 1: ./mod
  Time (mean ± σ):      1.729 s ±  0.265 s    [User: 0.011 s, System: 0.005 s]
  Range (min … max):    1.358 s …  2.468 s    30 runs
```

# Typescript

```shell
$ tsc -v
Version 5.0.4
node --version
v18.9.0
```

```shell
$ hyperfine -i --warmup 5 -m 30 'node main.js'
  Benchmark 1: node main.js
  Time (mean ± σ):      1.907 s ±  0.754 s    [User: 0.075 s, System: 0.010 s]
  Range (min … max):    0.867 s …  4.116 s    30 runs
```
