# JuliaTDD

Julia Package for TDD (Test Driven Development)  

The purpose of this package is to offer a reproducible workflow driven by `Pkg.test()` and rapid prototype in REPL.

The basic idea is very simple.

1. Create an empty package with one-line shell command

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

## Usage

See [Makefile](Makefile) or add/test this package in REPL:

```
(v1.0) pkg> add https://github.com/dev-juliacn/JuliaTDD
  Updating registry at `~/.julia/registries/General`
  Updating git-repo `https://github.com/JuliaRegistries/General.git`
  Updating git-repo `https://github.com/dev-juliacn/JuliaTDD`
 Resolving package versions...
  Updating `~/.julia/environments/v1.0/Project.toml`
  [7782f210] + JuliaTDD v0.1.0 #master (https://github.com/dev-juliacn/JuliaTDD)
  [8e6227b6] - JuliaTDD v0.1.0 #master (https://github.com/dev-juliacn/JuliaTDD)
  Updating `~/.julia/environments/v1.0/Manifest.toml`
  [7782f210] + JuliaTDD v0.1.0 #master (https://github.com/dev-juliacn/JuliaTDD)
  [8e6227b6] - JuliaTDD v0.1.0 #master (https://github.com/dev-juliacn/JuliaTDD)

(v1.0) pkg> test JuliaTDD
   Testing JuliaTDD
    Status `/var/folders/y3/s46lfx1d1yz7dzgbhw25bxnm0000gn/T/tmpMhtrdY/Manifest.toml`
  [7782f210] JuliaTDD v0.1.0 #master (https://github.com/dev-juliacn/JuliaTDD)
  [2a0f44e3] Base64  [`/Applications/Julia-1.0.app/Contents/Resources/julia/bin/../share/julia/stdlib/v1.0/Base64`]
  [b77e0a4c] InteractiveUtils  [`/Applications/Julia-1.0.app/Contents/Resources/julia/bin/../share/julia/stdlib/v1.0/InteractiveUtils`]
  [8f399da3] Libdl  [`/Applications/Julia-1.0.app/Contents/Resources/julia/bin/../share/julia/stdlib/v1.0/Libdl`]
  [37e2e46d] LinearAlgebra  [`/Applications/Julia-1.0.app/Contents/Resources/julia/bin/../share/julia/stdlib/v1.0/LinearAlgebra`]
  [d6f4376e] Markdown  [`/Applications/Julia-1.0.app/Contents/Resources/julia/bin/../share/julia/stdlib/v1.0/Markdown`]
Julia Version 1.0.0
Commit 5d4eaca0c9 (2018-08-08 20:58 UTC)
Platform Info:
  OS: macOS (x86_64-apple-darwin14.5.0)
  CPU: Intel(R) Core(TM) i7-4770HQ CPU @ 2.20GHz
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-6.0.0 (ORCJIT, haswell)
Environment:
  JULIA_LOAD_PATH = @:/var/folders/y3/s46lfx1d1yz7dzgbhw25bxnm0000gn/T/tmpMhtrdY
Hello World!The test works.
Let's do something useful.
  0.000003 seconds (5 allocations: 208 bytes)
sum(1, 1) = 2
#= /Users/sam/.julia/packages/JuliaTDD/4H0nx/test/sum.jl:5 =# @code_lowered(sum(1, 1)) = CodeInfo(
1 1 ─ %1 = x + y
  └──      return %1
)

; Function sum
; Location: /Users/sam/.julia/packages/JuliaTDD/4H0nx/test/sum.jl:1
define i64 @julia_sum_36003(i64, i64) {
top:
; Function +; {
; Location: int.jl:53
  %2 = add i64 %1, %0
;}
  ret i64 %2
}
#= /Users/sam/.julia/packages/JuliaTDD/4H0nx/test/sum.jl:7 =# @code_llvm(sum(1, 1)) = nothing
	.section	__TEXT,__text,regular,pure_instructions
; Function sum {
; Location: sum.jl:1
; Function +; {
; Location: sum.jl:1
	decl	%eax
	leal	(%edi,%esi), %eax
;}
	retl
	nopw	%cs:(%eax,%eax)
;}
#= /Users/sam/.julia/packages/JuliaTDD/4H0nx/test/sum.jl:9 =# @code_native(sum(1, 1)) = nothing
   Testing JuliaTDD tests passed 

(v1.0) pkg> 
```


