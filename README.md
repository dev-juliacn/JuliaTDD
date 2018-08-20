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
make clean repl-test
```

```
rm -rf JuliaTDD
docker-compose run --rm work julia -e 'using Pkg; Pkg.generate("JuliaTDD")'
Generating project JuliaTDD:
    JuliaTDD/Project.toml
    JuliaTDD/src/JuliaTDD.jl
docker-compose run --rm work julia -e 'using Pkg; Pkg.activate("JuliaTDD");Pkg.add("Pkg");'
   Cloning default registries into /root/.julia/registries
   Cloning registry General from "https://github.com/JuliaRegistries/General.git"
  Updating registry at `~/.julia/registries/General`
  Updating git-repo `https://github.com/JuliaRegistries/General.git`
 Resolving package versions...
  Updating `/home/JuliaTDD/Project.toml`
  [44cfe95a] + Pkg 
  Updating `/home/JuliaTDD/Manifest.toml`
  [2a0f44e3] + Base64 
  [ade2ca70] + Dates 
  [b77e0a4c] + InteractiveUtils 
  [76f85450] + LibGit2 
  [8f399da3] + Libdl 
  [37e2e46d] + LinearAlgebra 
  [d6f4376e] + Markdown 
  [44cfe95a] + Pkg 
  [de0858da] + Printf 
  [3fa0cd96] + REPL 
  [9a3f8284] + Random 
  [ea8e919c] + SHA 
  [9e88b42a] + Serialization 
  [6462fe0b] + Sockets 
  [cf7118a7] + UUIDs 
  [4ec0a83e] + Unicode 
