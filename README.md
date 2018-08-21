# JuliaTDD

Julia Package for TDD (Test Driven Development)  

The purpose of this package is to offer a reproducible workflow driven by `Pkg.test()` and rapid prototype in REPL.

The basic idea is very simple.

1. Create an empty package with one-line shell command running [generate.jl](generate.jl).

```
julia generate.jl
```

2. Add depenency with [add.jl](add.jl).
```
julia add.jl
```

3. Copy the files and folders from `JuliaTDD` folder to the root (because we want to use this repo as 
an external Julia package that can be added via `Pkg.add()`).

```
cp -r JuliaTDD/src .
cp -r JuliaTDD/*.toml .
```

4. Start REPL with one-line shell command running [main.jl](main.jl).

```
julia -i main.jl
```		

To make it simple to prototype ideas, unlike other production Julia packages, main activities 
in JuliaTDD happen in [test](test) folder, while we leave the [dummy hello world package](src/JuliaTDD.jl) unchanged.

## Usage

1. If you clone this repo, you can run following (see [Makefile](Makefile)).

```
make clean repl-test
```

2. If you are in another REPL, you can add and test this package

```
(v1.0) pkg> add https://github.com/dev-juliacn/JuliaTDD#pycall
```
```
(v1.0) pkg> test JuliaTDD
```

3. You can also use following one-liner with docker images[juliacn/ubuntu:julia](https://hub.docker.com/r/juliacn/ubuntu/tags/) 
(the official image [julia](https://hub.docker.com/r/library/julia/tags/) doesn't have `bzip2` which is required to install PyCall).
```
docker run --rm juliacn/ubuntu:julia julia -i -e 'using Pkg;Pkg.add(Pkg.PackageSpec(url="https://github.com/dev-juliacn/JuliaTDD", rev="pycall"));Pkg.test("JuliaTDD");'
```
