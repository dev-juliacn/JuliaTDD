# JuliaTDD

A local Julia Package for TDD (Test Driven Development)  

The purpose of this package is to offer a reproducible workflow driven by `Pkg.test()` and also allow rapid prototype in REPL.

The basic idea is very simple.

1. Create an empty Package with one-line shell command

```
julia -e 'using Pkg; Pkg.generate("JuliaTDD")'
```

2. Copy the files and folders from `JuliaTDD` folder to the root (because we want to use this repo as 
an external Julia package that can be added via `Pkg.add()`)

```
cp -r JuliaTDD/src .
cp -r JuliaTDD/*.toml .
```

3. Start REPL with one-line shell command that activate the environment and run `Pkg.test()`

```
julia -i -e 'using Pkg;Pkg.activate(".");Pkg.update();Pkg.test()'
```		

To make it simple to prototype ideas, unlike other production Julia packages, main activities 
in JuliaTDD happen in [test](test) folder, while we leave the [dummy hello world package](src/JuliaTDD.jl) unchanged.