cp -r JuliaTDD/src .
cp -r JuliaTDD/*.toml .
docker-compose run --rm work julia -i -e 'using Pkg;Pkg.activate(".");Pkg.update();Pkg.test()'
   Cloning default registries into /root/.julia/registries
   Cloning registry General from "https://github.com/JuliaRegistries/General.git"
  Updating registry at `~/.julia/registries/General`
  Updating git-repo `https://github.com/JuliaRegistries/General.git`
 Resolving package versions...
  Updating `Project.toml`
 [no changes]
  Updating `Manifest.toml`
 [no changes]
   Testing JuliaTDD
 Resolving package versions...
  Updating registry at `~/.julia/registries/General`
  Updating git-repo `https://github.com/JuliaRegistries/General.git`
 Resolving package versions...
  Updating `/tmp/tmps6981G/Project.toml`
  [b77e0a4c] + InteractiveUtils  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/InteractiveUtils`]
  Updating `/tmp/tmps6981G/Manifest.toml`
 [no changes]
Julia Version 1.0.0
Commit 5d4eaca0c9 (2018-08-08 20:58 UTC)
Platform Info:
  OS: Linux (x86_64-pc-linux-gnu)
  CPU: Intel(R) Core(TM) i7-4770HQ CPU @ 2.20GHz
  WORD_SIZE: 64
  LIBM: libopenlibm
  LLVM: libLLVM-6.0.0 (ORCJIT, haswell)
Environment:
  JULIA_PATH = /usr/local/julia
  JULIA_GPG = 3673DF529D9049477F76B37566E3C7DC03D6E495
  JULIA_VERSION = 1.0.0
  JULIA_LOAD_PATH = @:/tmp/tmps6981G
Hello World!The test works.
Let's do something useful.
 Resolving package versions...
 Installed MacroTools ───── v0.4.4
 Installed VersionParsing ─ v1.1.2
 Installed JSON ─────────── v0.19.0
 Installed Conda ────────── v1.0.1
 Installed PyCall ───────── v1.18.0
 Installed Compat ───────── v1.0.1
  Updating `/tmp/tmps6981G/Project.toml`
  [438e738f] + PyCall v1.18.0
  Updating `/tmp/tmps6981G/Manifest.toml`
  [34da2185] + Compat v1.0.1
  [8f4d0f93] + Conda v1.0.1
  [682c06a0] + JSON v0.19.0
  [1914dd2f] + MacroTools v0.4.4
  [438e738f] + PyCall v1.18.0
  [81def892] + VersionParsing v1.1.2
  [8bb1440f] + DelimitedFiles 
  [8ba89e20] + Distributed 
  [56ddb016] + Logging 
  [a63ad114] + Mmap 
  [1a1011a3] + SharedArrays 
  [2f01184e] + SparseArrays 
  [10745b16] + Statistics 
  [8dfed614] + Test 
  Building Conda ─→ `~/.julia/packages/Conda/m7vem/deps/build.log`
  Building PyCall → `~/.julia/packages/PyCall/WcrLS/deps/build.log`
  Updating registry at `~/.julia/registries/General`
  Updating git-repo `https://github.com/JuliaRegistries/General.git`
   Testing PyCall
 Resolving package versions...
    Status `/tmp/tmpyRD6lF/Manifest.toml`
  [34da2185] Compat v1.0.1
  [8f4d0f93] Conda v1.0.1
  [682c06a0] JSON v0.19.0
  [1914dd2f] MacroTools v0.4.4
  [438e738f] PyCall v1.18.0
  [81def892] VersionParsing v1.1.2
  [2a0f44e3] Base64  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Base64`]
  [ade2ca70] Dates  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Dates`]
  [8bb1440f] DelimitedFiles  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/DelimitedFiles`]
  [8ba89e20] Distributed  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Distributed`]
  [b77e0a4c] InteractiveUtils  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/InteractiveUtils`]
  [76f85450] LibGit2  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/LibGit2`]
  [8f399da3] Libdl  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Libdl`]
  [37e2e46d] LinearAlgebra  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/LinearAlgebra`]
  [56ddb016] Logging  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Logging`]
  [d6f4376e] Markdown  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Markdown`]
  [a63ad114] Mmap  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Mmap`]
  [44cfe95a] Pkg  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Pkg`]
  [de0858da] Printf  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Printf`]
  [3fa0cd96] REPL  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/REPL`]
  [9a3f8284] Random  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Random`]
  [ea8e919c] SHA  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/SHA`]
  [9e88b42a] Serialization  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Serialization`]
  [1a1011a3] SharedArrays  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/SharedArrays`]
  [6462fe0b] Sockets  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Sockets`]
  [2f01184e] SparseArrays  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/SparseArrays`]
  [10745b16] Statistics  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Statistics`]
  [8dfed614] Test  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Test`]
  [cf7118a7] UUIDs  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/UUIDs`]
  [4ec0a83e] Unicode  [`/usr/local/julia/bin/../share/julia/stdlib/v1.0/Unicode`]
┌ Info: Python version 3.6.5 from /root/.julia/packages/Conda/m7vem/deps/usr/lib/libpython3.6m, PYTHONHOME=/root/.julia/packages/Conda/m7vem/deps/usr:/root/.julia/packages/Conda/m7vem/deps/usr
│ ENV[PYTHONPATH]=
│ ENV[PYTHONHOME]=
└ ENV[PYTHONEXECUTABLE]=
[ Info: Installing zmq via the Conda pyzmq package...
[ Info: Running `conda install -y pyzmq` in root environment
Solving environment: done

## Package Plan ##

  environment location: /root/.julia/packages/Conda/m7vem/deps/usr

  added / updated specs: 
    - pyzmq


The following packages will be downloaded:

    package                    |            build
    ---------------------------|-----------------
    pyzmq-17.1.2               |   py36h14c3975_0         454 KB
    libsodium-1.0.16           |       h1bed415_0         302 KB
    zeromq-4.2.5               |       hf484d3e_0         567 KB
    ------------------------------------------------------------
                                           Total:         1.3 MB

The following NEW packages will be INSTALLED:

    libsodium: 1.0.16-h1bed415_0    
    pyzmq:     17.1.2-py36h14c3975_0
    zeromq:    4.2.5-hf484d3e_0     


Downloading and Extracting Packages
pyzmq-17.1.2         | 454 KB    | ##################################################################################################################################### | 100% 
libsodium-1.0.16     | 302 KB    | ##################################################################################################################################### | 100% 
zeromq-4.2.5         | 567 KB    | ##################################################################################################################################### | 100% 
Preparing transaction: done
Verifying transaction: done
Executing transaction: done
[ Info: Running `conda remove -y pyzmq` in root environment
Solving environment: done

## Package Plan ##

  environment location: /root/.julia/packages/Conda/m7vem/deps/usr

  removed specs: 
    - pyzmq


The following packages will be REMOVED:

    pyzmq: 17.1.2-py36h14c3975_0

Preparing transaction: done
Verifying transaction: done
Executing transaction: done
Test Summary: | Pass  Total
PyCall        |  429    429
Test Summary: | Pass  Total
pydef         |    6      6
Test Summary: | Pass  Total
pycall!       |   16     16
   Testing PyCall tests passed 
 Resolving package versions...
  Updating `/tmp/tmps6981G/Project.toml`
  [8f4d0f93] + Conda v1.0.1
  Updating `/tmp/tmps6981G/Manifest.toml`
 [no changes]
Collecting pip
  Downloading https://files.pythonhosted.org/packages/5f/25/e52d3f31441505a5f3af41213346e5b6c221c9e086a166f3703d2ddaf940/pip-18.0-py2.py3-none-any.whl (1.3MB)
    100% |################################| 1.3MB 2.7MB/s 
mkl-random 1.0.1 requires cython, which is not installed.
mkl-fft 1.0.4 requires cython, which is not installed.
Installing collected packages: pip
  Found existing installation: pip 10.0.1
    Uninstalling pip-10.0.1:
      Successfully uninstalled pip-10.0.1
Successfully installed pip-18.0
Package      Version  
------------ ---------
asn1crypto   0.24.0   
certifi      2018.8.13
cffi         1.11.5   
chardet      3.0.4    
conda        4.5.10   
cryptography 2.2.2    
idna         2.6      
mkl-fft      1.0.4    
mkl-random   1.0.1    
numpy        1.15.0   
pip          18.0     
pycosat      0.6.3    
pycparser    2.18     
pyOpenSSL    18.0.0   
PySocks      1.6.8    
requests     2.18.4   
ruamel-yaml  0.15.37  
setuptools   39.2.0   
six          1.11.0   
urllib3      1.22     
wheel        0.31.1   
   Testing JuliaTDD tests passed 
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.0.0 (2018-08-08)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

julia> 
```

